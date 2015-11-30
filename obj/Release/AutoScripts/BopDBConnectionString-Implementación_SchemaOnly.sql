CREATE USER [BopUsr] FOR LOGIN [BopUsr] WITH DEFAULT_SCHEMA=[dbo]
GO
CREATE USER [admin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[f_avanceOF] 
(
	-- Add the parameters for the function here
	@OF varchar(15)
)
RETURNS numeric 
AS
BEGIN
	-- Declare the return variable here
	DECLARE @avance numeric(10,1)
	DECLARE @real int
	SET @avance = 0
	SELECT @real = CantidadReal from OrdenesFabricacion where OrdenFab = @OF
	IF isNull(@real,0) <> 0
		SELECT        @avance = isNull(CantidadReal,0)*100/isNull(CantidadPlanif,0)
		FROM OrdenesFabricacion
		WHERE OrdenFab = @OF
	RETURN @avance

END





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[f_duracionOF] 
(
	-- Add the parameters for the function here
	@material nchar(50),
	@cantidad numeric(10,1)
)
RETURNS nchar(10)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @duracion numeric(10,1)
	DECLARE @resultado nchar(10)

	SELECT        @duracion = (@cantidad / Formatos.Rendimiento)
	FROM            Productos INNER JOIN
		                     Formatos ON RTrim(Productos.Formato) = Rtrim(Formatos.Formato)
	WHERE        (RTrim(Productos.Material) = @material)
	SET @duracion = ISNULL(@duracion,0)
	SET @resultado = Cast(@duracion as nchar(15))
	RETURN @resultado

END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[f_lote_OF] 
(
	-- Add the parameters for the function here
	@OrdenFab varchar(15)
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @lote int

	SELECT        @lote = max(Lote)
	FROM          Notificaciones
	WHERE        (OrdenFab = @OrdenFab)
	SET @lote = isNull(@lote,0) + 1

	RETURN @lote

END




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[f_MinInicioFin]
(
@inicio varchar(5),
@fin varchar(5)
)
RETURNS INT
as
BEGIN
DECLARE @minutos int
DECLARE @shh_ini varchar(2)
DECLARE @shh_fin varchar(2)
DECLARE @smm_ini varchar(2)
DECLARE @smm_fin varchar(2)
DECLARE @nhh_ini int
DECLARE @nhh_fin int
DECLARE @nmm_ini int
DECLARE @nmm_fin int

SET @shh_ini = substring(@inicio,1,2)
SET @shh_fin = substring(@fin,1,2)
SET @smm_ini = substring(@inicio,4,2)
SET @smm_fin = substring(@fin,4,2)
SET @nhh_ini =  @shh_ini
SET @nhh_fin =  @shh_fin
SET @nmm_ini =  @smm_ini
SET @nmm_fin =  @smm_fin

SET @minutos = datediff(MINUTE,TIMEFROMPARTS(@nhh_ini,@nmm_ini,0,0,0),TIMEFROMPARTS(@nhh_fin,@nmm_fin,0,0,0))

RETURN @minutos
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[f_nueva_linea_planilla] 
(
	-- Add the parameters for the function here
	@NroPlanilla bigint
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @n int

	SELECT        @n = max(Linea)
	FROM          PlanillasMedicionDet
	WHERE        (NroPlanilla = @NroPlanilla)
	SET @n = isNull(@n,0) + 1

	RETURN @n

END





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[f_secuencia_detencion]
(

)
RETURNs bigint
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result bigint
	SELECT @Result=actual from secuencias where tipo='DETEN'
	RETURN @Result
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[f_secuencia_incidente]
(

)
RETURNs bigint
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result bigint
	SELECT @Result=actual from secuencias where tipo='INCID'
	RETURN @Result
END




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[f_secuencia_OF]
(

)
RETURNs bigint
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result bigint
	SELECT @Result=actual from secuencias where tipo='OF'
	RETURN @Result
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[f_secuencia_PLANILLA]
(

)
RETURNs bigint
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result bigint
	SELECT @Result=actual from secuencias where tipo='PLANI'
	RETURN @Result
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas](
	[Area] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripción] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Fecha Creación] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Planta] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CCosto] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL DEFAULT ('CSJP00111'),
 CONSTRAINT [PK_Areas] PRIMARY KEY CLUSTERED 
(
	[Area] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autorizaciones](
	[Perfil] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Modulo] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Opcion] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Fecha Creación] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[Fecha Modif] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[Usuario Modif] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_Autorizaciones] PRIMARY KEY CLUSTERED 
(
	[Perfil] ASC,
	[Modulo] ASC,
	[Opcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carga_programa_prod](
	[SKU] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[PRIORIDAD] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[Fecha] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[KILOS] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[FAMILIA] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CausasDetencion](
	[Causa] [varchar](4) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripción] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Tipo] [varchar](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Planificada] [varchar](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Estandar] [varchar](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Mantencion] [varchar](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Fecha Creación] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_CausasDetencion] PRIMARY KEY CLUSTERED 
(
	[Causa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Centros](
	[Centro] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripción] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Dirección] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Fecha Creación] [date] NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_Centros] PRIMARY KEY CLUSTERED 
(
	[Centro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detenciones](
	[NroDetencion] [bigint] NOT NULL,
	[Equipo] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CodigoCausaPrimario] [varchar](4) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CodigoCausaSecundario] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[FechaDetencion] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[InicioDetencion] [varchar](5) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FinDetencion] [varchar](5) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Observaciones] [nvarchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[Usuario] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FechaGrabacion] [datetime] NULL,
 CONSTRAINT [PK_Detenciones] PRIMARY KEY CLUSTERED 
(
	[NroDetencion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipos](
	[Equipo] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripción] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Proceso] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Fecha Creación] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_Equipos] PRIMARY KEY CLUSTERED 
(
	[Equipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED 
(
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FamiliaProductos](
	[Codigo] [varchar](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FamiliaProducto] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_FamiliaProductos] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Formatos](
	[Formato] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CodigoFamilia] [varchar](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Rendimiento] [numeric](10, 6) NOT NULL,
	[Fecha Creación] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_Formatos] PRIMARY KEY CLUSTERED 
