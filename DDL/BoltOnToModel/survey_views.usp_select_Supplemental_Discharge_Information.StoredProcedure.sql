USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [survey_views].[usp_select_Supplemental_Discharge_Information] as  begin  select * from survey_views.Supplemental_Discharge_Information end 
GO
