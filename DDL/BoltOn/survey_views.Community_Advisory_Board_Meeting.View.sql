USE [dwh_test]
GO
/****** Object:  View [survey_views].[Community_Advisory_Board_Meeting]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [survey_views].[Community_Advisory_Board_Meeting] as select * from survey_views.f_select_Community_Advisory_Board_Meeting(null,null)
GO
