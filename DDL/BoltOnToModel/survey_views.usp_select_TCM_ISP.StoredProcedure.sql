USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [survey_views].[usp_select_TCM_ISP] as  begin  select * from survey_views.TCM_ISP end 
GO
