/* CREATE TABLE */

CREATE TABLE [dbo].[USERS_WARNINGS_FUNCTIONS](
	[UWF_ID] [numeric](18, 0) NOT NULL,
	[UWF_DESCRIPTION] [varchar](255) NULL,
	[UWF_LIT_ID] [numeric](18, 0) NULL,
 CONSTRAINT [PK_USERS_WARNINGS_FUNCTIONS] PRIMARY KEY CLUSTERED 
(
	[UWF_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[USERS_WARNINGS_FUNCTIONS]  WITH CHECK ADD  CONSTRAINT [FK_USERS_WARNINGS_FUNCTIONS_LITERALS] FOREIGN KEY([UWF_LIT_ID])
REFERENCES [dbo].[LITERALS] ([LIT_ID])
GO

ALTER TABLE [dbo].[USERS_WARNINGS_FUNCTIONS] CHECK CONSTRAINT [FK_USERS_WARNINGS_FUNCTIONS_LITERALS]
GO

/* LITERALS */

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000001, 'ParkWithLicensePlate');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000001, 1, 'ParkWithLicensePlate');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000001, 2, 'ParkWithLicensePlate');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000001, 3, 'ParkWithLicensePlate');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000001, 4, 'ParkWithLicensePlate');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000001, 5, 'ParkWithLicensePlate');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000002, 'ParkWithSpot');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000002, 1, 'ParkWithSpot');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000002, 2, 'ParkWithSpot');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000002, 3, 'ParkWithSpot');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000002, 4, 'ParkWithSpot');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000002, 5, 'ParkWithSpot');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000003, 'ParkingOffStreet');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000003, 1, 'ParkingOffStreet');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000003, 2, 'ParkingOffStreet');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000003, 3, 'ParkingOffStreet');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000003, 4, 'ParkingOffStreet');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000003, 5, 'ParkingOffStreet');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000004, 'UnparkWithLicensePlate');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000004, 1, 'UnparkWithLicensePlate');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000004, 2, 'UnparkWithLicensePlate');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000004, 3, 'UnparkWithLicensePlate');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000004, 4, 'UnparkWithLicensePlate');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000004, 5, 'UnparkWithLicensePlate');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000005, 'TicketPaymentWithNumber');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000005, 1, 'TicketPaymentWithNumber');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000005, 2, 'TicketPaymentWithNumber');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000005, 3, 'TicketPaymentWithNumber');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000005, 4, 'TicketPaymentWithNumber');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000005, 5, 'TicketPaymentWithNumber');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000006, 'TicketPaymentMenu');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000006, 1, 'TicketPaymentMenu');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000006, 2, 'TicketPaymentMenu');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000006, 3, 'TicketPaymentMenu');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000006, 4, 'TicketPaymentMenu');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000006, 5, 'TicketPaymentMenu');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000007, 'RechargeWithCode');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000007, 1, 'RechargeWithCode');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000007, 2, 'RechargeWithCode');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000007, 3, 'RechargeWithCode');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000007, 4, 'RechargeWithCode');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000007, 5, 'RechargeWithCode');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000008, 'RechargeWithQR');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000008, 1, 'RechargeWithQR');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000008, 2, 'RechargeWithQR');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000008, 3, 'RechargeWithQR');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000008, 4, 'RechargeWithQR');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000008, 5, 'RechargeWithQR');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000009, 'RechargeWithPaymentMethod');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000009, 1, 'RechargeWithPaymentMethod');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000009, 2, 'RechargeWithPaymentMethod');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000009, 3, 'RechargeWithPaymentMethod');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000009, 4, 'RechargeWithPaymentMethod');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000009, 5, 'RechargeWithPaymentMethod');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000010, 'RechargeWithSpoty');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000010, 1, 'RechargeWithSpoty');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000010, 2, 'RechargeWithSpoty');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000010, 3, 'RechargeWithSpoty');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000010, 4, 'RechargeWithSpoty');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000010, 5, 'RechargeWithSpoty');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000011, 'RechargeWithPagatelia');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000011, 1, 'RechargeWithPagatelia');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000011, 2, 'RechargeWithPagatelia');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000011, 3, 'RechargeWithPagatelia');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000011, 4, 'RechargeWithPagatelia');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000011, 5, 'RechargeWithPagatelia');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000012, 'RechargeMenu');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000012, 1, 'RechargeMenu');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000012, 2, 'RechargeMenu');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000012, 3, 'RechargeMenu');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000012, 4, 'RechargeMenu');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000012, 5, 'RechargeMenu');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000013, 'BalanceTransfer');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000013, 1, 'BalanceTransfer');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000013, 2, 'BalanceTransfer');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000013, 3, 'BalanceTransfer');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000013, 4, 'BalanceTransfer');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000013, 5, 'BalanceTransfer');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000014, 'ChangeCard');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000014, 1, 'ChangeCard');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000014, 2, 'ChangeCard');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000014, 3, 'ChangeCard');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000014, 4, 'ChangeCard');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000014, 5, 'ChangeCard');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000015, 'InviteAFriend');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000015, 1, 'InviteAFriend');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000015, 2, 'InviteAFriend');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000015, 3, 'InviteAFriend');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000015, 4, 'InviteAFriend');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000015, 5, 'InviteAFriend');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000016, 'Merchants');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000016, 1, 'Merchants');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000016, 2, 'Merchants');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000016, 3, 'Merchants');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000016, 4, 'Merchants');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000016, 5, 'Merchants');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000017, 'Settings');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000017, 1, 'Settings');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000017, 2, 'Settings');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000017, 3, 'Settings');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000017, 4, 'Settings');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000017, 5, 'Settings');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000018, 'TollCapufeVIAT');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000018, 1, 'TollCapufeVIAT');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000018, 2, 'TollCapufeVIAT');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000018, 3, 'TollCapufeVIAT');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000018, 4, 'TollCapufeVIAT');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000018, 5, 'TollCapufeVIAT');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000019, 'OperationsCurrent');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000019, 1, 'OperationsCurrent');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000019, 2, 'OperationsCurrent');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000019, 3, 'OperationsCurrent');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000019, 4, 'OperationsCurrent');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000019, 5, 'OperationsCurrent');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000020, 'OperationsHistoric');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000020, 1, 'OperationsHistoric');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000020, 2, 'OperationsHistoric');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000020, 3, 'OperationsHistoric');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000020, 4, 'OperationsHistoric');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000020, 5, 'OperationsHistoric');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000021, 'Support');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000021, 1, 'Support');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000021, 2, 'Support');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000021, 3, 'Support');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000021, 4, 'Support');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000021, 5, 'Support');

