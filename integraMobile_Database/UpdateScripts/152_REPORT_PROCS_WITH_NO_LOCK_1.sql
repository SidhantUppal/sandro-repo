/****** Object:  StoredProcedure [dbo].[Report_LIQUIDATIONDETAIL_CANADA]    Script Date: 5/20/2020 12:21:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Report_LIQUIDATIONDETAIL_CANADA]
	@DateIniUTC AS DATETIME,
	@DateEndUTC AS DATETIME,
	@Culture	AS VARCHAR(5)
AS	
BEGIN

IF @Culture IS NULL
BEGIN
	SET @Culture = 'en-US'
END

SELECT  OPE_INS_ID,
		GRP_ID,
		INS_ID REGION, 
		INS_DESCRIPTION [REGION NAME], 
		GRP_SHOW_ID [PAYBYPHONE LOT ID], 
		GRP_DESCRIPTION [LOT NAME],
		SUM(CASE WHEN ope_type IN (1,2,3) AND OPE_TOTAL_AMOUNT=0 THEN 1 ELSE 0 END) Free,
		SUM(CASE WHEN ope_type IN (1,2) AND OPE_TOTAL_AMOUNT>0 THEN 1 ELSE 0 END) Payments,
		SUM(CASE WHEN ope_type IN (3) AND OPE_TOTAL_AMOUNT>0 THEN 1 ELSE 0 END) Refunds,
		SUM(CASE WHEN ope_type IN (1,2) THEN (ope_amount+ope_partial_vat1) WHEN ope_type IN (3) THEN -(ope_amount+ope_partial_vat1) ELSE 0 END) [Parking FEE],
		SUM(CASE WHEN ope_type IN (1,2) THEN (OPE_PARTIAL_PERC_FEE+OPE_PARTIAL_FIXED_FEE) WHEN ope_type IN (3) THEN -(OPE_PARTIAL_PERC_FEE+OPE_PARTIAL_FIXED_FEE) ELSE 0 END) [PAYBYPHONE CONSUMER FEE],
		SUM(CASE WHEN ope_type IN (1,2) THEN (ope_amount+ope_partial_vat1+OPE_PARTIAL_PERC_FEE+OPE_PARTIAL_FIXED_FEE) WHEN ope_type IN (3) THEN -(OPE_PARTIAL_PERC_FEE+OPE_PARTIAL_FIXED_FEE+OPE_PARTIAL_PERC_FEE+OPE_PARTIAL_FIXED_FEE) ELSE 0  END) [TOTAL FOR DEPOSIT],
		1+INS_PERC_VAT2 VAT,
		CUR_ISO_CODE,
		POWER(10, CUR_MINOR_UNIT) DECIMAL_PART,
		CAST(ROUND(INS_PERC_VAT2*100,2) AS NUMERIC(18,2)) VAT_AMOUNT,		
		LITL_LITERAL,
		LAN_DESCRIPTION,
		INS_DESCRIPTION,
		GRP_DESCRIPTION,
		INS_CULTURE_LANG
FROM his_operations o WITH (NOLOCK), groups g WITH (NOLOCK), installations i WITH (NOLOCK)
INNER JOIN CURRENCIES WITH (NOLOCK) ON INS_CUR_ID = CUR_ID
INNER JOIN LITERAL_LANGUAGES WITH (NOLOCK) ON INS_SERVICE_VAT_LIT_ID = LITL_LIT_ID
INNER JOIN LANGUAGES WITH (NOLOCK) ON LITL_LAN_ID = LAN_ID
where OPE_UTC_DATE >= @DateIniUTC AND
	OPE_UTC_DATE < @DateEndUTC AND
	OPE_GRP_ID = GRP_ID AND
	OPE_INS_ID = INS_ID
	AND LAN_CULTURE = @Culture
GROUP BY INS_ID, INS_DESCRIPTION, GRP_SHOW_ID, GRP_DESCRIPTION,OPE_INS_ID,GRP_ID,INS_PERC_VAT2,CUR_ISO_CODE,CUR_MINOR_UNIT,LITL_LITERAL,LAN_DESCRIPTION,INS_CULTURE_LANG
ORDER BY RIGHT(replicate('0',9) + GRP_SHOW_ID,9)

END
GO


ALTER PROCEDURE [dbo].[Report_LIQUIDATIONDETAIL_CANADA_WITH_TARTYPE_AND_TICKETPAYMENTS] @DateIniUTC AS datetime,
@DateEndUTC AS datetime,
@Culture AS varchar(5)
AS
BEGIN

	IF @Culture IS NULL
	BEGIN
		SET @Culture = 'en-US'
	END

	SELECT
		x.OPE_INS_ID,
		x.GRP_ID,
		x.REGION,
		x.[REGION NAME],
		x.[PAYBYPHONE LOT ID],
		x.[LOT NAME],
		CASE
			WHEN x.TAR_TYPE = 0 THEN SUM(x.Free)
			ELSE 0
		END Free0,
		CASE
			WHEN x.TAR_TYPE = 0 THEN SUM(x.Payments)
			ELSE 0
		END Payments0,
		CASE
			WHEN x.TAR_TYPE = 0 THEN SUM(x.Refunds)
			ELSE 0
		END Refunds0,
		CASE
			WHEN x.TAR_TYPE = 0 THEN SUM(x.[Parking FEE])
			ELSE 0
		END ParkingFEE0,
		CASE
			WHEN x.TAR_TYPE = 0 THEN SUM(x.[PAYBYPHONE CONSUMER FEE])
			ELSE 0
		END CONSUMERFEE0,
		CASE
			WHEN x.TAR_TYPE = 0 THEN SUM(x.[TOTAL FOR DEPOSIT])
			ELSE 0
		END TOTALFORDEPOSIT0,
		CASE
			WHEN x.TAR_TYPE = 1 THEN SUM(x.Free)
			ELSE 0
		END Free1,
		CASE
			WHEN x.TAR_TYPE = 1 THEN SUM(x.Payments)
			ELSE 0
		END Payments1,
		CASE
			WHEN x.TAR_TYPE = 1 THEN SUM(x.Refunds)
			ELSE 0
		END Refunds1,
		CASE
			WHEN x.TAR_TYPE = 1 THEN SUM(x.[Parking FEE])
			ELSE 0
		END ParkingFEE1,
		CASE
			WHEN x.TAR_TYPE = 1 THEN SUM(x.[PAYBYPHONE CONSUMER FEE])
			ELSE 0
		END CONSUMERFEE1,
		CASE
			WHEN x.TAR_TYPE = 1 THEN SUM(x.[TOTAL FOR DEPOSIT])
			ELSE 0
		END TOTALFORDEPOSIT1,
		x.VAT,
		x.CUR_ISO_CODE,
		x.DECIMAL_PART,
		x.VAT_AMOUNT,
		x.LITL_LITERAL,
		x.LAN_DESCRIPTION,
		x.INS_DESCRIPTION,
		x.GRP_DESCRIPTION,
		x.INS_CULTURE_LANG,
		CASE
			WHEN GRP_ID = 0 AND
				TAR_TYPE = 0 THEN COALESCE(TPS.TICKET_PAYMENTS, 0)
			ELSE 0
		END TICKET_PAYMENTS,
		CASE
			WHEN GRP_ID = 0 AND
				TAR_TYPE = 0 THEN COALESCE(TPS.WEB_TICKET_PAYMENTS, 0)
			ELSE 0
		END WEB_TICKET_PAYMENTS,
		CASE
			WHEN GRP_ID = 0 AND
				TAR_TYPE = 0 THEN COALESCE(TPS.SUBTOTAL, 0)
			ELSE 0
		END SUBTOTAL,
		CASE
			WHEN GRP_ID = 0 AND
				TAR_TYPE = 0 THEN COALESCE(TPS.FEE, 0)
			ELSE 0
		END FEE,
		CASE
			WHEN GRP_ID = 0 AND
				TAR_TYPE = 0 THEN COALESCE(TPS.TOTAL, 0)
			ELSE 0
		END TOTAL,
		TPS.ISO_CODE,
		x.TAR_TYPE
	FROM (SELECT
		OPE_INS_ID,
		GRP_ID,
		REGION,
		[REGION NAME],
		[PAYBYPHONE LOT ID],
		[LOT NAME],
		Free,
		Payments,
		Refunds,
		[Parking FEE],
		[PAYBYPHONE CONSUMER FEE],
		[TOTAL FOR DEPOSIT],
		VAT,
		c.CUR_ISO_CODE,
		POWER(10, c.CUR_MINOR_UNIT) DECIMAL_PART,
		VAT_AMOUNT,
		LITL_LITERAL,
		LAN_DESCRIPTION,
		i.ins_description,
		GRP_DESCRIPTION,
		i.ins_culture_lang,
		TAR_TYPE
	FROM (

	/* ALL INSTALLATIONS AS GROUPS FOR INSTALLATIONS WITHOUT GROUP - TARTYPE 0 */
	SELECT
		i.INS_ID OPE_INS_ID,
		0 GRP_ID,
		0 REGION,
		i.INS_DESCRIPTION COLLATE SQL_Latin1_General_CP1_CI_AS [REGION NAME],
		0 [PAYBYPHONE LOT ID],
		i.INS_DESCRIPTION COLLATE SQL_Latin1_General_CP1_CI_AS [LOT NAME],
		0 Free,
		0 Payments,
		0 Refunds,
		0 [Parking FEE],
		0 [PAYBYPHONE CONSUMER FEE],
		0 [TOTAL FOR DEPOSIT],
		1 + i.INS_PERC_VAT2 VAT,
		CAST(ROUND(i.INS_PERC_VAT2 * 100, 2) AS numeric(18, 2)) VAT_AMOUNT,
		ll.LITL_LITERAL,
		l.LAN_DESCRIPTION,
		i.INS_DESCRIPTION COLLATE SQL_Latin1_General_CP1_CI_AS GRP_DESCRIPTION,
		0 TAR_TYPE
	FROM INSTALLATIONS i WITH (NOLOCK)
	INNER JOIN LITERAL_LANGUAGES ll WITH (NOLOCK)
		ON i.INS_SERVICE_VAT_LIT_ID = ll.LITL_LIT_ID
	INNER JOIN LANGUAGES l WITH (NOLOCK)
		ON ll.LITL_LAN_ID = l.LAN_ID
	WHERE l.LAN_CULTURE = @Culture
	AND i.INS_COU_ID = 39

	UNION ALL

	/* ALL INSTALLATIONS AS GROUPS FOR INSTALLATIONS WITHOUT GROUP - TARTYPE 1 */
	SELECT
		i.INS_ID OPE_INS_ID,
		0 GRP_ID,
		0 REGION,
		i.INS_DESCRIPTION COLLATE SQL_Latin1_General_CP1_CI_AS [REGION NAME],
		0 [PAYBYPHONE LOT ID],
		i.INS_DESCRIPTION COLLATE SQL_Latin1_General_CP1_CI_AS [LOT NAME],
		0 Free,
		0 Payments,
		0 Refunds,
		0 [Parking FEE],
		0 [PAYBYPHONE CONSUMER FEE],
		0 [TOTAL FOR DEPOSIT],
		1 + i.INS_PERC_VAT2 VAT,
		CAST(ROUND(i.INS_PERC_VAT2 * 100, 2) AS numeric(18, 2)) VAT_AMOUNT,
		ll.LITL_LITERAL,
		l.LAN_DESCRIPTION,
		i.INS_DESCRIPTION COLLATE SQL_Latin1_General_CP1_CI_AS GRP_DESCRIPTION,
		1 TAR_TYPE
	FROM INSTALLATIONS i WITH (NOLOCK)
	INNER JOIN LITERAL_LANGUAGES ll WITH (NOLOCK)
		ON i.INS_SERVICE_VAT_LIT_ID = ll.LITL_LIT_ID
	INNER JOIN LANGUAGES l WITH (NOLOCK)
		ON ll.LITL_LAN_ID = l.LAN_ID
	WHERE l.LAN_CULTURE = @Culture
	AND i.INS_COU_ID = 39

	UNION ALL

	/* ALL GROUPS - TARTYPE 0 */
	SELECT
		g.GRP_INS_ID OPE_INS_ID,
		GRP_ID,
		g.GRP_INS_ID REGION,
		i.INS_DESCRIPTION [REGION NAME],
		g.GRP_SHOW_ID [PAYBYPHONE LOT ID],
		g.GRP_DESCRIPTION [LOT NAME],
		0 Free,
		0 Payments,
		0 Refunds,
		0 [Parking FEE],
		0 [PAYBYPHONE CONSUMER FEE],
		0 [TOTAL FOR DEPOSIT],
		1 + i.INS_PERC_VAT2 VAT,
		CAST(ROUND(i.INS_PERC_VAT2 * 100, 2) AS numeric(18, 2)) VAT_AMOUNT,
		ll.LITL_LITERAL,
		l.LAN_DESCRIPTION,
		g.GRP_DESCRIPTION,
		0 TAR_TYPE
	FROM GROUPS g WITH (NOLOCK)
	INNER JOIN INSTALLATIONS i WITH (NOLOCK)
		ON g.GRP_INS_ID = i.INS_ID
	INNER JOIN LITERAL_LANGUAGES ll WITH (NOLOCK)
		ON i.INS_SERVICE_VAT_LIT_ID = ll.LITL_LIT_ID
	INNER JOIN LANGUAGES l WITH (NOLOCK)
		ON ll.LITL_LAN_ID = l.LAN_ID
	WHERE l.LAN_CULTURE = @Culture
	AND i.INS_COU_ID = 39

	UNION ALL

	/* ALL GROUPS - TARTYPE 1 */
	SELECT
		g.GRP_INS_ID OPE_INS_ID,
		GRP_ID,
		g.GRP_INS_ID REGION,
		i.INS_DESCRIPTION [REGION NAME],
		g.GRP_SHOW_ID [PAYBYPHONE LOT ID],
		g.GRP_DESCRIPTION [LOT NAME],
		0 Free,
		0 Payments,
		0 Refunds,
		0 [Parking FEE],
		0 [PAYBYPHONE CONSUMER FEE],
		0 [TOTAL FOR DEPOSIT],
		1 + i.INS_PERC_VAT2 VAT,
		CAST(ROUND(i.INS_PERC_VAT2 * 100, 2) AS numeric(18, 2)) VAT_AMOUNT,
		ll.LITL_LITERAL,
		l.LAN_DESCRIPTION,
		g.GRP_DESCRIPTION,
		1 TAR_TYPE
	FROM GROUPS g
	INNER JOIN INSTALLATIONS i WITH (NOLOCK)
		ON g.GRP_INS_ID = i.INS_ID
	INNER JOIN LITERAL_LANGUAGES ll WITH (NOLOCK)
		ON i.INS_SERVICE_VAT_LIT_ID = ll.LITL_LIT_ID
	INNER JOIN LANGUAGES l WITH (NOLOCK)
		ON ll.LITL_LAN_ID = l.LAN_ID
	WHERE l.LAN_CULTURE = @Culture
	AND i.INS_COU_ID = 39

	UNION ALL

	SELECT
		o.OPE_INS_ID,
		g.GRP_ID,
		i.INS_ID REGION,
		i.INS_DESCRIPTION [REGION NAME],
		g.GRP_SHOW_ID [PAYBYPHONE LOT ID],
		g.GRP_DESCRIPTION [LOT NAME],
		SUM(CASE
			WHEN o.OPE_TYPE IN (1, 2, 3) AND
				o.OPE_TOTAL_AMOUNT = 0 THEN 1
			ELSE 0
		END) Free,
		SUM(CASE
			WHEN o.OPE_TYPE IN (1, 2) AND
				o.OPE_TOTAL_AMOUNT > 0 THEN 1
			ELSE 0
		END) Payments,
		SUM(CASE
			WHEN o.OPE_TYPE IN (3) AND
				o.OPE_TOTAL_AMOUNT > 0 THEN 1
			ELSE 0
		END) Refunds,
		SUM(CASE
			WHEN o.OPE_TYPE IN (1, 2) THEN (o.OPE_AMOUNT + o.OPE_PARTIAL_VAT1)
			WHEN o.OPE_TYPE IN (3) THEN -(o.OPE_AMOUNT + o.OPE_PARTIAL_VAT1)
			ELSE 0
		END) [Parking FEE],
		SUM(CASE
			WHEN o.OPE_TYPE IN (1, 2) THEN (o.OPE_PARTIAL_PERC_FEE + o.OPE_PARTIAL_FIXED_FEE)
			WHEN o.OPE_TYPE IN (3) THEN -(o.OPE_PARTIAL_PERC_FEE + o.OPE_PARTIAL_FIXED_FEE)
			ELSE 0
		END) [PAYBYPHONE CONSUMER FEE],
		SUM(CASE
			WHEN o.OPE_TYPE IN (1, 2) THEN (o.OPE_AMOUNT + o.OPE_PARTIAL_VAT1 + o.OPE_PARTIAL_PERC_FEE + o.OPE_PARTIAL_FIXED_FEE)
			WHEN o.OPE_TYPE IN (3) THEN -(o.OPE_PARTIAL_PERC_FEE + o.OPE_PARTIAL_FIXED_FEE + o.OPE_PARTIAL_PERC_FEE + o.OPE_PARTIAL_FIXED_FEE)
			ELSE 0
		END) [TOTAL FOR DEPOSIT],
		1 + i.INS_PERC_VAT2 VAT,
		CAST(ROUND(i.INS_PERC_VAT2 * 100, 2) AS numeric(18, 2)) VAT_AMOUNT,
		ll.LITL_LITERAL,
		l.LAN_DESCRIPTION,
		g.GRP_DESCRIPTION,
		t.TAR_TYPE
	FROM HIS_OPERATIONS o WITH (NOLOCK)
	INNER JOIN GROUPS g WITH (NOLOCK)
		ON o.OPE_GRP_ID = g.GRP_ID
	INNER JOIN INSTALLATIONS i WITH (NOLOCK)
		ON o.OPE_INS_ID = i.INS_ID
	INNER JOIN LITERAL_LANGUAGES ll WITH (NOLOCK)
		ON i.INS_SERVICE_VAT_LIT_ID = ll.LITL_LIT_ID
	INNER JOIN LANGUAGES l WITH (NOLOCK)
		ON ll.LITL_LAN_ID = l.LAN_ID
	INNER JOIN TARIFFS t WITH (NOLOCK)
		ON o.OPE_TAR_ID = t.TAR_ID
	WHERE o.OPE_UTC_DATE >= @DateIniUTC
	AND o.OPE_UTC_DATE <= @DateEndUTC
	AND o.OPE_GRP_ID = g.GRP_ID
	AND o.OPE_INS_ID = i.INS_ID
	AND l.LAN_CULTURE = @Culture
	AND i.INS_COU_ID = 39

	GROUP BY			i.INS_ID,
						i.INS_DESCRIPTION,
						g.GRP_SHOW_ID,
						g.GRP_DESCRIPTION,
						o.OPE_INS_ID,
						g.GRP_ID,
						i.INS_PERC_VAT2,
						ll.LITL_LITERAL,
						l.LAN_DESCRIPTION,
						i.INS_CULTURE_LANG,
						t.TAR_TYPE) a
	INNER JOIN INSTALLATIONS i WITH (NOLOCK)
		ON ope_ins_id = i.ins_id
	INNER JOIN CURRENCIES c WITH (NOLOCK)
		ON i.ins_cur_id = c.cur_id) x
	LEFT JOIN (SELECT
		INS_STANDARD_CITY_ID,
		INS_ID,
		SUM(TICKET_PAYMENTS) TICKET_PAYMENTS,
		SUM(WEB_TICKET_PAYMENTS) WEB_TICKET_PAYMENTS,
		SUM(SUBTOTAL) SUBTOTAL,
		SUM(FEE) FEE,
		SUM(TOTAL) TOTAL,
		ISO_CODE,
		DECIMAL_PART
	FROM (SELECT
		INS_STANDARD_CITY_ID,
		INS_ID,
		COUNT(*) TICKET_PAYMENTS,
		0 WEB_TICKET_PAYMENTS,
		SUM(SUBTOTAL) SUBTOTAL,
		SUM(FEE) FEE,
		SUM(TOTAL) TOTAL,
		ISO_CODE,
		DECIMAL_PART
	FROM (SELECT
		p.[INS_STANDARD_CITY_ID],
		TIPA_INS_ID INS_ID,
		ABS([TIPA_TOTAL_AMOUNT] - ([TIPA_PARTIAL_PERC_FEE] + [TIPA_PARTIAL_FIXED_FEE])) SUBTOTAL,
		ABS([TIPA_PARTIAL_PERC_FEE] + [TIPA_PARTIAL_FIXED_FEE]) FEE,
		ABS([TIPA_TOTAL_AMOUNT]) TOTAL,
		[OPE_AMOUNT_CUR_ISO_CODE] ISO_CODE,
		POWER(10, c.CUR_MINOR_UNIT) DECIMAL_PART
	FROM [dbo].[VW_TICKET_PAYMENTS] p WITH (NOLOCK)
	INNER JOIN CURRENCIES c WITH (NOLOCK)
		ON p.TIPA_AMOUNT_CUR_ID = c.CUR_ID
	INNER JOIN INSTALLATIONS i WITH (NOLOCK)
		ON P.TIPA_INS_ID = i.INS_ID
	WHERE TIPA_UTC_DATE >= @DateIniUTC
	AND TIPA_UTC_DATE <= @DateEndUTC
	AND i.INS_COU_ID = 39) X
	GROUP BY	INS_STANDARD_CITY_ID,
						ISO_CODE,
						DECIMAL_PART,
						INS_ID

	UNION ALL

	SELECT
		INS_STANDARD_CITY_ID,
		INS_ID,
		0 TICKET_PAYMENTS,
		COUNT(*) WEB_TICKET_PAYMENTS,
		SUM(SUBTOTAL) SUBTOTAL,
		SUM(FEE) FEE,
		SUM(TOTAL) TOTAL,
		ISO_CODE,
		DECIMAL_PART
	FROM (SELECT
		I.INS_STANDARD_CITY_ID,
		INS_ID,
		ABS(TIPANU_TOTAL_AMOUNT - (TIPANU_PARTIAL_PERC_FEE + TIPANU_FIXED_FEE)) SUBTOTAL,
		ABS(TIPANU_PARTIAL_PERC_FEE + TIPANU_FIXED_FEE) FEE,
		ABS(TIPANU_TOTAL_AMOUNT) TOTAL,
		C.CUR_ISO_CODE ISO_CODE,
		POWER(10, c.CUR_MINOR_UNIT) DECIMAL_PART
	FROM TICKET_PAYMENTS_NON_USERS P WITH (NOLOCK)
	INNER JOIN INSTALLATIONS I WITH (NOLOCK)
		ON P.TIPANU_INS_ID = I.INS_ID
	INNER JOIN CURRENCIES C WITH (NOLOCK)
		ON P.TIPANU_AMOUNT_CUR_ID = C.CUR_ID
	WHERE TIPANU_UTC_DATE >= @DateIniUTC
	AND TIPANU_UTC_DATE <= @DateEndUTC
	AND I.INS_COU_ID = 39) X
	GROUP BY	INS_STANDARD_CITY_ID,
						ISO_CODE,
						DECIMAL_PART,
						INS_ID) X
	GROUP BY	INS_STANDARD_CITY_ID,
						ISO_CODE,
						INS_ID,
						DECIMAL_PART) TPS
		ON x.OPE_INS_ID = TPS.INS_ID
	GROUP BY	x.OPE_INS_ID,
						x.GRP_ID,
						x.REGION,
						x.[REGION NAME],
						x.[PAYBYPHONE LOT ID],
						x.[LOT NAME],
						x.VAT,
						x.CUR_ISO_CODE,
						x.DECIMAL_PART,
						x.VAT_AMOUNT,
						x.LITL_LITERAL,
						x.LAN_DESCRIPTION,
						x.INS_DESCRIPTION,
						x.GRP_DESCRIPTION,
						x.INS_CULTURE_LANG,
						TPS.TICKET_PAYMENTS,
						TPS.WEB_TICKET_PAYMENTS,
						TPS.SUBTOTAL,
						TPS.FEE,
						TPS.TOTAL,
						TPS.ISO_CODE,
						x.TAR_TYPE