(
	[Formato] ASC,
	[CodigoFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GanttDependencies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PredecessorID] [int] NOT NULL,
	[SuccessorID] [int] NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_GanttDependencies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GanttResourceAssignments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TaskID] [int] NOT NULL,
	[ResourceID] [int] NOT NULL,
	[Units] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_GanttResourceAssignments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GanttResources](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Color] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_GanttResources] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GanttTasks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[OrderID] [int] NOT NULL,
	[Title] [nvarchar](max) COLLATE Modern_Spanish_CI_AS NULL,
	[Start] [datetime] NOT NULL,
	[End] [datetime] NOT NULL,
	[PercentComplete] [decimal](5, 2) NOT NULL,
	[Expanded] [bit] NULL,
	[Summary] [bit] NOT NULL,
	[Description] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_GanttTasks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incidentes](
	[Incidente] [bigint] NOT NULL,
	[TipoIncidente] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FechaIncidente] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[HoraIncidente] [varchar](5) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Planta] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Area] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[Proceso] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[Equipo] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[Usuario] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Asunto] [varchar](300) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripcion] [varchar](2000) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[IndAlerta] [varchar](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_Incidentes] PRIMARY KEY CLUSTERED 
(
	[Incidente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[Codigo] [varchar](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Marca] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_Marcas] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mediciones](
	[Planta] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[Area] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[Proceso] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[Equipo] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[Variable] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Fecha] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Hora] [varchar](5) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[LoteSAP] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[Material] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[Valor] [numeric](18, 4) NOT NULL,
	[LimSup] [numeric](18, 4) NULL,
	[LimInf] [numeric](18, 4) NULL,
	[Unidad] [varchar](5) COLLATE Modern_Spanish_CI_AS NULL,
	[Observacion] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[FechaUltAct] [datetime] NULL,
	[UsuarioUltAct] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_Mediciones2] PRIMARY KEY CLUSTERED 
(
	[Variable] ASC,
	[Fecha] ASC,
	[Hora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_N0](
	[Perfil] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Posicion] [int] NOT NULL,
	[Modulo] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_Menu_N0] PRIMARY KEY CLUSTERED 
(
	[Perfil] ASC,
	[Posicion] ASC,
	[Modulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_N1](
	[Perfil] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Modulo] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Posicion] [int] NOT NULL,
	[Opcion] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_Menu_N1] PRIMARY KEY CLUSTERED 
(
	[Perfil] ASC,
	[Modulo] ASC,
	[Posicion] ASC,
	[Opcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_N2](
	[Perfil] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Modulo] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Posicion] [int] NOT NULL,
	[Opcion1] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Opcion2] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_Menu_N2] PRIMARY KEY CLUSTERED 
(
	[Perfil] ASC,
	[Modulo] ASC,
	[Posicion] ASC,
	[Opcion1] ASC,
	[Opcion2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modulos](
	[Modulo] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripción] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_Modulos] PRIMARY KEY CLUSTERED 
(
	[Modulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notificaciones](
	[OrdenFab] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Lote] [int] NOT NULL,
	[LoteSAP] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[Equipo] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Inicio] [varchar](5) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Fin] [varchar](5) COLLATE Modern_Spanish_CI_AS NULL,
	[Usuario] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FechaModificacion] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Producción] [numeric](18, 0) NULL,
	[Rechazo] [numeric](18, 0) NULL,
	[CausaRechazo] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_Notificaciones] PRIMARY KEY CLUSTERED 
(
	[OrdenFab] ASC,
	[Lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opciones](
	[Opcion] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripción] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Modulo] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[tipo] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL DEFAULT ('Pagina'),
	[url] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[tx] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_Opciones] PRIMARY KEY CLUSTERED 
(
	[Opcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenesFabricacion](
	[OrdenFab] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FechaPlanif] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Area] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Turno] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Material] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CantidadPlanif] [int] NOT NULL,
	[TiempoPlanif] [numeric](10, 1) NULL,
	[CantidadReal] [int] NULL,
	[TiempoReal] [numeric](10, 1) NULL,
	[Inicio] [varchar](5) COLLATE Modern_Spanish_CI_AS NULL,
	[Fin] [varchar](5) COLLATE Modern_Spanish_CI_AS NULL,
	[Prioridad] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[Fecha Lote] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[Observaciones] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[Planificador] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[Fecha Creación] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[Fecha Modif] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[EstadoOF] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_OrdenesFabricacion] PRIMARY KEY CLUSTERED 
(
	[OrdenFab] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfiles](
	[Perfil] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripción] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[Perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanillasMedicionDet](
	[NroPlanilla] [bigint] NOT NULL,
	[Linea] [int] NOT NULL,
	[Variable] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[Obligatorio] [bit] NULL,
	[Lote] [bit] NULL,
	[Producto] [bit] NULL,
 CONSTRAINT [PK_PlanillasMedicionDet] PRIMARY KEY CLUSTERED 
(
	[NroPlanilla] ASC,
	[Linea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanillasMedicionEnc](
	[NroPlanilla] [bigint] NOT NULL,
	[Titulo] [varchar](100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Planta] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[Area] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[Proceso] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[Equipo] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[DiasToleranciaIng] [int] NOT NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_PlanillasMedicionEnc] PRIMARY KEY CLUSTERED 
(
	[NroPlanilla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plantas](
	[Planta] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripción] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Fecha Creación] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Centro] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_Plantas] PRIMARY KEY CLUSTERED 
(
	[Planta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Procesos](
	[Proceso] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripción] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Fecha Creación] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Area] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_Procesos] PRIMARY KEY CLUSTERED 
