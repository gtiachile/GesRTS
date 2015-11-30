USE [GesRTS]
GO

/****** Object:  Table [dbo].[Territorio_Temp]     ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[Territorio_Temp] (
	[Terr_Key_RTS] [int] NOT NULL,
	[Ses_Key_RTS] [int] NOT NULL,
	[Terr_Nro] [int] NULL,
	[Terr_ID] [nvarchar](15) NULL,
	[Terr_Descrip] [nvarchar](30) NULL,
	[Vend] [nvarchar](10) NULL,


 CONSTRAINT [PK_Territorio_Temp] PRIMARY KEY CLUSTERED 
(
	[Terr_Key_RTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


