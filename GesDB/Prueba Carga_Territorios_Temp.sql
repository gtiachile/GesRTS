USE [GesRTS]
GO

/****** Object:  StoredProcedure [dbo].[p_Carga_Territorios_Temp]    Script Date: 24-11-2015 18:35:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- ==================================================================
-- Author:	A.Ulloa
-- Create date: 24-nov-2015
-- Description:	Carga la tabla Territorios en forma temporal, con los
--              datos de los Territorios de una Sesión en RTS
-- ==================================================================

	 DECLARE @Nro_Sesion		INT

	 SET @Nro_Sesion       = 916

	SET NOCOUNT ON;

-- Carga Tabla de Territorios

	DELETE FROM Territorio_Temp
	 WHERE	Territorio_Temp.Ses_Key_RTS = @Nro_Sesion
	
	INSERT	INTO Territorio_Temp
	SELECT	V_TerritoriosTP.PKEY, V_SesionesTP.PKEY, V_TerritoriosTP.TERRITORY_NUMBER, V_TerritoriosTP.TERRITORY_ID,
		V_TerritoriosTP.DESCRIPTION, V_TerritoriosTP.DRIVER1_ID
	  FROM	V_TerritoriosTP INNER JOIN
		V_SesionesTP ON V_TerritoriosTP.RN_SESSION_PKEY = V_SesionesTP.PKEY
	WHERE	V_TerritoriosTP.RN_SESSION_PKEY  =  @Nro_Sesion
	AND	V_TerritoriosTP.TERRITORY_NUMBER <> 0

GO