(
	[Proceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Material] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Producto] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CodigoMarca] [varchar](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Planta] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Proceso] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CodigoFamilia] [varchar](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[IndSemielaborado] [varchar](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[PesoNeto] [numeric](10, 5) NULL,
	[PesoNetoCaja] [numeric](10, 5) NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Unidad] [varchar](5) COLLATE Modern_Spanish_CI_AS NOT NULL DEFAULT ('Kg'),
	[Formato] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL DEFAULT ('MANUAL'),
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Secuencias](
	[tipo] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[inicial] [bigint] NOT NULL,
	[actual] [bigint] NOT NULL,
	[incremento] [int] NOT NULL,
	[fechaUltAct] [datetime] NULL,
 CONSTRAINT [PK_Secuencias] PRIMARY KEY CLUSTERED 
(
	[tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDetencion](
	[Tipo] [varchar](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripción] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_TipoDetencion] PRIMARY KEY CLUSTERED 
(
	[Tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposIncidentes](
	[TipoInicidente] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripcion] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[emailAlerta] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_TiposIncidentes] PRIMARY KEY CLUSTERED 
(
	[TipoInicidente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurnoPlanta](
	[Codigo] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripción] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Planta] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Turno] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[HoraInicio] [varchar](5) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[HoraFin] [varchar](5) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[DotacionStd] [int] NULL,
	[Fecha Creación] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_TurnoPlanta] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turnos](
	[Turno] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_Turnos] PRIMARY KEY CLUSTERED 
(
	[Turno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unidades](
	[Unidad] [varchar](5) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripcion] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Fecha Creación] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Tipo] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL DEFAULT ('Producto'),
 CONSTRAINT [PK_Unidades] PRIMARY KEY CLUSTERED 
(
	[Unidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioFuncion](
	[Usuario] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Funcion] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Area] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Turno] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Proceso] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[Equipo] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[NivelRegDetencion] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[DiasAtrasoReg] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_UsuarioFuncion] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Usuario] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Nombre] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[eMail] [varchar](40) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Pass] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Fecha Creación] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[UsuarioAD] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[DominioAD] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[Perfil] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[Expiracion] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Variables](
	[Variable] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Equipo] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripcion] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Unidad] [varchar](5) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[LimSup] [numeric](18, 4) NULL,
	[LimInf] [numeric](18, 4) NULL,
	[Fecha Creación] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[Estado] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_Variables] PRIMARY KEY CLUSTERED 
(
	[Variable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW V_LAYOUT_TREE_N0
AS
SELECT [Descripción] as NODE_DESCRIPTION,
	   ROW_NUMBER() OVER(ORDER BY Planta) as NODE_ID,
	   0 UNDER_PARENT,
	   0 LEVEL_DEPTH,
	   [Planta] as Codigo
  FROM [BopDB].[dbo].[Plantas]
  WHERE Estado='Activo'


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[V_MENUS] as
SELECT        Perfil, CAST(Posicion AS nchar(1)) AS MenuID, Modulo AS MenuName, 0 AS ParentID, NULL AS MenuLocation, Modulo AS Text, NULL AS NavigateUrl
FROM            Menu_N0
union
SELECT        Menu_N1.Perfil, CAST(CAST(Menu_N0.Posicion AS nchar(1)) + CAST(Menu_N1.Posicion AS nchar(1)) AS int) AS MenuId, Menu_N1.Opcion AS MenuName, CAST(Menu_N0.Posicion AS int) AS ParentID, NULL 
                         AS MenuLocation, Opciones.Descripción AS Text, '~' + Opciones.url AS NavigateUrl
FROM            Menu_N1 INNER JOIN
                         Menu_N0 ON Menu_N1.Perfil = Menu_N0.Perfil AND Menu_N1.Modulo = Menu_N0.Modulo INNER JOIN
                         Opciones ON Menu_N1.Opcion = Opciones.Opcion
union
SELECT        Menu_N2.Perfil, CAST(CAST(Menu_N0.Posicion AS nchar(1)) + CAST(Menu_N1.Posicion AS nchar(1)) + CAST(Menu_N2.Posicion AS nchar(1)) AS int) AS MenuID, Menu_N2.Opcion2 AS MenuName,
                          CAST(CAST(Menu_N0.Posicion AS nchar(1)) + CAST(Menu_N1.Posicion AS nchar(1)) AS int) AS ParentID, NULL AS MenuLocation, Opciones.Descripción AS Text, '~'+ Opciones.url AS NavigateUrl
FROM            Menu_N2 INNER JOIN
                         Menu_N1 ON Menu_N2.Perfil = Menu_N1.Perfil AND Menu_N2.Modulo = Menu_N1.Modulo AND Menu_N2.Opcion1 = Menu_N1.Opcion INNER JOIN
                         Menu_N0 ON Menu_N1.Perfil = Menu_N0.Perfil AND Menu_N1.Modulo = Menu_N0.Modulo INNER JOIN
                         Opciones ON Menu_N2.Opcion2 = Opciones.Opcion AND Menu_N2.Modulo = Opciones.Modulo






GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_PlanProduccion] as
SELECT        Areas.Planta,OrdenesFabricacion.FechaPlanif AS Fecha, Areas.Descripción AS Area, OrdenesFabricacion.Material + ' - ' + Productos.Producto AS Producto, Productos.Unidad, 
                         CASE TurnoPlanta.Descripción WHEN 'Turno Día' THEN SUM(OrdenesFabricacion.CantidadPlanif) END AS QDia, CASE TurnoPlanta.Descripción WHEN 'Turno Tarde' THEN SUM(OrdenesFabricacion.CantidadPlanif)
                          END AS QTarde, CASE TurnoPlanta.Descripción WHEN 'Turno Noche' THEN SUM(OrdenesFabricacion.CantidadPlanif) END AS QNoche, 
                         CASE TurnoPlanta.Descripción WHEN 'Turno Día' THEN SUM(OrdenesFabricacion.TiempoPlanif) END AS tDia, CASE TurnoPlanta.Descripción WHEN 'Turno Tarde' THEN SUM(OrdenesFabricacion.TiempoPlanif) 
                         END AS tTarde, CASE TurnoPlanta.Descripción WHEN 'Turno Noche' THEN SUM(OrdenesFabricacion.TiempoPlanif) END AS tNoche, Productos.Formato
FROM            OrdenesFabricacion INNER JOIN
                         Areas ON OrdenesFabricacion.Area = Areas.Area INNER JOIN
                         Productos ON OrdenesFabricacion.Material = Productos.Material INNER JOIN
                         TurnoPlanta ON Areas.Planta = TurnoPlanta.Planta AND OrdenesFabricacion.Turno = TurnoPlanta.Codigo
GROUP BY OrdenesFabricacion.FechaPlanif, Areas.Descripción, OrdenesFabricacion.Material + ' - ' + Productos.Producto, Productos.Unidad, TurnoPlanta.Descripción, Productos.Formato, Areas.Planta




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_reporte_detenciones]
as
SELECT        Detenciones.NroDetencion, Detenciones.Equipo, Detenciones.CodigoCausaPrimario, Detenciones.CodigoCausaSecundario, Convert(datetime,Detenciones.FechaDetencion,105) as FechaDetencion, Detenciones.InicioDetencion, Detenciones.FinDetencion, 
						 dbo.f_MinInicioFin(Detenciones.InicioDetencion,Detenciones.FinDetencion) as duracion,
                         Detenciones.Observaciones, Detenciones.Usuario, Detenciones.FechaGrabacion, Equipos.Descripción, Procesos.Proceso, Procesos.Descripción AS DescProcesos, Areas.Area, Areas.Descripción AS DescArea, 
                         Plantas.Planta, Plantas.Descripción AS Descplanta, CausasDetencion.Causa AS CodCausaPri, CausasDetencion_1.Causa AS CodCausaSec, CausasDetencion.Descripción AS DescCausaPri, 
                         CausasDetencion_1.Descripción AS DescCausaSec
