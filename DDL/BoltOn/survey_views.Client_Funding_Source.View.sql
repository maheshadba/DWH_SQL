USE [dwh_test]
GO
/****** Object:  View [survey_views].[Client_Funding_Source]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [survey_views].[Client_Funding_Source] as select * from survey_views.f_select_Client_Funding_Source(null,null)
GO
