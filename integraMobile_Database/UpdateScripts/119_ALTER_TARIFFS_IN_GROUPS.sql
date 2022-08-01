/* Para evitar posibles problemas de p�rdida de datos, debe revisar este script detalladamente antes de ejecutarlo fuera del contexto del dise�ador de base de datos.*/
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
ALTER TABLE dbo.TARIFFS_IN_GROUPS ADD
	TARGR_POLYGON_SHOW int NULL,
	TARGR_POLYGON_COLOUR varchar(10) NULL,
	TARGR_POLYGON_Z int NULL,
	TARGR_POLYGON_MAP_DESCRIPTION varchar(500) NULL
GO
ALTER TABLE dbo.TARIFFS_IN_GROUPS SET (LOCK_ESCALATION = TABLE)
GO
COMMIT