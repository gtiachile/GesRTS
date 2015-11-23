USE [GesRTS]
GO

/****** Object:  Table [dbo].[Dias_Semana]    Script Date: 12-11-2015 16:53:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Dias_Semana](
	[Nro_Dia]             int            NOT NULL,
	[Inicial_Dia_Ingles]  [nvarchar](1)  NOT NULL,
	[Inicial_Dia_Espanol] [nvarchar](1)  NOT NULL,
	[Dia_Semana]          [varchar](10)  NOT NULL,
	[Dia_Nombre_Corto]    [varchar](3)   NOT NULL,
 CONSTRAINT [PK_Dias_Semana] PRIMARY KEY CLUSTERED 
(
	[Nro_Dia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

