USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [survey_views].[usp_select_Alternative_Encounter]
	@p_Encrypt			bit = 1,
	@p_Profile_Id		int = null,
	@p_exclude_tribal	bit	= 0
as 
begin  

set nocount on;

select 
s.[SurveyResponseID]
      ,s.[ElementsProcessed]
      ,s.[SurveyID]
      ,s.[SurveyDate]
      ,s.[AuditDate]
      ,survey_views.f_hash_field(@p_Encrypt,s.[CL_EN_GEN_ID]) as [CL_EN_GEN_ID] -- col name
      ,s.[SiteID]
      ,s.[ProgramID]
      ,s.[IA_StaffID]
      ,survey_views.f_hash_field(@p_Encrypt,s.[ClientID]) as [ClientID]
      ,s.[RespondentID]
      ,survey_views.f_hash_field(@p_Encrypt,s.[CLIENT_0_ID_NSO]) as [CLIENT_0_ID_NSO]
       ,survey_views.f_hash_field(@p_Encrypt,s.[CLIENT_PERSONAL_0_NAME_FIRST]) as [CLIENT_PERSONAL_0_NAME_FIRST]
       ,survey_views.f_hash_field(@p_Encrypt,s.[CLIENT_PERSONAL_0_NAME_LAST]) as [CLIENT_PERSONAL_0_NAME_LAST]
      ,s.[CLIENT_PERSONAL_0_DOB_INTAKE]
      ,s.[CLIENT_TIME_0_START_ALT]
      ,s.[CLIENT_TIME_1_END_ALT]
      ,s.[NURSE_PERSONAL_0_NAME]
      ,s.[CLIENT_TALKED_0_WITH_ALT]
       ,survey_views.f_hash_field(@p_Encrypt,s.[CLIENT_TALKED_1_WITH_OTHER_ALT]) as [CLIENT_TALKED_1_WITH_OTHER_ALT]
      ,s.[CLIENT_ALTERNATIVE_ENCOUNTER_0_TYPE_ALT]
       ,survey_views.f_hash_field(@p_Encrypt,s.[CLIENT_ALTERNATIVE_ENCOUNTER_1_TYPE_OTHER_ALT]) as [CLIENT_ALTERNATIVE_ENCOUNTER_1_TYPE_OTHER_ALT]
      ,s.[CLIENT_DOMAIN_0_PERSONAL_HLTH_ALT]
      ,s.[CLIENT_DOMAIN_0_ENVIRONHLTH_ALT]
      ,s.[CLIENT_DOMAIN_0_LIFECOURSE_ALT]
      ,s.[CLIENT_DOMAIN_0_MATERNAL_ALT]
      ,s.[CLIENT_DOMAIN_0_FRNDFAM_ALT]
      ,s.[CLIENT_DOMAIN_0_TOTAL_ALT]
       ,survey_views.f_hash_field(@p_Encrypt,s.[CLIENT_ALT_0_COMMENTS_ALT]) as [CLIENT_ALT_0_COMMENTS_ALT]
      ,s.[CLIENT_TIME_1_DURATION_ALT]
       ,survey_views.f_hash_field(@p_Encrypt,s.[CLIENT_0_ID_AGENCY]) as [CLIENT_0_ID_AGENCY]
      , s.AuditDate as  [DW_AuditDate]
      ,s.[DataSource]
      ,s.[CLIENT_NO_REFERRAL]
      ,s.[CLIENT_SCREENED_SRVCS]
      ,null as [CLIENT_VISIT_SCHEDULE]
      , null as [Master_SurveyID]
      , null as [temp_time_start]
      , null  as [temp_time_end]
      ,s.[CLIENT_TIME_FROM_AMPM_ALT]
      ,s.[CLIENT_TIME_FROM_HR_ALT]
      ,s.[CLIENT_TIME_FROM_MIN_ALT]
      ,s.[CLIENT_TIME_TO_AMPM_ALT]
      ,s.[CLIENT_TIME_TO_HR_ALT]
      ,s.[CLIENT_TIME_TO_MIN_ALT]
      , null as [Old_CLIENT_TIME_0_START_ALT]
      , null as [Old_CLIENT_TIME_1_END_ALT]
      , null as [old_CLIENT_TIME_1_DURATION_ALT]
      , null as [temp_DURATION]
      , null as [LastModified]
from survey_views.Alternative_Encounter  s 

where 

s.SiteID in (select s.siteid from survey_views.f_get_sites_for_profile_id(@p_Profile_Id, @p_exclude_tribal) s)






end 
GO
