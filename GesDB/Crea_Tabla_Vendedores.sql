USE [GesRTS]
GO

/****** Object:  Table [dbo].[Vendedores]     ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[Vendedores](
	[Vendedor_ID] [varchar](10) NOT NULL,
	[Vendedor_Tipo] [varchar](10) NOT NULL,
	[Vendedor_Nombre] [varchar](50) NOT NULL,
	[Region] [nvarchar](9) NOT NULL,
	[Supervisor] [varchar](10) NULL,
	[Estado] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Vendedores] PRIMARY KEY CLUSTERED 
(
	[Vendedor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

