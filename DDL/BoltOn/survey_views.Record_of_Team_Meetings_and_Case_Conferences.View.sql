USE [dwh_test]
GO
/****** Object:  View [survey_views].[Record_of_Team_Meetings_and_Case_Conferences]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [survey_views].[Record_of_Team_Meetings_and_Case_Conferences] as select * from survey_views.f_select_Record_of_Team_Meetings_and_Case_Conferences(null,null)
GO
