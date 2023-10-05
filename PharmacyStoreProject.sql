

use [PharmacyStore]
go


CREATE TABLE [dbo].[EmployeeType]
	(
		EmployeeTypeID INT PRIMARY KEY, 
		TypeDescription NVARCHAR(50),
	)
INSERT INTO  [dbo].[EmployeeType] (EmployeeTypeID, TypeDescription)
             VALUES (1, 'Pharmarcist'),
			        (2, 'Pharmarcist Assistance'),
			        (3, 'Janitor')

SELECT * FROM [dbo].[EmployeeType]

CREATE TABLE [dbo].[Employee]
	(
		EmployeeID INT PRIMARY KEY, 
		LastName NVARCHAR(50), 
		FirstName NVARCHAR(50), 
		EmployeeTypeID INT,
		CONSTRAINT Employee_EmployeeTypeID FOREIGN KEY (EmployeeTypeID) REFERENCES EmployeeType (EmployeeTypeID) 
	)
INSERT INTO [dbo].[Employee](EmployeeID, LastName, FirstName, EmployeeTypeID)
		VALUES	(1, 'Jackson', 'John', 1),
				(2, 'Tawa', 'Bello', 1),
				(3, 'Adeyemi', 'Ola', 1),
				(4, 'Olatoyin', 'Ade', 2),
				(5, 'Dunni', 'Bolarinwa', 2),
				(6, 'Chien', 'Jack', 2),
				(7, 'Singh', 'Hing', 2),
				(8, 'Emmanuel', 'Ibol', 3),
				(9, 'Jack', 'Michael', 1)

SELECT * FROM Employee


CREATE TABLE [dbo].[Province] 
	(
		ProvinceID INT PRIMARY KEY, 
		ProvinceName NVARCHAR(50)
	)
INSERT INTO[dbo].[Province] (ProvinceID, ProvinceName)
        VALUES  (1, 'Alberta'),
		        (2, 'Saskatchewan'),
				(3, 'Manitoba'),
				(4, 'Quebac'),
				(5, 'Ontario'),
				(6, 'Newfoundland'),
				(7, 'British Columbia'),
				(8, 'Nova Scotia')
		        
SELECT * FROM [dbo].[Province]

CREATE TABLE [dbo].[City] 
(
	CityID INT PRIMARY KEY, 
	CityName NVARCHAR(50), 
	ProvinceID INT,
	CONSTRAINT City_ProvinceID FOREIGN KEY (ProvinceID) REFERENCES Province (ProvinceID)
)
INSERT INTO [dbo].[City] (CityID, CityName, ProvinceID)
        VALUES  (1, 'Edmonton', 1),
		        (2, 'Calgary', 1),
				(3, 'Red Deer', 1),
				(4, 'Regina', 2),
				(5, 'Saskatoon', 2),
				(6, 'Toronto', 5),
				(7, 'Winnepeg',3),
				(8, 'Brampton', 5)
		        
SELECT * FROM [dbo].[City]

CREATE TABLE [dbo].[Branch] 
(
	BranchID INT PRIMARY KEY, 
	BranchName NVARCHAR(50), 
	Address NVARCHAR (250), 
	CityID INT,
	CONSTRAINT Branch_CityID FOREIGN KEY (CityID) REFERENCES City (CityID)
)
INSERT INTO [dbo].[Branch] ([BranchID], [BranchName], [Address], [CityID])
        VALUES  (1, 'Costco SW', '123, Person Road', 1),
		        (2, 'Millwoods Town Centre', '123Lakewood Road', 1)
				
SELECT * FROM [dbo].[Branch]

CREATE TABLE Shelve 
(
	ShelveID INT PRIMARY KEY, 
	ShelveName NVARCHAR (5) 
)
INSERT INTO Shelve (ShelveID, ShelveName)
	VALUES (1, 'A'),
			(2, 'B'),
			(3, 'C')

SELECT * FROM [dbo].[Shelve];

CREATE TABLE [dbo].[Category] 
(
	CategoryID INT PRIMARY KEY, 
	CategoryName NVARCHAR(50), 
	ShelveID int
	CONSTRAINT Category_ShelveID FOREIGN KEY (ShelveID) REFERENCES Shelve (ShelveID)
)
INSERT INTO [dbo].[Category] (CategoryID, CategoryName, ShelveID)
        VALUES  (1, 'Antibiotics', 1),
		        (2, 'Multivitamins', 2),
				(3, 'Pain Reliefs', 3)

