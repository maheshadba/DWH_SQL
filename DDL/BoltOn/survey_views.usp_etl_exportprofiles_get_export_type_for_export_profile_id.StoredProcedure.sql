USE [dwh_test]
GO
/****** Object:  StoredProcedure [survey_views].[usp_etl_exportprofiles_get_export_type_for_export_profile_id]    Script Date: 11/27/2017 1:27:29 PM ******/
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
