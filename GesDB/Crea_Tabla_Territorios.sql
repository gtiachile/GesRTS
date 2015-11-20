USE [GesRTS]
GO

/****** Object:  Table [dbo].[Territorios]     ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[Territorios] (
	[Territorio_Key_RTS] [int] NOT NULL,
	[Sesion_Key_RTS] [int] NOT NULL,
	[Territorio_Nro] [int] NULL,
	[Territorio_ID] [nvarchar](15) NULL,
	[Territorio_Descrip] [nvarchar](30) NULL,
	[Vendedor] [nvarchar](10) NULL,


 CONSTRAINT [PK_Territorios] PRIMARY KEY CLUSTERED 
(
	[Territorio_Key_RTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


