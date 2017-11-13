USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [survey_views].[usp_select_PHQ_9] 
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
      ,s.[ClientID]
      ,s.[RespondentID]
      --,s.[CLIENT_0_ID_AGENCY]
      ,s.[CLIENT_0_ID_NSO]
      ,s.[CLIENT_PERSONAL_0_DOB_INTAKE]
      ,s.[CLIENT_PERSONAL_0_NAME_FIRST]
      ,s.[CLIENT_PERSONAL_0_NAME_LAST]
      --,s.[Need from Kim]
      --,s.[NeedFromKim]
      ,s.[CLIENT_PHQ9_0_TOTAL_SCORE]
      ,s.[CLIENT_PHQ9_1_CONCENTRATION]
      ,s.[CLIENT_PHQ9_1_DIFFICULTY]
      ,s.[CLIENT_PHQ9_1_FEEL_BAD]
      ,s.[CLIENT_PHQ9_1_FEEL_DEPRESSED]
      ,s.[CLIENT_PHQ9_1_FEEL_TIRED]
      ,s.[CLIENT_PHQ9_1_HURT_SELF]
      ,s.[CLIENT_PHQ9_1_LITTLE_INTEREST]
      ,s.[CLIENT_PHQ9_1_MOVE_SPEAK]
      ,s.[CLIENT_PHQ9_1_TROUBLE_EAT]
      ,s.[CLIENT_PHQ9_1_TROUBLE_SLEEP]
      ,s.[NURSE_PERSONAL_0_NAME]
     -- ,s.[DW_AuditDate]
     -- ,s.[DataSource]
     -- ,s.[Master_SurveyID] 
from survey_views.PHQ_9 s
where
s.SiteID in (select s.siteid from survey_views.f_get_sites_for_profile_id(@p_Profile_Id, @p_exclude_tribal) s)



end 
GO
