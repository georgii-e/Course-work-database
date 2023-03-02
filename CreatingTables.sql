USE Coursework
GO

CREATE TABLE RouteEditor
(
	Id INT PRIMARY KEY IDENTITY,
	FullName NVARCHAR(50) CHECK(FullName !='') NOT NULL,
	Age INT NOT NULL,
	Salary SMALLMONEY,
	CONSTRAINT CK_RouteEditor_Age CHECK (Age BETWEEN 18 AND 67)
)
GO

CREATE TABLE [Route]
(
	Number INT PRIMARY KEY,
	EditorId INT REFERENCES RouteEditor(Id),
	StartPoint NVARCHAR(20) CHECK(StartPoint !='') NOT NULL,
	FinishPoint NVARCHAR(20) CHECK(FinishPoint !='') NOT NULL,
	RouteDuration TIME NOT NULL DEFAULT '00:35:00'
)
GO

CREATE TABLE Controller
(
	Id INT PRIMARY KEY IDENTITY,
	RouteNumber INT REFERENCES [Route](Number),
	FullName NVARCHAR(50) CHECK(FullName !='') NOT NULL,
	Age INT NOT NULL,
	Salary SMALLMONEY,
	CONSTRAINT CK_Controller_Age CHECK (Age BETWEEN 18 AND 65)
)
GO

CREATE TABLE Depot
(
	Id INT PRIMARY KEY IDENTITY,
	[Address] NVARCHAR(50) CHECK(Address !='') NOT NULL,
	Capacity INT DEFAULT 20 NOT NULL,
	AvailablePlaces INT NOT NULL,
	CONSTRAINT CK_Capacity CHECK (AvailablePlaces <= Capacity)
)
GO

CREATE TABLE DepotEmployee
(
	Id INT PRIMARY KEY IDENTITY,
	DepotId INT REFERENCES Depot(Id),
	FullName NVARCHAR(50) CHECK(FullName !='') NOT NULL,
	Specialization NVARCHAR(30) CHECK(Specialization !=''),
	Age INT NOT NULL,
	Salary SMALLMONEY,
	CONSTRAINT CK_DepotEmployee_Age CHECK (Age BETWEEN 18 AND 63)
)
GO

CREATE TABLE Manufacture
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(40) CHECK([Name] !='') NOT NULL,
	[Address] NVARCHAR(50) CHECK([Address] !='') NOT NULL,
	ProducesPerYear INT
	CONSTRAINT CK_Manufacture_Performance CHECK (ProducesPerYear>=0)
)
GO

CREATE TABLE PublicTransport
(
	Id INT PRIMARY KEY IDENTITY,
	DepotId INT REFERENCES Depot(Id) NOT NULL,
	FactoryId INT REFERENCES Manufacture(Id) NOT NULL,
	[Type] NVARCHAR(20) CHECK([Type] !='') NOT NULL,
	Model NVARCHAR(15) CHECK(Model !='')
)
GO

CREATE TABLE Driver
(
	Id INT PRIMARY KEY IDENTITY,
	TransportId INT REFERENCES PublicTransport(Id),
	FullName NVARCHAR(50) CHECK(FullName !='') NOT NULL,
	Age INT NOT NULL,
	Salary SMALLMONEY,
	CONSTRAINT CK_Driver_Age CHECK (Age BETWEEN 18 AND 60)
)
GO

CREATE TABLE Validator
(
	Id INT PRIMARY KEY IDENTITY,
	TransportId INT REFERENCES PublicTransport(Id),
	Fare INT DEFAULT 8 NOT NULL,
	NumberOfPassengers INT DEFAULT 0 NOT NULL
)
GO

CREATE TABLE TransportRoute
(
	RouteNumber INT REFERENCES [Route](Number) NOT NULL,
	TransportId INT REFERENCES PublicTransport(Id) NOT NULL,
	StartDate DATE NOT NULL DEFAULT CONVERT(DATE, GETDATE()),
	ValidUntil DATE,
	PRIMARY KEY(RouteNumber, TransportId),
	CONSTRAINT CK_TransportRoute_ValidUntil CHECK (ValidUntil>StartDate)
)
GO
