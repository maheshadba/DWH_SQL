USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [survey_views].[usp_select_TCM_Finance_Log] as  begin  select * from survey_views.TCM_Finance_Log end 
GO
