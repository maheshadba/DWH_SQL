USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [survey_views].[usp_select_WA_MIECHV_Supplemental_HVEF] as  begin  select * from survey_views.WA_MIECHV_Supplemental_HVEF end 
GO
