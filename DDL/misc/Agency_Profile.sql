create procedure [survey_views].usp_etl_select_Agency_Profile  
(
 @p_export_profile_id int,
  @p_entity_filter char(5)=null
)
as
begin

declare  @_hash_profile   char(10);
set   @_hash_profile   = (select top 1 isnull('SA',hash_policy) from survey_views.f_get_survey_etl_work() where ExportProfileID=@p_export_profile_id);

--print  @p_export_profile_id;
--print  @_hash_profile;


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
--vbase.Entity_ID_Mapped,
vbase.AGENCY_INFO_1_FUNDED_CAPACITY_FTE,
vbase.AGENCY_FUNDING01_0_FUNDER_NAME,
vbase.AGENCY_FUNDING01_1_START_DATE,
vbase.AGENCY_FUNDING01_1_END_DATE,
vbase.AGENCY_FUNDING01_1_AMOUNT,
vbase.AGENCY_FUNDING02_0_FUNDER_NAME,
vbase.AGENCY_FUNDING02_1_START_DATE,
vbase.AGENCY_FUNDING02_1_END_DATE,
vbase.AGENCY_FUNDING02_1_AMOUNT,
vbase.AGENCY_RESEARCH_0_INVOLVEMENT,
vbase.AGENCY_RESEARCH01_1_PI1,
vbase.AGENCY_RESEARCH01_0_PROJECT_NAME,
vbase.AGENCY_RESEARCH01_1_PROJECT_DESCRIPTION,
vbase.AGENCY_RESEARCH01_1_START_DATE,
vbase.AGENCY_RESEARCH01_1_END_DATE,
vbase.AGENCY_RESEARCH01_1_APPROVAL,
vbase.AGENCY_INFO_1_CONTRACT_CAPACITY_FTE,
vbase.AGENCY_INFO_BOARD_0_MEETING_DATE01,
vbase.AGENCY_INFO_BOARD_0_MEETING_DATE02,
vbase.AGENCY_INFO_BOARD_0_MEETING_DATE03,
vbase.AGENCY_INFO_BOARD_0_MEETING_DATE04,
vbase.AGENCY_FUNDING01_1_FUNDER_TYPE,
vbase.AGENCY_FUNDING02_1_FUNDER_TYPE,
vbase.AGENCY_FUNDING02_1_DF_GRANT_TYPE,
vbase.AGENCY_FUNDING03_0_FUNDER_NAME,
vbase.AGENCY_FUNDING04_0_FUNDER_NAME,
vbase.AGENCY_FUNDING05_0_FUNDER_NAME,
vbase.AGENCY_FUNDING06_0_FUNDER_NAME,
vbase.AGENCY_FUNDING07_0_FUNDER_NAME,
vbase.AGENCY_FUNDING08_0_FUNDER_NAME,
vbase.AGENCY_FUNDING10_0_FUNDER_NAME,
vbase.AGENCY_FUNDING11_0_FUNDER_NAME,
vbase.AGENCY_FUNDING12_0_FUNDER_NAME,
vbase.AGENCY_FUNDING13_0_FUNDER_NAME,
vbase.AGENCY_FUNDING14_0_FUNDER_NAME,
vbase.AGENCY_FUNDING15_0_FUNDER_NAME,
vbase.AGENCY_FUNDING16_0_FUNDER_NAME,
vbase.AGENCY_FUNDING17_0_FUNDER_NAME,
vbase.AGENCY_FUNDING09_0_FUNDER_NAME,
vbase.AGENCY_FUNDING18_0_FUNDER_NAME,
vbase.AGENCY_FUNDING19_0_FUNDER_NAME,
vbase.AGENCY_FUNDING20_0_FUNDER_NAME,
vbase.AGENCY_FUNDING03_1_START_DATE,
vbase.AGENCY_FUNDING04_1_START_DATE,
vbase.AGENCY_FUNDING05_1_START_DATE,
vbase.AGENCY_FUNDING06_1_START_DATE,
vbase.AGENCY_FUNDING07_1_START_DATE,
vbase.AGENCY_FUNDING08_1_START_DATE,
vbase.AGENCY_FUNDING09_1_START_DATE,
vbase.AGENCY_FUNDING10_1_START_DATE,
vbase.AGENCY_FUNDING11_1_START_DATE,
vbase.AGENCY_FUNDING12_1_START_DATE,
vbase.AGENCY_FUNDING13_1_START_DATE,
vbase.AGENCY_FUNDING14_1_START_DATE,
vbase.AGENCY_FUNDING15_1_START_DATE,
vbase.AGENCY_FUNDING16_1_START_DATE,
vbase.AGENCY_FUNDING17_1_START_DATE,
vbase.AGENCY_FUNDING18_1_START_DATE,
vbase.AGENCY_FUNDING19_1_START_DATE,
vbase.AGENCY_FUNDING20_1_START_DATE,
vbase.AGENCY_FUNDING03_1_END_DATE,
vbase.AGENCY_FUNDING04_1_END_DATE,
vbase.AGENCY_FUNDING05_1_END_DATE,
vbase.AGENCY_FUNDING06_1_END_DATE,
vbase.AGENCY_FUNDING07_1_END_DATE,
vbase.AGENCY_FUNDING08_1_END_DATE,
vbase.AGENCY_FUNDING09_1_END_DATE,
vbase.AGENCY_FUNDING10_1_END_DATE,
vbase.AGENCY_FUNDING11_1_END_DATE,
vbase.AGENCY_FUNDING12_1_END_DATE,
vbase.AGENCY_FUNDING13_1_END_DATE,
vbase.AGENCY_FUNDING14_1_END_DATE,
vbase.AGENCY_FUNDING15_1_END_DATE,
vbase.AGENCY_FUNDING16_1_END_DATE,
vbase.AGENCY_FUNDING17_1_END_DATE,
vbase.AGENCY_FUNDING18_1_END_DATE,
vbase.AGENCY_FUNDING19_1_END_DATE,
vbase.AGENCY_FUNDING20_1_END_DATE,
vbase.AGENCY_FUNDING03_1_FUNDER_TYPE,
vbase.AGENCY_FUNDING04_1_FUNDER_TYPE,
vbase.AGENCY_FUNDING05_1_FUNDER_TYPE,
vbase.AGENCY_FUNDING06_1_FUNDER_TYPE,
vbase.AGENCY_FUNDING07_1_FUNDER_TYPE,
vbase.AGENCY_FUNDING08_1_FUNDER_TYPE,
vbase.AGENCY_FUNDING09_1_FUNDER_TYPE,
vbase.AGENCY_FUNDING10_1_FUNDER_TYPE,
vbase.AGENCY_FUNDING11_1_FUNDER_TYPE,
vbase.AGENCY_FUNDING12_1_FUNDER_TYPE,
vbase.AGENCY_FUNDING13_1_FUNDER_TYPE,
vbase.AGENCY_FUNDING14_1_FUNDER_TYPE,
vbase.AGENCY_FUNDING15_1_FUNDER_TYPE,
vbase.AGENCY_FUNDING16_1_FUNDER_TYPE,
vbase.AGENCY_FUNDING17_1_FUNDER_TYPE,
vbase.AGENCY_FUNDING18_1_FUNDER_TYPE,
vbase.AGENCY_FUNDING19_1_FUNDER_TYPE,
vbase.AGENCY_FUNDING20_1_FUNDER_TYPE,
vbase.AGENCY_FUNDING03_1_DF_GRANT_TYPE,
vbase.AGENCY_FUNDING04_1_DF_GRANT_TYPE,
vbase.AGENCY_FUNDING05_1_DF_GRANT_TYPE,
vbase.AGENCY_FUNDING06_1_DF_GRANT_TYPE,
vbase.AGENCY_FUNDING07_1_DF_GRANT_TYPE,
vbase.AGENCY_FUNDING08_1_DF_GRANT_TYPE,
vbase.AGENCY_FUNDING09_1_DF_GRANT_TYPE,
vbase.AGENCY_FUNDING10_1_DF_GRANT_TYPE,
vbase.AGENCY_FUNDING11_1_DF_GRANT_TYPE,
vbase.AGENCY_FUNDING12_1_DF_GRANT_TYPE,
vbase.AGENCY_FUNDING13_1_DF_GRANT_TYPE,
vbase.AGENCY_FUNDING14_1_DF_GRANT_TYPE,
vbase.AGENCY_FUNDING15_1_DF_GRANT_TYPE,
vbase.AGENCY_FUNDING16_1_DF_GRANT_TYPE,
vbase.AGENCY_FUNDING17_1_DF_GRANT_TYPE,
vbase.AGENCY_FUNDING18_1_DF_GRANT_TYPE,
vbase.AGENCY_FUNDING19_1_DF_GRANT_TYPE,
vbase.AGENCY_FUNDING20_1_DF_GRANT_TYPE,
vbase.AGENCY_FUNDING03_1_AMOUNT,
vbase.AGENCY_FUNDING04_1_AMOUNT,
vbase.AGENCY_FUNDING05_1_AMOUNT,
vbase.AGENCY_FUNDING06_1_AMOUNT,
vbase.AGENCY_FUNDING07_1_AMOUNT,
vbase.AGENCY_FUNDING08_1_AMOUNT,
vbase.AGENCY_FUNDING09_1_AMOUNT,
vbase.AGENCY_FUNDING10_1_AMOUNT,
vbase.AGENCY_FUNDING11_1_AMOUNT,
vbase.AGENCY_FUNDING12_1_AMOUNT,
vbase.AGENCY_FUNDING13_1_AMOUNT,
vbase.AGENCY_FUNDING14_1_AMOUNT,
vbase.AGENCY_FUNDING15_1_AMOUNT,
vbase.AGENCY_FUNDING16_1_AMOUNT,
vbase.AGENCY_FUNDING17_1_AMOUNT,
vbase.AGENCY_FUNDING18_1_AMOUNT,
vbase.AGENCY_FUNDING19_1_AMOUNT,
vbase.AGENCY_FUNDING20_1_AMOUNT,
--vbase.DW_AuditDate,
--vbase.DataSource,
vbase.AGENCY_FUNDING01_1_DF_GRANT_TYPE,
--vbase.Master_SurveyID,
vbase.AGENCY_FUNDING01_MEDICAID_TYPE,
vbase.AGENCY_FUNDING02_MEDICAID_TYPE,
vbase.AGENCY_FUNDING03_MEDICAID_TYPE,
vbase.AGENCY_FUNDING04_MEDICAID_TYPE,
vbase.AGENCY_FUNDING05_MEDICAID_TYPE,
vbase.AGENCY_FUNDING06_MEDICAID_TYPE,
vbase.AGENCY_FUNDING07_MEDICAID_TYPE,
vbase.AGENCY_FUNDING08_MEDICAID_TYPE,
vbase.AGENCY_FUNDING09_MEDICAID_TYPE,
vbase.AGENCY_FUNDING10_MEDICAID_TYPE,
vbase.AGENCY_FUNDING11_MEDICAID_TYPE,
vbase.AGENCY_FUNDING12_MEDICAID_TYPE,
vbase.AGENCY_FUNDING13_MEDICAID_TYPE,
vbase.AGENCY_FUNDING14_MEDICAID_TYPE,
vbase.AGENCY_FUNDING15_MEDICAID_TYPE,
vbase.AGENCY_FUNDING16_MEDICAID_TYPE,
vbase.AGENCY_FUNDING17_MEDICAID_TYPE,
vbase.AGENCY_FUNDING18_MEDICAID_TYPE,
vbase.AGENCY_FUNDING19_MEDICAID_TYPE,
vbase.AGENCY_FUNDING20_MEDICAID_TYPE

from survey_views.f_select_Agency_Profile_Update(@_hash_profile,@p_export_profile_id) vbase
where
vbase.CL_EN_GEN_ID in (select * from survey_views.f_list_client_inclusions(vbase.ProgramID, vbase.SiteID,vbase.CL_EN_GEN_ID,@p_entity_filter))
and
vbase.CL_EN_GEN_ID not in (select * from survey_views.f_list_client_exclusions(vbase.ProgramID, vbase.SiteID,vbase.CL_EN_GEN_ID,@p_entity_filter))

 
end;

