USE GesRTS
GO

/****** Object:  StoredProcedure dbo.p_ValidaInsertaRegion    Script Date: 12-11-2015 14:33:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROC dbo.p_ValidaInsertaRegion
(
@Region_ID nvarchar(9),
@Descripción varchar(30),
@Dirección varchar(50),
@Ciudad varchar(30),
@Jefe_Zonal varchar(50),
@Region_Chile varchar(2),
@Region_RTS varchar(2),
@Estado varchar(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS 
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM Regiones WHERE Region_ID=@Region_ID) > 0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
	INSERT INTO Regiones (Region_ID, Descripción, Dirección, Ciudad, Jefe_Zonal, Region_Chile, Region_RTS, Estado)
                      VALUES (@Region_ID, @Descripción, @Dirección, @Ciudad, @Jefe_Zonal, @Region_Chile, @Region_RTS, @Estado)
END

GO

