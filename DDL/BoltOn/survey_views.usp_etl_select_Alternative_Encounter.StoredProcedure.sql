USE [dwh_test]
GO
/****** Object:  StoredProcedure [survey_views].[usp_etl_select_Alternative_Encounter]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [survey_views].[usp_etl_select_Alternative_Encounter]  
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
	vbase.SurveyDate,
	vbase.AuditDate,
	vbase.CL_EN_GEN_ID,
	vbase.SiteID,
	vbase.ProgramID,
	vbase.IA_StaffID,
	vbase.ClientID,
	vbase.RespondentID,
	vbase.CLIENT_0_ID_NSO,
	vbase.CLIENT_PERSONAL_0_NAME_FIRST,
	vbase.CLIENT_PERSONAL_0_NAME_LAST,
	vbase.CLIENT_PERSONAL_0_DOB_INTAKE,
	vbase.CLIENT_TIME_0_START_ALT,
	vbase.CLIENT_TIME_1_END_ALT,
	vbase.NURSE_PERSONAL_0_NAME,
	vbase.CLIENT_TALKED_0_WITH_ALT,
	vbase.CLIENT_TALKED_1_WITH_OTHER_ALT,
	vbase.CLIENT_ALTERNATIVE_ENCOUNTER_0_TYPE_ALT,
	vbase.CLIENT_ALTERNATIVE_ENCOUNTER_1_TYPE_OTHER_ALT,
	vbase.CLIENT_DOMAIN_0_PERSONAL_HLTH_ALT,
	vbase.CLIENT_DOMAIN_0_ENVIRONHLTH_ALT,
	vbase.CLIENT_DOMAIN_0_LIFECOURSE_ALT,
	vbase.CLIENT_DOMAIN_0_MATERNAL_ALT,
	vbase.CLIENT_DOMAIN_0_FRNDFAM_ALT,
	vbase.CLIENT_DOMAIN_0_TOTAL_ALT,
	vbase.CLIENT_ALT_0_COMMENTS_ALT,
	vbase.CLIENT_TIME_1_DURATION_ALT,
	vbase.CLIENT_0_ID_AGENCY,
	--vbase.DW_AuditDate,
	vbase.DataSource,
	vbase.CLIENT_NO_REFERRAL,
	vbase.CLIENT_SCREENED_SRVCS,
	--vbase.CLIENT_VISIT_SCHEDULE,
	--vbase.Master_SurveyID,
	vbase.CLIENT_TIME_FROM_AMPM_ALT,
	vbase.CLIENT_TIME_FROM_HR_ALT,
	vbase.CLIENT_TIME_FROM_MIN_ALT,
	vbase.CLIENT_TIME_TO_AMPM_ALT,
	vbase.CLIENT_TIME_TO_HR_ALT,
	vbase.CLIENT_TIME_TO_MIN_ALT

	from survey_views.f_select_Alternative_Encounter(@_hash_profile,@p_export_profile_id) vbase

		if @p_etl_session_token is not null
		begin

			declare @_completed datetime=getdate();
		
			insert into survey_views.survey_export_sessions (session_token, extract_procedure, number_of_records, time_completed, survey_name, file_name, export_profile_id, profile_name, site_id, agency_name)
			select 
			@p_etl_session_token,
			@_my_name,
			count(responses.SurveyResponseID) as [Count],
			@_completed,
			'Alternative_Encounter_Survey',
			'Alternative_Encounter.txt',
			ep.ExportProfileID,
			ep.ProfileName,
			ee.SiteID,
			ee.AgencyName

			from survey_views.ExportEntities ee 
				inner join survey_views.f_select_Alternative_Encounter(@_hash_profile,@p_export_profile_id) responses 
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
