USE [dwh_test]
GO
/****** Object:  View [survey_views].[Infant_Birth]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [survey_views].[Infant_Birth] as select * from survey_views.f_select_Infant_Birth(null,null)
GO
