USE [dwh_test]
GO
/****** Object:  View [survey_views].[MN_Primary_Caregiver_Intake]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [survey_views].[MN_Primary_Caregiver_Intake] as select * from survey_views.f_select_MN_Primary_Caregiver_Intake(null,null)
GO
