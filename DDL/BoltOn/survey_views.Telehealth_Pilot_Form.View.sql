USE [dwh_test]
GO
/****** Object:  View [survey_views].[Telehealth_Pilot_Form]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [survey_views].[Telehealth_Pilot_Form] as select * from survey_views.f_select_Telehealth_Pilot_Form(null,null)
GO
