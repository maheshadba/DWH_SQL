USE [dwh_test]
GO
/****** Object:  UserDefinedFunction [survey_views].[f_get_survey_etl_detail]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [survey_views].[f_get_survey_etl_detail]
(	
	@p_session_token varchar(50)
)
RETURNS TABLE 
AS
RETURN 
(
 select
	st.export_profile_id	as ExportPofileID,
	st.profile_name			as ProfileName,
	st.site_id				as SiteID,
	st.agency_name			as AgencyName,
	st.file_name			as [FileName],
	st.number_of_records	as [RecordCount],
	st.time_completed		as ExportDT

 from survey_views.survey_export_sessions st
 where
 st.session_token=@p_session_token
)
GO
