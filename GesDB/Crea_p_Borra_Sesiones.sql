USE [GesRTS]
GO
/****** Object:  StoredProcedure [dbo].[p_Borra_Sesiones]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==================================================================
-- Author:	A.Ulloa
-- Create date: 28-nov-2015
-- Description:	Borra las tablas de Sesiones, Territorios, Rutas y
--              Paradas, cuando se elimina una sesión.
-- ==================================================================

CREATE PROC [dbo].[p_Borra_Sesiones]
-- Add the parameters for the stored procedure here
	 @Nro_Sesion		INT
	,@Usuario		NVARCHAR(30)

AS
BEGIN

-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.

	SET NOCOUNT ON;

-- Graba tabla de Auditoría

	DECLARE @Region_ID  	VARCHAR(9)
	DECLARE @Descr_Sesion	VARCHAR(50)
	DECLARE @Fecha_Accion	DATETIME
 
	SET @Fecha_Accion = GETDATE()

	SELECT	@Region_ID = Sesiones.Region_ID, @Descr_Sesion = Sesiones.Descripcion
	  FROM	Sesiones
	 WHERE	Sesiones.Sesion_Key_RTS = @Nro_Sesion

	INSERT INTO Audita (Fecha_Hora_Evento, Opcion_ID, Usuario, Region, Accion) 
                    VALUES (@Fecha_Accion, 'Sesiones', @Usuario, @Region_ID, CONCAT('Borra sesión ', @Nro_Sesion, ' - ', @Descr_Sesion))

-- Borra tablas Sesiones, Territorios, Rutas y Paradas

	DELETE FROM Sesiones
	 WHERE Sesiones.Sesion_Key_RTS = @Nro_Sesion

	DELETE FROM Territorios
	 WHERE Territorios.Sesion_Key_RTS = @Nro_Sesion

	DELETE FROM Rutas
	 WHERE Rutas.Sesion_Key_RTS = @Nro_Sesion

	DELETE FROM Paradas
	 WHERE Paradas.Sesion_Key_RTS = @Nro_Sesion

END