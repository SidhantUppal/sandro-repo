CREATE TABLE [dbo].[SERVICES_TYPE](
	[SERTYP_ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[SERTYP_DESCRIPTION] [varchar](200) NOT NULL,
	[SERTYP_LIT_ID] [numeric](18, 0) NULL,
	[SERTYP_TYPE_TYPESERVICE_ID] [int] NOT NULL,
	[SERTYP_ INITIALIZATION_TYPE_ID] [int] NOT NULL,
 CONSTRAINT [PK_SERVICES_TYPE] PRIMARY KEY CLUSTERED 
(
	[SERTYP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[SERVICES_TYPE]  WITH CHECK ADD  CONSTRAINT [FK_SERVICES_TYPE_LITERALS] FOREIGN KEY([SERTYP_LIT_ID])
REFERENCES [dbo].[LITERALS] ([LIT_ID])
GO

ALTER TABLE [dbo].[SERVICES_TYPE] CHECK CONSTRAINT [FK_SERVICES_TYPE_LITERALS]
GO