END
GO

ALTER PROCEDURE [dbo].[Report_LIQUIDATIONDETAIL_EXTENDED]
	@DateIniUTC AS DATETIME,
	@DateEndUTC AS DATETIME,
	@Culture	AS VARCHAR(5)
AS	
BEGIN

IF @Culture IS NULL
BEGIN
	SET @Culture = 'en-US'
END

SELECT  D.OPE_INS_ID, 
		INS_DESCRIPTION,
		GROUPS.GRP_SHOW_ID,		
		GROUPS.GRP_ID, 
		GROUPS.GRP_DESCRIPTION,
		SUM(PARKINGS_COUNT) Parkings,
		SUM(EXTENSIONS_COUNT) Extensions,
		SUM(REFUNDS_COUNT) Refunds,
		TPC.TICKETPAYMENTS_COUNT /*0*/ Payments,
		SUM(dbo.AmountChangedIso(PARKINGS_TOTAL_AMOUNT, OPE_AMOUNT_CUR_ISO_CODE)) Parkings_Amount,
		SUM(dbo.AmountChangedIso(EXTENSIONS_TOTAL_AMOUNT, OPE_AMOUNT_CUR_ISO_CODE)) Extensions_Amount,
		SUM(dbo.AmountChangedIso(REFUNDS_TOTAL_AMOUNT*-1, OPE_AMOUNT_CUR_ISO_CODE)) Refunds_Amount,
		SUB.Payments_Amount,
		SUM(dbo.AmountChangedIso(PARKINGS_TOTAL_AMOUNT+EXTENSIONS_TOTAL_AMOUNT+(REFUNDS_TOTAL_AMOUNT*-1), OPE_AMOUNT_CUR_ISO_CODE)) Total_Amount,
		1+INS_PERC_VAT2 VAT,
		CUR_ISO_CODE,
		POWER(10, CUR_MINOR_UNIT) DECIMAL_PART,
		CAST(ROUND(INS_PERC_VAT2*100,2) AS NUMERIC(18,2)) VAT_AMOUNT,
		CAST(ROUND(INS_PERC_VAT1*100,2) AS NUMERIC(18,2)) VAT1_AMOUNT,
		L1.LITL_LITERAL,
		L2.LITL_LITERAL FEE_LITERAL,
		LA1.LAN_DESCRIPTION,
		INS_CULTURE_LANG,
		INSF1.INSF_IS_TAX,
		INSF1.INSF_PERC_FEE_APPLY,
		INSF1.INSF_PERC_FEE,
		INSF1.INSF_FIXED_FEE_APPLY,
		INSF1.INSF_FIXED_FEE,
		INS_PERC_VAT1,
		INS_PERC_VAT2,
		INSF4.INSF_IS_TAX INSF_IS_TAX4,
		INSF4.INSF_PERC_FEE_APPLY INSF_PERC_FEE_APPLY4,
		INSF4.INSF_PERC_FEE INSF_PERC_FEE4,
		INSF4.INSF_FIXED_FEE_APPLY INSF_FIXED_FEE_APPLY4,
		INSF4.INSF_FIXED_FEE INSF_FIXED_FEE4
