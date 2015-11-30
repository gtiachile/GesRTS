USE [GesRTS]
GO

/****** Object:  Table [dbo].[Usuarios]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[Usuarios](
	[Usuario] [varchar](50) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[eMail] [varchar](40) NOT NULL,
	[Pass] [varchar](10) NOT NULL,
	[Fecha Creación] [varchar](20) NULL,
	[Estado] [varchar](10) NOT NULL,
	[UsuarioAD] [varchar](50) NULL,
	[DominioAD] [varchar](20) NULL,
	[Perfil] [varchar](15) NULL,
	[Expiracion] [varchar](20) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

