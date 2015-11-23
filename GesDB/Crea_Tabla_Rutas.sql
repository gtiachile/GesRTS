USE [GesRTS]
GO

/****** Object:  Table [dbo].[Rutas]     ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[Rutas] (
	[Ruta_Key_RTS] [int] NOT NULL,
	[Sesion_Key_RTS] [int] NOT NULL,
	[Territorio_Key_RTS] [int] NOT NULL,
	[Ruta_Nro] [int] NOT NULL,
	[Ruta_ID] [nvarchar](15) NULL,
	[Ruta_Descrip] [nvarchar](30) NULL,
	[Ruta_Dia] [nvarchar](1) NULL,
	[Ruta_Inicio_Tipo] [nvarchar](3) NULL,
	[Ruta_Inicio_Ubicacion] [nvarchar](15) NULL,

 CONSTRAINT [PK_Rutas] PRIMARY KEY CLUSTERED 
(
	[Ruta_Key_RTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


