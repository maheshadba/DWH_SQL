USE [dwh_test]
GO
/****** Object:  StoredProcedure [survey_views].[usp_etl_select_New_Hire]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [survey_views].[usp_etl_select_New_Hire]  
(
 @p_export_profile_id int,
  @p_entity_filter char(5)=null,
  @p_etl_session_token varchar(50)=null
)
as
begin


set nocount on;
declare		@_rec_count int;
declare		@_my_name varchar(256);
set			@_my_name = OBJECT_NAME(@@PROCID);


declare  @_hash_profile   char(10);


set   @_hash_profile   = (select top 1 isnull('SA',hash_policy) from survey_views.f_get_survey_etl_work() where ExportProfileID=@p_export_profile_id);

begin transaction



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
	--vbase.Validation_Ind,
	--vbase.Validation_Comment,
	--vbase.Entity_ID_Mapped,
	vbase.NEW_HIRE_0_HIRE_DATE,
	vbase.NEW_HIRE_1_NAME_FIRST,
	vbase.NEW_HIRE_0_NAME_LAST,
	vbase.NEW_HIRE_1_ROLE,
	vbase.NEW_HIRE_ADDRESS_1_STREET,
	vbase.NEW_HIRE_ADDRESS_1_CITY,
	vbase.NEW_HIRE_ADDRESS_1_STATE,
	vbase.NEW_HIRE_ADDRESS_0_ZIP,
	vbase.NEW_HIRE_0_PHONE,
	vbase.NEW_HIRE_0_EMAIL,
	vbase.NEW_HIRE_SUP_0_PHONE,
	vbase.NEW_HIRE_SUP_0_EMAIL,
	vbase.NEW_HIRE_0_REASON_FOR_HIRE,
	vbase.NEW_HIRE_0_REASON_FOR_HIRE_REPLACE,
	vbase.NEW_HIRE_0_FTE,
	vbase.NEW_HIRE_0_PREVIOUS_NFP_WORK,
	vbase.NEW_HIRE_0_REASON_NFP_WORK_DESC,
	vbase.NEW_HIRE_0_EDUC_COMPLETED,
	vbase.NEW_HIRE_0_START_DATE,
	vbase.NEW_HIRE_SUP_0_NAME,
	vbase.NEW_HIRE_0_TEAM_NAME,
	vbase.NEW_HIRE_0_ACCESS_LEVEL,
	--vbase.DISP_CODE,
	--vbase.REVIEWED_BY,
	--vbase.REVIEWED_DATE,
	--vbase.ADDED_TO_ETO,
	--vbase.ADDED_TO_ETO_BY,
	--vbase.ETO_LOGIN_EMAILED,
	--vbase.ETO_LOGIN_EMAILED_BY,
	--vbase.ADDED_TO_CMS,
	--vbase.ADDED_TO_CMS_BY,
	--vbase.GEN_COMMENTS,
	--vbase.CHANGE_STATUS_COMPLETED,
	vbase.NEW_HIRE_1_DOB,
	vbase.NEW_HIRE_1_PREVIOUS_WORK_AGENCY,
	vbase.NEW_HIRE_1_PREVIOUS_WORK_CITY,
	vbase.NEW_HIRE_1_PREVIOUS_WORK_DATE1,
	vbase.NEW_HIRE_1_PREVIOUS_WORK_DATE2,
	vbase.NEW_HIRE_1_PREVIOUS_WORK_NAME,
	vbase.NEW_HIRE_1_PREVIOUS_WORK_STATE,
	vbase.NEW_HIRE_1_REPLACE_STAFF_TERM,
	vbase.NEW_HIRE_ER_0_LNAME,
	vbase.NEW_HIRE_ER_1_FNAME,
	vbase.NEW_HIRE_ER_1_PHONE,
	vbase.NEW_HIRE_ADDRESS_1_STATE_OTHR,
	vbase.NEW_HIRE_SUP_0_NAME_OTHR,
	--vbase.DW_AuditDate,
	--vbase.DataSource,
	vbase.NEW_HIRE_ADDITIONAL_INFO
	--vbase.Master_SurveyID

	from survey_views.f_select_New_Hire_Form(@_hash_profile,@p_export_profile_id) vbase


		if @p_etl_session_token is not null
		begin

			declare @_completed datetime=getdate();
		
			insert into survey_views.survey_export_sessions (session_token, extract_procedure, number_of_records, time_completed, survey_name, file_name, export_profile_id, profile_name, site_id, agency_name)
			select 
			@p_etl_session_token,
			@_my_name,
			count(responses.SurveyResponseID) as [Count],
			@_completed,
			'New_Hire_Survey',
			'New_Hire.txt',
			ep.ExportProfileID,
			ep.ProfileName,
			ee.SiteID,
			ee.AgencyName

			from survey_views.ExportEntities ee 
			 inner join survey_views.f_select_New_Hire_Form(@_hash_profile,@p_export_profile_id) responses 
														on responses.SiteID=ee.SiteID
			 inner join survey_views.ExportProfile ep	on ee.ExportProfileID=ep.ExportProfileID
			where
				ee.ExportProfileID=@p_export_profile_id
			group by
			ep.ExportProfileID,
			ep.ProfileName,
			ee.AgencyName,
			ee.SiteID;


		end



commit transaction;

 
end;


GO