INSERT INTO [dbo].[LITERALS] (LIT_ID, LIT_DESCRIPTION) VALUES (70000022, 'ScoreAPP');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000022, 1, 'ScoreAPP');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000022, 2, 'ScoreAPP');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000022, 3, 'ScoreAPP');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000022, 4, 'ScoreAPP');
INSERT INTO [dbo].[LITERAL_LANGUAGES] ([LITL_LIT_ID],[LITL_LAN_ID],[LITL_LITERAL]) VALUES (70000022, 5, 'ScoreAPP');

/* INSERT FUNCTIONS */

INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (100, 'ParkWithLicensePlate', 70000001);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (101, 'ParkWithSpot', 70000002);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (103, 'ParkingOffStreet', 70000003);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (200, 'UnparkWithLicensePlate', 70000004);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (300, 'TicketPaymentWithNumber', 70000005);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (301, 'TicketPaymentMenu', 70000006);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (400, 'RechargeWithCode', 70000007);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (401, 'RechargeWithQR', 70000008);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (402, 'RechargeWithPaymentMethod', 70000009);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (403, 'RechargeWithSpoty', 70000010);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (404, 'RechargeWithPagatelia', 70000011);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (450, 'RechargeMenu', 70000012);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (500, 'BalanceTransfer', 70000013);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (600, 'ChangeCard', 70000014);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (700, 'InviteAFriend', 70000015);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (750, 'Merchants', 70000016);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (800, 'Settings', 70000017);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (900, 'TollCapufeVIAT', 70000018);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (1000, 'OperationsCurrent', 70000019);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (1001, 'OperationsHistoric', 70000020);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (1200, 'Support', 70000021);
INSERT INTO dbo.[USERS_WARNINGS_FUNCTIONS] (UWF_ID, UWF_DESCRIPTION, UWF_LIT_ID) VALUES (1300, 'ScoreAPP', 70000022);

/* USERS_WARNINGS_RECIPIENTS */

/****** Object:  Table [dbo].[EMAILTOOL_RECIPIENTS]    Script Date: 12/02/2019 12:31:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[USERS_WARNINGS_RECIPIENTS](
	[ETR_ID] [bigint] NOT NULL,
	[ETR_EMAIL] [varchar](100) NOT NULL,
 CONSTRAINT [PK_USERS_WARNINGS_RECIPIENTS_1] PRIMARY KEY CLUSTERED 
(
	[ETR_ID] ASC,
	[ETR_EMAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificator' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS_WARNINGS_RECIPIENTS', @level2type=N'COLUMN',@level2name=N'ETR_ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS_WARNINGS_RECIPIENTS', @level2type=N'COLUMN',@level2name=N'ETR_EMAIL'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Table to store temporary data for notification tool sendings' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'USERS_WARNINGS_RECIPIENTS'
GO