/***********************************************************/
/************     [INSTALLATION_POLYGONS]     ***************/
/***********************************************************/

CREATE TABLE [dbo].[INSTALLATION_POLYGONS](
	[INSPOL_ID] [numeric](18, 0) NOT NULL,
	[INSPOL_DESCRIPTION] [varchar](50) NOT NULL,
	[INSPOL_INS_ID] [numeric](18, 0) NOT NULL,
	[INSPOL_COLOUR] [varchar](10) NULL,
	[INSPOL_MESSAGE_LIT_ID] [numeric](18, 0) NULL,
	[INSPOL_INI_APPLY_DATE] [datetime] NOT NULL,
	[INSPOL_END_APPLY_DATE] [datetime] NOT NULL,
 CONSTRAINT [PK_INSTALLATION_POLYGONS] PRIMARY KEY CLUSTERED 
(
	[INSPOL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[INSTALLATION_POLYGONS]  WITH CHECK ADD  CONSTRAINT [FK_INSTALLATION_POLYGONS_INSTALLATIONS] FOREIGN KEY([INSPOL_INS_ID])
REFERENCES [dbo].[INSTALLATIONS] ([INS_ID])
GO

ALTER TABLE [dbo].[INSTALLATION_POLYGONS] CHECK CONSTRAINT [FK_INSTALLATION_POLYGONS_INSTALLATIONS]
GO





/***********************************************************/
/*******      [INSTALLATION_POLYGON_GEOMETRIES]      *******/
/***********************************************************/
CREATE TABLE [dbo].[INSTALLATION_POLYGON_GEOMETRIES](
	[IPGE_ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[IPGE_INSPOL_ID] [numeric](18, 0) NOT NULL,
	[IPGE_POL_NUMBER] [int] NOT NULL,
	[IPGE_ORDER] [numeric](18, 0) NOT NULL,
	[IPGE_LATITUDE] [numeric](18, 12) NOT NULL,
	[IPGE_LONGITUDE] [numeric](18, 12) NOT NULL,
	[IPGE_INI_APPLY_DATE] [datetime] NOT NULL,
	[IPGE_END_APPLY_DATE] [datetime] NOT NULL,
 CONSTRAINT [PK_INSTALLATION_POLYGON_GEOMETRIES] PRIMARY KEY CLUSTERED 
(
	[IPGE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[INSTALLATION_POLYGON_GEOMETRIES]  WITH CHECK ADD  CONSTRAINT [FK_INSTALLATION_POLYGON_GEOMETRIES_INSTALLATION_POLYGON] FOREIGN KEY([IPGE_INSPOL_ID])
REFERENCES [dbo].[INSTALLATION_POLYGONS] ([INSPOL_ID])
GO

ALTER TABLE [dbo].[INSTALLATION_POLYGON_GEOMETRIES] CHECK CONSTRAINT [FK_INSTALLATION_POLYGON_GEOMETRIES_INSTALLATION_POLYGON]
GO
