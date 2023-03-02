USE Coursework
GO

SET STATISTICS TIME ON 

CREATE INDEX Driver_FullName_idx
ON Driver(FullName)
GO

DROP INDEX Driver_FullName_idx ON Driver
GO

SELECT FullName FROM Driver
WHERE FullName = 'Eleanor Nicholls'
GO
