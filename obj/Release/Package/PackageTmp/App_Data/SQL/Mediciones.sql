USE [BopDB]
GO

/****** Object:  Table [dbo].[Mediciones]    Script Date: 02-11-2015 12:11:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Mediciones](
	[Planta] [varchar](10) NULL,
	[Area] [varchar](10) NULL,
	[Proceso] [varchar](10) NULL,
	[Equipo] [varchar](10) NULL,
	[Variable] [varchar](10) NOT NULL,
	[Fecha] [varchar](20) NOT NULL,
	[Hora] [varchar](5) NOT NULL,
	[LoteSAP] [varchar](50) NULL,
	[Material] [varchar](10) NULL,
	[Valor] [numeric](18, 4) NOT NULL,
	[LimSup] [numeric](18, 4) NULL,
	[LimInf] [numeric](18, 4) NULL,
	[Unidad] [varchar](5) NULL,
	[Observacion] [varchar](300) NULL,
	[FechaUltAct] [datetime] NULL,
	[UsuarioUltAct] [varchar](50) NULL,
 CONSTRAINT [PK_Mediciones2] PRIMARY KEY CLUSTERED 
(
	[Variable] ASC,
	[Fecha] ASC,
	[Hora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

