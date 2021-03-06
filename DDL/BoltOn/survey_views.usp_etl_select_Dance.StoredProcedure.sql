USE [dwh_test]
GO
/****** Object:  StoredProcedure [survey_views].[usp_etl_select_Dance]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [survey_views].[usp_etl_select_Dance]  
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
vbase.CLIENT_CAC_NA,
vbase.CLIENT_CI_NA,
vbase.CLIENT_EPA_NA,
vbase.CLIENT_NCCO_NA,
vbase.CLIENT_NI_NA,
vbase.CLIENT_NT_NA,
vbase.CLIENT_NVC_NA,
vbase.CLIENT_PC_NA,
vbase.CLIENT_PO_NA,
vbase.CLIENT_PRA_NA,
vbase.CLIENT_RP_NA,
vbase.CLIENT_SCA_NA,
vbase.CLIENT_SE_NA,
vbase.CLIENT_VE_NA,
vbase.CLIENT_VEC_NA,
vbase.CLIENT_VISIT_VARIABLES,
vbase.CLIENT_LS_NA,
vbase.CLIENT_RD_NA,
vbase.CLIENT_VQ_NA,
vbase.CLIENT_0_ID_NSO,
vbase.CLIENT_PERSONAL_0_NAME_FIRST,
vbase.CLIENT_PERSONAL_0_NAME_LAST,
vbase.CLIENT_CAC_COMMENTS,
vbase.CLIENT_CI_COMMENTS,
vbase.CLIENT_EPA_COMMENTS,
vbase.CLIENT_LS_COMMENTS,
vbase.CLIENT_NCCO_COMMENTS,
vbase.CLIENT_NI_COMMENTS,
vbase.CLIENT_NT_COMMENTS,
vbase.CLIENT_NVC_COMMENTS,
vbase.CLIENT_PC_COMMENTS,
vbase.CLIENT_PO_COMMENTS,
vbase.CLIENT_PRA_COMMENTS,
vbase.CLIENT_RD_COMMENTS,
vbase.CLIENT_RP_COMMENTS,
vbase.CLIENT_SCA_COMMENTS,
vbase.CLIENT_SE_COMMENTS,
vbase.CLIENT_VE_COMMENTS,
vbase.CLIENT_VEC_COMMENTS,
vbase.CLIENT_VQ_COMMENTS,
vbase.CLIENT_ACTIVITY_DURATION,
vbase.CLIENT_CAC_PER,
vbase.CLIENT_CHILD_AGE,
vbase.CLIENT_CHILD_DURATION,
vbase.CLIENT_CI_PER,
vbase.CLIENT_EPA_PER,
vbase.CLIENT_LS_PER,
vbase.CLIENT_NCCO_PER,
vbase.CLIENT_NI_PER,
vbase.CLIENT_NT_PER,
vbase.CLIENT_NVC_PER,
vbase.CLIENT_PC_PER,
vbase.CLIENT_PO_PER,
vbase.CLIENT_PRA_PER,
vbase.CLIENT_RD_PER,
vbase.CLIENT_RP_PER,
vbase.CLIENT_SCA_PER,
vbase.CLIENT_SE_PER,
vbase.CLIENT_VE_PER,
vbase.CLIENT_VEC_PER,
vbase.CLIENT_VQ_PER,
vbase.NURSE_PERSONAL_0_NAME

from survey_views.f_select_DANCE_Coding_Sheet(@_hash_profile,@p_export_profile_id) vbase

		if @p_etl_session_token is not null
			begin

			declare @_completed datetime=getdate();
		
			insert into survey_views.survey_export_sessions (session_token, extract_procedure, number_of_records, time_completed, survey_name, file_name, export_profile_id, profile_name, site_id, agency_name)
			select 
			@p_etl_session_token,
			@_my_name,
			count(responses.SurveyResponseID) as [Count],
			@_completed,
			'DANCE_survey',
			'Dance.txt',
			ep.ExportProfileID,
			ep.ProfileName,
			ee.SiteID,
			ee.AgencyName

			from survey_views.ExportEntities ee 
			 inner join survey_views.f_select_DANCE_Coding_Sheet(@_hash_profile,@p_export_profile_id) responses 
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
