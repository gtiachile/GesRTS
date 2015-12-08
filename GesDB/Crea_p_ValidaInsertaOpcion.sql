USE [GesRTS]
GO

/****** Object:  StoredProcedure [dbo].[p_ValidaInsertaOpcion]    Script Date: 12-11-2015 14:33:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[p_ValidaInsertaOpcion]
(
@Opcion VARCHAR(20),
@Descripción VARCHAR(30),
@Modulo VARCHAR(15),
@Estado VARCHAR(10),
@Tipo VARCHAR(10),
@Url VARCHAR(100),
@Txt VARCHAR(20),
@Audita VARCHAR(2),
@Done BIT,
@Msg VARCHAR(200)
)
AS 
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM Opciones WHERE Opcion=@Opcion) > 0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
	INSERT INTO [Opciones] ([Opcion], [Descripción], [Modulo], [Estado],[Tipo], [Url], [Txt], [Audita])
                        VALUES (@Opcion, @Descripción, @Modulo, @Estado, @Tipo, @Url, @Txt, @Audita)
END

GO

