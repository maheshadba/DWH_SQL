USE [dwh_test]
GO
/****** Object:  View [survey_views].[Edinburgh_Postnatal_Depression_Scale]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [survey_views].[Edinburgh_Postnatal_Depression_Scale] as select * from survey_views.f_select_Edinburgh_Postnatal_Depression_Scale(null,null)
GO