SELECT * FROM [dbo].[Category]


CREATE TABLE [dbo].[Drug] 
	(
		DrugID INT PRIMARY KEY, 
		DrugName NVARCHAR(50), 
		CategoryID INT, 
		UnitPrice MONEY,
		CONSTRAINT Drug_CategoryID FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID)
	)
INSERT INTO [dbo].[Drug] (DrugID, DrugName, CategoryID, UnitPrice)
        VALUES  (1, 'Amoxil', 1, 10),
		        (2, 'Augumentin', 1, 12),
				(3, 'Cephalexin', 1, 13),
				(4, 'Ciprofloxacin', 1, 14),
				(5, 'Clindamycin', 1, 15),
				(6, 'Metronidazole', 1, 16),
				(7, 'Centrum for Women', 2, 17),
				(8, 'Centrum for Men', 2, 18),
				(9, 'Vitamin D3', 2, 19),
				(10, 'Folate', 2, 20),
				(11, 'Advil', 3, 21),
				(12, 'Aboniki', 3, 22),
				(13, 'Ibuprofen', 3, 23)
				
SELECT * FROM [dbo].[Drug]

CREATE TABLE [dbo].[AgeGroup] 
(
	AgeGroupID INT PRIMARY KEY, 
	GroupName NVARCHAR(50), 
	StartAgeRange INT, 
	EndAgeRange INT 
)
INSERT INTO [dbo].[AgeGroup] (AgeGroupID, GroupName, StartAgeRange,EndAgeRange)
        VALUES  (1, 'Infant', 0, 2),
		        (2, 'Children', 3, 17),
				(3, 'Adult', 18, 65),
				(4, 'Senior', 66, 99)
				
		        
SELECT * FROM [dbo].[AgeGroup]

CREATE TABLE [dbo].[Patients] 
(
	PatientID INT PRIMARY KEY, 
	LastName NVARCHAR(50), 
	FirstName NVARCHAR(50), 
	DoB NVARCHAR(50), 
	AgeGroupID INT,
	CONSTRAINT Patient_AgeGroupID FOREIGN KEY (AgeGroupID) REFERENCES AgeGroup (AgeGroupID)
)
INSERT INTO [dbo].[Patients] (PatientID, LastName, FirstName, DoB, AgeGroupID)
        VALUES  (1, 'Saheed', 'Bros', '12-12-2002', 3),
		        (2, 'Soga', 'Michael', '12-12-2003', 3),
				(3, 'Chima', 'Obi', '01-10-1997', 3),
				(4, 'Omolade', 'FKY', '10-10-1945', 4),
				(5, 'Bowade', 'FL', '10-10-1970', 3),
				(6, 'Esan', 'Onifade', '01-02-2020', 2)

SELECT * FROM [dbo].[Patients]

CREATE TABLE Assistance 
(
	AssistanceID INT PRIMARY KEY, 
	EmployeeID INT, 
	LastName NVARCHAR(50), 
	FirstName NVARCHAR(50),
	CONSTRAINT Assistance_AgeGroupID FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID)
) 
INSERT INTO Assistance(AssistanceID, EmployeeID, LastName, FirstName)
	VALUES	(4, 2, 'Olatoyin', 'Ade'),
			(5, 2, 'Jackie', 'B'),
			(6, 2, 'Otobong', 'Ek'),
			(7, 2, 'Rosie', 'U')

SELECT * FROM Assistance

CREATE TABLE  [dbo].[AssistanceType] 
(
	AssistantTypeID INT PRIMARY KEY, 
	TypeDescription NVARCHAR(50)
)
INSERT INTO  [dbo].[AssistanceType] (AssistantTypeID, TypeDescription)
        VALUES  (1, 'Billing'),
		        (2, 'Sorting'),
				(3, 'Despensing'),
				(4, 'Counter'),
				(5, 'Cleaning')
SELECT * FROM [dbo].[AssistanceType]

-- References the SalesID from the SalesTransaction.

CREATE TABLE [dbo].[Pharm_AssistantTrans]
(
	Pharm_AssistantTransID INT IDENTITY (1,1) PRIMARY KEY, 
	SalesID INT, 
	AssistanceID INT, 
	AssistanceTypeID INT,
	CONSTRAINT Pharm_AssistantTrans_SalesID FOREIGN KEY (SalesID) REFERENCES SalesTransaction (SalesID),
	CONSTRAINT Pharm_AssistantTrans_AssistanceID FOREIGN KEY (AssistanceID) REFERENCES Assistance (AssistanceID),
	CONSTRAINT Pharm_AssistantTrans_AssistanceTypeID FOREIGN KEY (AssistanceTypeID) REFERENCES AssistanceType (AssistantTypeID)
)

