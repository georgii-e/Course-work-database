USE Coursework
GO

CREATE VIEW TrolleybusDepot AS
SELECT PublicTransport.Id AS TransportId, Model AS TrolleybusModel, [Address] AS DepotAddress
FROM PublicTransport JOIN Depot ON Depot.Id=PublicTransport.DepotId
GO --тролейбуси та депо, в яких вони розташовані

SELECT * FROM TrolleybusDepot
GO 

CREATE VIEW RouteController AS
SELECT FullName, Age, Salary, RouteNumber, RouteDuration FROM [Controller]
JOIN [Route] ON Number = RouteNumber
GO --інформація про контролерів та тривалість маршруту на яких вони працюють

SELECT * FROM RouteController
ORDER BY Age
GO 