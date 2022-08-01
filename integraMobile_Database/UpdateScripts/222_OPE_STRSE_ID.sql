/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
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
ALTER TABLE dbo.STREET_SECTIONS SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.OPERATIONS ADD
	OPE_STRSE_ID numeric(18, 0) NULL
GO
ALTER TABLE dbo.OPERATIONS ADD CONSTRAINT
	FK_OPERATIONS_STREET_SECTIONS FOREIGN KEY
	(
	OPE_STRSE_ID
	) REFERENCES dbo.STREET_SECTIONS
	(
	STRSE_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.OPERATIONS SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.HIS_OPERATIONS ADD
	OPE_STRSE_ID numeric(18, 0) NULL
GO
ALTER TABLE dbo.HIS_OPERATIONS ADD CONSTRAINT
	FK_HIS_OPERATIONS_STREET_SECTIONS FOREIGN KEY
	(
	OPE_STRSE_ID
	) REFERENCES dbo.STREET_SECTIONS
	(
	STRSE_ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.HIS_OPERATIONS SET (LOCK_ESCALATION = TABLE)
GO
COMMIT


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[TR_OPERATIONS]
   ON [dbo].[OPERATIONS]
   AFTER INSERT,UPDATE
AS 
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

DECLARE @CountInserted int
DECLARE @CountDeleted int

SELECT @CountInserted = COUNT(*) FROM Inserted
SELECT @CountDeleted = COUNT(*) FROM Deleted

IF @CountInserted > 0 AND @CountDeleted > 0
BEGIN


UPDATE HIS_OPERATIONS SET
  OPE_USR_ID = i.OPE_USR_ID,
  OPE_MOSE_OS = i.OPE_MOSE_OS,
  OPE_USRP_ID  = i.OPE_USRP_ID ,
  OPE_INS_ID = i.OPE_INS_ID,
  OPE_TYPE = i.OPE_TYPE,
  OPE_GRP_ID = i.OPE_GRP_ID,
  OPE_TAR_ID = i.OPE_TAR_ID,
  OPE_DATE = i.OPE_DATE,
  OPE_INIDATE = i.OPE_INIDATE,
  OPE_ENDDATE = i.OPE_ENDDATE,
  OPE_UTC_DATE = i.OPE_UTC_DATE,
  OPE_UTC_INIDATE = i.OPE_UTC_INIDATE,
  OPE_UTC_ENDDATE = i.OPE_UTC_ENDDATE,
  OPE_DATE_UTC_OFFSET = i.OPE_DATE_UTC_OFFSET,
  OPE_INIDATE_UTC_OFFSET = i.OPE_INIDATE_UTC_OFFSET,
  OPE_ENDDATE_UTC_OFFSET = i.OPE_ENDDATE_UTC_OFFSET,
  OPE_AMOUNT = i.OPE_AMOUNT,
  OPE_TIME = i.OPE_TIME,
  OPE_AMOUNT_CUR_ID = i.OPE_AMOUNT_CUR_ID,
  OPE_BALANCE_CUR_ID = i.OPE_BALANCE_CUR_ID,
  OPE_CHANGE_APPLIED = i.OPE_CHANGE_APPLIED,
  OPE_CHANGE_FEE_APPLIED = i.OPE_CHANGE_FEE_APPLIED,
  OPE_FINAL_AMOUNT = i.OPE_FINAL_AMOUNT,
  OPE_EXTERNAL_ID1 = i.OPE_EXTERNAL_ID1,
  OPE_EXTERNAL_ID2 = i.OPE_EXTERNAL_ID2,
  OPE_EXTERNAL_ID3 = i.OPE_EXTERNAL_ID3,
  OPE_INSERTION_UTC_DATE = i.OPE_INSERTION_UTC_DATE,
  OPE_CUSPMR_ID = i.OPE_CUSPMR_ID,
  OPE_OPEDIS_ID = i.OPE_OPEDIS_ID,
  OPE_BALANCE_BEFORE = i.OPE_BALANCE_BEFORE,
  OPE_SUSCRIPTION_TYPE = i.OPE_SUSCRIPTION_TYPE,
  OPE_CONFIRMED_IN_WS1 = i.OPE_CONFIRMED_IN_WS1,
  OPE_CONFIRMED_IN_WS2 = i.OPE_CONFIRMED_IN_WS2,
  OPE_CONFIRMED_IN_WS3 = i.OPE_CONFIRMED_IN_WS3,
  OPE_CONFIRM_IN_WS1_RETRIES_NUM = i.OPE_CONFIRM_IN_WS1_RETRIES_NUM,
  OPE_CONFIRM_IN_WS2_RETRIES_NUM = i.OPE_CONFIRM_IN_WS2_RETRIES_NUM,
  OPE_CONFIRM_IN_WS3_RETRIES_NUM = i.OPE_CONFIRM_IN_WS3_RETRIES_NUM,
  OPE_CONFIRM_IN_WS1_DATE = i.OPE_CONFIRM_IN_WS1_DATE,
  OPE_CONFIRM_IN_WS2_DATE = i.OPE_CONFIRM_IN_WS2_DATE,
  OPE_CONFIRM_IN_WS3_DATE = i.OPE_CONFIRM_IN_WS3_DATE,
  OPE_MOSE_ID = i.OPE_MOSE_ID,  
  OPE_LATITUDE = i.OPE_LATITUDE,
  OPE_LONGITUDE = i.OPE_LONGITUDE,
  OPE_APP_VERSION = i.OPE_APP_VERSION,
  OPE_CONFIRMATION_TIME_IN_WS1 = i.OPE_CONFIRMATION_TIME_IN_WS1,
  OPE_CONFIRMATION_TIME_IN_WS2 = i.OPE_CONFIRMATION_TIME_IN_WS2,
  OPE_CONFIRMATION_TIME_IN_WS3 = i.OPE_CONFIRMATION_TIME_IN_WS3,
  OPE_QUEUE_LENGTH_BEFORE_CONFIRM_WS1 = i.OPE_QUEUE_LENGTH_BEFORE_CONFIRM_WS1,
  OPE_QUEUE_LENGTH_BEFORE_CONFIRM_WS2 = i.OPE_QUEUE_LENGTH_BEFORE_CONFIRM_WS2,
  OPE_QUEUE_LENGTH_BEFORE_CONFIRM_WS3 = i.OPE_QUEUE_LENGTH_BEFORE_CONFIRM_WS3,  
  OPE_PERC_VAT1 =  i.OPE_PERC_VAT1,
  OPE_PERC_VAT2 =  i.OPE_PERC_VAT2,
  OPE_PARTIAL_VAT1 = i.OPE_PARTIAL_VAT1,
  OPE_PERC_FEE = i.OPE_PERC_FEE,
  OPE_PERC_FEE_TOPPED = i.OPE_PERC_FEE_TOPPED,
  OPE_PARTIAL_PERC_FEE = i.OPE_PARTIAL_PERC_FEE,
  OPE_FIXED_FEE = i.OPE_FIXED_FEE,
  OPE_PARTIAL_FIXED_FEE = i.OPE_PARTIAL_FIXED_FEE,  
  OPE_PERC_BONUS = i.OPE_PERC_BONUS,
  OPE_PARTIAL_BONUS_FEE = i.OPE_PARTIAL_BONUS_FEE,
  OPE_TOTAL_AMOUNT = i.OPE_TOTAL_AMOUNT,
  OPE_CUSINV_ID  = i.OPE_CUSINV_ID ,
  OPE_BONUS_ID = i.OPE_BONUS_ID,
  OPE_BONUS_MARCA = i.OPE_BONUS_MARCA,
  OPE_BONUS_TYPE = i.OPE_BONUS_TYPE,
  OPE_SPACE_STRING = i.OPE_SPACE_STRING,
  OPE_TIME_BALANCE_USED = i.OPE_TIME_BALANCE_USED,
  OPE_TIME_BALANCE_BEFORE =i.OPE_TIME_BALANCE_BEFORE,
  OPE_REAL_AMOUNT = i.OPE_REAL_AMOUNT,
  OPE_POSTPAY = i.OPE_POSTPAY,
  OPE_REFUND_PREVIOUS_ENDDATE = i.OPE_REFUND_PREVIOUS_ENDDATE,
  OPE_SHOPKEEPER_OP = i.OPE_SHOPKEEPER_OP,
  OPE_SHOPKEEPER_AMOUNT = i.OPE_SHOPKEEPER_AMOUNT,
  OPE_SHOPKEEPER_PROFIT = i.OPE_SHOPKEEPER_PROFIT,
  OPE_AUTH_ID = i.OPE_AUTH_ID,
  OPE_AMOUNT_WITHOUT_BON = i.OPE_AMOUNT_WITHOUT_BON,
  OPE_BON_MLT = i.OPE_BON_MLT,
  OPE_VEHICLE_TYPE = i.OPE_VEHICLE_TYPE,
  OPE_BACKOFFICE_USR = i.OPE_BACKOFFICE_USR,
  OPE_STOP_DATE = i.OPE_STOP_DATE,
  OPE_UTC_STOP_DATE = i.OPE_UTC_STOP_DATE,
  OPE_PARKING_MODE = i.OPE_PARKING_MODE,
  OPE_PARKING_MODE_STATUS = i.OPE_PARKING_MODE_STATUS,
  OPE_EXTERNAL_BASE_ID1 = i.OPE_EXTERNAL_BASE_ID1,
  OPE_EXTERNAL_BASE_ID2 = i.OPE_EXTERNAL_BASE_ID2,
  OPE_EXTERNAL_BASE_ID3 = i.OPE_EXTERNAL_BASE_ID3,
  OPE_PERMIT_AUTO_RENEW = i.OPE_PERMIT_AUTO_RENEW,
  OPE_PERMIT_EXPIRATION_TIME = i.OPE_PERMIT_EXPIRATION_TIME,
  OPE_PERMIT_LAST_AUTORENEWAL_DATE = i.OPE_PERMIT_LAST_AUTORENEWAL_DATE,
  OPE_PERMIT_LAST_AUTORENEWAL_NUM_RETRIES = i.OPE_PERMIT_LAST_AUTORENEWAL_NUM_RETRIES,
  OPE_PERMIT_LAST_AUTORENEWAL_STATUS = i.OPE_PERMIT_LAST_AUTORENEWAL_STATUS,
  OPE_PERMIT_EXPIRATION_UTC_TIME = i.OPE_PERMIT_EXPIRATION_UTC_TIME,
  OPE_PLATE2_USRP_ID  = i.OPE_PLATE2_USRP_ID ,
  OPE_PLATE3_USRP_ID  = i.OPE_PLATE3_USRP_ID ,
  OPE_PLATE4_USRP_ID  = i.OPE_PLATE4_USRP_ID ,
  OPE_PLATE5_USRP_ID  = i.OPE_PLATE5_USRP_ID ,
  OPE_PLATE6_USRP_ID  = i.OPE_PLATE6_USRP_ID ,
  OPE_PLATE7_USRP_ID  = i.OPE_PLATE7_USRP_ID ,
  OPE_PLATE8_USRP_ID  = i.OPE_PLATE8_USRP_ID ,
  OPE_PLATE9_USRP_ID  = i.OPE_PLATE9_USRP_ID ,
  OPE_PLATE10_USRP_ID  = i.OPE_PLATE10_USRP_ID,
  OPE_REL_OPE_ID = i.OPE_REL_OPE_ID,
  OPE_CONFIRM_MODE = i.OPE_CONFIRM_MODE,
  OPE_PERMIT_LAST_AUTORENEWAL_RESULT = i.OPE_PERMIT_LAST_AUTORENEWAL_RESULT,
  OPE_ADDITIONAL_PARAMS = OPERATIONS.OPE_ADDITIONAL_PARAMS,
  OPE_EXPIRE_SMS_SENT = i.OPE_EXPIRE_SMS_SENT,
  OPE_CAMP_ID = i.OPE_CAMP_ID,
  OPE_CAMP_OPE_NUM_BON_PARK = i.OPE_CAMP_OPE_NUM_BON_PARK,
  OPE_BON_EXT_MLT = i.OPE_BON_EXT_MLT,
  OPE_SOAPP_ID = i.OPE_SOAPP_ID,
  OPE_STRSE_ID = i.OPE_STRSE_ID

  FROM HIS_OPERATIONS h INNER JOIN Deleted d on h.OPE_ID=d.OPE_ID JOIN Inserted i ON h.OPE_ID = i.OPE_ID
		INNER JOIN OPERATIONS on h.OPE_ID = OPERATIONS.OPE_ID;

   IF @@ERROR != 0
 ROLLBACK TRAN


END

IF @CountInserted > 0
BEGIN




INSERT INTO HIS_OPERATIONS (OPE_ID,OPE_USR_ID,OPE_MOSE_OS,OPE_USRP_ID ,OPE_INS_ID,OPE_TYPE,OPE_GRP_ID,OPE_TAR_ID,OPE_DATE ,
						OPE_INIDATE,OPE_ENDDATE,OPE_UTC_DATE,OPE_UTC_INIDATE,OPE_UTC_ENDDATE,OPE_DATE_UTC_OFFSET,OPE_INIDATE_UTC_OFFSET,
						OPE_ENDDATE_UTC_OFFSET,OPE_AMOUNT,OPE_TIME,OPE_AMOUNT_CUR_ID,OPE_BALANCE_CUR_ID,OPE_CHANGE_APPLIED,
						OPE_CHANGE_FEE_APPLIED,OPE_FINAL_AMOUNT,OPE_EXTERNAL_ID1,OPE_EXTERNAL_ID2,OPE_EXTERNAL_ID3,
						OPE_INSERTION_UTC_DATE,OPE_CUSPMR_ID,OPE_OPEDIS_ID,OPE_BALANCE_BEFORE,OPE_SUSCRIPTION_TYPE,OPE_CONFIRMED_IN_WS1,
						OPE_CONFIRMED_IN_WS2,OPE_CONFIRMED_IN_WS3,OPE_CONFIRM_IN_WS1_RETRIES_NUM,OPE_CONFIRM_IN_WS2_RETRIES_NUM,
						OPE_CONFIRM_IN_WS3_RETRIES_NUM,OPE_CONFIRM_IN_WS1_DATE,OPE_CONFIRM_IN_WS2_DATE,OPE_CONFIRM_IN_WS3_DATE,
						OPE_MOSE_ID,OPE_LATITUDE,OPE_LONGITUDE,OPE_APP_VERSION,OPE_CONFIRMATION_TIME_IN_WS1,OPE_CONFIRMATION_TIME_IN_WS2,
						OPE_CONFIRMATION_TIME_IN_WS3,OPE_QUEUE_LENGTH_BEFORE_CONFIRM_WS1,OPE_QUEUE_LENGTH_BEFORE_CONFIRM_WS2,
						OPE_QUEUE_LENGTH_BEFORE_CONFIRM_WS3,OPE_PERC_VAT1,OPE_PERC_VAT2,OPE_PARTIAL_VAT1,OPE_PERC_FEE,OPE_PERC_FEE_TOPPED,
						OPE_PARTIAL_PERC_FEE,OPE_FIXED_FEE,OPE_PARTIAL_FIXED_FEE,OPE_PERC_BONUS,OPE_PARTIAL_BONUS_FEE,OPE_TOTAL_AMOUNT,
						OPE_CUSINV_ID,OPE_BONUS_ID, OPE_BONUS_MARCA, OPE_BONUS_TYPE, OPE_SPACE_STRING, OPE_TIME_BALANCE_USED, OPE_TIME_BALANCE_BEFORE,
						OPE_REAL_AMOUNT, OPE_POSTPAY, OPE_REFUND_PREVIOUS_ENDDATE, OPE_SHOPKEEPER_OP, OPE_SHOPKEEPER_AMOUNT, OPE_SHOPKEEPER_PROFIT,
						OPE_AMOUNT_WITHOUT_BON, OPE_BON_MLT, OPE_AUTH_ID, OPE_VEHICLE_TYPE, OPE_BACKOFFICE_USR,
						OPE_STOP_DATE, OPE_UTC_STOP_DATE, OPE_PARKING_MODE, OPE_PARKING_MODE_STATUS,
						OPE_EXTERNAL_BASE_ID1, OPE_EXTERNAL_BASE_ID2, OPE_EXTERNAL_BASE_ID3, OPE_PERMIT_AUTO_RENEW, OPE_PERMIT_EXPIRATION_TIME, 
						OPE_PERMIT_LAST_AUTORENEWAL_DATE, OPE_PERMIT_LAST_AUTORENEWAL_NUM_RETRIES, OPE_PERMIT_LAST_AUTORENEWAL_STATUS, OPE_PERMIT_EXPIRATION_UTC_TIME,
						OPE_PLATE2_USRP_ID, OPE_PLATE3_USRP_ID, OPE_PLATE4_USRP_ID, OPE_PLATE5_USRP_ID, OPE_PLATE6_USRP_ID, OPE_PLATE7_USRP_ID, OPE_PLATE8_USRP_ID, OPE_PLATE9_USRP_ID, OPE_PLATE10_USRP_ID,
						OPE_REL_OPE_ID, OPE_CONFIRM_MODE, OPE_PERMIT_LAST_AUTORENEWAL_RESULT,
						OPE_ADDITIONAL_PARAMS,OPE_EXPIRE_SMS_SENT, OPE_CAMP_ID, OPE_CAMP_OPE_NUM_BON_PARK,OPE_BON_EXT_MLT, OPE_SOAPP_ID,
						OPE_STRSE_ID)
  SELECT i.OPE_ID,i.OPE_USR_ID,i.OPE_MOSE_OS,i.OPE_USRP_ID ,i.OPE_INS_ID,i.OPE_TYPE,i.OPE_GRP_ID,i.OPE_TAR_ID,i.OPE_DATE ,
	i.OPE_INIDATE,i.OPE_ENDDATE,i.OPE_UTC_DATE,i.OPE_UTC_INIDATE,i.OPE_UTC_ENDDATE,i.OPE_DATE_UTC_OFFSET,i.OPE_INIDATE_UTC_OFFSET,
	i.OPE_ENDDATE_UTC_OFFSET,i.OPE_AMOUNT,i.OPE_TIME,i.OPE_AMOUNT_CUR_ID,i.OPE_BALANCE_CUR_ID,i.OPE_CHANGE_APPLIED,
	i.OPE_CHANGE_FEE_APPLIED,i.OPE_FINAL_AMOUNT,i.OPE_EXTERNAL_ID1,i.OPE_EXTERNAL_ID2,i.OPE_EXTERNAL_ID3,
	i.OPE_INSERTION_UTC_DATE,i.OPE_CUSPMR_ID,i.OPE_OPEDIS_ID,i.OPE_BALANCE_BEFORE,i.OPE_SUSCRIPTION_TYPE,i.OPE_CONFIRMED_IN_WS1,
	i.OPE_CONFIRMED_IN_WS2,i.OPE_CONFIRMED_IN_WS3,i.OPE_CONFIRM_IN_WS1_RETRIES_NUM,i.OPE_CONFIRM_IN_WS2_RETRIES_NUM,
	i.OPE_CONFIRM_IN_WS3_RETRIES_NUM,i.OPE_CONFIRM_IN_WS1_DATE,i.OPE_CONFIRM_IN_WS2_DATE,i.OPE_CONFIRM_IN_WS3_DATE,
	i.OPE_MOSE_ID,i.OPE_LATITUDE,i.OPE_LONGITUDE,i.OPE_APP_VERSION,i.OPE_CONFIRMATION_TIME_IN_WS1,i.OPE_CONFIRMATION_TIME_IN_WS2,
	i.OPE_CONFIRMATION_TIME_IN_WS3,i.OPE_QUEUE_LENGTH_BEFORE_CONFIRM_WS1,i.OPE_QUEUE_LENGTH_BEFORE_CONFIRM_WS2,
	i.OPE_QUEUE_LENGTH_BEFORE_CONFIRM_WS3,i.OPE_PERC_VAT1,i.OPE_PERC_VAT2,i.OPE_PARTIAL_VAT1,i.OPE_PERC_FEE,i.OPE_PERC_FEE_TOPPED,
	i.OPE_PARTIAL_PERC_FEE,i.OPE_FIXED_FEE,i.OPE_PARTIAL_FIXED_FEE,i.OPE_PERC_BONUS,i.OPE_PARTIAL_BONUS_FEE,i.OPE_TOTAL_AMOUNT,
	i.OPE_CUSINV_ID,i.OPE_BONUS_ID, i.OPE_BONUS_MARCA, i.OPE_BONUS_TYPE , i.OPE_SPACE_STRING,i.OPE_TIME_BALANCE_USED, i.OPE_TIME_BALANCE_BEFORE,
	i.OPE_REAL_AMOUNT, i.OPE_POSTPAY, i.OPE_REFUND_PREVIOUS_ENDDATE, i.OPE_SHOPKEEPER_OP, i.OPE_SHOPKEEPER_AMOUNT, i.OPE_SHOPKEEPER_PROFIT,
	i.OPE_AMOUNT_WITHOUT_BON, i.OPE_BON_MLT, i.OPE_AUTH_ID, i.OPE_VEHICLE_TYPE, i.OPE_BACKOFFICE_USR,
	i.OPE_STOP_DATE, i.OPE_UTC_STOP_DATE, i.OPE_PARKING_MODE, i.OPE_PARKING_MODE_STATUS,
	i.OPE_EXTERNAL_BASE_ID1, i.OPE_EXTERNAL_BASE_ID2, i.OPE_EXTERNAL_BASE_ID3,  i.OPE_PERMIT_AUTO_RENEW, i.OPE_PERMIT_EXPIRATION_TIME,
	i.OPE_PERMIT_LAST_AUTORENEWAL_DATE, i.OPE_PERMIT_LAST_AUTORENEWAL_NUM_RETRIES, i.OPE_PERMIT_LAST_AUTORENEWAL_STATUS, i.OPE_PERMIT_EXPIRATION_UTC_TIME,
	i.OPE_PLATE2_USRP_ID, i.OPE_PLATE3_USRP_ID, i.OPE_PLATE4_USRP_ID, i.OPE_PLATE5_USRP_ID, i.OPE_PLATE6_USRP_ID, i.OPE_PLATE7_USRP_ID, i.OPE_PLATE8_USRP_ID, i.OPE_PLATE9_USRP_ID, i.OPE_PLATE10_USRP_ID,
	i.OPE_REL_OPE_ID, i.OPE_CONFIRM_MODE, i.OPE_PERMIT_LAST_AUTORENEWAL_RESULT,
	OPERATIONS.OPE_ADDITIONAL_PARAMS, i.OPE_EXPIRE_SMS_SENT, i.OPE_CAMP_ID, i.OPE_CAMP_OPE_NUM_BON_PARK, i.OPE_BON_EXT_MLT, i.OPE_SOAPP_ID,
	i.OPE_STRSE_ID
  FROM Inserted i
		INNER JOIN OPERATIONS ON i.OPE_ID = OPERATIONS.OPE_ID
  where i.OPE_ID not in (select d.OPE_ID from Deleted d);

   IF @@ERROR != 0
 ROLLBACK TRAN
END

END
GO


ALTER VIEW [dbo].[ALL_OPERATIONS]
AS
SELECT        CONVERT(varchar, CASE ISNULL(TAR_TYPE, 0) WHEN 1 THEN 19 ELSE OPE_TYPE END) + '_' + CONVERT(varchar, OPE_ID) AS OPE_IDD,
				CASE ISNULL(TAR_TYPE, 0) WHEN 1 THEN 19 ELSE OPE_TYPE END AS OPE_TYPE, OPE_USR_ID, OPE_INS_ID, INS_DESCRIPTION, INS_SHORTDESC, OPE_DATE, OPE_UTC_DATE, OPE_INIDATE, OPE_ENDDATE, 
                         OPE_REFUND_PREVIOUS_ENDDATE, CAST(CASE WHEN OPE_TYPE = 3 THEN OPE_AMOUNT ELSE - OPE_AMOUNT END AS int) OPE_AMOUNT, CAST(CASE WHEN OPE_TYPE = 3 THEN ISNULL(OPE_REAL_AMOUNT, 
                         OPE_AMOUNT) ELSE - ISNULL(OPE_REAL_AMOUNT, OPE_AMOUNT) END AS int) OPE_REAL_AMOUNT, OPE_TIME, OPE_AMOUNT_CUR_ID, CUR1.CUR_ISO_CODE OPE_AMOUNT_CUR_ISO_CODE, 
                         cast(CUR1.CUR_MINOR_UNIT AS int) OPE_AMOUNT_CUR_MINOR_UNIT, CAST(CASE WHEN OPE_TYPE = 3 THEN OPE_FINAL_AMOUNT ELSE - OPE_FINAL_AMOUNT END AS int) OPE_FINAL_AMOUNT, OPE_BALANCE_CUR_ID, 
                         CUR2.CUR_ISO_CODE OPE_BALANCE_CUR_ISO_CODE, cast(CUR2.CUR_MINOR_UNIT AS int) OPE_BALANCE_CUR_MINOR_UNIT, OPE_CHANGE_APPLIED, USER_PLATES.USRP_ID, USER_PLATES.USRP_PLATE, NULL 
                         TIPA_TICKET_NUMBER, NULL TIPA_TICKET_DATA, NULL SECH_SECHT_ID, GRP_ID, TAR_ID, GRP_DESCRIPTION, TAR_DESCRIPTION, OPE_SUSCRIPTION_TYPE, OPE_BALANCE_BEFORE, OPE_INSERTION_UTC_DATE, 
                         OPE_DATE_UTC_OFFSET, OPE_INIDATE_UTC_OFFSET, OPE_ENDDATE_UTC_OFFSET, 1 EPO_SRCTYPE, NULL EPO_SRCIDENT, OPE_PERC_VAT1, OPE_PERC_VAT2, 
                         CAST(CASE WHEN OPE_TYPE = 3 THEN OPE_PARTIAL_VAT1 ELSE - OPE_PARTIAL_VAT1 END AS int) OPE_PARTIAL_VAT1, OPE_PERC_FEE, OPE_PERC_FEE_TOPPED, 
                         CAST(CASE WHEN OPE_TYPE = 3 THEN OPE_PARTIAL_PERC_FEE ELSE - OPE_PARTIAL_PERC_FEE END AS int) OPE_PARTIAL_PERC_FEE, OPE_FIXED_FEE, 
                         CAST(CASE WHEN OPE_TYPE = 3 THEN OPE_PARTIAL_FIXED_FEE ELSE - OPE_PARTIAL_FIXED_FEE END AS int) OPE_PARTIAL_FIXED_FEE, CAST(CASE WHEN OPE_TYPE = 3 THEN ISNULL(OPE_TOTAL_AMOUNT, 
                         OPE_AMOUNT) ELSE - ISNULL(OPE_TOTAL_AMOUNT, OPE_AMOUNT) END AS int) OPE_TOTAL_AMOUNT, CASE WHEN ISNULL(OPE_PERC_FEE_TOPPED, 0) > 0 AND ISNULL(OPE_PERC_FEE_TOPPED, 0) 
                         < (OPE_AMOUNT * ISNULL(OPE_PERC_FEE, 0)) THEN OPE_PERC_FEE_TOPPED ELSE (OPE_AMOUNT * ISNULL(OPE_PERC_FEE, 0)) END + ISNULL(OPE_FIXED_FEE, 0) OPE_FEE, CASE WHEN ISNULL(OPE_PERC_BONUS, 0) 
                         > 0 THEN - OPE_PERC_BONUS * (CASE WHEN ISNULL(OPE_PERC_FEE_TOPPED, 0) > 0 AND ISNULL(OPE_PERC_FEE_TOPPED, 0) < (OPE_AMOUNT * ISNULL(OPE_PERC_FEE, 0)) 
                         THEN OPE_PERC_FEE_TOPPED ELSE (OPE_AMOUNT * ISNULL(OPE_PERC_FEE, 0)) END + ISNULL(OPE_FIXED_FEE, 0)) ELSE 0 END OPE_BONUS, ISNULL(OPE_PARTIAL_VAT1, 0) 
                         + ((CASE WHEN ISNULL(OPE_PERC_FEE_TOPPED, 0) > 0 AND ISNULL(OPE_PERC_FEE_TOPPED, 0) < (OPE_AMOUNT * ISNULL(OPE_PERC_FEE, 0)) 
                         THEN OPE_PERC_FEE_TOPPED ELSE (OPE_AMOUNT * ISNULL(OPE_PERC_FEE, 0)) END) * ISNULL(OPE_PERC_VAT2, 0)) + (ISNULL(OPE_FIXED_FEE, 0) * ISNULL(OPE_PERC_VAT2, 0)) 
                         - CASE WHEN ISNULL(OPE_PERC_BONUS, 0) > 0 THEN OPE_PARTIAL_BONUS_FEE - (OPE_PERC_BONUS * (CASE WHEN ISNULL(OPE_PERC_FEE_TOPPED, 0) > 0 AND ISNULL(OPE_PERC_FEE_TOPPED, 0) 
                         < (OPE_AMOUNT * ISNULL(OPE_PERC_FEE, 0)) THEN OPE_PERC_FEE_TOPPED ELSE (OPE_AMOUNT * ISNULL(OPE_PERC_FEE, 0)) END + ISNULL(OPE_FIXED_FEE, 0))) ELSE 0 END OPE_VAT, NULL 
                         OPE_ADDITIONAL_USR_ID, NULL OPE_ADDITIONAL_USR_USERNAME, NULL OPE_CUSPMR_TYPE, NULL OPE_CUSPMR_PAGATELIA_NEW_BALANCE, 
                         CAST(CASE WHEN OPE_TYPE = 3 THEN OPE_TIME_BALANCE_USED ELSE - OPE_TIME_BALANCE_USED END AS int) OPE_TIME_BALANCE_USED, OPE_TIME_BALANCE_BEFORE, OPE_POSTPAY, OPE_SHOPKEEPER_OP, 
                         OPE_SHOPKEEPER_AMOUNT, OPE_SHOPKEEPER_PROFIT, TAR_TYPE, UP2.USRP_PLATE USRP_PLATE2, UP3.USRP_PLATE USRP_PLATE3, UP4.USRP_PLATE USRP_PLATE4, UP5.USRP_PLATE USRP_PLATE5, 
                         UP6.USRP_PLATE USRP_PLATE6, UP7.USRP_PLATE USRP_PLATE7, UP8.USRP_PLATE USRP_PLATE8, UP9.USRP_PLATE USRP_PLATE9, UP10.USRP_PLATE USRP_PLATE10, OPE_PLATE2_USRP_ID, 
						 OPE_PLATE3_USRP_ID, OPE_PLATE4_USRP_ID, OPE_PLATE5_USRP_ID, OPE_PLATE6_USRP_ID, OPE_PLATE7_USRP_ID, OPE_PLATE8_USRP_ID, OPE_PLATE9_USRP_ID, OPE_PLATE10_USRP_ID,
						 OPE_ID, OPE_LATITUDE, OPE_LONGITUDE, OPE_EXTERNAL_BASE_ID1, OPE_EXTERNAL_BASE_ID2, OPE_EXTERNAL_BASE_ID3,
						 OPE_STRSE_ID, STRSE_DESCRIPTION
FROM            dbo.HIS_OPERATIONS  WITH (NOLOCK) LEFT OUTER JOIN
                         dbo.USER_PLATES WITH (NOLOCK) ON dbo.HIS_OPERATIONS.OPE_USRP_ID = USER_PLATES.USRP_ID INNER JOIN
                         dbo.CURRENCIES CUR1 WITH (NOLOCK) ON OPE_AMOUNT_CUR_ID = CUR1.CUR_ID INNER JOIN
                         dbo.CURRENCIES CUR2 WITH (NOLOCK) ON OPE_BALANCE_CUR_ID = CUR2.CUR_ID LEFT OUTER JOIN
                         dbo.GROUPS WITH (NOLOCK) ON OPE_GRP_ID = GRP_ID LEFT OUTER JOIN
                         dbo.TARIFFS WITH (NOLOCK) ON OPE_TAR_ID = TAR_ID LEFT OUTER JOIN
                         dbo.USER_PLATES UP2 WITH (NOLOCK) ON dbo.HIS_OPERATIONS.OPE_PLATE2_USRP_ID = UP2.USRP_ID LEFT OUTER JOIN
                         dbo.USER_PLATES UP3 WITH (NOLOCK) ON dbo.HIS_OPERATIONS.OPE_PLATE3_USRP_ID = UP3.USRP_ID LEFT OUTER JOIN
                         dbo.USER_PLATES UP4 WITH (NOLOCK) ON dbo.HIS_OPERATIONS.OPE_PLATE4_USRP_ID = UP4.USRP_ID LEFT OUTER JOIN
                         dbo.USER_PLATES UP5 WITH (NOLOCK) ON dbo.HIS_OPERATIONS.OPE_PLATE5_USRP_ID = UP5.USRP_ID LEFT OUTER JOIN
                         dbo.USER_PLATES UP6 WITH (NOLOCK) ON dbo.HIS_OPERATIONS.OPE_PLATE6_USRP_ID = UP6.USRP_ID LEFT OUTER JOIN
                         dbo.USER_PLATES UP7 WITH (NOLOCK) ON dbo.HIS_OPERATIONS.OPE_PLATE7_USRP_ID = UP7.USRP_ID LEFT OUTER JOIN
                         dbo.USER_PLATES UP8 WITH (NOLOCK) ON dbo.HIS_OPERATIONS.OPE_PLATE8_USRP_ID = UP8.USRP_ID LEFT OUTER JOIN
                         dbo.USER_PLATES UP9 WITH (NOLOCK) ON dbo.HIS_OPERATIONS.OPE_PLATE9_USRP_ID = UP9.USRP_ID LEFT OUTER JOIN
                         dbo.USER_PLATES UP10 WITH (NOLOCK) ON dbo.HIS_OPERATIONS.OPE_PLATE10_USRP_ID = UP10.USRP_ID LEFT OUTER JOIN
						 dbo.STREET_SECTIONS WITH (NOLOCK) ON dbo.HIS_OPERATIONS.OPE_STRSE_ID = STREET_SECTIONS.STRSE_ID, INSTALLATIONS
WHERE        OPE_INS_ID = INS_ID
UNION ALL
SELECT        '4_' + CONVERT(varchar, TIPA_ID),   
			  4 OPE_TYPE, TIPA_USR_ID, TIPA_INS_ID, INS_DESCRIPTION, INS_SHORTDESC, TIPA_DATE, TIPA_UTC_DATE, NULL, NULL, NULL, - TIPA_AMOUNT TIPA_AMOUNT, - TIPA_AMOUNT, NULL, TIPA_AMOUNT_CUR_ID, 
                         CUR1.CUR_ISO_CODE OPE_AMOUNT_CUR_ISO_CODE, cast(CUR1.CUR_MINOR_UNIT AS int) OPE_AMOUNT_CUR_MINOR_UNIT, - TIPA_FINAL_AMOUNT, TIPA_BALANCE_CUR_ID, 
                         CUR2.CUR_ISO_CODE OPE_BALANCE_CUR_ISO_CODE, cast(CUR2.CUR_MINOR_UNIT AS int) OPE_BALANCE_CUR_MINOR_UNIT, TIPA_CHANGE_APPLIED, USRP_ID, TIPA_PLATE_STRING, TIPA_TICKET_NUMBER, 
                         TIPA_TICKET_DATA, NULL, NULL, NULL, NULL, NULL, TIPA_SUSCRIPTION_TYPE, TIPA_BALANCE_BEFORE, TIPA_INSERTION_UTC_DATE, TIPA_DATE_UTC_OFFSET, NULL, NULL, 1 EPO_SRCTYPE, NULL EPO_SRCIDENT, 
                         TIPA_PERC_VAT1, TIPA_PERC_VAT2, - TIPA_PARTIAL_VAT1, TIPA_PERC_FEE, TIPA_PERC_FEE_TOPPED, - TIPA_PARTIAL_PERC_FEE, TIPA_FIXED_FEE, - TIPA_PARTIAL_FIXED_FEE, - ISNULL(TIPA_TOTAL_AMOUNT, 
                         TIPA_AMOUNT), CASE WHEN ISNULL(TIPA_PERC_FEE_TOPPED, 0) > 0 AND ISNULL(TIPA_PERC_FEE_TOPPED, 0) < (TIPA_AMOUNT * ISNULL(TIPA_PERC_FEE, 0)) 
                         THEN TIPA_PERC_FEE_TOPPED ELSE (TIPA_AMOUNT * ISNULL(TIPA_PERC_FEE, 0)) END + ISNULL(TIPA_FIXED_FEE, 0), 0, ISNULL(TIPA_PARTIAL_VAT1, 0) + ((CASE WHEN ISNULL(TIPA_PERC_FEE_TOPPED, 0) > 0 AND 
                         ISNULL(TIPA_PERC_FEE_TOPPED, 0) < (TIPA_AMOUNT * ISNULL(TIPA_PERC_FEE, 0)) THEN TIPA_PERC_FEE_TOPPED ELSE (TIPA_AMOUNT * ISNULL(TIPA_PERC_FEE, 0)) END) * ISNULL(TIPA_PERC_VAT2, 0)) 
                         + (ISNULL(TIPA_FIXED_FEE, 0) * ISNULL(TIPA_PERC_VAT2, 0)), NULL, NULL, NULL OPE_CUSPMR_TYPE, NULL OPE_CUSPMR_PAGATELIA_NEW_BALANCE, NULL OPE_TIME_BALANCE_USED, NULL 
                         OPE_TIME_BALANCE_BEFORE, NULL OPE_POSTPAY, 0 OPE_SHOPKEEPER_OP, 0 OPE_SHOPKEEPER_AMOUNT, 0 OPE_SHOPKEEPER_PROFIT, 0 TAR_TYPE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
						 NULL, NULL, NULL, NULL, NULL, NULL, NULL,
						 TIPA_ID, TIPA_LATITUDE, TIPA_LONGITUDE, NULL, NULL, NULL,
						 NULL, NULL
FROM            dbo.TICKET_PAYMENTS  WITH (NOLOCK) LEFT OUTER JOIN
                         dbo.USER_PLATES WITH (NOLOCK) ON dbo.TICKET_PAYMENTS.TIPA_USRP_ID = USER_PLATES.USRP_ID INNER JOIN
                         dbo.CURRENCIES CUR1 WITH (NOLOCK) ON TIPA_AMOUNT_CUR_ID = CUR1.CUR_ID INNER JOIN
                         dbo.CURRENCIES CUR2 WITH (NOLOCK) ON TIPA_BALANCE_CUR_ID = CUR2.CUR_ID,   INSTALLATIONS WITH (NOLOCK)
WHERE        TIPA_INS_ID = INS_ID
UNION ALL
SELECT        '5_' + CONVERT(varchar, CUSPMR_ID),
			  5 OPE_TYPE, CUSPMR_USR_ID, NULL, NULL, NULL, CUSPMR_DATE, CUSPMR_UTC_DATE, NULL, NULL, NULL, CUSPMR_AMOUNT, CUSPMR_AMOUNT, NULL, CUSPMR_CUR_ID, CUR_ISO_CODE, 
                         cast(CUR_MINOR_UNIT AS int), NULL, CUSPMR_CUR_ID, CUR_ISO_CODE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CUSPMR_SUSCRIPTION_TYPE, CUSPMR_BALANCE_BEFORE, 
                         CUSPMR_INSERTION_UTC_DATE, CUSPMR_DATE_UTC_OFFSET, NULL, NULL, 1 EPO_SRCTYPE, NULL EPO_SRCIDENT, CUSPMR_PERC_VAT1, CUSPMR_PERC_VAT2, CUSPMR_PARTIAL_VAT1, CUSPMR_PERC_FEE, 
                         CUSPMR_PERC_FEE_TOPPED, CUSPMR_PARTIAL_PERC_FEE, CUSPMR_FIXED_FEE, CUSPMR_PARTIAL_FIXED_FEE, ISNULL(CUSPMR_TOTAL_AMOUNT_CHARGED, CUSPMR_AMOUNT), 
                         CASE WHEN ISNULL(CUSPMR_PERC_FEE_TOPPED, 0) > 0 AND ISNULL(CUSPMR_PERC_FEE_TOPPED, 0) < (CUSPMR_AMOUNT * ISNULL(CUSPMR_PERC_FEE, 0)) 
                         THEN CUSPMR_PERC_FEE_TOPPED ELSE (CUSPMR_AMOUNT * ISNULL(CUSPMR_PERC_FEE, 0)) END + ISNULL(CUSPMR_FIXED_FEE, 0), 0, ISNULL(CUSPMR_PARTIAL_VAT1, 0) 
                         + ((CASE WHEN ISNULL(CUSPMR_PERC_FEE_TOPPED, 0) > 0 AND ISNULL(CUSPMR_PERC_FEE_TOPPED, 0) < (CUSPMR_AMOUNT * ISNULL(CUSPMR_PERC_FEE, 0)) 
                         THEN CUSPMR_PERC_FEE_TOPPED ELSE (CUSPMR_AMOUNT * ISNULL(CUSPMR_PERC_FEE, 0)) END) * ISNULL(CUSPMR_PERC_VAT2, 0)) + (ISNULL(CUSPMR_FIXED_FEE, 0) * ISNULL(CUSPMR_PERC_VAT2, 
                         0)), NULL, NULL, CUSPMR_TYPE OPE_CUSPMR_TYPE, CUSPMR_PAGATELIA_NEW_BALANCE OPE_CUSPMR_PAGATELIA_NEW_BALANCE, NULL OPE_TIME_BALANCE_USED, NULL OPE_TIME_BALANCE_BEFORE, NULL 
                         OPE_POSTPAY, 0 OPE_SHOPKEEPER_OP, 0 OPE_SHOPKEEPER_AMOUNT, 0 OPE_SHOPKEEPER_PROFIT, 0 TAR_TYPE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
						 NULL, NULL, NULL, NULL, NULL, NULL, NULL,
						 CUSPMR_ID, CUSPMR_LATITUDE, CUSPMR_LONGITUDE, NULL, NULL, NULL,
						 NULL, NULL
FROM            dbo.CUSTOMER_PAYMENT_MEANS_RECHARGES_HIS  WITH (NOLOCK), dbo.CURRENCIES  WITH (NOLOCK)
WHERE        CUSPMR_CUR_ID = CUR_ID AND (CUSPMR_SUSCRIPTION_TYPE = 1 OR
                         CUSPMR_SUSCRIPTION_TYPE IS NULL) AND (CUSPMR_TRANS_STATUS IN (1, 2, 3, 4) OR
                         CUSPMR_RCOUP_ID IS NOT NULL OR
                         CUSPMR_TYPE IN (3, 4, 6))
UNION ALL
SELECT        '6_' + CONVERT(varchar, SECH_ID),
			  6 OPE_TYPE, SECH_USR_ID, NULL, NULL, NULL, SECH_DATE, SECH_UTC_DATE, NULL, NULL, NULL, - SECH_AMOUNT, - SECH_AMOUNT, NULL, SECH_AMOUNT_CUR_ID, 
                         CUR1.CUR_ISO_CODE OPE_AMOUNT_CUR_ISO_CODE, cast(CUR1.CUR_MINOR_UNIT AS int) OPE_AMOUNT_CUR_MINOR_UNIT, - SECH_FINAL_AMOUNT, SECH_BALANCE_CUR_ID, 
                         CUR2.CUR_ISO_CODE OPE_BALANCE_CUR_ISO_CODE, cast(CUR2.CUR_MINOR_UNIT AS int) OPE_BALANCE_CUR_MINOR_UNIT, SECH_CHANGE_APPLIED, NULL, NULL, NULL, NULL, 
                         SECH_SECHT_ID, NULL, NULL, NULL, NULL, SECH_SUSCRIPTION_TYPE, SECH_BALANCE_BEFORE, SECH_INSERTION_UTC_DATE, SECH_DATE_UTC_OFFSET, NULL, NULL, 1 EPO_SRCTYPE, NULL EPO_SRCIDENT, 
                         SECH_PERC_VAT1, SECH_PERC_VAT2, - SECH_PARTIAL_VAT1, SECH_PERC_FEE, SECH_PERC_FEE_TOPPED, - SECH_PARTIAL_PERC_FEE, SECH_FIXED_FEE, - SECH_PARTIAL_FIXED_FEE, - ISNULL(SECH_TOTAL_AMOUNT, 
                         SECH_AMOUNT), CASE WHEN ISNULL(SECH_PERC_FEE_TOPPED, 0) > 0 AND ISNULL(SECH_PERC_FEE_TOPPED, 0) < (SECH_AMOUNT * ISNULL(SECH_PERC_FEE, 0)) 
                         THEN SECH_PERC_FEE_TOPPED ELSE (SECH_AMOUNT * ISNULL(SECH_PERC_FEE, 0)) END + ISNULL(SECH_FIXED_FEE, 0), 0, ISNULL(SECH_PARTIAL_VAT1, 0) + ((CASE WHEN ISNULL(SECH_PERC_FEE_TOPPED, 0) > 0 AND
                          ISNULL(SECH_PERC_FEE_TOPPED, 0) < (SECH_AMOUNT * ISNULL(SECH_PERC_FEE, 0)) THEN SECH_PERC_FEE_TOPPED ELSE (SECH_AMOUNT * ISNULL(SECH_PERC_FEE, 0)) END) * ISNULL(SECH_PERC_VAT2, 0)) 
                         + (ISNULL(SECH_FIXED_FEE, 0) * ISNULL(SECH_PERC_VAT2, 0)), NULL, NULL, NULL OPE_CUSPMR_TYPE, NULL OPE_CUSPMR_PAGATELIA_NEW_BALANCE, NULL OPE_TIME_BALANCE_USED, NULL 
                         OPE_TIME_BALANCE_BEFORE, NULL OPE_POSTPAY, 0 OPE_SHOPKEEPER_OP, 0 OPE_SHOPKEEPER_AMOUNT, 0 OPE_SHOPKEEPER_PROFIT, 0 TAR_TYPE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
						 NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
						 SECH_ID, NULL, NULL, NULL, NULL, NULL,
						 NULL, NULL
FROM            dbo.SERVICE_CHARGES  WITH (NOLOCK) INNER JOIN
                         dbo.CURRENCIES CUR1 WITH (NOLOCK) ON SECH_AMOUNT_CUR_ID = CUR1.CUR_ID INNER JOIN
                         dbo.CURRENCIES CUR2 WITH (NOLOCK) ON SECH_BALANCE_CUR_ID = CUR2.CUR_ID
UNION ALL
SELECT        '7_' + CONVERT(varchar, OPEDIS_ID),
			  7 OPE_TYPE, OPEDIS_USR_ID, NULL, NULL, NULL, OPEDIS_DATE, OPEDIS_UTC_DATE, NULL, NULL, NULL, OPEDIS_AMOUNT, OPEDIS_AMOUNT, NULL, OPEDIS_AMOUNT_CUR_ID, 
                         CUR1.CUR_ISO_CODE OPE_AMOUNT_CUR_ISO_CODE, cast(CUR1.CUR_MINOR_UNIT AS int) OPE_AMOUNT_CUR_MINOR_UNIT, OPEDIS_FINAL_AMOUNT, OPEDIS_BALANCE_CUR_ID, 
                         CUR2.CUR_ISO_CODE OPE_BALANCE_CUR_ISO_CODE, cast(CUR2.CUR_MINOR_UNIT AS int) OPE_BALANCE_CUR_MINOR_UNIT, OPEDIS_CHANGE_APPLIED, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
                         OPEDIS_SUSCRIPTION_TYPE, OPEDIS_BALANCE_BEFORE, OPEDIS_INSERTION_UTC_DATE, OPEDIS_DATE_UTC_OFFSET, NULL, NULL, 1 EPO_SRCTYPE, NULL EPO_SRCIDENT, OPEDIS_PERC_VAT1, OPEDIS_PERC_VAT2, 
                         OPEDIS_PARTIAL_VAT1, OPEDIS_PERC_FEE, OPEDIS_PERC_FEE_TOPPED, OPEDIS_PARTIAL_PERC_FEE, OPEDIS_FIXED_FEE, OPEDIS_PARTIAL_FIXED_FEE, ISNULL(OPEDIS_TOTAL_AMOUNT, OPEDIS_AMOUNT), 
                         CASE WHEN ISNULL(OPEDIS_PERC_FEE_TOPPED, 0) > 0 AND ISNULL(OPEDIS_PERC_FEE_TOPPED, 0) < (OPEDIS_AMOUNT * ISNULL(OPEDIS_PERC_FEE, 0)) 
                         THEN OPEDIS_PERC_FEE_TOPPED ELSE (OPEDIS_AMOUNT * ISNULL(OPEDIS_PERC_FEE, 0)) END + ISNULL(OPEDIS_FIXED_FEE, 0), 0, ISNULL(OPEDIS_PARTIAL_VAT1, 0) 
                         + ((CASE WHEN ISNULL(OPEDIS_PERC_FEE_TOPPED, 0) > 0 AND ISNULL(OPEDIS_PERC_FEE_TOPPED, 0) < (OPEDIS_AMOUNT * ISNULL(OPEDIS_PERC_FEE, 0)) 
                         THEN OPEDIS_PERC_FEE_TOPPED ELSE (OPEDIS_AMOUNT * ISNULL(OPEDIS_PERC_FEE, 0)) END) * ISNULL(OPEDIS_PERC_VAT2, 0)) + (ISNULL(OPEDIS_FIXED_FEE, 0) * ISNULL(OPEDIS_PERC_VAT2, 0)), NULL, NULL, NULL 
                         OPE_CUSPMR_TYPE, NULL OPE_CUSPMR_PAGATELIA_NEW_BALANCE, NULL OPE_TIME_BALANCE_USED, NULL OPE_TIME_BALANCE_BEFORE, NULL OPE_POSTPAY, 0 OPE_SHOPKEEPER_OP, 
                         0 OPE_SHOPKEEPER_AMOUNT, 0 OPE_SHOPKEEPER_PROFIT, 0 TAR_TYPE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
						 OPEDIS_ID, NULL,NULL, NULL, NULL, NULL,
						 NULL, NULL
FROM            dbo.OPERATIONS_DISCOUNTS  WITH (NOLOCK) INNER JOIN
                         dbo.CURRENCIES CUR1 WITH (NOLOCK) ON OPEDIS_AMOUNT_CUR_ID = CUR1.CUR_ID INNER JOIN
                         dbo.CURRENCIES CUR2 WITH (NOLOCK) ON OPEDIS_BALANCE_CUR_ID = CUR2.CUR_ID
UNION ALL
SELECT        CONVERT(varchar, EPO_TYPE) + '_' + CONVERT(varchar, EPO_ID),
			  EPO_TYPE, USRP_USR_ID, EPO_INS_ID, INS_DESCRIPTION, INS_SHORTDESC, EPO_DATE, EPO_DATE_UTC, EPO_INIDATE, EPO_ENDDATE, NULL, - EPO_AMOUNT, - EPO_AMOUNT, EPO_TIME, INS_CUR_ID, CUR_ISO_CODE, 
                         cast(CUR_MINOR_UNIT AS int), - EPO_AMOUNT, NULL, NULL, NULL, 1, USRP_ID, USRP_PLATE, NULL, NULL, NULL SECH_SECHT_ID, GRP_ID, TAR_ID, GRP_DESCRIPTION, TAR_DESCRIPTION, NULL, NULL, 
                         EPO_INSERTION_UTC_DATE, EPO_DATE_UTC_OFFSET, EPO_INIDATE_UTC_OFFSET, EPO_ENDDATE_UTC_OFFSET, EPO_SRCTYPE, EPO_SRCIDENT, 0, 0, 0, 0, 0, 0, 0, 0, - EPO_AMOUNT, 0, 0, 0, NULL, NULL, NULL 
                         OPE_CUSPMR_TYPE, NULL OPE_CUSPMR_PAGATELIA_NEW_BALANCE, NULL OPE_TIME_BALANCE_USED, NULL OPE_TIME_BALANCE_BEFORE, NULL OPE_POSTPAY, 0 OPE_SHOPKEEPER_OP, 
                         0 OPE_SHOPKEEPER_AMOUNT, 0 OPE_SHOPKEEPER_PROFIT, 0 TAR_TYPE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
						 EPO_ID, NULL, NULL, NULL, NULL, NULL,
						 NULL, NULL
FROM            dbo.EXTERNAL_PARKING_OPERATIONS  WITH (NOLOCK) LEFT JOIN
                         GROUPS WITH (NOLOCK) ON EPO_ZONE = GRP_ID LEFT JOIN
                         TARIFFS WITH (NOLOCK) ON EPO_TARIFF = TAR_ID, dbo.USER_PLATES, dbo.INSTALLATIONS  WITH (NOLOCK), dbo.CURRENCIES  WITH (NOLOCK)
WHERE        EPO_PLATE = USRP_PLATE AND USRP_ENABLED = 1 AND EPO_INS_ID = INS_ID AND INS_CUR_ID = CUR_ID
UNION ALL
SELECT        CONVERT(varchar, OPEOFF_TYPE) + '_' + CONVERT(varchar, OPEOFF_ID),
			  OPEOFF_TYPE, OPEOFF_USR_ID, OPEOFF_INS_ID, INS_DESCRIPTION, INS_SHORTDESC, CASE OPEOFF_TYPE WHEN 8 THEN OPEOFF_NOTIFY_ENTRY_DATE ELSE OPEOFF_PAYMENT_DATE END, 
                         CASE OPEOFF_TYPE WHEN 8 THEN OPEOFF_UTC_NOTIFY_ENTRY_DATE ELSE OPEOFF_UTC_PAYMENT_DATE END, OPEOFF_ENTRY_DATE, OPEOFF_END_DATE, NULL, - OPEOFF_AMOUNT, - OPEOFF_AMOUNT, 
                         OPEOFF_TIME, CAST(OPEOFF_AMOUNT_CUR_ID AS int), CUR1.CUR_ISO_CODE, cast(CUR1.CUR_MINOR_UNIT AS int), CAST(- OPEOFF_FINAL_AMOUNT AS int), OPEOFF_BALANCE_CUR_ID, CUR2.CUR_ISO_CODE, 
                         cast(CUR2.CUR_MINOR_UNIT AS int) OPE_BALANCE_CUR_MINOR_UNIT, OPEOFF_CHANGE_APPLIED, USRP_ID, USRP_PLATE, NULL, NULL, NULL, GRP_ID, NULL, GRP_DESCRIPTION, OPEOFF_TARIFF, 
                         OPEOFF_SUSCRIPTION_TYPE, OPEOFF_BALANCE_BEFORE, OPEOFF_INSERTION_UTC_DATE, 
                         CASE OPEOFF_TYPE WHEN 8 THEN OPEOFF_NOTIFY_ENTRY_DATE_UTC_OFFSET ELSE OPEOFF_PAYMENT_DATE_UTC_OFFSET END, OPEOFF_ENTRY_DATE_UTC_OFFSET, OPEOFF_END_DATE_UTC_OFFSET, 1, NULL, 0, 
                         0, 0, 0, 0, 0, 0, 0, - OPEOFF_AMOUNT, 0, 0, 0, NULL, NULL, NULL OPE_CUSPMR_TYPE, NULL OPE_CUSPMR_PAGATELIA_NEW_BALANCE, NULL OPE_TIME_BALANCE_USED, NULL OPE_TIME_BALANCE_BEFORE, NULL 
                         OPE_POSTPAY, 0 OPE_SHOPKEEPER_OP, 0 OPE_SHOPKEEPER_AMOUNT, 0 OPE_SHOPKEEPER_PROFIT, 0 TAR_TYPE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
						 OPEOFF_ID, OPEOFF_LATITUDE, OPEOFF_LONGITUDE, NULL, NULL, NULL,
						 NULL, NULL
FROM            dbo.OPERATIONS_OFFSTREET  WITH (NOLOCK) LEFT OUTER JOIN
                         dbo.USER_PLATES WITH (NOLOCK) ON dbo.OPERATIONS_OFFSTREET.OPEOFF_USRP_ID = USER_PLATES.USRP_ID INNER JOIN
                         dbo.CURRENCIES CUR1 WITH (NOLOCK) ON OPEOFF_AMOUNT_CUR_ID = CUR1.CUR_ID INNER JOIN
                         dbo.CURRENCIES CUR2 WITH (NOLOCK) ON OPEOFF_BALANCE_CUR_ID = CUR2.CUR_ID LEFT OUTER JOIN
                         dbo.GROUPS WITH (NOLOCK) ON OPEOFF_GRP_ID = GRP_ID, INSTALLATIONS
WHERE        OPEOFF_INS_ID = INS_ID
UNION ALL
SELECT        '14_' + CONVERT(varchar, BAT_ID), 
			  14, BAT_SRC_USR_ID, NULL, NULL, NULL, BAT_DATE, BAT_UTC_DATE, NULL, NULL, NULL, - BAT_AMOUNT, - BAT_AMOUNT, NULL, BAT_AMOUNT_CUR_ID, CUR1.CUR_ISO_CODE, cast(CUR1.CUR_MINOR_UNIT AS int), 
                         - BAT_AMOUNT, BAT_DST_BALANCE_CUR_ID, CUR2.CUR_ISO_CODE, cast(CUR2.CUR_MINOR_UNIT AS int), BAT_CHANGE_APPLIED, NULL, NULL, NULL TIPA_TICKET_NUMBER, NULL TIPA_TICKET_DATA, NULL 
                         SECH_SECHT_ID, NULL, NULL, NULL, NULL, NULL, BAT_SRC_BALANCE_BEFORE, BAT_INSERTION_UTC_DATE, BAT_DATE_UTC_OFFSET, NULL, NULL, 1 EPO_SRCTYPE, NULL EPO_SRCIDENT, NULL, NULL, NULL 
                         OPE_PARTIAL_VAT1, NULL, NULL, NULL OPE_PARTIAL_PERC_FEE, NULL, NULL OPE_PARTIAL_FIXED_FEE, - BAT_AMOUNT, 0 OPE_FEE, 0 OPE_BONUS, 0 OPE_VAT, BAT_DST_USR_ID, USR_USERNAME, NULL 
                         OPE_CUSPMR_TYPE, NULL OPE_CUSPMR_PAGATELIA_NEW_BALANCE, NULL OPE_TIME_BALANCE_USED, NULL OPE_TIME_BALANCE_BEFORE, NULL OPE_POSTPAY, BAT_SHOPKEEPER_OP, 
                         BAT_SHOPKEEPER_COLLECTED_AMOUNT, BAT_SHOPKEEPER_PROFIT, 0 TAR_TYPE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
						 BAT_ID, NULL, NULL, NULL, NULL, NULL,
						 NULL, NULL
FROM            dbo.BALANCE_TRANSFERS  WITH (NOLOCK) INNER JOIN
                         dbo.CURRENCIES CUR1 WITH (NOLOCK) ON BAT_AMOUNT_CUR_ID = CUR1.CUR_ID INNER JOIN
                         dbo.CURRENCIES CUR2 WITH (NOLOCK) ON BAT_DST_BALANCE_CUR_ID = CUR2.CUR_ID INNER JOIN
                         dbo.USERS WITH (NOLOCK) ON BAT_DST_USR_ID = USR_ID
UNION ALL
SELECT      '15_' + CONVERT(varchar, BAT_ID),   
			15, BAT_DST_USR_ID, NULL, NULL, NULL, BAT_DATE, BAT_UTC_DATE, NULL, NULL, NULL, BAT_DST_AMOUNT, BAT_DST_AMOUNT, NULL, BAT_DST_BALANCE_CUR_ID, CUR_ISO_CODE, 
                         cast(CUR_MINOR_UNIT AS int), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, BAT_DST_BALANCE_BEFORE, BAT_INSERTION_UTC_DATE, 
                         BAT_DATE_UTC_OFFSET, NULL, NULL, 1 EPO_SRCTYPE, NULL EPO_SRCIDENT, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, BAT_DST_AMOUNT, 0, 0, 0, BAT_SRC_USR_ID, USR_USERNAME, NULL 
                         OPE_CUSPMR_TYPE, NULL OPE_CUSPMR_PAGATELIA_NEW_BALANCE, NULL OPE_TIME_BALANCE_USED, NULL OPE_TIME_BALANCE_BEFORE, NULL OPE_POSTPAY, BAT_SHOPKEEPER_OP, 
                         BAT_SHOPKEEPER_COLLECTED_AMOUNT, BAT_SHOPKEEPER_PROFIT, 0 TAR_TYPE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
						 BAT_ID, NULL, NULL, NULL, NULL, NULL,
						 NULL, NULL
FROM            dbo.BALANCE_TRANSFERS  WITH (NOLOCK), dbo.CURRENCIES  WITH (NOLOCK), dbo.USERS WITH (NOLOCK)
WHERE        BAT_DST_BALANCE_CUR_ID = CUR_ID AND BAT_SRC_USR_ID = USR_ID
UNION ALL
SELECT        CONVERT(varchar, TOLM_TYPE) + '_' + CONVERT(varchar, TOLM_ID),
			  TOLM_TYPE, TOLM_USR_ID, TOLM_INS_ID, INS_DESCRIPTION, INS_SHORTDESC, TOLM_DATE, TOLM_UTC_DATE, NULL, NULL, NULL, 
                         CAST(CASE WHEN TOLM_TYPE = 18 THEN TOLM_AMOUNT ELSE - TOLM_AMOUNT END AS int) OPE_AMOUNT, CAST(CASE WHEN TOLM_TYPE = 2 THEN TOLM_AMOUNT ELSE - TOLM_AMOUNT END AS int) 
                         OPE_REAL_AMOUNT, /*CAST(  -TOLM_AMOUNT AS int) OPE_AMOUNT,*/ NULL, TOLM_AMOUNT_CUR_ID, CUR1.CUR_ISO_CODE OPE_AMOUNT_CUR_ISO_CODE, cast(CUR1.CUR_MINOR_UNIT AS int) 
                         OPE_AMOUNT_CUR_MINOR_UNIT, CAST(CASE WHEN TOLM_TYPE = 18 THEN TOLM_FINAL_AMOUNT ELSE - TOLM_FINAL_AMOUNT END AS int) OPE_FINAL_AMOUNT, TOLM_BALANCE_CUR_ID, 
                         CUR2.CUR_ISO_CODE OPE_BALANCE_CUR_ISO_CODE, cast(CUR2.CUR_MINOR_UNIT AS int) OPE_BALANCE_CUR_MINOR_UNIT, TOLM_CHANGE_APPLIED, USRP_ID, USRP_PLATE, NULL TIPA_TICKET_NUMBER, NULL 
                         TIPA_TICKET_DATA, NULL SECH_SECHT_ID, TOLM_TOL_ID, NULL, TOL_DESCRIPTION, TOLM_TOL_TARIFF, NULL, TOLM_BALANCE_BEFORE, TOLM_INSERTION_UTC_DATE, TOLM_DATE_UTC_OFFSET, NULL, NULL, 
                         1 EPO_SRCTYPE, NULL EPO_SRCIDENT, TOLM_PERC_VAT1, TOLM_PERC_VAT2, CAST(CASE WHEN TOLM_TYPE = 18 THEN TOLM_PARTIAL_VAT1 ELSE - TOLM_PARTIAL_VAT1 END AS int) OPE_PARTIAL_VAT1, 
                         TOLM_PERC_FEE, TOLM_PERC_FEE_TOPPED, CAST(CASE WHEN TOLM_TYPE = 18 THEN TOLM_PARTIAL_PERC_FEE ELSE - TOLM_PARTIAL_PERC_FEE END AS int) OPE_PARTIAL_PERC_FEE, TOLM_FIXED_FEE, 
                         CAST(CASE WHEN TOLM_TYPE = 18 THEN TOLM_PARTIAL_FIXED_FEE ELSE - TOLM_PARTIAL_FIXED_FEE END AS int) OPE_PARTIAL_FIXED_FEE, CAST(CASE WHEN TOLM_TYPE = 18 THEN ISNULL(TOLM_TOTAL_AMOUNT, 
                         TOLM_AMOUNT) ELSE - ISNULL(TOLM_TOTAL_AMOUNT, TOLM_AMOUNT) END AS int) OPE_TOTAL_AMOUNT, CASE WHEN ISNULL(TOLM_PERC_FEE_TOPPED, 0) > 0 AND ISNULL(TOLM_PERC_FEE_TOPPED, 0) 
                         < (TOLM_AMOUNT * ISNULL(TOLM_PERC_FEE, 0)) THEN TOLM_PERC_FEE_TOPPED ELSE (TOLM_AMOUNT * ISNULL(TOLM_PERC_FEE, 0)) END + ISNULL(TOLM_FIXED_FEE, 0) OPE_FEE, 0 OPE_BONUS, 
                         ISNULL(TOLM_PARTIAL_VAT1, 0) + ((CASE WHEN ISNULL(TOLM_PERC_FEE_TOPPED, 0) > 0 AND ISNULL(TOLM_PERC_FEE_TOPPED, 0) < (TOLM_AMOUNT * ISNULL(TOLM_PERC_FEE, 0)) 
                         THEN TOLM_PERC_FEE_TOPPED ELSE (TOLM_AMOUNT * ISNULL(TOLM_PERC_FEE, 0)) END) * ISNULL(TOLM_PERC_VAT2, 0)) + (ISNULL(TOLM_FIXED_FEE, 0) * ISNULL(TOLM_PERC_VAT2, 0)) OPE_VAT, NULL 
                         OPE_ADDITIONAL_USR_ID, NULL OPE_ADDITIONAL_USR_USERNAME, TOLM_TYPE OPE_CUSPMR_TYPE, NULL OPE_CUSPMR_PAGATELIA_NEW_BALANCE, NULL OPE_TIME_BALANCE_USED, NULL 
                         OPE_TIME_BALANCE_BEFORE, NULL OPE_POSTPAY, 0 OPE_SHOPKEEPER_OP, 0 OPE_SHOPKEEPER_AMOUNT, 0 OPE_SHOPKEEPER_PROFIT, 0 TAR_TYPE, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
						 NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
						 TOLM_ID, TOLM_LATITUDE, TOLM_LONGITUDE, NULL, NULL, NULL,
						 NULL, NULL
FROM            dbo.TOLL_MOVEMENTS WITH (NOLOCK) LEFT OUTER JOIN
                         dbo.USER_PLATES WITH (NOLOCK) ON dbo.TOLL_MOVEMENTS.TOLM_USRP_ID = USER_PLATES.USRP_ID INNER JOIN
                         dbo.CURRENCIES CUR1 WITH (NOLOCK) ON TOLM_AMOUNT_CUR_ID = CUR1.CUR_ID INNER JOIN
                         dbo.CURRENCIES CUR2 WITH (NOLOCK) ON TOLM_BALANCE_CUR_ID = CUR2.CUR_ID LEFT OUTER JOIN
                         dbo.TOLLS WITH (NOLOCK) ON TOLM_TOL_ID = TOL_ID, INSTALLATIONS WITH (NOLOCK)
WHERE        TOLM_INS_ID = INS_ID



GO

