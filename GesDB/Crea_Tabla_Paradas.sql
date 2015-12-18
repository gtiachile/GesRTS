USE [GesRTS]
GO

/****** Object:  Table [dbo].[Paradas]     ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[Paradas] (
	[Parada_Key_RTS] 	[int] NOT NULL,
	[Sesion_Key_RTS] 	[int] NOT NULL,
	[Territory_Key_RTS] 	[int] NOT NULL,
	[Ruta_Key_RTS] 		[int] NULL,
	[Ubicacion_Region] 	[nvarchar](9) NULL,
	[Ubicacion_Tipo] 	[nvarchar](3) NULL,
	[Ubicacion_ID] 		[nvarchar](15) NULL,
	[Ubicacion_Extension] 	[int] NULL,
	[Nro_Secuencia] 	[int] NULL,
	[Tipo_Parada] 		[nvarchar](3) NULL,
	[Hora_Llegada] 		[datetime] NULL,
	[Tiempo_Servicio] 	[int] NULL,
	[Tiempo_Viaje] 		[int] NULL,
	[Distancia] 		[int] NULL,
	[Hora_Apertura] 	[datetime] NULL,
	[Hora_Cierre] 		[datetime] NULL,
	[Ventana1_Apertura] 	[datetime] NULL,
	[Ventana1_Cierre] 	[datetime] NULL,
	[Ventana2_Apertura] 	[datetime] NULL,
	[Ventana2_Cierre] 	[datetime] NULL,
	[Ext_Parada_Key_RTS] 	[int] NULL,

 CONSTRAINT [PK_Paradas] PRIMARY KEY CLUSTERED 
(
	[Parada_Key_RTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


