USE Coursework
GO

CREATE TRIGGER Validator_INSERT
ON Validator AFTER INSERT
AS
UPDATE Validator
SET Fare = Fare + Fare * 0.2
WHERE Id = (SELECT Id FROM INSERTED)
GO

INSERT INTO Validator VALUES
(4, 16, 20)
GO

CREATE TRIGGER TransportRoute_INSERT
ON TransportRoute AFTER INSERT  
AS  
IF (ROWCOUNT_BIG() = 0) -- number of rows affected by the last statement executed
	RETURN;
DECLARE @FinishDate DATE, @StartDate DATE
SET @FinishDate = (SELECT ValidUntil FROM INSERTED)
SET @StartDate = (SELECT StartDate FROM INSERTED)
IF DATEDIFF(MONTH, @StartDate, @FinishDate)>12
BEGIN  
RAISERROR ('The contract cannot be concluded for more than one year', 1, 1);  
ROLLBACK TRANSACTION;  
RETURN   
END;  
GO  

INSERT TransportRoute VALUES (509, 7, '2022-02-05', '2023-03-05')
GO

