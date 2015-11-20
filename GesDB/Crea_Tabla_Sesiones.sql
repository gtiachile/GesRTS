USE [GesRTS]
GO

/****** Object:  Table [dbo].[Sesiones]    ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[Sesiones] (
	[Sesion_Key_RTS] [int] NOT NULL,
	[Region_ID] [nvarchar](9) NOT NULL,
	[Tipo] [int] NULL,
	[Descripcion] [nvarchar](50) NULL,
	[Escenario] [nvarchar](15) NULL,
	[Fecha_Creacion] [datetime] NULL,
	[Fecha_Vigencia] [datetime] NULL,
	[Fecha_Expiracion] [datetime] NULL,
	[Usuario_Modificacion] [nvarchar](12) NULL,
	[Fecha_Modificacion] [datetime] NULL,
	[Usuario_Catalogacion] [nvarchar](12) NULL,
	[Fecha_Catalogacion] [datetime] NULL,

 CONSTRAINT [PK_Sesiones] PRIMARY KEY CLUSTERED 
(
	[Sesion_Key_RTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