FROM DB_OPERATIONS_HOUR D WITH (NOLOCK)
		INNER JOIN INSTALLATIONS WITH (NOLOCK) ON OPE_INS_ID = INS_ID
		INNER JOIN CURRENCIES WITH (NOLOCK)ON INS_CUR_ID = CUR_ID
		LEFT JOIN GROUPS WITH (NOLOCK) ON D.GRP_ID = GROUPS.GRP_ID
		INNER JOIN LITERAL_LANGUAGES L1 WITH (NOLOCK) ON INS_SERVICE_VAT_LIT_ID = L1.LITL_LIT_ID
		INNER JOIN LITERAL_LANGUAGES L2 WITH (NOLOCK) ON INS_SERVICE_FEE_LIT_ID = L2.LITL_LIT_ID
		INNER JOIN LANGUAGES LA1 WITH (NOLOCK) ON L1.LITL_LAN_ID = LA1.LAN_ID
		INNER JOIN LANGUAGES LA2 WITH (NOLOCK) ON L2.LITL_LAN_ID = LA1.LAN_ID
		LEFT JOIN (
			SELECT  SUM(dbo.AmountChangedIso(TICKETPAYMENTS_TOTAL_AMOUNT, OPE_AMOUNT_CUR_ISO_CODE)) Payments_Amount, OPE_INS_ID
			FROM DB_OPERATIONS_HOUR WITH (NOLOCK)
			WHERE HOUR_UTC >= @DateIniUTC
				AND HOUR_UTC <= @DateEndUTC
			GROUP BY OPE_INS_ID
		) SUB ON D.OPE_INS_ID = SUB.OPE_INS_ID
		INNER JOIN INSTALLATIONS_FINAN_PARS_OPE_TYPE INSF1 WITH (NOLOCK) ON INS_ID = INSF1.INSF_INS_ID AND INSF1.INSF_OPE_TYPE = 1 AND INSF1.INSF_SUSCRIPTION_TYPE = 1 AND COALESCE(INSF1.INSF_TAR_TYPE, 0) = 0 /* INSF_TAR_TYPE = 0 DUE TO IPS-315 */
		INNER JOIN INSTALLATIONS_FINAN_PARS_OPE_TYPE INSF4 WITH (NOLOCK) ON INS_ID = INSF4.INSF_INS_ID AND INSF4.INSF_OPE_TYPE = 4 AND INSF4.INSF_SUSCRIPTION_TYPE = 1 AND COALESCE(INSF4.INSF_TAR_TYPE, 0) = 0 /* INSF_TAR_TYPE = 0 DUE TO IPS-315 */
		INNER JOIN (
			SELECT OPE_INS_ID, SUM(TICKETPAYMENTS_COUNT) TICKETPAYMENTS_COUNT
			FROM DB_OPERATIONS_HOUR WITH (NOLOCK)
			WHERE HOUR_UTC >= @DateIniUTC
			AND HOUR_UTC <= @DateEndUTC
			GROUP BY OPE_INS_ID
		) TPC ON D.OPE_INS_ID = TPC.OPE_INS_ID
