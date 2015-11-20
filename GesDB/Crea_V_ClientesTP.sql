USE [GesRTS]
GO

/****** Object:  View [dbo].[V_ClientesTP]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[V_ClientesTP]
AS
SELECT 
	 [REGION_ID]  
	,[TYPE]  
	,[ID]
	,[ADDR_LINE1] 
        ,[REGION1] AS COMUNA
        ,[REGION2] AS CIUDAD
        ,[REGION3] AS REGION
	,[COUNTRY]
	,[LONGITUDE]
	,[LATITUDE]
	,[DELIVERY_DAYS] 
	,[USER_FIELD1] 
	,[USER_FIELD2] 
	,[USER_FIELD3] 
	,[DATE_ADDED]
	,[DESCRIPTION]
	,[LOCQUALITY]
	,[USER_MODIFIED]
	,[DATE_MODIFIED]
  FROM S_TS_LOCATION


GO
