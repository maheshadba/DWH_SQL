USE [dwh_test]
GO
/****** Object:  View [survey_views].[MN_18_Months_Toddler]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [survey_views].[MN_18_Months_Toddler] as select * from survey_views.f_select_MN_18_Months_Toddler(null,null)
GO
