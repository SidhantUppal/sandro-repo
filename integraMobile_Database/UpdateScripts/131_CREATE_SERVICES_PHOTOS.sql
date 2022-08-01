CREATE TABLE [dbo].[SERVICES_PHOTOS](
	[SERPHO_ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SERPHO_SERUP_ID] [numeric](18, 0) NOT NULL,
	[SERPHO_NUMBER] [numeric](18, 0) NOT NULL,
	[SERPHO_PATH] [varchar](512) NOT NULL,
	[SERPHO_NAME] [varchar](50) NOT NULL,
	[SERPHO_THUMB_PATH] [varchar](512) NOT NULL,
 CONSTRAINT [PK_SERVICES_PHOTOS] PRIMARY KEY CLUSTERED 
(
	[SERPHO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[SERVICES_PHOTOS]  WITH CHECK ADD  CONSTRAINT [FK_SERVICES_PHOTOS_SERVICES_USER_PLATES] FOREIGN KEY([SERPHO_SERUP_ID])
REFERENCES [dbo].[SERVICES_USER_PLATES] ([SERUP_ID])
GO

ALTER TABLE [dbo].[SERVICES_PHOTOS] CHECK CONSTRAINT [FK_SERVICES_PHOTOS_SERVICES_USER_PLATES]
GO