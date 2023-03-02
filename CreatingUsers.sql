USE Coursework
GO

CREATE LOGIN Administrator WITH PASSWORD = '1111'
CREATE USER Administrator FOR LOGIN Administrator
ALTER ROLE db_datawriter ADD MEMBER Administrator
GO

CREATE LOGIN Accountant WITH PASSWORD = '1111'
CREATE USER Accountant FOR LOGIN Accountant
ALTER ROLE db_datareader ADD MEMBER Accountant
GO

CREATE LOGIN RouteEditor WITH PASSWORD = '1111'
CREATE USER RouteEditor FOR LOGIN RouteEditor
GRANT SELECT ON PublicTransport TO RouteEditor
GRANT SELECT ON TransportRoute TO RouteEditor
GRANT SELECT ON Depot(Address, AvailablePlaces) TO RouteEditor
GRANT INSERT, DELETE, UPDATE ON [Route] TO RouteEditor
GO

/*��� �������� ����������� �������� �� ����������� ���������� ��� 
������ ��������� �� ���������������� ����; ������� ���� � ��� �������*/

EXECUTE AS USER = 'RouteEditor'
GO

REVERT
GO

SELECT * FROM DepotEmployee
GO