WHERE HOUR_UTC >= @DateIniUTC
	AND HOUR_UTC <= @DateEndUTC
	AND LA1.LAN_CULTURE = @Culture
	AND LA2.LAN_CULTURE = @Culture
	AND GROUPS.GRP_DESCRIPTION IS NOT NULL
GROUP BY D.OPE_INS_ID, INS_DESCRIPTION, GROUPS.GRP_SHOW_ID, GROUPS.GRP_ID, GROUPS.GRP_DESCRIPTION, CUR_MINOR_UNIT,CUR_ISO_CODE,INS_PERC_VAT2,L1.LITL_LITERAL,L2.LITL_LITERAL,LA1.LAN_DESCRIPTION,INS_CULTURE_LANG,SUB.Payments_Amount,INSF1.INSF_IS_TAX,INSF1.INSF_PERC_FEE_APPLY,INSF1.INSF_PERC_FEE,INSF1.INSF_FIXED_FEE_APPLY,INSF1.INSF_FIXED_FEE,INSF4.INSF_IS_TAX,INSF4.INSF_PERC_FEE_APPLY,INSF4.INSF_PERC_FEE,INSF4.INSF_FIXED_FEE_APPLY,INSF4.INSF_FIXED_FEE,INS_PERC_VAT1,INS_PERC_VAT2,TPC.TICKETPAYMENTS_COUNT
ORDER BY GRP_SHOW_ID ASC
END
GO


