ALTER TABLE CURRENCIES_PAYMENT_TYPE_GATEWAY_CONFIG ADD
	CPTGC_LOCAL_BATCH_TIME varchar(5) NULL,
	CPTGC_TIMEZONE varchar(100) NULL,
	CPTGC_FIXED_FEE numeric(18,0) NULL,
	CPTGC_PERC_FEE numeric(18,5) NULL,
	CPTGC_MIN_FEE numeric(18,0) null
GO