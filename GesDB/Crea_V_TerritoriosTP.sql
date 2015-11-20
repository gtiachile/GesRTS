USE [GesRTS]
GO

/****** Object:  View [dbo].[V_TerritoriosTP]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[V_TerritoriosTP]
AS
SELECT 
	 [PKEY]
	,[RN_SESSION_PKEY]
	,[TERRITORY_NUMBER]
	,[TERRITORY_ID]
	,[DESCRIPTION]
	,[DRIVER1_ID]
  FROM S_RS_TERRITORY


GO

