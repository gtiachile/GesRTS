USE [GesRTS]
GO

/****** Object:  StoredProcedure [dbo].[p_ValidaInsertaCCOSTO]    Script Date: 12-11-2015 14:34:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[p_ValidaInsertaCCOSTO]
(
@CCosto      varchar(10),
@Descripción varchar(30),
@Responsable varchar(30),
@Estado      varchar(10),
@Done BIT,
@Msg VARCHAR(200)
)
AS
BEGIN
	SET @Done = 1
	SET @Msg = ''
	IF (SELECT COUNT(*) FROM CENTROSCOSTO WHERE Ccosto = @CCosto)>0
	BEGIN
		SET @Done = 0
		SET @Msg = 'Registro ya existe'
		RETURN;
	END
INSERT INTO [CentrosCosto] ([CCosto], [Descripción], [Responsable], [Estado]) VALUES (@CCosto, @Descripción, @Responsable, @Estado)
END


GO

