USE [dwh_test]
GO
/****** Object:  View [survey_views].[Home_Visit_Encounter]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [survey_views].[Home_Visit_Encounter] as select * from survey_views.f_select_Home_Visit_Encounter(null,null)
GO