SELECT * FROM [dbo].[Pharm_AssistantTrans]


CREATE TABLE SalesTransaction
(
	SalesID INT IDENTITY(1,1) PRIMARY KEY, 
	TransDate DATE, 
	DrugID INT, 
	PatientID INT, 
	PharmacistID INT, 
	BranchID INT, 
	Quantity FLOAT,
	CONSTRAINT SalesTransaction_DrugID FOREIGN KEY (DrugID) REFERENCES Drug (DrugID),
	CONSTRAINT SalesTransaction_PatientID FOREIGN KEY (PatientID) REFERENCES Patients (PatientID),
	CONSTRAINT SalesTransaction_PharmacistID FOREIGN KEY (PharmacistID) REFERENCES Employee (EmployeeID),
	CONSTRAINT SalesTransaction_BranchID FOREIGN KEY (BranchID) REFERENCES Branch (BranchID)
)

SELECT * FROM SalesTransaction

--QUESTIONS 3
-- TO DYNAMIALLY POPULATE THE SALES TRANSACTION TABLE
---------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE PharmStoreSalesTrans (@initialYear INT, @finalYear INT, @targetRecordsPerYear INT,  @drugMultiplier INT )
AS 
BEGIN
SET NOCOUNT ON												-- do not count the number of iterations/multiplier

		--DECLARE @initialYear INT = YEAR(DATEADD(YEAR, -5, GETDATE())) -- year five years ago, instead of writing 2018
		--DECLARE @finalYear INT = YEAR(GETDATE())                    -- current year, instead of writing 2022
		DECLARE @currentYear INT = @initialYear						-- for operational purpose
		DECLARE @dateDiffs INT 	-- variable for the exact difference in dates/days btw 2 consecutive years
		DECLARE @randomDates INT   -- derive random dates using the declare date difference
		DECLARE @initialDates DATE  -- subtract random dates from current/initial dates
		--DECLARE @targetRecordsPerYear INT = 50000					-- set the yearly target
		DECLARE @recordCount INT = 0								-- initiate recordcount
		DECLARE @drugsID INT										-- declare variable
		--DECLARE @drugMultiplier INT = 25
		DECLARE @patientsID INT										-- declare variable
		DECLARE @EmployeeID INT
		DECLARE @PharmNew INT
		DECLARE @RandPharmNew INT 
		

		DECLARE @branchesID INT										-- declare variable
		DECLARE @quantities INT										-- declare variable

		IF (SELECT COUNT(*) FROM [SalesTransaction]) > 0		--check if the table already contain some data
			TRUNCATE TABLE [SalesTransaction];					--clean up the table should it contain any data
		IF OBJECT_ID('tempdb..#TempPharm') IS NOT NULL
			DROP TABLE #TempPharm

		CREATE TABLE #TempPharm
		(
			PharmNew INT, 
			LastName NVARCHAR (50), 
			FirstName NVARCHAR (50), 
			EmployeeID INT
		)

		WHILE @currentYear <= @finalYear				--set initial and overall condition with respect to year, say while 2018 < 2023, 2019 < 2023 etc 

			BEGIN										-- start implementing with the condition @currentYear < @finalYear

				 INSERT INTO #TempPharm(PharmNew, LastName, FirstName, EmployeeID)

				 SELECT ROW_NUMBER() OVER (ORDER BY EmployeeID) AS PharmNew, LastName, FirstName, EmployeeID FROM [dbo].[Employee] WHERE EmployeeTypeID = 1;

				WHILE @recordCount < @targetRecordsPerYear				--set condition with respect to number of records per year

					BEGIN

						-- the five columns apart from the SalesID which is autoincrement
						SELECT @drugsID = CAST(RAND() * (SELECT MAX(DrugID) FROM Drug) AS INT) + 1					--to randomly derive the various values of DrugID
						
						SELECT @patientsID = CAST(RAND() * (SELECT MAX(PatientID) FROM Patients) AS INT) + 1		--to randomly derive the various values of PatientID
						
						SELECT @dateDiffs = DATEDIFF(DAY, DATEFROMPARTS(@currentYear, 1, 1), DATEFROMPARTS(@currentYear + 1, 1, 1))	-- variable for the exact difference in dates/days btw 2 consecutive years
						SELECT @randomDates = CAST(RAND() * @dateDiffs AS INT)  -- derive random dates using the declare date difference
						SELECT @initialDates = DATEADD(DAY, -@randomDates, DATEFROMPARTS(@currentYear + 1, 1, 1))
						
						SELECT @PharmNew = (SELECT CAST(RAND () * (SELECT MAX(PharmNew) FROM #TempPharm) AS INT) + 1)
						SELECT @EmployeeID = EmployeeID FROM #TempPharm WHERE PharmNew = @PharmNew
						
						SELECT @branchesID = CAST(RAND() * (SELECT MAX(BranchID) FROM Branch) AS INT) + 1			--to randomly derive the various values of BranchID
						
						SELECT @quantities = CAST(RAND() * @drugMultiplier AS INT) + 1											--to randomly derive the various values of Quantities <= 25
        
						INSERT INTO [SalesTransaction] (TransDate, DrugID, PatientID, PharmacistID, BranchID, Quantity)			-- indicate columns in Sales Transaction table where values should be inserted 
						VALUES (@initialDates,  @drugsID, @patientsID, @EmployeeID, @branchesID, @quantities)					-- insert the randomly derived variable values into the empty Sales Transaction table
        
						SELECT @recordCount += 1			--increament the record by 1, same as @recordCount = @recordCount + 1
					END										--run again from BEGIN as long as the number of records is still less than yearly target, otherwise terminate and go down
    
				SELECT @currentYear += 1				-- move the the next year (year + 1), run this after meeting the yearly target, same as @currentYear = @currentYear + 1
				SELECT @recordCount = 0					-- reset the record count to start afresh for the new year

			END

			--TO DYNAMICALLY POPULATE PHARMASSIST TABLE TRANS 

		DECLARE @RandAssistNew_ID INT							--a new row id created as proxy to reach the AssistanceID
		DECLARE @AssistanceID INT
		DECLARE @AssistanceTypeID INT
		DECLARE @AssistSalesID INT
		DECLARE @Count INT = 0

		-- Truncate the table before inserting records
		TRUNCATE TABLE [dbo].[Pharm_AssistantTrans]

		-- Create a temporary table to hold Assistance data
		IF OBJECT_ID('tempdb..#TempAssist') IS NOT NULL
			DROP TABLE #TempAssist

		CREATE TABLE #TempAssist
		(
			Assist_NewID INT,
			AssistanceID INT
		)

		WHILE @count < (SELECT COUNT(*) FROM [SalesTransaction])
		BEGIN
			INSERT INTO #TempAssist (Assist_NewID, AssistanceID)
			SELECT ROW_NUMBER() OVER (ORDER BY AssistanceID) AS Assist_NewID, AssistanceID FROM Assistance 
    
			SET @RandAssistNew_ID = (SELECT CAST(RAND()* (SELECT MAX(Assist_NewID) FROM #TempAssist) AS INT) + 1)
			SELECT @AssistanceID = (SELECT TOP 1 AssistanceID FROM #TempAssist WHERE Assist_NewID = @RandAssistNew_ID) 
    
			-- Generate a random AssistanceTypeID (not equal to 5 i.e. cleaner not considered for transaction jobs)
			SELECT @AssistanceTypeID = CAST(RAND() * (SELECT MAX(AssistantTypeID) FROM AssistanceType WHERE AssistantTypeID NOT IN (5)) AS INT) + 1

			--SELECT * FROM [dbo].[AssistanceType]
			--salesID from Sales Transaction Table
			SELECT @AssistSalesID = (SELECT CAST(RAND()*(SELECT MAX(SalesID) FROM (SELECT SalesID, TransDate FROM [SalesTransaction]) a) AS INT) + 1)

			INSERT INTO [dbo].[Pharm_AssistantTrans] (SalesID, AssistanceID, AssistanceTypeID)
			VALUES (@AssistSalesID, @AssistanceID, @AssistanceTypeID)
   
			SELECT @count += 1
		END

END		--End of script
-------------------------------------------------------------------------------------------------------------------------------------------------------


	-- to execute the stored procedure with desired parameters
	EXEC PharmStoreSalesTrans 2018, 2022, 50, 25

	-- to query the populated tables
	SELECT * FROM [SalesTransaction]
	ORDER BY TransDate

	SELECT * FROM [Pharm_AssistantTrans]












