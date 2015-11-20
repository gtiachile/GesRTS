USE [GesRTS]
GO

/****** Object:  Table [dbo].[Regiones]    Script Date: 12-11-2015 17:39:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Regiones](
	[Region_ID] [nvarchar](9) NOT NULL,
	[Descripción] [varchar](30) NOT NULL,
	[Dirección] [varchar](50) NOT NULL,
        [Ciudad] [varchar](30) NOT NULL,
	[Jefe_Zonal] [varchar](50) NULL,
	[Region_Chile] [varchar](2) NOT NULL,
	[Region_RTS] [varchar](2) NOT NULL,
	[Estado] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Regiones] PRIMARY KEY CLUSTERED 
(
	[Region_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

