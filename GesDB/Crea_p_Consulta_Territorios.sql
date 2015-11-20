USE [GesRTS]
GO
/****** Object:  StoredProcedure [dbo].[p_Consulta_Territorios]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==============================================================
-- Author:	A.Ulloa
-- Create date: 17-nov-2015
-- Description:	Consulta Territorios asociados a una Sesión TP
-- ==============================================================

CREATE PROC [dbo].[p_Consulta_Territorios]
-- Add the parameters for the stored procedure here
	@Nro_Sesion     INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT V_TerritoriosTP.PKEY, V_SesionesTP.PKEY, V_TerritoriosTP.TERRITORY_NUMBER, V_TerritoriosTP.TERRITORY_ID,
               V_TerritoriosTP.DESCRIPTION, V_TerritoriosTP.DRIVER1_ID
		FROM     V_TerritoriosTP INNER JOIN
			 V_SesionesTP ON V_TerritoriosTP.RN_SESSION_PKEY = V_SesionesTP.PKEY
		WHERE    V_TerritoriosTP.RN_SESSION_PKEY  =  @Nro_Sesion
		AND      V_TerritoriosTP.TERRITORY_NUMBER <> 0
		ORDER BY V_SesionesTP.PKEY,
		         V_TerritoriosTP.TERRITORY_NUMBER

END