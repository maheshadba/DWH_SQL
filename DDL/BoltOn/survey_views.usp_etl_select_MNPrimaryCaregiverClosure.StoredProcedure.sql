USE [dwh_test]
GO
/****** Object:  StoredProcedure [survey_views].[usp_etl_select_MNPrimaryCaregiverClosure]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [survey_views].[usp_etl_select_MNPrimaryCaregiverClosure]  
(
 @p_export_profile_id int,
  @p_entity_filter char(5)=null,
  @p_etl_session_token varchar(50)=null
)
as
begin


set nocount on;
declare		@_rec_count int;
declare		@_my_name varchar(256);
set			@_my_name = OBJECT_NAME(@@PROCID);


declare  @_hash_profile   char(10);


set   @_hash_profile   = (select top 1 isnull('SA',hash_policy) from survey_views.f_get_survey_etl_work() where ExportProfileID=@p_export_profile_id);

begin transaction


	select 

	vbase. SurveyResponseID,
	vbase.ElementsProcessed,
	vbase.SurveyID,
	--vbase.Master_SurveyID,
	vbase.SurveyDate,
	vbase.AuditDate,
	vbase.CL_EN_GEN_ID,
	vbase.SiteID,
	vbase.ProgramID,
	vbase.IA_StaffID,
	vbase.ClientID,
	vbase.RespondentID,
	--vbase.DW_AuditDate,
	--vbase.DataSource,
	vbase.MN_CPA_FILE,
	vbase.MN_CPA_FIRST_TIME,
	vbase.MN_CPA_SUBSTANTIATED,
	vbase.MN_SITE,
	vbase.CLIENT_0_ID_NSO,
	vbase.CLIENT_PERSONAL_0_NAME_FIRST,
	vbase.CLIENT_PERSONAL_0_NAME_LAST,
	vbase.INFANT_0_ID_NSO,
	vbase.INFANT_PERSONAL_0_NAME_FIRST,
	vbase.MN_INFANT_0_ID_2,
	--vbase.MN_TEAM_NAME,
	vbase.MN_DATA_STAFF_PERSONAL_0_NAME,
	vbase.NURSE_PERSONAL_0_NAME

	from survey_views.f_select_MN_Primary_Caregiver_Closure(@_hash_profile,@p_export_profile_id) vbase


		if @p_etl_session_token is not null
		begin

			declare @_completed datetime=getdate();
		
			insert into survey_views.survey_export_sessions (session_token, extract_procedure, number_of_records, time_completed, survey_name, file_name, export_profile_id, profile_name, site_id, agency_name)
			select 
			@p_etl_session_token,
			@_my_name,
			count(responses.SurveyResponseID) as [Count],
			@_completed,
			'MN_Primary_Caregiver_Closure',
			'MN_Primary_Caregiver_Closure.txt',
			ep.ExportProfileID,
			ep.ProfileName,
			ee.SiteID,
			ee.AgencyName

			from survey_views.ExportEntities ee 
			 inner join survey_views.f_select_MN_Primary_Caregiver_Closure(@_hash_profile,@p_export_profile_id) responses 
														on responses.SiteID=ee.SiteID
			 inner join survey_views.ExportProfile ep	on ee.ExportProfileID=ep.ExportProfileID
			where
				ee.ExportProfileID=@p_export_profile_id
			group by
			ep.ExportProfileID,
			ep.ProfileName,
			ee.AgencyName,
			ee.SiteID;


		end


commit transaction;
 
end;


GO
