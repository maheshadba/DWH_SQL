USE [dwh_test]
GO
/****** Object:  View [survey_views].[DANCE_Coding_Sheet]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [survey_views].[DANCE_Coding_Sheet] as select * from survey_views.f_select_DANCE_Coding_Sheet(null,null)
GO
