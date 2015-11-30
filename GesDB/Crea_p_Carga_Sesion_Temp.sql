USE [GesRTS]
GO
/****** Object:  StoredProcedure [dbo].[p_Carga_Sesion_Temp]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==================================================================
-- Author:	A.Ulloa
-- Create date: 24-nov-2015
-- Description:	Carga la tabla Sesion_Temp desde la tabla de
--              Sesiones en RTS
-- ==================================================================

CREATE PROC [dbo].[p_Carga_Sesion_Temp]
-- Add the parameters for the stored procedure here
	 @Nro_Sesion		INT
	,@Usuario		NVARCHAR(30)

AS
BEGIN

	DECLARE @Fecha_Cataloga		DATETIME
	DECLARE @Fecha_Vigencia		DATETIME
	DECLARE @Fecha_Expiracion	DATETIME

	SET @Fecha_Cataloga   = GETDATE()
	SET @Fecha_Vigencia   = GETDATE()
	SET @Fecha_Expiracion = GETDATE() + 365

-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.

	SET NOCOUNT ON;

-- Carga Tabla de Sesiones

	DELETE FROM Sesion_Temp
	 WHERE	Sesion_Temp.Ses_Key_RTS = @Nro_Sesion
	
	INSERT INTO Sesion_Temp
		SELECT	V_SesionesTP.PKEY, V_SesionesTP.REGION_ID, V_SesionesTP.TYPE, V_SesionesTP.DESCRIPTION, V_SesionesTP.SCENARIO, V_SesionesTP.SESSION_DATE,
			@Fecha_Vigencia AS Fec_Vigencia, @Fecha_Expiracion AS Fec_Expiracion, V_SesionesTP.USER_MODIFIED, V_SesionesTP.DATE_MODIFIED,
			@Usuario AS Usua_Cataloga, @Fecha_Cataloga AS Fec_Cataloga
		  FROM	V_SesionesTP
		 WHERE	V_SesionesTP.PKEY = @Nro_Sesion

END