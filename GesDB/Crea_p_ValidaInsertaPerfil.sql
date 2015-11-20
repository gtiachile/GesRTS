USE [GesRTS]
GO

/****** Object:  StoredProcedure [dbo].[p_ValidaInsertaPerfil]    Script Date: 12-11-2015 14:34:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[p_ValidaInsertaPerfil]
(
@Perfil VARCHAR(15),
@Descripción VARCHAR(30),
@Estado VARCHAR(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS 
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM Perfiles WHERE Perfil=@Perfil) > 0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
	INSERT INTO [Perfiles] ([Perfil], [Descripción], [Estado]) VALUES (@Perfil, @Descripción, @Estado)
END

GO