FROM            Detenciones INNER JOIN
                         Equipos ON Detenciones.Equipo = Equipos.Equipo INNER JOIN
                         Procesos ON Equipos.Proceso = Procesos.Proceso INNER JOIN
                         Areas ON Procesos.Area = Areas.Area INNER JOIN
                         Plantas ON Areas.Planta = Plantas.Planta INNER JOIN
                         CausasDetencion ON Detenciones.CodigoCausaPrimario = CausasDetencion.Causa LEFT OUTER JOIN
                         CausasDetencion AS CausasDetencion_1 ON Detenciones.CodigoCausaSecundario = CausasDetencion_1.Causa

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[v_reporte_incidentes] as
SELECT        Incidentes.Incidente, TiposIncidentes.Descripcion AS DescTipoIncidente, Convert(datetime,Incidentes.FechaIncidente,105) as FechaIncidente, Incidentes.HoraIncidente, Incidentes.Planta, Plantas.Descripción AS DescPlanta, Incidentes.Area, 
                         ISNULL(Areas.Descripción, '') AS DescArea, Incidentes.Proceso, ISNULL(Procesos.Descripción, '') AS DescProceso, Incidentes.Equipo, ISNULL(Equipos.Descripción, '') AS DescEquipo, Incidentes.Usuario, 
                         Incidentes.Asunto, Incidentes.Descripcion, Incidentes.IndAlerta
FROM            Equipos RIGHT OUTER JOIN
                         Incidentes INNER JOIN
                         TiposIncidentes ON Incidentes.TipoIncidente = TiposIncidentes.TipoInicidente LEFT OUTER JOIN
                         Plantas ON Incidentes.Planta = Plantas.Planta ON Equipos.Equipo = Incidentes.Equipo LEFT OUTER JOIN
                         Procesos ON Incidentes.Proceso = Procesos.Proceso LEFT OUTER JOIN
                         Areas ON Incidentes.Area = Areas.Area

