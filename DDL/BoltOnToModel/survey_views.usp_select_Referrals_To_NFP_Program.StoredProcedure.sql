USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [survey_views].[usp_select_Referrals_To_NFP_Program] 
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
      ,s.[REFERRAL_PROSPECT_0_SOURCE_CODE]
      ,s.[REFERRAL_SOURCE_PRIMARY_0_NAME]
      ,s.[REFERRAL_SOURCE_PRIMARY_1_LOCATION]
      ,s.[REFERRAL_SOURCE_SECONDARY_0_NAME]
      ,s.[REFERRAL_SOURCE_SECONDARY_1_LOCATION]
      ,s.[REFERRAL_PROSPECT_0_NOTES]
	  ,s.[REFERRAL_PROSPECT_DEMO_1_PLANG]
      ,s.[REFERRAL_PROSPECT_DEMO_1_NAME_FIRST]
      ,s.[REFERRAL_PROSPECT_DEMO_0_NAME_LAST]
      ,s.[REFERRAL_PROSPECT_DEMO_1_DOB]
      ,s.[REFERRAL_PROSPECT_DEMO_1_STREET]
      ,s.[REFERRAL_PROSPECT_DEMO_1_STREET2]
      ,s.[REFERRAL_PROSPECT_DEMO_1_ZIP]
      ,s.[REFERRAL_PROSPECT_DEMO_1_WORK]
      ,s.[REFERRAL_PROSPECT_DEMO_1_PHONE_HOME]
      ,s.[REFERRAL_PROSPECT_DEMO_1_CELL]
      ,s.[REFERRAL_PROSPECT_DEMO_1_EMAIL]
      ,s.[REFERRAL_PROSPECT_DEMO_1_EDD]
      ,s.[REFERRAL_PROSPECT_0_WAIT_LIST]
      ,s.[REFERRAL_PROSPECT_0_FOLLOWUP_NURSE]
      --,s.[DW_AuditDate]
      --,s.[DataSource]
      --,s.[LA_CTY_REFERRAL_SCHOOL]
      --,s.[LA_CTY_REFERRAL_SOURCE_OTH]
      ,s.[CLIENT_0_ID_NSO]
      --,s.[Master_SurveyID]
from survey_views.Referrals_To_NFP_Program  s
where
s.SiteID in (select s.siteid from survey_views.f_get_sites_for_profile_id(@p_Profile_Id, @p_exclude_tribal) s)




end 
GO
