USE [dwh_test]
GO
/****** Object:  View [survey_views].[TX_THV_Supplemental_Data_Form]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [survey_views].[TX_THV_Supplemental_Data_Form] as select * from survey_views.f_select_TX_THV_Supplemental_Data_Form(null,null)
GO