ALTER PROCEDURE [dbo].[Report_LIQUIDATIONDETAILSUB]
	@DateIniUTC AS datetime,
	@DateEndUTC AS datetime,
	@InstallationId AS INT
AS	
BEGIN

--SET @DateIniUTC = dateadd(yy,(DATEPART(year, @DateIniUTC)-1900),0) + dateadd(mm,DATEPART(month, @DateIniUTC)-1,0) + DATEPART(day, @DateIniUTC)
--SET @DateEndUTC = dateadd(yy,(DATEPART(year, @DateEndUTC)-1900),0) + dateadd(mm,DATEPART(month, @DateEndUTC)-1,0) + DATEPART(day, @DateEndUTC)

;WITH cte AS 
(
    SELECT dt = DATEADD(DAY, -(DAY(@DateIniUTC) - 1), @DateIniUTC)

    UNION ALL

    SELECT DATEADD(MONTH, 1, dt)
    FROM cte
    WHERE dt < DATEADD(DAY, -(DAY(@DateEndUTC) - 1), @DateEndUTC)
)

--select * from cte

SELECT DATEADD(DD, DATEDIFF(DD,0,[HOUR_UTC]), 0) AS [DATE_UTC],
	   OPE_INS_ID, INS_DESCRIPTION,
	   OHD_FDO_ID, FDO_DESCCRIPTION,FDO_ISCOUNCIL,	    	   
	   SUM(dbo.AmountChangedIso([OHD_PARKINGS_AMOUNT] + [OHD_PARKINGS_PERC_FEE] + [OHD_PARKINGS_FIXED_FEE] +
								[OHD_EXTENSIONS_AMOUNT] + [OHD_EXTENSIONS_PERC_FEE] + [OHD_EXTENSIONS_FIXED_FEE] +
								[OHD_REFUNDS_AMOUNT] - [OHD_REFUNDS_PERC_FEE] - [OHD_REFUNDS_FIXED_FEE] +
								[OHD_TICKETPAYMENTS_AMOUNT] + [OHD_TICKETPAYMENTS_PERC_FEE] + [OHD_TICKETPAYMENTS_FIXED_FEE] +
								[OHD_RECHARGES_AMOUNT] + [OHD_RECHARGES_PERC_FEE] + [OHD_RECHARGES_FIXED_FEE] +
								[OHD_COUPONS_AMOUNT] + [OHD_COUPONS_PERC_FEE] + [OHD_COUPONS_FIXED_FEE] +
								[OHD_SERVICES_AMOUNT] + [OHD_SERVICES_PERC_FEE] + [OHD_SERVICES_FIXED_FEE], OPE_AMOUNT_CUR_ISO_CODE)) DIST_AMOUNT,
	   SUM(dbo.AmountChangedIso([OHD_PARKINGS_VAT] + [OHD_PARKINGS_PERC_FEE_VAT] + [OHD_PARKINGS_FIXED_FEE_VAT] +
								[OHD_EXTENSIONS_VAT] + [OHD_EXTENSIONS_PERC_FEE_VAT] + [OHD_EXTENSIONS_FIXED_FEE_VAT] +
								[OHD_REFUNDS_VAT] - [OHD_REFUNDS_PERC_FEE_VAT] - [OHD_REFUNDS_FIXED_FEE_VAT] +
								[OHD_TICKETPAYMENTS_VAT] + [OHD_TICKETPAYMENTS_PERC_FEE_VAT] + [OHD_TICKETPAYMENTS_FIXED_FEE_VAT] +
								[OHD_RECHARGES_VAT] + [OHD_RECHARGES_PERC_FEE_VAT] + [OHD_RECHARGES_FIXED_FEE_VAT] +
								[OHD_COUPONS_VAT] + [OHD_COUPONS_PERC_FEE_VAT] + [OHD_COUPONS_FIXED_FEE_VAT] +
								[OHD_SERVICES_VAT] + [OHD_SERVICES_PERC_FEE_VAT] + [OHD_SERVICES_FIXED_FEE_VAT], OPE_AMOUNT_CUR_ISO_CODE)) DIST_VAT,
	   SUM(dbo.AmountChangedIso([OHD_PARKINGS_AMOUNT] + [OHD_PARKINGS_PERC_FEE] + [OHD_PARKINGS_FIXED_FEE] +
								[OHD_EXTENSIONS_AMOUNT] + [OHD_EXTENSIONS_PERC_FEE] + [OHD_EXTENSIONS_FIXED_FEE] +
								[OHD_REFUNDS_AMOUNT] - [OHD_REFUNDS_PERC_FEE] - [OHD_REFUNDS_FIXED_FEE], OPE_AMOUNT_CUR_ISO_CODE)) DIST_PARKINGS_AMOUNT,
	   SUM(dbo.AmountChangedIso([OHD_PARKINGS_VAT] + [OHD_PARKINGS_PERC_FEE_VAT] + [OHD_PARKINGS_FIXED_FEE_VAT] +
								[OHD_EXTENSIONS_VAT] + [OHD_EXTENSIONS_PERC_FEE_VAT] + [OHD_EXTENSIONS_FIXED_FEE_VAT] +
								[OHD_REFUNDS_VAT] - [OHD_REFUNDS_PERC_FEE_VAT] - [OHD_REFUNDS_FIXED_FEE_VAT], OPE_AMOUNT_CUR_ISO_CODE)) DIST_PARKINGS_VAT,
	   SUM(dbo.AmountChangedIso([OHD_TICKETPAYMENTS_AMOUNT] + [OHD_TICKETPAYMENTS_PERC_FEE] + [OHD_TICKETPAYMENTS_FIXED_FEE], OPE_AMOUNT_CUR_ISO_CODE)) DIST_TICKETPAYMENTS_AMOUNT,
	   SUM(dbo.AmountChangedIso([OHD_TICKETPAYMENTS_VAT] + [OHD_TICKETPAYMENTS_PERC_FEE_VAT] + [OHD_TICKETPAYMENTS_FIXED_FEE_VAT], OPE_AMOUNT_CUR_ISO_CODE)) DIST_TICKETPAYMENTS_VAT,
	   SUM(dbo.AmountChangedIso([OHD_RECHARGES_AMOUNT] + [OHD_RECHARGES_PERC_FEE] + [OHD_RECHARGES_FIXED_FEE] +
								[OHD_COUPONS_AMOUNT] + [OHD_COUPONS_PERC_FEE] + [OHD_COUPONS_FIXED_FEE] +
								[OHD_SERVICES_AMOUNT] + [OHD_SERVICES_PERC_FEE] + [OHD_SERVICES_FIXED_FEE], OPE_AMOUNT_CUR_ISO_CODE)) DIST_OTHERS_AMOUNT,
	   SUM(dbo.AmountChangedIso([OHD_RECHARGES_VAT] + [OHD_RECHARGES_PERC_FEE_VAT] + [OHD_RECHARGES_FIXED_FEE_VAT] +
								[OHD_COUPONS_VAT] + [OHD_COUPONS_PERC_FEE_VAT] + [OHD_COUPONS_FIXED_FEE_VAT] +
								[OHD_SERVICES_VAT] + [OHD_SERVICES_PERC_FEE_VAT] + [OHD_SERVICES_FIXED_FEE_VAT], OPE_AMOUNT_CUR_ISO_CODE)) DIST_OTHERS_VAT,
	   0 DIST_CASH_RECHARGES_AMOUNT, 0 DIST_CASH_RECHARGES_VAT	   
