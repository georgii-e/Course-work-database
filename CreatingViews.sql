USE Coursework
GO

CREATE VIEW TrolleybusDepot AS
SELECT PublicTransport.Id AS TransportId, Model AS TrolleybusModel, [Address] AS DepotAddress
FROM PublicTransport JOIN Depot ON Depot.Id=PublicTransport.DepotId
GO --���������� �� ����, � ���� ���� ����������

SELECT * FROM TrolleybusDepot
GO 

CREATE VIEW RouteController AS
SELECT FullName, Age, Salary, RouteNumber, RouteDuration FROM [Controller]
JOIN [Route] ON Number = RouteNumber
GO --���������� ��� ���������� �� ��������� �������� �� ���� ���� ��������

SELECT * FROM RouteController
ORDER BY Age
GO 