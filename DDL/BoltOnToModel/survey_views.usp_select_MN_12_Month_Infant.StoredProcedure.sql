USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [survey_views].[usp_select_MN_12_Month_Infant] as  begin  select * from survey_views.MN_12_Month_Infant end 
GO
