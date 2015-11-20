USE [GesRTS]
GO

/****** Object:  StoredProcedure [dbo].[p_ValidaInsertaModulo]    Script Date: 12-11-2015 14:33:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[p_ValidaInsertaModulo]
(
@Modulo VARCHAR(15),
@Descripción VARCHAR(30),
@Estado VARCHAR(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS 
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM Modulos WHERE Modulo=@Modulo) > 0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
	INSERT INTO [Modulos] ([Modulo], [Descripción], [Estado]) VALUES (@Modulo, @Descripción, @Estado)
END
GO

