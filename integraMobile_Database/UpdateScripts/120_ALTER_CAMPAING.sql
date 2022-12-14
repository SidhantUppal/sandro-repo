/* Para evitar posibles problemas de p?rdida de datos, debe revisar este script detalladamente antes de ejecutarlo fuera del contexto del dise?ador de base de datos.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.CAMPAING
	DROP CONSTRAINT FK_CAMPAING_COUNTRIES
GO
ALTER TABLE dbo.COUNTRIES SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.CAMPAING
	DROP CONSTRAINT DF_CAMPAING_CAMP_STATUS
GO
CREATE TABLE dbo.Tmp_CAMPAING
	(
	CAMP_ID numeric(18, 0) NOT NULL IDENTITY (1, 1),
	CAMP_DESCRIPTION nvarchar(100) NULL,
	CAMP_SCHEMA numeric(18, 0) NOT NULL,
	CAMP_STATUS int NOT NULL,
	CAMP_COU_ID numeric(18, 0) NOT NULL,
	CAMP_MAX_DELIVER_AMOUNT int NOT NULL,
	CAMP_INSERTION_UTC_DATE date NOT NULL,
	CAMP_INITIAL_DELIVERY_DATE date NOT NULL,
	CAMP_END_DELIVERY_DATE date NULL,
	CAMP_USER_DELIVER_AMOUNT int NOT NULL,
	CAMP_USER_MAX_USES int NOT NULL,
	CAMP_PARKING_NUMBER numeric(18, 0) NULL,
	CAMP_NUMBER_BONIFYED_PARKING nvarchar(1024) NULL,
	CAMP_DISCOUNT numeric(18, 5) NULL,
	CAMP_LAYOUT_ID numeric(18, 0) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_CAMPAING SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.Tmp_CAMPAING ADD CONSTRAINT
	DF_CAMPAING_CAMP_STATUS DEFAULT ((1)) FOR CAMP_STATUS
GO
SET IDENTITY_INSERT dbo.Tmp_CAMPAING ON
GO
IF EXISTS(SELECT * FROM dbo.CAMPAING)
	 EXEC('INSERT INTO dbo.Tmp_CAMPAING (CAMP_ID, CAMP_DESCRIPTION, CAMP_SCHEMA, CAMP_STATUS, CAMP_COU_ID, CAMP_MAX_DELIVER_AMOUNT, CAMP_INSERTION_UTC_DATE, CAMP_INITIAL_DELIVERY_DATE, CAMP_END_DELIVERY_DATE, CAMP_USER_DELIVER_AMOUNT, CAMP_USER_MAX_USES)
		SELECT CAMP_ID, CAMP_DESCRIPTION, CAMP_SCHEMA, CAMP_STATUS, CAMP_COU_ID, CAMP_MAX_DELIVER_AMOUNT, CAMP_INSERTION_UTC_DATE, CAMP_INITIAL_DELIVERY_DATE, CAMP_END_DELIVERY_DATE, CAMP_USER_DELIVER_AMOUNT, CAMP_USER_MAX_USES FROM dbo.CAMPAING WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_CAMPAING OFF
GO
ALTER TABLE dbo.CAMPAING_USER_ASSIGNATION
	DROP CONSTRAINT FK_CAMPAING_USER_ASSIGNATION_CAMPAING
GO
DROP TABLE dbo.CAMPAING
GO
EXECUTE sp_rename N'dbo.Tmp_CAMPAING', N'CAMPAING', 'OBJECT' 
GO
ALTER TABLE dbo.CAMPAING ADD CONSTRAINT
	PK_CAMPAING PRIMARY KEY CLUSTERED 
	(
	CAMP_ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.CAMPAING ADD CONSTRAINT
	FK_CAMPAING_COUNTRIES FOREIGN KEY
	(
	CAMP_COU_ID
	) REFERENCES dbo.COUNTRIES
	(
	COU_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.CAMPAING_USER_ASSIGNATION ADD CONSTRAINT
	FK_CAMPAING_USER_ASSIGNATION_CAMPAING FOREIGN KEY
	(
	CAUS_CAMP_ID
	) REFERENCES dbo.CAMPAING
	(
	CAMP_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.CAMPAING_USER_ASSIGNATION SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
