USE [dwh_test]
GO
/****** Object:  StoredProcedure [survey_views].[usp_etl_get_session_export_detail]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [survey_views].[usp_etl_get_session_export_detail]
(
	@p_session_token varchar(50)
)
as
begin
set nocount on;


 select * from survey_views.survey_export_sessions es where es.session_token=@p_session_token;


end
GO
