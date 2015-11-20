USE [GesRTS]
GO

/****** Object:  View [dbo].[V_SesionesTP]    Script Date: 12-11-2015 13:50:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[V_SesionesTP]
AS
SELECT [PKEY]
      ,[REGION_ID]
      ,[TYPE]
      ,[DESCRIPTION]
      ,[SCENARIO]
      ,[SESSION_DATE]
      ,[USER_MODIFIED]
      ,[DATE_MODIFIED]
  FROM S_RS_SESSION
 WHERE TYPE = 1


GO

