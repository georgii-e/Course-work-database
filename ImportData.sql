USE Coursework
GO

INSERT INTO RouteEditor VALUES
('Hanna Shields', '61', '641'),
('Leslie Elliott', '41', '576'),
('Hafsah Lamb', '67', '730'),
('Chanelle Zimmerman', '58', '924'),
('Alexandra Le', '51', '704'),
('Briony Simon', '35', '750'),
('Aryan Mclaughlin', '43', '866'),
('Shayla Aguilar', '30', '844'),
('Evan Harding', '29', '970'),
('Harris Nash', '58', '719'),
('Danny Burton', '66', '960'),
('Ifan Mckinney', '53', '865'),
('Bailey Harper', '55', '960'),
('Rhonda Glass', '59', '654'),
('Rueben England', '22', '803')
GO


INSERT INTO [Route] VALUES
('509', '1', 'Dadar', 'Thane', DEFAULT),
('192', '2', 'Solapur', 'Puri', '00:20:00'),
('50', '5', 'Gwalior', 'Jansi', '00:25:00'),
('21', '4', 'Jaipur', 'Ajmer', '00:50:00'),
('114', '8', 'Akola', 'Surat', '00:29:00'),
('692', '12', 'Nunc', 'Consequat', DEFAULT),
('151', '2', 'Interdum', 'Varius', '00:21:00'),
('78', '4', 'Sit', 'Amet', '00:36:00'),
('25', '15', 'Mattis', 'Vulputate', '01:50:00'),
('49', '1', 'Enim', 'Nulla', '00:22:00'),
('30', '9', 'Aliquet', 'Porttitor', DEFAULT),
('504', '7', 'Lacus', 'Luctus', '00:12:00'),
('998', '12', 'Accumsan', 'Tortor', '00:05:00'),
('17', '11', 'Posuere', 'Consequat', '00:15:00'),
('16', '10', 'Akola', 'Surat', '00:14:00')
GO

INSERT INTO Controller VALUES
(509, 'Boone Cook', 30, 654),
(21, 'Yoshiaki Ward', 44, 679),
(114, 'Ulises Bailey', 20, 732),
(50, 'Edison Cooper', 29, 734),
(21, 'Lawrence Alexander', 59, 502),
(692, 'Matt Driscoll', 51, 677),
(78, 'Taiba Howarth', 27, 682),
(151, 'Aubrey Wolfe', 56, 516),
(25, 'Kyal Meadows', 63, 508),
(49, 'Austen Mccarthy', 29, 744),
(30, 'Kingsley Hilton', 49, 702),
(504, 'Ralphie Hernandez', 28, 510),
(998, 'Miles Spears', 30, 756),
(17, 'Coral Peacock', 64, 554),
(16, 'Geraint Wang', 20, 534)
GO

INSERT INTO Depot VALUES
('28 Walnutwood Rd.', 40, 5),
('60 Smoky Hollow St.', 15, 11),
('293 Market St.', 10, 8),
('76 South Myrtle Drive', DEFAULT, 0),
('878 Jefferson Drive', 25, 15),
('4775 Rollins Road', 17, 5),
('4479 Ash Avenue', 15, 11),
('1878 Dancing Dove Lane', 100, 84),
('1728 Linda Street', DEFAULT, 0),
('3978 Sussex Court', 250, 115),
('2088 Oakwood Avenue', 14, 4),
('2553 University Hill Road', 78, 12),
('293 Market St.', 80, 8),
('76 South Myrtle Drive', DEFAULT, 0),
('878 Jefferson Drive', 14, 11)
GO

INSERT INTO DepotEmployee VALUES
(4, 'Isobel Juarez', 'Mechanic', 19, 758),
(1, 'Kurt Hogan', 'Chief Engineer', 56, 840),
(9, 'Diane Ponce', 'Ñleaner', 22, 545),
(12, 'Rihanna Collins', 'Director', 29, 999),
(5, 'Aaliyah Garner', 'Mechanic', 21, 509),
(7, 'Emilie Maddox', 'Constructor', 23, 596),
(15, 'Amina Mcintosh', 'Logistician', 34, 671),
(3, 'Ryan Campbell', 'Designer', 49, 932),
(2, 'Samia Whitney', 'Mechanic', 37, 849),
(4, 'Fred Valentine', 'Ñleaner', 50, 720),
(11, 'Jasper Rosario', 'Constructor', 63, 824),
(13, 'Saira Watts', 'Accountant', 31, 733),
(1, 'Tabitha Rhodes', 'Engineer', 19, 837),
(8, 'Bushra Rich', 'Logistician', 39, 967),
(6, 'Walter Holder', 'Ñleaner', 18, 617)
GO

