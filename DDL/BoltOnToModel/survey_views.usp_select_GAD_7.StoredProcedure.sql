USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [survey_views].[usp_select_GAD_7]
	@p_Encrypt			bit = 1,
	@p_Profile_Id		int = null,
	@p_exclude_tribal	bit	= 0
as  
begin  

select 

		   s.[SurveyResponseID]
		  ,s.[ElementsProcessed]
		  ,s.[SurveyID]
		  --,s.[Master_SurveyID]
		  , null as Master_SurveyID
		  ,s.[SurveyDate]
		  ,s.[AuditDate]
		  , survey_views.f_hash_field(s.CL_EN_GEN_ID,@p_Encrypt) as [CL_EN_GEN_ID]
		  ,s.[SiteID]
		  ,s.[ProgramID]
		  ,s.[IA_StaffID]
		  , survey_views.f_hash_field(s.[ClientID],@p_Encrypt) AS ClientID
		  ,s.[RespondentID]
		  --,s.[DW_AuditDate]
		, null as DW_AuditDate
		  --,s.[DataSource]
		, null as DataSource
		  ,s.[CLIENT_GAD7_AFRAID]
		  ,s.[CLIENT_GAD7_CTRL_WORRY]
		  ,s.[CLIENT_GAD7_IRRITABLE]
		  ,s.[CLIENT_GAD7_NERVOUS]
		  ,s.[CLIENT_GAD7_PROBS_DIFFICULT]
		  ,s.[CLIENT_GAD7_RESTLESS]
		  ,s.[CLIENT_GAD7_TRBL_RELAX]
		  ,s.[CLIENT_GAD7_WORRY]
		  , survey_views.f_hash_field(s.[CLIENT_0_ID_NSO],@p_Encrypt) AS [CLIENT_0_ID_NSO]
		  , survey_views.f_hash_field(s.[CLIENT_PERSONAL_0_NAME_FIRST],@p_Encrypt) AS [CLIENT_PERSONAL_0_NAME_FIRST]
		  , survey_views.f_hash_field(s.[CLIENT_PERSONAL_0_NAME_LAST],@p_Encrypt) AS [CLIENT_PERSONAL_0_NAME_LAST]
		  ,s.[CLIENT_GAD7_TOTAL]
		  ,s.[CLIENT_PERSONAL_0_DOB_INTAKE]
		  ,s.[NURSE_PERSONAL_0_NAME]

from survey_views.GAD_7  s
where
s.SiteID in (select s.siteid from survey_views.f_get_sites_for_profile_id(@p_Profile_Id, @p_exclude_tribal) s)


end 
GO
