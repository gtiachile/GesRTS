USE [GesRTS]
GO
/****** Object:  StoredProcedure [dbo].[p_Consulta_Rutas]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ====================================================================
-- Author:	A.Ulloa
-- Create date: 17-nov-2015
-- Description:	Consulta Rutas asociados a un Territorio y Sesión TP
-- ====================================================================

CREATE PROC [dbo].[p_Consulta_Rutas]
-- Add the parameters for the stored procedure here
	@Nro_Sesion     INT
--     ,@Nro_Territorio INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT	S_RS_ROUTE.PKEY, S_RS_ROUTE.RN_SESSION_PKEY, S_RS_ROUTE.TERRITORY_PKEY, S_RS_ROUTE.ROUTE_NUMBER,
		S_RS_ROUTE.ROUTE_ID, S_RS_ROUTE.DESCRIPTION, S_RS_ROUTE.LOCATION_TYPE_ORIGIN, S_RS_ROUTE.LOCATION_ID_ORIGIN
	FROM	S_RS_ROUTE                                                                        INNER JOIN
		S_RS_TERRITORY ON S_RS_ROUTE.RN_SESSION_PKEY     = S_RS_TERRITORY.RN_SESSION_PKEY INNER JOIN
		S_RS_SESSION   ON S_RS_TERRITORY.RN_SESSION_PKEY = S_RS_SESSION.PKEY
	WHERE	S_RS_SESSION.PKEY = @Nro_Sesion
	

END