USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [survey_views].[usp_select_NFP_Tribal_Project]
	@p_Encrypt			bit = 1,
	@p_Profile_Id		int = null,
	@p_exclude_tribal	bit	= 0
as
begin  

set nocount on;

select s.[SurveyResponseID]
		  ,s.[ElementsProcessed]
		  ,s.[SurveyID]
		  ,s.[SurveyDate]
		  ,s.[AuditDate]
		  ,survey_views.f_hash_field(s.[CL_EN_GEN_ID],@p_Encrypt) AS [CL_EN_GEN_ID]
		  ,s.[SiteID]
		  ,s.[ProgramID]
		  ,s.[IA_StaffID]
		  ,survey_views.f_hash_field(s.[ClientID],@p_Encrypt) AS [ClientID]
		  ,s.[RespondentID]
		  --,s.[DW_AuditDate]
		  , null as DW_AuditDate
		  ,s.[CLIENT_TRIBAL_0_PARITY]
		   ,survey_views.f_hash_field(s.[CLIENT_PERSONAL_0_NAME_FIRST],@p_Encrypt) AS [CLIENT_PERSONAL_0_NAME_FIRST]
		   ,survey_views.f_hash_field(s.[CLIENT_PERSONAL_0_NAME_LAST],@p_Encrypt) AS [CLIENT_PERSONAL_0_NAME_LAST]
		  ,s.[CLIENT_PERSONAL_0_DOB_INTAKE]
		  ,s.[NURSE_PERSONAL_0_NAME]
		  --s.[DataSource]
		  , null as DataSource
		  ,s.[CLIENT_TRIBAL_CHILD_1_LIVING]
		  ,s.[CLIENT_TRIBAL_CHILD_10_LIVING]
		  ,s.[CLIENT_TRIBAL_CHILD_2_LIVING]
		  ,s.[CLIENT_TRIBAL_CHILD_3_LIVING]
		  ,s.[CLIENT_TRIBAL_CHILD_4_LIVING]
		  ,s.[CLIENT_TRIBAL_CHILD_5_LIVING]
		  ,s.[CLIENT_TRIBAL_CHILD_6_LIVING]
		  ,s.[CLIENT_TRIBAL_CHILD_7_LIVING]
		  ,s.[CLIENT_TRIBAL_CHILD_8_LIVING]
		  ,s.[CLIENT_TRIBAL_CHILD_9_LIVING]
		  ,s.[CLIENT_TRIBAL_CHILD_1_DOB]
		  ,s.[CLIENT_TRIBAL_CHILD_10_DOB]
		  ,s.[CLIENT_TRIBAL_CHILD_2_DOB]
		  ,s.[CLIENT_TRIBAL_CHILD_3_DOB]
		  ,s.[CLIENT_TRIBAL_CHILD_4_DOB]
		  ,s.[CLIENT_TRIBAL_CHILD_5_DOB]
		  ,s.[CLIENT_TRIBAL_CHILD_6_DOB]
		  ,s.[CLIENT_TRIBAL_CHILD_7_DOB]
		  ,s.[CLIENT_TRIBAL_CHILD_8_DOB]
		  ,s.[CLIENT_TRIBAL_CHILD_9_DOB]
		  --,s.[Master_SurveyID]
		  , null as Master_SurveyID

	from survey_views.NFP_Tribal_Project s

	where
	s.SiteID in (select s.siteid from survey_views.f_get_sites_for_profile_id(@p_Profile_Id, @p_exclude_tribal) s)





end; 
GO
