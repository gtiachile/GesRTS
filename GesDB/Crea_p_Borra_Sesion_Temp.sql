USE [GesRTS]
GO
/****** Object:  StoredProcedure [dbo].[p_Borra_Sesion_Temp]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==================================================================
-- Author:	A.Ulloa
-- Create date: 17-nov-2015
-- Description:	Borra las tablas de Sesiones y Territorios generadas
--              desde las tablas en RTS en forma temporal
-- ==================================================================

CREATE PROC [dbo].[p_Borra_Sesion_Temp]
-- Add the parameters for the stored procedure here
	 @Nro_Sesion		INT

AS
BEGIN

-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.

	SET NOCOUNT ON;

-- Borra tablas Temporales de Sesión y Territorios

	DELETE FROM Sesion_Temp
	 WHERE Sesion_Temp.Ses_Key_RTS = @Nro_Sesion

	DELETE FROM Territorio_Temp
	 WHERE Territorio_Temp.Ses_Key_RTS = @Nro_Sesion

END