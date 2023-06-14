CREATE DATABASE KalipsoCoffe
GO

USE KalipsoCoffe
GO

CREATE TABLE MembershipInfo(

	mem_ID					INT IDENTITY (1,1),
	mem_FirstName			NVARCHAR(80)		NOT NULL,
	mem_MiddleName			NVARCHAR(80),
	mem_LastName			NVARCHAR(80)		NOT NULL,
	mem_PhoneNumber			VARCHAR(9)			NOT NULL,
	mem_Email				NVARCHAR(200)		NOT NULL,
	mem_ExpirationDate		DATETIME			NOT NULL,
	mem_MemebershipType		INT					NOT NULL,
	mem_Image				NVARCHAR(MAX)		NOT NULL

	CONSTRAINT PK_dbo_MembershipInfo_mem_ID				PRIMARY KEY		(mem_ID),
	CONSTRAINT CK_dbo_MembershipInfo_mem_MembershipType	CHECK			(mem_MemebershipType IN (1,2,3))
);

-- #1
INSERT INTO MembershipInfo([mem_FirstName],[mem_MiddleName], [mem_LastName],[mem_PhoneNumber],[mem_Email],[mem_ExpirationDate],[mem_MemebershipType], [mem_Image])
VALUES					  ('Esdra', 'María', 'Cerna', '999-999', 'esdracerna@kalipsocoffeshop.com', '12-12-2025', 1,'https://i.ibb.co/9bkZrBc/165423294-retrato-de-una-empleada-pelirroja-sonriente-con-anteojos-y-cabello-peinado-en-mo-o-tocando.webp')
GO

-- #2
INSERT INTO MembershipInfo([mem_FirstName],[mem_MiddleName], [mem_LastName],[mem_PhoneNumber],[mem_Email],[mem_ExpirationDate],[mem_MemebershipType], [mem_Image])
VALUES					  ('Gustavo', 'E.', 'Lopez', '393-298', 'Gustav999@kalipsocoffeshop.com', '12-12-2027', 2,'https://i.ibb.co/vPW0Vc9/istockphoto-1300972574-170667a.jpg')
GO

-- #3
INSERT INTO MembershipInfo([mem_FirstName],[mem_MiddleName], [mem_LastName],[mem_PhoneNumber],[mem_Email],[mem_ExpirationDate],[mem_MemebershipType], [mem_Image])
VALUES					  ('Alex', 'E.', 'Castro', '123-123', 'alexE@kalipsocoffeshop.com', '12-12-2024', 3,'https://i.ibb.co/645nDRz/istockphoto-1309328823-612x612.jpg')
GO


-- #4
INSERT INTO MembershipInfo([mem_FirstName],[mem_MiddleName], [mem_LastName],[mem_PhoneNumber],[mem_Email],[mem_ExpirationDate],[mem_MemebershipType], [mem_Image])
VALUES					  ('Karla', 'Cecilia', 'Alejandro', '453-889', 'cecimeow@kalipsocoffeshop.com', '12-12-2028', 1,'https://i.ibb.co/SNLcVKG/1673865145388.jpg')
GO

-- #5
INSERT INTO MembershipInfo([mem_FirstName],[mem_MiddleName], [mem_LastName],[mem_PhoneNumber],[mem_Email],[mem_ExpirationDate],[mem_MemebershipType], [mem_Image])
VALUES					  ('Eder', NULL, 'Sánchez', '333-333', 'Sanchez2000@kalipsocoffeshop.com', '12-12-2027', 1,'https://i.ibb.co/mBDgVHr/pexels-photo-5378700.webp')
GO

-- #6
INSERT INTO MembershipInfo([mem_FirstName],[mem_MiddleName], [mem_LastName],[mem_PhoneNumber],[mem_Email],[mem_ExpirationDate],[mem_MemebershipType], [mem_Image])
VALUES					  ('Joselyn', 'Ruby', 'Smith', '901-123', 'jossRsmith@kalipsocoffeshop.com', '01-01-2030', 3,'https://i.ibb.co/zXXctzq/profile.jpg')
GO


CREATE OR ALTER PROC UDP_MembershipInfo_List
	@mem_ID		INT
AS
BEGIN
	SELECT	mem_ID, 
			mem_FirstName, 
			mem_MiddleName, 
			mem_LastName, 
			CONCAT(mem_FirstName, ' ', mem_MiddleName, ' ', mem_LastName) AS 'Full Name',
			mem_PhoneNumber, 
			mem_Email, 
			YEAR(mem_ExpirationDate) AS ExpirationYear, 
			CASE mem_MemebershipType
			WHEN 1 THEN 'https://i.ibb.co/G55Wq67/PREMIUM.png'
			WHEN 2 THEN 'https://i.ibb.co/BLgdYPg/GOLD.png'
			WHEN 3 THEN 'https://i.ibb.co/k9HBybh/PLATINUM.png'
			ELSE '' END AS 'Membership Type', 
			mem_Image 
	FROM MembershipInfo
	WHERE mem_ID = @mem_ID
END