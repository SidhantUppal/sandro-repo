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
ALTER TABLE dbo.INSTALLATIONS ADD
	INS_LIT_UNPARK_NOT_ALLOWED numeric(18, 0) NULL
GO
ALTER TABLE dbo.INSTALLATIONS SET (LOCK_ESCALATION = TABLE)
GO
COMMIT


/***********************************************************************************************************/
/* YA ESTAN DISPONIBLES LOS REGISTROS EN TODOS LOS ENTORNOS*/
/***********************************************************************************************************/
--INSERT INTO [dbo].[LITERALS]([LIT_ID],[LIT_DESCRIPTION],[LIT_KEY])
--VALUES(60000020,'Mensaje por defecto: no tiene derecho desaparcar',NULL)

--INSERT INTO [dbo].[LITERAL_LANGUAGES]([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL])
--VALUES(60000020,1,'La ordenanza de tu ciudad no permite desaparcar el m�nimo de la tarifa (habitualmente 15 minutos). Disculpa las molestias.')
--INSERT INTO [dbo].[LITERAL_LANGUAGES]([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL])
--VALUES(60000020,2,'Unpark is not allowed because of city/operator rules when your parking session is the minimum time allowed.')
--INSERT INTO [dbo].[LITERAL_LANGUAGES]([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL])
--VALUES(60000020,3,'Plaque non-authoris�e pour terminer le stationnement.')
--INSERT INTO [dbo].[LITERAL_LANGUAGES]([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL])
--VALUES(60000020,4,'L''ordenan�a de la teva ciutat no permet retornar els aparcaments del m�nim de la tarifa (habitualment 15 minuts). Disculpa les mol�sties.')
--INSERT INTO [dbo].[LITERAL_LANGUAGES]([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL])
--VALUES(60000020,5,'El reglamento de su ciudad no permite retornar los estacionamientos por el m�nimo de la tarifa (habitualmente 15 minutos). Disculpe las molestias.')


--INSERT INTO [dbo].[LITERALS]([LIT_ID],[LIT_DESCRIPTION],[LIT_KEY])
--VALUES(60000021,'Mensaje Sant Cugat: no tiene derecho desaparcar',NULL)

--INSERT INTO [dbo].[LITERAL_LANGUAGES]([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL])
--VALUES(60000021,1,'La ordenanza municipal de su municipio estipula un tiempo m�nimo de estacionamiento que no se puede recuperar en caso de des aparcamiento. Cualquier duda puede dirigirse a la Oficina de Estacionamiento Regulado o llamar al 93.855.23.64')
--INSERT INTO [dbo].[LITERAL_LANGUAGES]([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL])
--VALUES(60000021,2,'The municipal ordinance of its municipality stipulates a minimum parking time that can not be recovered in case of parking. Any doubt can be directed to the Regulated Parking Office or call 93.855.23.64')
--INSERT INTO [dbo].[LITERAL_LANGUAGES]([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL])
--VALUES(60000021,3,'L''ordonnance municipale de sa municipalit� stipule une dur�e de stationnement minimale qui ne peut �tre r�cup�r�e en cas de stationnement. Tout doute peut �tre dirig� vers le bureau de stationnement r�glement� ou appeler le 93 855.23.64')
--INSERT INTO [dbo].[LITERAL_LANGUAGES]([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL])
--VALUES(60000021,4,'L''ordenan�a municipal del seu municipi estipula un temps m�nim d''estacionament que no es pot recuperar en cas de des aparcament. Qualsevol dubte pot adre�ar-se a l''Oficina d�Estacionament Regulat o trucar al 93.855.23.64')
--INSERT INTO [dbo].[LITERAL_LANGUAGES]([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL])
--VALUES(60000021,5,'La ordenanza municipal de su municipio estipula un tiempo m�nimo de estacionamiento que no se puede recuperar en caso de des aparcamiento. Cualquier duda puede dirigirse a la Oficina de Estacionamiento Regulado o llamar al 93.855.23.64')

/***********************************************************************************************************/

UPDATE INSTALLATIONS SET INS_LIT_UNPARK_NOT_ALLOWED=60000020
UPDATE INSTALLATIONS SET INS_LIT_UNPARK_NOT_ALLOWED=60000021 where INS_ID=200001