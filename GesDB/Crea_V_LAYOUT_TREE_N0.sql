USE [GesRTS]
GO

/****** Object:  View [dbo].[V_LAYOUT_TREE_N0]    Script Date: 12-11-2015 13:50:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[V_LAYOUT_TREE_N0]
AS
SELECT [Descripción] as NODE_DESCRIPTION,
	   ROW_NUMBER() OVER(ORDER BY Planta) as NODE_ID,
	   0 UNDER_PARENT,
	   0 LEVEL_DEPTH,
	   [Planta] as Codigo
  FROM [BopDB].[dbo].[Plantas]
  WHERE Estado='Activo'


GO

