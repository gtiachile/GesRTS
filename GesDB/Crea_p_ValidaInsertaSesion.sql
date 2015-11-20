USE [GesRTS]
GO

/****** Object:  StoredProcedure dbo.p_ValidaInsertaSesion  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROC dbo.p_ValidaInsertaSesion
(
@Sesion_Key_RTS int,
@Region_ID nvarchar (9),
@Tipo int,
@Descripcion nvarchar (50),
@Escenario nvarchar (15),
@Fecha_Creacion datetime,
@Fecha_Vigencia datetime,
@Fecha_Expiracion datetime,
@Usuario_Modificacion nvarchar(12),
@Fecha_Modificacion datetime,
@Usuario_Catalogacion nvarchar(12),
@Fecha_Catalogacion datetime,
@Done BIT,
@Msg VARCHAR(200)
)
AS 
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM Sesiones WHERE Sesion_Key_RTS = @Sesion_Key_RTS) > 0
	OR (SELECT COUNT(*) FROM Sesiones WHERE Descripcion    = @Descripcion)    > 0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Sesión ya existe'
		RETURN;
	END
	INSERT INTO Sesiones (Sesion_Key_RTS,  Region_ID,  Tipo,  Descripcion,  Escenario,  Fecha_Creacion,  Fecha_Vigencia,  Fecha_Expiracion,  Usuario_Modificacion,  Fecha_Modificacion,  Usuario_Catalogacion,  Fecha_Catalogacion) 
                     VALUES (@Sesion_Key_RTS, @Region_ID, @Tipo, @Descripcion, @Escenario, @Fecha_Creacion, @Fecha_Vigencia, @Fecha_Expiracion, @Usuario_Modificacion, @Fecha_Modificacion, @Usuario_Catalogacion, @Fecha_Catalogacion) 
END

GO
