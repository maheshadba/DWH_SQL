USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [survey_views].[usp_select_Record_of_Team_Meetings_and_Case_Conferences] as  begin  select * from survey_views.Record_of_Team_Meetings_and_Case_Conferences end 
GO
