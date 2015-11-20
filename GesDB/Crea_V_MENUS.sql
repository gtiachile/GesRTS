USE [GesRTS]
GO

/****** Object:  View [dbo].[V_MENUS]    Script Date: 12-11-2015 13:49:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE view [dbo].[V_MENUS] as
SELECT        Perfil, CAST(Posicion AS nchar(1)) AS MenuID, Modulo AS MenuName, 0 AS ParentID, NULL AS MenuLocation, Modulo AS Text, NULL AS NavigateUrl
FROM            Menu_N0
union
SELECT        Menu_N1.Perfil, CAST(CAST(Menu_N0.Posicion AS nchar(1)) + CAST(Menu_N1.Posicion AS nchar(1)) AS int) AS MenuId, Menu_N1.Opcion AS MenuName, CAST(Menu_N0.Posicion AS int) AS ParentID, NULL 
                         AS MenuLocation, Opciones.Descripción AS Text, '~' + Opciones.url AS NavigateUrl
FROM            Menu_N1 
                  INNER JOIN Menu_N0 ON Menu_N1.Perfil = Menu_N0.Perfil AND Menu_N1.Modulo = Menu_N0.Modulo
                  INNER JOIN Opciones ON Menu_N1.Opcion = Opciones.Opcion
union
SELECT        Menu_N2.Perfil, CAST(CAST(Menu_N0.Posicion AS nchar(1)) + CAST(Menu_N1.Posicion AS nchar(1)) + CAST(Menu_N2.Posicion AS nchar(1)) AS int) AS MenuID, Menu_N2.Opcion2 AS MenuName,
                          CAST(CAST(Menu_N0.Posicion AS nchar(1)) + CAST(Menu_N1.Posicion AS nchar(1)) AS int) AS ParentID, NULL AS MenuLocation, Opciones.Descripción AS Text, '~'+ Opciones.url AS NavigateUrl
FROM            Menu_N2 
                  INNER JOIN Menu_N1  ON Menu_N2.Perfil  = Menu_N1.Perfil  AND Menu_N2.Modulo = Menu_N1.Modulo AND Menu_N2.Opcion1 = Menu_N1.Opcion 
                  INNER JOIN Menu_N0  ON Menu_N1.Perfil  = Menu_N0.Perfil  AND Menu_N1.Modulo = Menu_N0.Modulo 
                  INNER JOIN Opciones ON Menu_N2.Opcion2 = Opciones.Opcion AND Menu_N2.Modulo = Opciones.Modulo






GO

