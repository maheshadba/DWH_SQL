USE [dwh_test]
GO
/****** Object:  View [survey_views].[Staff_Team_to_Team_Transfer_Request]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [survey_views].[Staff_Team_to_Team_Transfer_Request] as select * from survey_views.f_select_Staff_Team_to_Team_Transfer_Request(null,null)
GO
