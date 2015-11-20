USE [GesRTS]
GO

/****** Object:  StoredProcedure [dbo].[p_ValidaInsertaUsuario]    Script Date: 12-11-2015 14:32:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[p_ValidaInsertaUsuario]
(
@Usuario VARCHAR(50),
@Nombre VARCHAR(30),
@eMail VARCHAR(40),
@Pass VARCHAR(10),
@Fecha_Creación VARCHAR(20),
@Estado VARCHAR(10),
@UsuarioAD VARCHAR(50),
@DominioAD VARCHAR(20),
@Perfil VARCHAR(15),
@Expiracion VARCHAR(20),
@Done BIT,
@Msg VARCHAR(200)
)
AS 
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM Usuarios WHERE Usuario=@Usuario) > 0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [Usuarios] ([Usuario], [Nombre], [eMail], [Pass], [Fecha Creación],[UsuarioAD],[DominioAD],[Perfil],[Expiracion], [Estado]) VALUES (@Usuario, @Nombre, @eMail, @Pass, @Fecha_Creación,@UsuarioAD,@DominioAD,@Perfil,@Expiracion, @Estado)
END

GO