INSERT INTO Manufacture VALUES
('RideHub', '2341 Lake Forest Drive, NY', 137),
('TransfuseTransit', '2948 Cimmaron Road, CA', 422),
('Siro', '3932 Better Street, KS', 189),
('Buscio', '1280 Michael Street, TX', 170),
('Shuttle', '2357 Geneva Street, NY', 263),
('Sable', '707 Devils Hill Road, MS', 290),
('Mobius', '2009 Turkey Pen Road, NY', 243),
('Sibilance', '3813 Henry Ford Avenue, OK', 410),
('TriCab', '3656 Jody Road, PA', 183),
('GetawayMobility', '2662 Lee Avenue, NJ', 21),
('Lufen', '4432 Walnut Drive, ND', 95),
('Airbus', '4347 Park Street, CA', 105),
('Turofone', '4475 Poplar Street, IL', 164),
('RideGo', '3003 Hiney Road, NV', 130),
('Tippin', '46 Zimmerman Lane, CA', 106)
GO

INSERT INTO PublicTransport VALUES
(2, 1, 'tram', 'AEG HS56'),
(2, 3, 'minibus', 'Tatra T400'),
(4, 5, 'minibus', 'Fiat 672F'),
(3, 2, 'trolleybus', 'Bogdan 228'),
(15, 1, 'electric train', 'Inbus F140'),
(12, 13, 'bus', 'Crossley TDD42'),
(3, 6, 'electric train', 'Daimler'),
(4, 7, 'electric train', 'English DD6WTB'),
(11, 8, 'tram', 'FBW 71'),
(13, 15, 'bus', 'FBW 91T'),
(10, 9, 'trolleybus', 'Fiat 2404'),
(9, 7, 'minibus', 'Fuji 250 series'),
(14, 5, 'tram', 'Ganz'),
(5, 11, 'bus', 'LOWA W700'),
(7, 12, 'trolleybus', 'Guy BT')
GO

INSERT INTO Driver VALUES
(9, 'Braden Flores', 24, 448),
(6, 'Lionel Foster', 52, 518),
(12, 'Waylon Walker', 50, 662),
(2, 'Uziel Rivera', 27, 637),
(10, 'Omar Barnes', 53, 532),
(6, 'Uzair Shaffer', 46, 679),
(4, 'Aniqa Bean', 23, 532),
(1, 'Amirah Cooke', 59, 507),
(11, 'Asad Hinton', 53, 436),
(10, 'Amy-Louise Austin', 28, 557),
(13, 'Sahra Mcgregor', 38, 576),
(3, 'Lionel Foster', 36, 463),
(9, 'Tyrese Christian', 42, 425),
(12, 'Uziel Rivera', 34, 476),
(8, 'Eleanor Nicholls', 25, 653)
GO

INSERT INTO Validator VALUES
(15, 20, DEFAULT),
(10, 21, 2),
(9, 4, 3),
(8, 15, 15),
(1, 12, 21),
(7, 10, 16),
(2, 22, 4),
(5, 14, 5),
(4, 11, 10),
(3, 10, 35),
(1, DEFAULT, 44),
(5, 22, 8),
(11, 54, 9),
(12, 14, 14),
(13, 19, 25)
GO

INSERT INTO TransportRoute VALUES
(509, 8, '2022-02-12', '2024-03-11'),
(50, 9, '2021-05-15', '2025-07-29'),
(21, 10, '2022-09-27', '2029-10-07'),
(114, 11, '2020-02-20', '2032-03-15'),
(509, 12, '2021-12-21', '2022-01-11'),
(692, 1, '2022-02-12', '2024-03-11'),
(151, 2, '2021-05-15', '2025-07-29'),
(504, 5, '2022-09-27', '2029-10-07'),
(30, 7, '2020-02-20', '2032-03-15'),
(49, 13, '2021-12-21', '2022-01-11'),
(25, 15, '2022-02-12', '2024-03-11'),
(16, 8, '2021-05-15', '2025-07-29'),
(17, 14, '2022-09-27', '2029-10-07'),
(114, 3, '2020-02-20', '2032-03-15'),
(509, 4, '2021-12-21', '2022-01-11')
GO

