USE [dwh_test]
GO
/****** Object:  View [survey_views].[Use_Of_Government_and_Community_Services]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [survey_views].[Use_Of_Government_and_Community_Services] as select * from survey_views.f_select_Use_Of_Government_and_Community_Services(null,null)
GO
