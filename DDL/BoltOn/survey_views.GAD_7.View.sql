USE [dwh_test]
GO
/****** Object:  View [survey_views].[GAD_7]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [survey_views].[GAD_7] as select * from survey_views.f_select_GAD_7(null,null)
GO
