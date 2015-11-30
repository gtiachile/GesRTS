USE [GesRTS]
GO

/****** Object:  Table [dbo].[Sesion_Temp]    ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[Sesion_Temp] (
	[Ses_Key_RTS] [int] NOT NULL,
	[Reg_ID] [nvarchar](9) NOT NULL,
	[Tip] [int] NULL,
	[Descr] [nvarchar](50) NULL,
	[Esc] [nvarchar](15) NULL,
	[Fec_Creacion] [datetime] NULL,
	[Fec_Vigencia] [datetime] NULL,
	[Fec_Expiracion] [datetime] NULL,
	[Usua_Modificacion] [nvarchar](12) NULL,
	[Fec_Modificacion] [datetime] NULL,
	[Usua_Catalogacion] [nvarchar](12) NULL,
	[Fec_Catalogacion] [datetime] NULL,

 CONSTRAINT [PK_Sesion_Temp] PRIMARY KEY CLUSTERED 
(
	[Ses_Key_RTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