FROM 
	 DB_OPERATIONS_HOUR_DIST WITH (NOLOCK)
		INNER JOIN DB_OPERATIONS_HOUR WITH (NOLOCK) ON DBOH_ID = OHD_DBOH_ID
		INNER JOIN FINAN_DIST_OPERATORS WITH (NOLOCK) ON OHD_FDO_ID = FDO_ID
		INNER JOIN INSTALLATIONS WITH (NOLOCK) ON OPE_INS_ID = INS_ID
		INNER JOIN FINAN_DIST_OPERATORS_INSTALLATIONS WITH (NOLOCK) ON FDOI_FDO_ID = FDO_ID AND FDOI_INS_ID=OPE_INS_ID
WHERE --cte.dt = DATEADD(DD, DATEDIFF(DD,0,[HOUR_UTC]), 0) AND
	  --CAST(CONVERT(VARCHAR, DATEPART(year, cte.dt)) + '-' + CONVERT(VARCHAR, DATEPART(month, cte.dt)) + '-' + CONVERT(VARCHAR, DATEPART(day, cte.dt)) AS DATETIME)
	  FDO_MAIN = 0 AND
	   HOUR_UTC >= @DateIniUTC AND
	   HOUR_UTC < DATEADD(DD, 1, @DateEndUTC) AND
	   OPE_INS_ID = @InstallationId
