USE [GesRTS]
GO
/****** Object:  StoredProcedure [dbo].[p_Carga_Sesiones]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==================================================================
-- Author:	A.Ulloa
-- Create date: 17-nov-2015
-- Description:	Carga las tablas de Sesiones, Territorios, Rutas y
--              Paradas en GesRTS, desde las tablas en RTS
-- ==================================================================

CREATE PROC [dbo].[p_Carga_Sesiones]
-- Add the parameters for the stored procedure here
	 @Nro_Sesion		INT
	,@Usuario		NVARCHAR(30)
	,@Fecha_Vigencia	DATETIME
	,@Fecha_Expiracion	DATETIME

AS
BEGIN

	DECLARE @Fecha_Cataloga	DATETIME 
	SET @Fecha_Cataloga = GETDATE()

-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.

	SET NOCOUNT ON;

-- Carga Tabla de Sesiones

	DELETE FROM Sesiones
	 WHERE	Sesiones.Sesion_Key_RTS = @Nro_Sesion
	
	INSERT INTO Sesiones
	SELECT	V_SesionesTP.PKEY, V_SesionesTP.REGION_ID, V_SesionesTP.TYPE, V_SesionesTP.DESCRIPTION, V_SesionesTP.SCENARIO, V_SesionesTP.SESSION_DATE,
		@Fecha_Vigencia AS Fecha_Vigencia, @Fecha_Expiracion AS Fecha_Expiracion, V_SesionesTP.USER_MODIFIED, V_SesionesTP.DATE_MODIFIED,
		@Usuario AS Usuario_Cataloga, @Fecha_Cataloga AS Fecha_Cataloga
	  FROM	V_SesionesTP
	 WHERE	V_SesionesTP.PKEY = @Nro_Sesion

-- Carga Tabla de Territorios

	DELETE FROM Territorios
	 WHERE	Territorios.Sesion_Key_RTS = @Nro_Sesion
	
--	INSERT	INTO Territorios
--	SELECT	V_TerritoriosTP.PKEY, V_SesionesTP.PKEY, V_TerritoriosTP.TERRITORY_NUMBER, V_TerritoriosTP.TERRITORY_ID,
--		V_TerritoriosTP.DESCRIPTION, V_TerritoriosTP.DRIVER1_ID
--	  FROM	V_TerritoriosTP INNER JOIN
--		V_SesionesTP ON V_TerritoriosTP.RN_SESSION_PKEY = V_SesionesTP.PKEY
--	WHERE	V_TerritoriosTP.RN_SESSION_PKEY  =  @Nro_Sesion
--	AND	V_TerritoriosTP.TERRITORY_NUMBER <> 0

	INSERT	INTO Territorios
	SELECT	*
	  FROM	Territorio_Temp
	WHERE	Territorio_Temp.Ses_Key_RTS = @Nro_Sesion

-- Carga Tabla de Rutas

	DELETE FROM Rutas
	WHERE	Rutas.Sesion_Key_RTS = @Nro_Sesion
	
	INSERT	INTO Rutas
	SELECT	V_RutasTP.PKEY, V_RutasTP.RN_SESSION_PKEY, V_RutasTP.TERRITORY_PKEY, V_RutasTP.ROUTE_NUMBER,
		V_RutasTP.ROUTE_ID, V_RutasTP.DESCRIPTION, V_RutasTP.INITIAL_DAY, V_RutasTP.LOCATION_TYPE_ORIGIN, V_RutasTP.LOCATION_ID_ORIGIN
	FROM	V_RutasTP
	WHERE	V_RutasTP.RN_SESSION_PKEY =  @Nro_Sesion
	AND	V_RutasTP.ROUTE_NUMBER    <> 0

-- Carga Tabla de Paradas

	DECLARE @Parada_Key_RTS		INT  
	DECLARE @Sesion_Key_RTS		INT  
	DECLARE @Territory_Key_RTS	INT  
	DECLARE @Ruta_Key_RTS		INT 
	DECLARE @Ubicacion_Region	NVARCHAR(9) 
	DECLARE @Ubicacion_Tipo		NVARCHAR(3) 
	DECLARE @Ubicacion_ID		NVARCHAR(15) 
	DECLARE @Ubicacion_Extension	INT 
	DECLARE @Nro_Secuencia		INT 
	DECLARE @Tipo_Parada		NVARCHAR(3) 
	DECLARE @Hora_Llegada		DATETIME 
	DECLARE @Tiempo_Servicio	INT 
	DECLARE @Tiempo_Viaje		INT 
	DECLARE @Distancia		INT 
	DECLARE @Hora_Apertura		DATETIME 
	DECLARE @Hora_Cierre		DATETIME 
	DECLARE @Ventana1_Apertura	DATETIME 
	DECLARE @Ventana1_Cierre	DATETIME 
	DECLARE @Ventana2_Apertura	DATETIME 
	DECLARE @Ventana2_Cierre	DATETIME

	DECLARE @Nro_Ruta		INT

	DELETE FROM Paradas
	WHERE	Paradas.Sesion_Key_RTS = @Nro_Sesion

	DECLARE DB_cursorA CURSOR FOR  
	SELECT	V_ParadasTP.PKEY, V_ParadasTP.RN_SESSION_PKEY, V_ParadasTP.ROUTE_PKEY, V_ParadasTP.LOCATION_REGION_ID, V_ParadasTP.LOCATION_TYPE,
		V_ParadasTP.LOCATION_ID, V_ParadasTP.LOCATION_EXTENSION_PKEY, V_ParadasTP.SEQUENCE_NUMBER, V_ParadasTP.STOP_TYPE,
		V_ParadasTP.ARRIVAL, V_ParadasTP.SERVICE_TIME, V_ParadasTP.TRAVEL_TIME, V_ParadasTP.DISTANCE,V_ParadasTP.OPEN_TIME,
		V_ParadasTP.CLOSE_TIME, V_ParadasTP.TW1_OPEN_TIME, V_ParadasTP.TW1_CLOSE_TIME, V_ParadasTP.TW2_OPEN_TIME, V_ParadasTP.TW2_CLOSE_TIME		
	FROM	V_ParadasTP
	WHERE	V_ParadasTP.RN_SESSION_PKEY =  @Nro_Sesion
	AND     V_ParadasTP.SEQUENCE_NUMBER <> 0

	OPEN DB_cursorA
  
	FETCH NEXT FROM DB_cursorA INTO @Parada_Key_RTS, @Sesion_Key_RTS, @Ruta_Key_RTS, @Ubicacion_Region, @Ubicacion_Tipo,@Ubicacion_ID, @Ubicacion_Extension,
					@Nro_Secuencia, @Tipo_Parada, @Hora_Llegada,@Tiempo_Servicio, @Tiempo_Viaje, @Distancia, @Hora_Apertura,
					@Hora_Cierre, @Ventana1_Apertura, @Ventana1_Cierre, @Ventana2_Apertura, @Ventana2_Cierre

	WHILE @@FETCH_STATUS = 0   
	BEGIN   
		SELECT	@Territory_Key_RTS = V_RutasTP.TERRITORY_PKEY, @Nro_Ruta = V_RutasTP.ROUTE_NUMBER
		FROM	V_RutasTP
		WHERE	V_RutasTP.PKEY = @Ruta_Key_RTS

		IF (@Nro_Ruta > 0)
		   BEGIN
			INSERT INTO Paradas (Parada_Key_RTS, Sesion_Key_RTS, Territorio_Key_RTS, Ruta_Key_RTS, Ubicacion_Region, Ubicacion_Tipo, Ubicacion_ID,
				Ubicacion_Extension, Nro_Secuencia, Tipo_Parada, Hora_Llegada, Tiempo_Servicio, Tiempo_Viaje,  Distancia, Hora_Apertura,
				Hora_Cierre, Ventana1_Apertura, Ventana1_Cierre, Ventana2_Apertura, Ventana2_Cierre)
			VALUES (@Parada_Key_RTS, @Sesion_Key_RTS, @Territory_Key_RTS, @Ruta_Key_RTS, @Ubicacion_Region, @Ubicacion_Tipo, @Ubicacion_ID,
				@Ubicacion_Extension, @Nro_Secuencia, @Tipo_Parada, @Hora_Llegada, @Tiempo_Servicio, @Tiempo_Viaje, @Distancia,@Hora_Apertura,
				@Hora_Cierre, @Ventana1_Apertura, @Ventana1_Cierre, @Ventana2_Apertura, @Ventana2_Cierre)
		   END

		FETCH NEXT FROM DB_cursorA INTO @Parada_Key_RTS, @Sesion_Key_RTS, @Ruta_Key_RTS, @Ubicacion_Region, @Ubicacion_Tipo,@Ubicacion_ID, @Ubicacion_Extension,
					@Nro_Secuencia, @Tipo_Parada, @Hora_Llegada,@Tiempo_Servicio, @Tiempo_Viaje, @Distancia, @Hora_Apertura,
					@Hora_Cierre, @Ventana1_Apertura, @Ventana1_Cierre, @Ventana2_Apertura, @Ventana2_Cierre
	END   

	CLOSE DB_cursorA   
	DEALLOCATE DB_cursorA

-- Borra tablas Temporales de Sesión y Territorios

	DELETE FROM Sesion_Temp
	 WHERE Sesion_Temp.Ses_Key_RTS = @Nro_Sesion

	DELETE FROM Territorio_Temp
	 WHERE Territorio_Temp.Ses_Key_RTS = @Nro_Sesion

-- Graba tabla de Auditoría

	DECLARE @Region_ID  	VARCHAR(9)
	DECLARE @Descr_Sesion	VARCHAR(50)
	DECLARE @Fecha_Accion	DATETIME
 
	SET @Fecha_Accion = GETDATE()

	SELECT	@Region_ID = V_SesionesTP.REGION_ID, @Descr_Sesion = V_SesionesTP.DESCRIPTION
	  FROM	V_SesionesTP
	 WHERE	V_SesionesTP.PKEY = @Nro_Sesion

	INSERT INTO Audita (Fecha_Hora_Evento, Opcion_ID, Usuario, Region, Accion) 
                    VALUES (@Fecha_Accion, 'Cataloga', @Usuario, @Region_ID, CONCAT('Cataloga sesión ', @Nro_Sesion, ' - ', @Descr_Sesion))

END