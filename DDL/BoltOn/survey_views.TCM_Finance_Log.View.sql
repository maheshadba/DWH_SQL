USE [dwh_test]
GO
/****** Object:  View [survey_views].[TCM_Finance_Log]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [survey_views].[TCM_Finance_Log] as select * from survey_views.f_select_TCM_Finance_Log(null,null)
GO