GROUP BY DATEADD(DD, DATEDIFF(DD,0,[HOUR_UTC]), 0), OPE_INS_ID, INS_DESCRIPTION, OHD_FDO_ID, FDO_DESCCRIPTION, FDO_ISCOUNCIL
--HAVING DATEADD(DD, DATEDIFF(DD,0,[HOUR_UTC]), 0) >= @DateIniUTC AND
--	   DATEADD(DD, DATEDIFF(DD,0,[HOUR_UTC]), 0) <= @DateEndUTC

UNION

SELECT DATEADD(DD, DATEDIFF(DD,0,[HOUR_UTC]), 0) AS [DATE_UTC],
	   VW_CASH_RECHARGES_HOUR.INS_ID, INS_DESCRIPTION,
	   VW_CASH_RECHARGES_HOUR.FDO_ID, FDO_DESCCRIPTION,	FDO_ISCOUNCIL,
	   0 DIST_AMOUNT, 0 DIST_VAT, 0 DIST_PARKINGS_AMOUNT, 0 DIST_PARKINGS_VAT, 0 DIST_TICKETPAYMENTS_AMOUNT, 0 DIST_TICKETPAYMENTS_VAT, 0 DIST_OTHERS_AMOUNT, 0 DIST_OTHERS_VAT,
	   SUM(dbo.AmountChangedIso(VW_CASH_RECHARGES_HOUR.AMOUNT + VW_CASH_RECHARGES_HOUR.PERC_FEE + VW_CASH_RECHARGES_HOUR.FIXED_FEE, VW_CASH_RECHARGES_HOUR.CUR_ISO_CODE)) DIST_CASH_RECHARGES_AMOUNT,
	   SUM(dbo.AmountChangedIso(VW_CASH_RECHARGES_HOUR.VAT + VW_CASH_RECHARGES_HOUR.PERC_FEE_VAT + VW_CASH_RECHARGES_HOUR.FIXED_FEE_VAT, VW_CASH_RECHARGES_HOUR.CUR_ISO_CODE)) DIST_CASH_RECHARGES_VAT
