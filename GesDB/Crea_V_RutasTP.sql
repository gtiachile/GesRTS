﻿USE [GesRTS]
GO

/****** Object:  View [dbo].[V_RutasTP]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[V_RutasTP]
AS
SELECT 
	 [PKEY]
	,[RN_SESSION_PKEY]
	,[TERRITORY_PKEY]
	,[ROUTE_NUMBER]
	,[ROUTE_ID]
	,[DESCRIPTION]
	,[DAY] AS [INITIAL_DAY]
	,[LOCATION_TYPE_ORIGIN]
	,[LOCATION_ID_ORIGIN]
  FROM S_RS_ROUTE


GO
