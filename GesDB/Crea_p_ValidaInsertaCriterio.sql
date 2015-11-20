USE [GesRTS]
GO

/****** Object:  StoredProcedure [dbo].[p_ValidaInsertaCriterio]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[p_ValidaInsertaCriterio]
(
@Criterio_ID VARCHAR(30),
@Fecha_Desde datetime,
@Inicio_Nombre VARCHAR(20),
@Region NVARCHAR(9),
@Supervisor VARCHAR(10),
@Estado VARCHAR(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS 
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM Criterios WHERE Criterio_ID = @Criterio_ID) > 0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Criterio ya existe'
		RETURN;
	END
INSERT INTO [Criterios] ([Criterio_ID], [Fecha_Desde], [Inicio_Nombre], [Region], [Supervisor], [Estado]) 
                 VALUES (@Criterio_ID,  @Fecha_Desde,  @Inicio_Nombre,  @Region,  @Supervisor,  @Estado)
END

GO