FROM VW_CASH_RECHARGES_HOUR WITH (NOLOCK)
		INNER JOIN FINAN_DIST_OPERATORS WITH (NOLOCK) ON VW_CASH_RECHARGES_HOUR.FDO_ID = FINAN_DIST_OPERATORS.FDO_ID
		INNER JOIN INSTALLATIONS WITH (NOLOCK) ON VW_CASH_RECHARGES_HOUR.INS_ID = INSTALLATIONS.INS_ID
		INNER JOIN FINAN_DIST_OPERATORS_INSTALLATIONS WITH (NOLOCK) ON FDOI_FDO_ID = FINAN_DIST_OPERATORS.FDO_ID AND FDOI_INS_ID=INSTALLATIONS.INS_ID
WHERE FDO_MAIN = 0 AND
	   HOUR_UTC >= @DateIniUTC AND
	   HOUR_UTC < DATEADD(DD, 1, @DateEndUTC) AND 
	   VW_CASH_RECHARGES_HOUR.INS_ID = @InstallationId
GROUP BY DATEADD(DD, DATEDIFF(DD,0,[HOUR_UTC]), 0),
	   VW_CASH_RECHARGES_HOUR.INS_ID, INS_DESCRIPTION,
	   VW_CASH_RECHARGES_HOUR.FDO_ID, FDO_DESCCRIPTION,	FDO_ISCOUNCIL

END 
GO
