USE [dwh_test]
GO
/****** Object:  View [survey_views].[Goodwill_Indy_Additional_Referral_Data]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [survey_views].[Goodwill_Indy_Additional_Referral_Data] as select * from survey_views.f_select_Goodwill_Indy_Additional_Referral_Data(null,null)
GO
