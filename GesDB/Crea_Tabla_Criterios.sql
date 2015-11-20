USE [GesRTS]
GO

/****** Object:  Table [dbo].[Criterios]     ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[Criterios](
	[Criterio_ID] [varchar](30) NOT NULL,
	[Fecha_Desde] datetime NULL,
	[Inicio_Nombre] [varchar](20) NOT NULL,
	[Region] [nvarchar](9) NOT NULL,
	[Supervisor] [varchar](50) NOT NULL,
	[Estado] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Criterioes] PRIMARY KEY CLUSTERED 
(
	[Criterio_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

