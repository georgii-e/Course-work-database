USE Coursework
GO

SELECT * FROM
(SELECT Id AS TransportId, [Type], RouteNumber, ValidUntil FROM PublicTransport, TransportRoute
WHERE PublicTransport.Id=TransportId) AS TransportInfo
WHERE TransportInfo.ValidUntil > '2023-01-10'
ORDER BY TransportId
GO --��������� � �������� �����������

SELECT Depot.Id AS DepotId, [Address], COUNT(FullName) AS AmountOfWorkers FROM Depot
LEFT JOIN DepotEmployee ON DepotId = Depot.Id
GROUP BY [Address], Depot.Id
GO --���� �� ������� ����������, �� ��� �����������

SELECT PublicTransport.Id, Model, [Address], AvailablePlaces FROM Depot, PublicTransport
WHERE Depot.Id=DepotId AND AvailablePlaces=0
GO --������� �������� ����

WITH DuplicatedId AS (
    SELECT TransportId FROM Driver
	LEFT JOIN PublicTransport ON TransportId = PublicTransport.Id
	GROUP BY TransportId
	HAVING COUNT(Driver.Id)>1)
SELECT FullName, Model FROM Driver 
LEFT JOIN PublicTransport ON TransportId = PublicTransport.Id
WHERE TransportId IN (SELECT * FROM DuplicatedId)
ORDER BY Model
GO --�����, �� ���� ������ ������� ��䳿�

SELECT PublicTransport.Id, Model, SUM(Fare*NumberOfPassengers) AS TotalSum FROM Validator, PublicTransport
WHERE PublicTransport.Id = Validator.TransportId
GROUP BY PublicTransport.Id, Model
ORDER BY Id
GO --����� ���������� ����� � ����� �� ��������

WITH DuplicatedId AS (
    SELECT EditorId FROM [Route]
	LEFT JOIN RouteEditor ON EditorId = RouteEditor.Id
	GROUP BY EditorId
	HAVING COUNT(RouteEditor.Id)>1)
SELECT [Number], FullName FROM [Route] 
LEFT JOIN RouteEditor ON EditorId = RouteEditor.Id
WHERE EditorId IN (SELECT * FROM DuplicatedId)
ORDER BY FullName
GO --���������, � �� ��������� ������� ��������

SELECT [Type], [Model], RouteNumber FROM PublicTransport
RIGHT JOIN TransportRoute ON Id = TransportId
WHERE [Type] = 'trolleybus'
GO --��������, ����� �������� ����������

SELECT [Model], [Address] FROM PublicTransport
LEFT JOIN Depot ON DepotId = Depot.Id
ORDER BY [Address]
GO --������ ����������, �� ������ ���� � ����� ���� �����������

SELECT AVG(Age) AS AverageAge, AVG(Salary) AS AverageSalary, 'RouteEditor' AS FieldOfActivity FROM RouteEditor
UNION SELECT AVG(Age), AVG(Salary), 'DepotEmployee' FROM DepotEmployee
UNION SELECT AVG(Age), AVG(Salary), 'Driver' FROM Driver
GO --������� �� �� ��������� ����� ���� ����������

SELECT [Type], [Model], [Name] AS MufactureName, [Address] AS ManufactureAddress FROM PublicTransport
LEFT JOIN Manufacture ON FactoryId = Manufacture.Id
ORDER BY [Type], MufactureName
GO --����� ���������� ��� ��������

SELECT FullName, Age, Salary*0.6 AS ExpectedPension FROM RouteEditor
WHERE Age >= 60
UNION SELECT FullName, Age, Salary*0.6 FROM DepotEmployee
WHERE Age >= 60
UNION SELECT FullName, Age, Salary*0.6 FROM Driver
WHERE Age >= 60
GO--���������� �� ����� ����� ����� �� ����� �� ������������ �����

SELECT FullName, [Number], StartPoint, FinishPoint FROM [Route]
RIGHT JOIN Controller ON Number = RouteNumber
ORDER BY FullName
GO --���������� �� �� �������� � ����� ����� �� ���������

SELECT FullName, Age, Salary FROM RouteEditor
UNION SELECT FullName, Age, Salary FROM DepotEmployee
UNION SELECT FullName, Age, Salary FROM Driver
GO --������ ��� ���������� ���'������ � ������������ ��������

SELECT RouteNumber, ValidUntil, RouteEditor.FullName AS RouteEditorName FROM TransportRoute
LEFT JOIN [Route] ON RouteNumber = [Number]
LEFT JOIN RouteEditor ON EditorId = Id
WHERE ValidUntil < '2023-12-31'
GO --��������� �� ���������� �������� ���� �� ���'���� ��������� ��������

SELECT FullName, Age, 'RouteEditor' AS FieldOfActivity FROM RouteEditor 
WHERE Age > (SELECT AVG(Age) FROM RouteEditor)
UNION SELECT FullName, Age, 'DepotEmployee' FROM DepotEmployee 
WHERE Age > (SELECT AVG(Age) FROM DepotEmployee)
UNION SELECT FullName, Age, 'Driver' FROM Driver 
WHERE Age > (SELECT AVG(Age) FROM Driver)
ORDER BY FieldOfActivity, Age
GO --���������� � ���� ������ �� �������

SELECT Model, [Name] AS FactoryName, [Address] FROM Manufacture
RIGHT JOIN PublicTransport ON Manufacture.Id = FactoryId
WHERE SUBSTRING([Address], (len([Address]) - 1), 2) = 'NY'
ORDER BY FactoryName
GO --�����������, �� ���������� � ��� ����� �� ����� ���������� �� ���� �����������

SELECT FullName, Salary, 'RouteEditor' AS FieldOfActivity FROM RouteEditor 
WHERE Salary < (SELECT AVG(Salary) FROM RouteEditor)
UNION SELECT FullName, Salary, 'DepotEmployee' FROM DepotEmployee 
WHERE Salary < (SELECT AVG(Salary) FROM DepotEmployee)
UNION SELECT FullName, Salary, 'Driver' FROM Driver 
WHERE Salary < (SELECT AVG(Salary) FROM Driver)
ORDER BY FieldOfActivity, Salary
GO --��������� � ����������� ������ �� �������

SELECT FullName, [Type], Model FROM Driver
LEFT JOIN PublicTransport ON TransportId = PublicTransport.Id
WHERE PublicTransport.[Type] = 'tram'
GO --��䳿, �� ������� ���������

SELECT [Type], Model, [Name] AS ManufactureName, [Address] AS ManufactureAddress,
ProducesPerYear FROM PublicTransport
LEFT JOIN Manufacture ON FactoryId = Manufacture.Id
WHERE ProducesPerYear > 200
ORDER BY [Type], ProducesPerYear
GO --���������, �� ��� ��������� ������� � ������������� ����� �� 200 �������/��

WITH EmployeeInfo AS (
    SELECT FullName, Age, Salary, 
'RouteEditor' AS FieldOfActivity FROM RouteEditor
UNION SELECT FullName, Age, Salary, 'DepotEmployee' FROM DepotEmployee
UNION SELECT FullName, Age, Salary, 'Driver' FROM Driver)
SELECT TOP 5 * FROM EmployeeInfo
ORDER BY Salary DESC
GO --��� 5 ��������� �/�

