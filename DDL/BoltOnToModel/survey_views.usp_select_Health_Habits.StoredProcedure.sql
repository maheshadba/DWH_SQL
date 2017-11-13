USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [survey_views].[usp_select_Health_Habits] 
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
      ,s.[CLIENT_SUBSTANCE_CIG_1_PRE_PREG]
      ,s.[CLIENT_SUBSTANCE_CIG_0_DURING_PREG]
      ,s.[CLIENT_SUBSTANCE_CIG_1_LAST_48]
      ,s.[CLIENT_SUBSTANCE_ALCOHOL_0_14DAY]
      ,s.[CLIENT_SUBSTANCE_ALCOHOL_1_14DAY_DRINKS]
      ,s.[CLIENT_SUBSTANCE_POT_0_14DAYS]
      ,s.[CLIENT_SUBSTANCE_POT_1_14DAYS_JOINTS]
      ,s.[CLIENT_SUBSTANCE_COCAINE_0_14DAY]
      ,s.[CLIENT_SUBSTANCE_COCAINE_1_14DAY_TIMES]
      ,s.[CLIENT_SUBSTANCE_OTHER_0_14DAY]
      ,s.[CLIENT_SUBSTANCE_OTHER_1_14DAY_TIMES]
      ,s.[NURSE_PERSONAL_0_NAME_LAST]
      ,s.[CLIENT_0_ID_AGENCY]
      --,s.[DW_AuditDate]
     -- ,s.[DataSource]
      ,s.[CLIENT_SUBSTANCE_NICOTINE_0_OTHER_TYPES]
      ,s.[CLIENT_SUBSTANCE_NICOTINE_0_OTHER]
     -- ,s.[Master_SurveyID] 
from survey_views.Health_Habits s
where
s.SiteID in (select s.siteid from survey_views.f_get_sites_for_profile_id(@p_Profile_Id, @p_exclude_tribal) s)





end 
GO