GO
ALTER TABLE [dbo].[Areas]  WITH CHECK ADD  CONSTRAINT [FK_Areas_Plantas] FOREIGN KEY([Planta])
REFERENCES [dbo].[Plantas] ([Planta])
GO
ALTER TABLE [dbo].[Areas] CHECK CONSTRAINT [FK_Areas_Plantas]
GO
ALTER TABLE [dbo].[Formatos]  WITH CHECK ADD  CONSTRAINT [FK_Formatos_FamiliaProductos] FOREIGN KEY([CodigoFamilia])
REFERENCES [dbo].[FamiliaProductos] ([Codigo])
GO
ALTER TABLE [dbo].[Formatos] CHECK CONSTRAINT [FK_Formatos_FamiliaProductos]
GO
ALTER TABLE [dbo].[GanttTasks]  WITH CHECK ADD  CONSTRAINT [FK_GanttTasks_GanttTasks] FOREIGN KEY([ParentID])
REFERENCES [dbo].[GanttTasks] ([ID])
GO
ALTER TABLE [dbo].[GanttTasks] CHECK CONSTRAINT [FK_GanttTasks_GanttTasks]
GO
ALTER TABLE [dbo].[Plantas]  WITH CHECK ADD  CONSTRAINT [FK_Plantas_Centros] FOREIGN KEY([Centro])
REFERENCES [dbo].[Centros] ([Centro])
GO
ALTER TABLE [dbo].[Plantas] CHECK CONSTRAINT [FK_Plantas_Centros]
GO
ALTER TABLE [dbo].[Procesos]  WITH CHECK ADD  CONSTRAINT [FK_Procesos_Areas] FOREIGN KEY([Area])
REFERENCES [dbo].[Areas] ([Area])
GO
ALTER TABLE [dbo].[Procesos] CHECK CONSTRAINT [FK_Procesos_Areas]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE p_detenciones_usuario
@usuario varchar(50)
as
BEGIN
	SET NOCOUNT ON;
	declare @diasAtras INT

	SELECT @diasAtras = DiasAtrasoReg from UsuarioFuncion
	WHERE Usuario=@usuario

	SELECT [NroDetencion]
		  ,[Equipo]
		  ,[CodigoCausaPrimario]
		  ,[CodigoCausaSecundario]
		  ,[FechaDetencion]
		  ,[InicioDetencion]
		  ,[FinDetencion]
		  ,[Observaciones]
		  ,[Usuario]
		  ,[FechaGrabacion]
	  FROM [BopDB].[dbo].[Detenciones]
	  WHERE Usuario = @usuario and Convert(datetime,FechaDetencion,105)>=getdate()-@diasAtras
	  ORDER BY NroDetencion Desc
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE p_eliminaOF
	-- Add the parameters for the stored procedure here
	@OF varchar(15),
	@Lote int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
 DELETE FROM Notificaciones where OrdenFab=@OF and Lote=@Lote
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE p_equiposDetencion
	-- Add the parameters for the stored procedure here
	@nivel varchar(10), 
	@localizacion varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @nivel = 'Planta'
	SELECT        Equipos.Equipo, Equipos.Descripción
				FROM            Equipos INNER JOIN
                         Procesos ON Equipos.Proceso = Procesos.Proceso INNER JOIN
                         Areas ON Procesos.Area = Areas.Area INNER JOIN
                         Plantas ON Areas.Planta = Plantas.Planta
				WHERE Plantas.Planta = @localizacion

	IF @nivel = 'Area'
	SELECT        Equipos.Equipo, Equipos.Descripción
				FROM            Equipos INNER JOIN
                         Procesos ON Equipos.Proceso = Procesos.Proceso INNER JOIN
                         Areas ON Procesos.Area = Areas.Area INNER JOIN
                         Plantas ON Areas.Planta = Plantas.Planta
				WHERE Areas.Area = @localizacion

	IF @nivel = 'Proceso'
	SELECT        Equipos.Equipo, Equipos.Descripción
				FROM            Equipos INNER JOIN
                         Procesos ON Equipos.Proceso = Procesos.Proceso INNER JOIN
                         Areas ON Procesos.Area = Areas.Area INNER JOIN
                         Plantas ON Areas.Planta = Plantas.Planta
				WHERE Procesos.Proceso = @localizacion
	IF @nivel = 'Equipo'
	SELECT        Equipos.Equipo, Equipos.Descripción
				FROM            Equipos INNER JOIN
                         Procesos ON Equipos.Proceso = Procesos.Proceso INNER JOIN
                         Areas ON Procesos.Area = Areas.Area INNER JOIN
                         Plantas ON Areas.Planta = Plantas.Planta
				WHERE Equipos.Equipo = @localizacion

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_equiposIncidente]
	-- Add the parameters for the stored procedure here
	@nivel varchar(10), 
	@localizacion varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @nivel = 'Planta'
	SELECT '' as Equipo, 'N/A' as Descripción
	UNION
	SELECT        Equipos.Equipo, Equipos.Descripción
				FROM            Equipos INNER JOIN
                         Procesos ON Equipos.Proceso = Procesos.Proceso INNER JOIN
                         Areas ON Procesos.Area = Areas.Area INNER JOIN
                         Plantas ON Areas.Planta = Plantas.Planta
				WHERE Plantas.Planta = @localizacion

	IF @nivel = 'Area'
	SELECT '' as Equipo, 'N/A' as Descripción
	UNION
	SELECT        Equipos.Equipo, Equipos.Descripción
				FROM            Equipos INNER JOIN
                         Procesos ON Equipos.Proceso = Procesos.Proceso INNER JOIN
                         Areas ON Procesos.Area = Areas.Area INNER JOIN
                         Plantas ON Areas.Planta = Plantas.Planta
				WHERE Areas.Area = @localizacion

	IF @nivel = 'Proceso'
	SELECT '' as Equipo, 'N/A' as Descripción
	UNION
	SELECT        Equipos.Equipo, Equipos.Descripción
				FROM            Equipos INNER JOIN
                         Procesos ON Equipos.Proceso = Procesos.Proceso INNER JOIN
                         Areas ON Procesos.Area = Areas.Area INNER JOIN
                         Plantas ON Areas.Planta = Plantas.Planta
				WHERE Procesos.Proceso = @localizacion
	IF @nivel = 'Equipo'
	SELECT '' as Equipo, 'N/A' as Descripción
	UNION
	SELECT        Equipos.Equipo, Equipos.Descripción
				FROM            Equipos INNER JOIN
                         Procesos ON Equipos.Proceso = Procesos.Proceso INNER JOIN
                         Areas ON Procesos.Area = Areas.Area INNER JOIN
                         Plantas ON Areas.Planta = Plantas.Planta
				WHERE Equipos.Equipo = @localizacion

END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_fechasIngreso] 
@diasAtras INT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @inc INT
	DECLARE @tfechas TABLE (fecha date)
	SET @inc = 0
	WHILE (@inc <= @diasAtras)
	BEGIN
		INSERT INTO @tfechas (fecha) values (GETDATE() - @inc) 
		SET @inc = @inc + 1
	END
	select convert(varchar(10),fecha,105) as fecha from @tfechas
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_fechasIngresoMod] 
@fechaMod varchar(20),
@diasAtras INT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @inc INT
	DECLARE @fechaModD datetime
	DECLARE @tfechas TABLE (fecha date)
	SET @fechaModD = convert(datetime, @fechaMod, 105)
	SET @inc = 0
	WHILE (@inc <= @diasAtras)
	BEGIN
		INSERT INTO @tfechas (fecha) values (@fechaModD - @inc) 
		SET @inc = @inc + 1
	END
	select convert(varchar(10),fecha,105) as fecha from @tfechas
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_secuencia_detencion]
AS
BEGIN
	SET NOCOUNT ON;
	declare @actual as bigint
	declare @incremento as int
	select @actual=actual,@incremento=incremento from secuencias
	   where tipo='DETEN'
	update secuencias set actual=@actual+@incremento, fechaUltAct=getdate()
	   where tipo='DETEN'
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_secuencia_incidente]
AS
BEGIN
	SET NOCOUNT ON;
	declare @actual as bigint
	declare @incremento as int
	select @actual=actual,@incremento=incremento from secuencias
	   where tipo='INCID'
	update secuencias set actual=@actual+@incremento, fechaUltAct=getdate()
	   where tipo='INCID'
