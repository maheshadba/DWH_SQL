USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [survey_views].[usp_select_Maternal_Health_Assessment]
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
      ,s.[CL_EN_GEN_ID]
      ,s.[SiteID]
      ,s.[ProgramID]
      ,s.[IA_StaffID]
      ,s.[ClientID]
      ,s.[RespondentID]
      ,s.[CLIENT_0_ID_NSO]
      ,s.[CLIENT_PERSONAL_0_NAME_FIRST]
      ,s.[CLIENT_PERSONAL_0_NAME_LAST]
      ,s.[CLIENT_PERSONAL_0_DOB_INTAKE]
      ,s.[NURSE_PERSONAL_0_NAME]
      ,s.[CLIENT_HEALTH_PREGNANCY_0_LIVE_BIRTHS]
      ,s.[CLIENT_HEALTH_PREGNANCY_0_DOCTOR_VISIT]
      ,s.[CLIENT_HEALTH_PREGNANCY_0_WKS_PRENATAL_CARE]
      ,s.[CLIENT_HEALTH_PREGNANCY_0_EDD]
      ,s.[CLIENT_HEALTH_GENERAL_0_CONCERNS]
      ,s.[CLIENT_HEALTH_GENERAL_WEIGHT_0_POUNDS]
      ,s.[CLIENT_HEALTH_BELIEF_0_LITTLE_CONTROL]
      ,s.[CLIENT_HEALTH_BELIEF_0_CANT_SOLVE]
      ,s.[CLIENT_HEALTH_BELIEF_0_LITTLE_CAN_DO]
      ,s.[CLIENT_HEALTH_BELIEF_0_FEEL_HELPLESS]
      ,s.[CLIENT_HEALTH_BELIEF_0_FEEL_PUSHED_AROUND]
      ,s.[CLIENT_HEALTH_BELIEF_0_FUTURE_CONTROL]
      ,s.[CLIENT_HEALTH_BELIEF_ 0_DO_ANYTHING]
      ,s.[CLIENT_HEALTH_GENERAL_0_OTHER]
      ,s.[CLIENT_HEALTH_GENERAL_HEIGHT_0_FEET]
      ,s.[CLIENT_HEALTH_GENERAL_HEIGHT_1_INCHES]
      ,s.[CLIENT_0_ID_AGENCY]
      --,s.[DW_AuditDate]
      --,s.[DataSource]
     -- ,s.[LA_CTY_MENTAL_MAT_HEALTH]
     -- ,s.[LA_CTY_PHYSICAL_MAT_HEALTH]
      --,s.[LA_CTY_DX_OTHER_MAT_HEALTH]
      --,s.[LA_CTY_DSM_DX_MAT_HEALTH]
      ,s.[CLIENT_HEALTH_GENERAL_0_PRE_GEST_BP]
      ,s.[CLIENT_HEALTH_GENERAL_0_PRE_GEST_DIABETES]
      ,s.[CLIENT_HEALTH_GENERAL_0_PRE_GEST_HEART]
      ,s.[CLIENT_HEALTH_GENERAL_0_PRE_GEST_KIDNEYS]
      ,s.[CLIENT_HEALTH_GENERAL_0_PRE_GEST_STI]
      ,s.[CLIENT_HEALTH_GENERAL_0_PRE_GEST_UTI]
      ,s.[CLIENT_HEALTH_GENERAL_0_PRE_GEST_VI]
      ,s.[CLIENT_HEALTH_GENERAL_CURRENT_WEIGHT_0_POUNDS]
      --,s.[Master_SurveyID]
      ,s.[CLIENT_HEALTH_GENERAL_0_CONCERNS2]
      ,s.[CLIENT_HEALTH_GENERAL_0_ADDICTION]
      ,s.[CLIENT_HEALTH_GENERAL_0_MENTAL_HEALTH]
     -- ,s.[LastModified] 
from survey_views.Maternal_Health_Assessment  s
where
s.SiteID in (select s.siteid from survey_views.f_get_sites_for_profile_id(@p_Profile_Id, @p_exclude_tribal) s)



end 
GO
