USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [survey_views].[usp_etl_exportprofiles_get_export_type_for_export_profile_id]
(
	@p_export_profile_id int = null
)
as
begin
set nocount on;

select
ExportTypeID 
from survey_views.ExportProfile 
where ExportProfileID = @p_export_profile_id;

end;
GO
