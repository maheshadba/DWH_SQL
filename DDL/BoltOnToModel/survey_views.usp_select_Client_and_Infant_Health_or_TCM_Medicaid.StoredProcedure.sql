USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [survey_views].[usp_select_Client_and_Infant_Health_or_TCM_Medicaid] as  begin  select * from survey_views.Client_and_Infant_Health_or_TCM_Medicaid end 
GO
