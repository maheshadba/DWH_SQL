USE [dwh_test]
GO
/****** Object:  View [survey_views].[TEST_CASE_ASSESSMENT]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [survey_views].[TEST_CASE_ASSESSMENT] as select * from survey_views.f_select_TEST_CASE_ASSESSMENT(null,null)
GO
