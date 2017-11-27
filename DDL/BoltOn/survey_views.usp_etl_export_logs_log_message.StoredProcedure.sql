USE [dwh_test]
GO
/****** Object:  StoredProcedure [survey_views].[usp_etl_export_logs_log_message]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [survey_views].[usp_etl_export_logs_log_message]
(
	@p_export_profile_id int,
	@p_export_profile_name varchar(150),
	@p_message varchar(150)
) as
begin
set nocount on;

insert into survey_views.survey_export_logs (export_profile_id, export_profile_name, process_message)
values(@p_export_profile_id,@p_export_profile_name,@p_message);


end
GO
