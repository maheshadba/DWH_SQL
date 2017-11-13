USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [survey_views].[usp_select_Edinburgh_Postnatal_Depression_Scale] 
	@p_Encrypt			bit = 1,
	@p_Profile_Id		int = null,
	@p_exclude_tribal	bit	= 0
as  
begin  

select 
s.[SurveyResponseID]
      ,s.[ElementsProcessed]
      ,s.[SurveyID]
      ,s.[SurveyDate]
      ,s.[AuditDate]
      ,s.[CL_EN_GEN_ID]
      ,s.[SiteID]
      ,s.[ProgramID]
      ,s.[IA_StaffID]
      ,survey_views.f_hash_field(@p_Encrypt, s.[ClientID]) as [ClientID]
      ,s.[RespondentID]
      ,survey_views.f_hash_field(@p_Encrypt, s.[CLIENT_PERSONAL_0_NAME_FIRST]) as [CLIENT_PERSONAL_0_NAME_FIRST]
      ,survey_views.f_hash_field(@p_Encrypt, s.[CLIENT_PERSONAL_0_NAME_LAST]) as [CLIENT_PERSONAL_0_NAME_LAST]
      ,s.[CLIENT_PERSONAL_0_DOB_INTAKE]
      ,s.[CLIENT_EPDS_1_ABLE_TO_LAUGH]
      ,s.[CLIENT_EPDS_1_ENJOY_THINGS]
      ,s.[CLIENT_EPDS_1_BLAME_SELF]
      ,s.[CLIENT_EPDS_1_ANXIOUS_WORRIED]
      ,s.[CLIENT_EPDS_1_SCARED_PANICKY]
      ,s.[CLIENT_EPDS_1_THINGS_GETTING_ON_TOP]
      ,s.[CLIENT_EPDS_1_DIFFICULTY_SLEEPING]
      ,s.[CLIENT_EPDS_1_SAD_MISERABLE]
      ,s.[CLIENT_EPDS_1_BEEN_CRYING]
      ,s.[CLIENT_EPDS_1_HARMING_SELF]
      ,survey_views.f_hash_field(@p_Encrypt, s.[CLIENT_0_ID_NSO]) as [CLIENT_0_ID_NSO]
      ,s.[NURSE_PERSONAL_0_NAME]
      ,survey_views.f_hash_field(@p_Encrypt, s.[CLIENT_0_ID_AGENCY]) as[CLIENT_0_ID_AGENCY]
     -- ,s.[DW_AuditDate]
     -- ,s.[DataSource]
      --,s.[LA_CTY_OQ10_EDPS]
      --,s.[LA_CTY_PHQ9_SCORE_EDPS]
     -- ,s.[LA_CTY_STRESS_INDEX_EDPS]
      ,s.[CLIENT_EPS_TOTAL_SCORE]
      --,s.[Master_SurveyID]  
from survey_views.Edinburgh_Postnatal_Depression_Scale s
where
s.SiteID in (select s.siteid from survey_views.f_get_sites_for_profile_id(@p_Profile_Id, @p_exclude_tribal) s)




end 
GO