END




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_secuencia_OF]
AS
BEGIN
	SET NOCOUNT ON;
	declare @actual as bigint
	declare @incremento as int
	select @actual=actual,@incremento=incremento from secuencias
	   where tipo='OF'
	update secuencias set actual=@actual+@incremento, fechaUltAct=getdate()
	   where tipo='OF'
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_secuencia_Planillas]
AS
BEGIN
	SET NOCOUNT ON;
	declare @actual as bigint
	declare @incremento as int
	select @actual=actual,@incremento=incremento from secuencias
	   where tipo='PLANI'
	update secuencias set actual=@actual+@incremento, fechaUltAct=getdate()
	   where tipo='PLANI'
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[p_ValidaInsertaAREAS]
(
@Area varchar(10),
@Descripción varchar(20),
@Estado varchar(10),
@Planta varchar(10),
@CCosto varchar(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM AREAS WHERE Area = @Area)>0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [Areas] ([Area], [Descripción], [Estado], [Planta], [CCosto]) VALUES (@Area, @Descripción, @Estado, @Planta, @CCosto)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[p_ValidaInsertaCAUSASDETENCION]
(
@Causa varchar(4),
@Descripción varchar(50),
@Tipo varchar(2),
@Planificada varchar(2),
@Estandar varchar(2),
@Mantencion varchar(2),
@Estado varchar(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM CAUSASDETENCION WHERE Causa = @Causa)>0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [CausasDetencion] ([Causa], [Descripción], [Tipo], [Planificada], [Estandar], [Mantencion], [Estado]) VALUES (@Causa, @Descripción, @Tipo, @Planificada, @Estandar, @Mantencion, @Estado)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[p_ValidaInsertaCENTROS]
(
@Centro varchar(10),
@Descripción varchar(15),
@Dirección varchar(30),
@Estado varchar(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM CENTROS WHERE Centro = @Centro)>0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [Centros] ([Centro], [Descripción], [Dirección], [Estado]) VALUES (@Centro, @Descripción, @Dirección, @Estado)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[p_ValidaInsertaEQUIPOS]
(
@Equipo varchar(10),
@Descripción varchar(30),
@Proceso varchar(10),
@Estado varchar(10)
)
AS
BEGIN
	DECLARE @Msg VARCHAR(200)
	DECLARE @Done BIT
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM EQUIPOS WHERE Equipo = @Equipo)>0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [Equipos] ([Equipo], [Proceso], [Estado], [Descripción]) VALUES (@Equipo, @Proceso, @Estado, @Descripción)
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[p_ValidaInsertaFAMILIAPRODUCTOS]
(
@Codigo varchar(2),
@FamiliaProducto varchar(20),
@Estado varchar(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM FAMILIAPRODUCTOS WHERE Codigo = @Codigo)>0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [FamiliaProductos] ([Codigo], [FamiliaProducto], [Estado]) VALUES (@Codigo, @FamiliaProducto, @Estado)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[p_ValidaInsertaFORMATOS]
(
@Formato varchar(10),
@CodigoFamilia varchar(2),
@Rendimiento numeric,
@Estado varchar(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM FORMATOS WHERE Formato = @Formato)>0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [Formatos] ([Formato], [CodigoFamilia], [Rendimiento], [Estado]) VALUES (@Formato, @CodigoFamilia, @Rendimiento, @Estado)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[p_ValidaInsertaMARCAS]
(
@Codigo varchar(2),
@Marca varchar(15),
@Estado varchar(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM MARCAS WHERE Codigo = @Codigo)>0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [Marcas] ([Codigo], [Marca], [Estado]) VALUES (@Codigo, @Marca, @Estado)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[p_ValidaInsertaMEDICIONES]
(
@Planta varchar(10),
@Area varchar(10),
@Proceso varchar(10),
@Equipo varchar(10),
@Variable varchar(10),
@Fecha varchar(20),
@Hora varchar(5),
@LoteSAP varchar(50),
@Material varchar(10),
@Valor numeric(18,4),
@LimSup numeric(18,4),
@LimInf numeric(18,4),
@Unidad varchar(5),
@Observacion varchar(300)

)
AS
BEGIN

	IF (SELECT COUNT(*) FROM MEDICIONES WHERE Variable = @Variable and Fecha=@Fecha and Hora=@Hora)>0
	BEGIN

		UPDATE [Mediciones] SET [Planta] = @Planta, [Area] = @Area, [Proceso] = @Proceso, [Equipo] = @Equipo, [LoteSAP] = @LoteSAP, [Material] = @Material, [Valor] = @Valor, [LimSup] = @LimSup, [LimInf] = @LimInf, [Unidad] = @Unidad, [Observacion] = @Observacion WHERE [Variable] = @Variable AND [Fecha] = @Fecha AND [Hora] = @Hora
		RETURN;
	END
INSERT INTO [Mediciones] ([Planta], [Area], [Proceso], [Equipo], [Variable], [Fecha], [Hora], [LoteSAP], [Material], [Valor], [LimSup], [LimInf], [Unidad], [Observacion]) VALUES (@Planta, @Area, @Proceso, @Equipo, @Variable, @Fecha, @Hora, @LoteSAP, @Material, @Valor, @LimSup, @LimInf, @Unidad, @Observacion)
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC p_ValidaInsertaModulo
(
@Modulo VARCHAR(15),
@Descripción VARCHAR(30),
@Estado VARCHAR(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS 
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM Modulos WHERE Modulo=@Modulo) > 0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
	INSERT INTO [Modulos] ([Modulo], [Descripción], [Estado]) VALUES (@Modulo, @Descripción, @Estado)
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[p_ValidaInsertaOpcion]
(
@Opcion VARCHAR(20),
@Descripción VARCHAR(30),
@Modulo VARCHAR(15),
@Estado VARCHAR(10),
@tipo VARCHAR(10),
@url VARCHAR(100),
@tx VARCHAR(20),
@Done BIT,
@Msg VARCHAR(200)
)
AS 
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM Opciones WHERE Opcion=@Opcion) > 0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
	INSERT INTO [Opciones] ([Opcion], [Descripción], [Modulo], [Estado],[Tipo],[Url]) VALUES (@Opcion, @Descripción, @Modulo, @Estado, @Tipo, @Url)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[p_ValidaInsertaPerfil]
(
@Perfil VARCHAR(15),
@Descripción VARCHAR(30),
@Estado VARCHAR(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS 
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM Perfiles WHERE Perfil=@Perfil) > 0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
	INSERT INTO [Perfiles] ([Perfil], [Descripción], [Estado]) VALUES (@Perfil, @Descripción, @Estado)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[p_ValidaInsertaPLANILLASMEDICIONENC]
(
@NroPlanilla bigint,
@Titulo varchar(100),
@Planta varchar(10),
@Area varchar(10),
@Proceso varchar(10),
@Equipo varchar(30),
@DiasToleranciaIng int,
@Estado varchar(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM PLANILLASMEDICIONENC WHERE NroPlanilla = @NroPlanilla)>0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [PlanillasMedicionEnc] ([NroPlanilla], [Titulo], [Planta], [Area], [Proceso], [Equipo], [DiasToleranciaIng], [Estado]) VALUES (@NroPlanilla, @Titulo, @Planta, @Area, @Proceso, @Equipo, @DiasToleranciaIng, @Estado)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[p_ValidaInsertaPLANTAS]
(
@Planta varchar(10),
@Descripción varchar(20),
@Estado varchar(10),
@Centro varchar(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM PLANTAS WHERE Planta = @Planta)>0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [Plantas] ([Planta], [Descripción], [Estado], [Centro]) VALUES (@Planta, @Descripción, @Estado, @Centro)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[p_ValidaInsertaPROCESOS]
(
@Proceso varchar(10),
@Descripción varchar(20),
@Fecha_Creación varchar(20),
@Estado varchar(10),
@Area varchar(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM PROCESOS WHERE Proceso = @Proceso)>0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [Procesos] ([Proceso], [Descripción], [Fecha Creación], [Estado], [Area]) VALUES (@Proceso, @Descripción, @Fecha_Creación, @Estado, @Area)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[p_ValidaInsertaPRODUCTOS]
(
@Material varchar(10),
@Producto varchar(50),
@CodigoMarca varchar(2),
@Planta varchar(10),
@Proceso varchar(10),
@CodigoFamilia varchar(2),
@IndSemielaborado varchar(2),
@PesoNeto numeric,
@PesoNetoCaja numeric,
@Estado varchar(10),
@Unidad varchar(5),
@Formato varchar(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM PRODUCTOS WHERE Material = @Material)>0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [Productos] ([Material], [Producto], [CodigoMarca], [Planta], [Proceso], [CodigoFamilia], [IndSemielaborado], [PesoNeto], [PesoNetoCaja], [Estado], [Unidad]) VALUES (@Material, @Producto, @CodigoMarca, @Planta, @Proceso, @CodigoFamilia, @IndSemielaborado, @PesoNeto, @PesoNetoCaja, @Estado, @Unidad)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[p_ValidaInsertaSECUENCIAS]
(
@tipo varchar(10),
@inicial bigint,
@actual bigint,
@incremento int,
@fechaUltAct datetime,
@Done BIT,
@Msg VARCHAR(200)
)
AS
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM SECUENCIAS WHERE tipo = @tipo)>0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [Secuencias] ([tipo], [inicial], [actual], [incremento]) VALUES (@tipo, @inicial, @actual, @incremento)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[p_ValidaInsertaTIPODETENCION]
(
@Tipo varchar(2),
@Descripción varchar(20),
@Estado varchar(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM TIPODETENCION WHERE Tipo = @Tipo)>0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [TipoDetencion] ([Tipo], [Descripción], [Estado]) VALUES (@Tipo, @Descripción, @Estado)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[p_ValidaInsertaTIPOSINCIDENTES]
(
@TipoInicidente varchar(10),
@Descripcion varchar(50),
@Estado varchar(10),
@emailAlerta varchar(100),
@Done BIT,
@Msg VARCHAR(200)
)
AS
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM TIPOSINCIDENTES WHERE TipoInicidente = @TipoInicidente)>0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [TiposIncidentes] ([TipoInicidente], [Descripcion], [emailAlerta],[Estado]) VALUES (@TipoInicidente, @emailAlerta,@Descripcion, @Estado)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[p_ValidaInsertaTURNOPLANTA]
(
@Codigo varchar(10),
@Descripción varchar(30),
@Planta varchar(10),
@Turno varchar(10),
@HoraInicio varchar(5),
@HoraFin varchar(5),
@DotacionStd int,
@Estado varchar(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM TURNOPLANTA WHERE Codigo = @Codigo)>0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [TurnoPlanta] ([Codigo], [Descripción], [Planta], [Turno], [DotacionStd], [Estado], [HoraInicio], [HoraFin]) VALUES (@Codigo, @Descripción, @Planta, @Turno, @DotacionStd, @Estado, @HoraInicio, @HoraFin)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[p_ValidaInsertaTURNOS]
(
@Turno varchar(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM TURNOS WHERE Turno = @Turno)>0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [Turnos] ([Turno]) VALUES (@Turno)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[p_ValidaInsertaUnidad]
(
@Unidad VARCHAR(5),
@Descripcion VARCHAR(15),
@Estado VARCHAR(10),
@Tipo VARCHAR(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS 
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM Unidades WHERE Unidad=@Unidad) > 0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [Unidades] ([Unidad], [Descripcion], [Estado], [Tipo]) VALUES (@Unidad, @Descripcion, @Estado, @Tipo)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[p_ValidaInsertaUsuario]
(
@Usuario VARCHAR(50),
@Nombre VARCHAR(30),
@eMail VARCHAR(40),
@Pass VARCHAR(10),
@Fecha_Creación VARCHAR(20),
@Estado VARCHAR(10),
@UsuarioAD VARCHAR(50),
@DominioAD VARCHAR(20),
@Perfil VARCHAR(15),
@Expiracion VARCHAR(20),
@Done BIT,
@Msg VARCHAR(200)
)
AS 
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM Usuarios WHERE Usuario=@Usuario) > 0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [Usuarios] ([Usuario], [Nombre], [eMail], [Pass], [Fecha Creación],[UsuarioAD],[DominioAD],[Perfil],[Expiracion], [Estado]) VALUES (@Usuario, @Nombre, @eMail, @Pass, @Fecha_Creación,@UsuarioAD,@DominioAD,@Perfil,@Expiracion, @Estado)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[p_ValidaInsertaUsuarioFuncion]
(
@Usuario VARCHAR(50),
@Funcion VARCHAR(50),
@Area VARCHAR(10),
@Turno VARCHAR(10),
@Proceso VARCHAR(10),
@Equipo VARCHAR(10),
@NivelRegDetencion VARCHAR(10),
@DiasAtrasoReg int,
@Done BIT,
@Msg VARCHAR(200)
)
AS 
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM UsuarioFuncion WHERE Usuario=@Usuario) > 0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [UsuarioFuncion] ([Usuario], [Funcion], [Area], [Turno], [Proceso], [Equipo], [NivelRegDetencion], [DiasAtrasoReg])
                      VALUES (@Usuario,  @Funcion,  @Area,  @Turno,  @Proceso,  @Equipo,  @NivelRegDetencion,  @DiasAtrasoReg)
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[p_ValidaInsertaVARIABLES]
(
@Variable varchar(10),
@Equipo varchar(30),
@Descripcion varchar(50),
@Unidad varchar(5),
@LimSup numeric,
@LimInf numeric,
@Estado varchar(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM VARIABLES WHERE Variable = @Variable)>0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [Variables] ([Variable], [Equipo], [Descripcion], [Unidad], [LimSup], [LimInf], [Estado]) VALUES (@Variable, @Equipo, @Descripcion, @Unidad, @LimSup, @LimInf, @Estado)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_fechaCreacion]
ON [dbo].[Areas]
AFTER INSERT
AS
    UPDATE Areas
    SET [Fecha Creación] = Cast(GETDATE() as nchar(20))
    WHERE Area IN (SELECT DISTINCT Area FROM Inserted)




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_fechaCreacionCausasDet]
ON [dbo].[CausasDetencion]
AFTER INSERT
AS
    UPDATE CausasDetencion
    SET [Fecha Creación] = Cast(GETDATE() as nchar(20))
    WHERE Causa IN (SELECT DISTINCT Causa FROM Inserted)





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE trigger [dbo].[tr_actualiza_detencion]
on [dbo].[Detenciones]
after update as
 update Detenciones
 set FechaGrabacion = getdate()
 FROM inserted
 WHERE Detenciones.NroDetencion = inserted.NroDetencion


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_fechaCreacionEquipo]
ON [dbo].[Equipos]
AFTER INSERT
AS
    UPDATE Equipos
    SET [Fecha Creación] = Cast(GETDATE() as nchar(20))
    WHERE Equipo IN (SELECT DISTINCT Equipo FROM Inserted)





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_fechaCreacionFormato]
ON [dbo].[Formatos]
AFTER INSERT
AS
    UPDATE Formatos
    SET [Fecha Creación] = Cast(GETDATE() as nchar(20))
    WHERE Formato IN (SELECT DISTINCT Formato FROM Inserted)





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE trigger [dbo].[tr_actualiza_notificacion]
on [dbo].[Notificaciones]
after update as
 update OrdenesFabricacion
 set CantidadReal = CantidadReal - [Producción],
 TiempoReal = IsNull(TiempoReal,0) - DATEDIFF(minute, Convert(time,deleted.Inicio),Convert(time,deleted.Fin))
 FROM deleted
 WHERE OrdenesFabricacion.OrdenFab = deleted.OrdenFab

 update OrdenesFabricacion
 set CantidadReal = CantidadReal + [Producción],
 TiempoReal = IsNull(TiempoReal,0) + DATEDIFF(minute, Convert(time,inserted.Inicio),Convert(time,inserted.Fin))
 FROM inserted
 WHERE OrdenesFabricacion.OrdenFab = inserted.OrdenFab


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE trigger [dbo].[tr_borra_notificacion]
on [dbo].[Notificaciones]
after delete as
 update OrdenesFabricacion
 set CantidadReal = CantidadReal - [Producción],
 TiempoReal = IsNull(TiempoReal,0) - DATEDIFF(minute, Convert(time,deleted.Inicio),Convert(time,deleted.Fin))
 FROM deleted
 WHERE OrdenesFabricacion.OrdenFab = deleted.OrdenFab

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE trigger [dbo].[tr_nueva_notificacion]
on [dbo].[Notificaciones]
after insert as
 update OrdenesFabricacion
 set CantidadReal = IsNull(CantidadReal,0) + [Producción],
     TiempoReal = IsNull(TiempoReal,0) + DATEDIFF(minute, Convert(time,inserted.Inicio),Convert(time,inserted.Fin))
 FROM inserted
 WHERE OrdenesFabricacion.OrdenFab = inserted.OrdenFab

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_fechaCreacionOF]
ON [dbo].[OrdenesFabricacion]
AFTER INSERT
AS
    UPDATE OrdenesFabricacion
    SET [Fecha Creación] = Cast(GETDATE() as nchar(20)), [EstadoOF] = 'Planif'
    WHERE OrdenFab IN (SELECT DISTINCT OrdenFab FROM Inserted)





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_fechaCreacionProceso]
ON [dbo].[Procesos]
AFTER INSERT
AS
    UPDATE Procesos
    SET [Fecha Creación] = Cast(GETDATE() as nchar(20))
    WHERE Proceso IN (SELECT DISTINCT Proceso FROM Inserted)





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_fechaCreacionUnidad]
ON [dbo].[Unidades]
AFTER INSERT
AS
    UPDATE Unidades
    SET [Fecha Creación] = Cast(GETDATE() as nchar(20))
    WHERE Unidad IN (SELECT DISTINCT Unidad FROM Inserted)





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_fechaCreacionUsuarios]
ON [dbo].[Usuarios]
AFTER INSERT
AS
    UPDATE Usuarios
    SET [Fecha Creación] = Cast(GETDATE() as nchar(20))
    WHERE Usuario IN (SELECT DISTINCT Usuario FROM Inserted)





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_fechaCreacionVariable]
ON [dbo].[Variables]
AFTER INSERT
AS
    UPDATE Variables
    SET [Fecha Creación] = Cast(GETDATE() as nvarchar(20))
    WHERE Variable IN (SELECT DISTINCT Variable FROM Inserted)





GO
