USE [GesRTS]
GO

/****** Object:  Table [dbo].[Audita]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[Audita](
	[Fecha_Hora_Evento] [datetime] NOT NULL,
	[Opcion_ID] [varchar](20) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Region] [varchar](9) NOT NULL,
	[Accion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Audita] PRIMARY KEY CLUSTERED 
(
	[Fecha_Hora_Evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

