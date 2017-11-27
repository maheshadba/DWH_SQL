USE [dwh_test]
GO
/****** Object:  StoredProcedure [survey_views].[usp_etl_update_session_export_detail]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [survey_views].[usp_etl_update_session_export_detail]
(
	@p_session_token varchar(50),
	@p_export_profile_id int,
	@p_procedure_name varchar(256),
	@p_survey_name varchar(256),
	@p_num_of_records int
)
as
begin
set nocount on;


insert into survey_views.survey_export_sessions (session_token, extract_procedure, number_of_records, time_completed, survey_name)
values
(@p_session_token,@p_procedure_name,@p_num_of_records,getdate(),@p_survey_name);
	


end
GO
