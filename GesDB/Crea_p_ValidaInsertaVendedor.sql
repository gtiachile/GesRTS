USE [GesRTS]
GO

/****** Object:  StoredProcedure [dbo].[p_ValidaInsertaVendedor]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[p_ValidaInsertaVendedor]
(
@Vendedor_ID VARCHAR(10),
@Vendedor_Tipo VARCHAR(10),
@Vendedor_Nombre VARCHAR(50),
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
	IF (SELECT COUNT(*) FROM Vendedores WHERE Vendedor_ID = @Vendedor_ID) > 0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Vendedor ya existe'
		RETURN;
	END
INSERT INTO [Vendedores] ([Vendedor_ID], [Vendedor_Tipo], [Vendedor_Nombre], [Region], [Supervisor], [Estado]) 
                  VALUES (@Vendedor_ID,  @Vendedor_Tipo,  @Vendedor_Nombre,  @Region,  @Supervisor,  @Estado)
END

GO

