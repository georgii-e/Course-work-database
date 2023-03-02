USE Coursework
GO

CREATE PROCEDURE GetEmployeesSalary
AS
WITH SummSalary AS(
SELECT 'RouteEditors' AS GroupOfEmployees, SUM(Salary) AS TotalSum FROM RouteEditor
UNION SELECT 'DepotEmployees', SUM(Salary) FROM DepotEmployee
UNION SELECT 'Drivers', SUM(Salary) FROM Driver)
SELECT COALESCE(GroupOfEmployees, 'All employees') AS GroupOfEmployees, SUM(TotalSum) AS TotalSum FROM SummSalary
GROUP BY ROLLUP(GroupOfEmployees)
GO --щомісячні витрати на зарплатню усім працівникам

EXEC GetEmployeesSalary
GO

CREATE FUNCTION WorkingСontrollers()
RETURNS TABLE -- Inline Table-Valued Function
AS
RETURN
(
	SELECT TOP 3 FullName, Age, RouteDuration, [Number] FROM Controller
	LEFT JOIN [Route] ON RouteNumber = [Number]
	WHERE Age > 55
	ORDER BY RouteDuration DESC
)
GO --контролери, старші за 55 років, які працюють на найдовших маргрутах

SELECT * FROM WorkingСontrollers()
GO

CREATE FUNCTION ComputeProceeds(@TransportId INT)
RETURNS MONEY
AS
BEGIN
	DECLARE @Sum MONEY
	SELECT @Sum = SUM(Fare*NumberOfPassengers) FROM Validator WHERE TransportId = @TransportId
	RETURN @Sum
END;
GO --прибуток з валідаторів, що встановлені у певному транспорті

SELECT TransportId, Model, dbo.ComputeProceeds(TransportId) AS TotalSum FROM Validator
LEFT JOIN PublicTransport ON TransportId = PublicTransport.Id
WHERE TransportId = 1
GROUP BY TransportId, Model
GO
