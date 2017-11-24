create procedure [survey_views].usp_etl_select_ Tribal  
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
vbase.DW_AuditDate,
vbase.CLIENT_TRIBAL_0_PARITY,
vbase.CLIENT_PERSONAL_0_NAME_FIRST,
vbase.CLIENT_PERSONAL_0_NAME_LAST,
vbase.CLIENT_PERSONAL_0_DOB_INTAKE,
vbase.NURSE_PERSONAL_0_NAME,
vbase.DataSource,
vbase.CLIENT_TRIBAL_CHILD_1_LIVING,
vbase.CLIENT_TRIBAL_CHILD_10_LIVING,
vbase.CLIENT_TRIBAL_CHILD_2_LIVING,
vbase.CLIENT_TRIBAL_CHILD_3_LIVING,
vbase.CLIENT_TRIBAL_CHILD_4_LIVING,
vbase.CLIENT_TRIBAL_CHILD_5_LIVING,
vbase.CLIENT_TRIBAL_CHILD_6_LIVING,
vbase.CLIENT_TRIBAL_CHILD_7_LIVING,
vbase.CLIENT_TRIBAL_CHILD_8_LIVING,
vbase.CLIENT_TRIBAL_CHILD_9_LIVING,
vbase.CLIENT_TRIBAL_CHILD_1_DOB,
vbase.CLIENT_TRIBAL_CHILD_10_DOB,
vbase.CLIENT_TRIBAL_CHILD_2_DOB,
vbase.CLIENT_TRIBAL_CHILD_3_DOB,
vbase.CLIENT_TRIBAL_CHILD_4_DOB,
vbase.CLIENT_TRIBAL_CHILD_5_DOB,
vbase.CLIENT_TRIBAL_CHILD_6_DOB,
vbase.CLIENT_TRIBAL_CHILD_7_DOB,
vbase.CLIENT_TRIBAL_CHILD_8_DOB,
vbase.CLIENT_TRIBAL_CHILD_9_DOB,
vbase.Master_SurveyID,

from survey_views.f_select_ Tribal (@_hash_profile,@p_export_profile_id) vbase
where
vbase.CL_EN_GEN_ID in (select * from survey_views.f_list_client_inclusions(vbase.ProgramID, vbase.SiteID,vbase.CL_EN_GEN_ID,@p_entity_filter))
and
vbase.CL_EN_GEN_ID not in (select * from survey_views.f_list_client_exclusions(vbase.ProgramID, vbase.SiteID,vbase.CL_EN_GEN_ID,@p_entity_filter))

 
end;


