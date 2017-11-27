USE [dwh_test]
GO
/****** Object:  StoredProcedure [survey_views].[usp_etl_select_Demographics]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [survey_views].[usp_etl_select_Demographics]  
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
	vbase.CLIENT_PERSONAL_0_VOLUNTARILY_INVOLVED,
	vbase.CLIENT_MARITAL_0_STATUS,
	vbase.CLIENT_BIO_DAD_0_CONTACT_WITH,
	vbase.CLIENT_LIVING_0_WITH,
	vbase.CLIENT_LIVING_1_WITH_OTHERS,
	vbase.CLIENT_EDUCATION_0_HS_GED,
	vbase.CLIENT_EDUCATION_1_HS_GED_LAST_GRADE,
	vbase.CLIENT_EDUCATION_1_HIGHER_EDUC_COMP,
	vbase.CLIENT_EDUCATION_1_ENROLLED_CURRENT,
	vbase.CLIENT_EDUCATION_1_ENROLLED_TYPE,
	vbase.CLIENT_EDUCATION_1_ENROLLED_PLAN,
	vbase.CLIENT_WORKING_0_CURRENTLY_WORKING,
	vbase.CLIENT_INCOME_0_HH_INCOME,
	vbase.CLIENT_INCOME_1_LOW_INCOME_QUALIFY,
	vbase.CLIENT_0_ID_NSO,
	vbase.CLIENT_PERSONAL_0_NAME_FIRST,
	vbase.CLIENT_PERSONAL_0_NAME_LAST,
	vbase.NURSE_PERSONAL_0_NAME,
	vbase.CLIENT_PERSONAL_0_DOB_INTAKE,
	--vbase.CLIENT_PERSONAL_0_ETHNICITY_INTAKE,
	--vbase.CLIENT_PERSONAL_0_RACE,
	--vbase.CLIENT_PERSONAL_LANGUAGE_0_INTAKE,
	vbase.CLIENT_0_ID_AGENCY,
	--vbase.CLIENT_WORKING_1_WORKED_SINCE_BIRTH,
	--vbase.CLIENT_WORKING_1_WORKED_SINCE_BIRTH_MONTHS,
	--vbase.CLIENT_BC_0_USED_6MONTHS,
	--vbase.CLIENT_BC_1_NOT_USED_REASON,
	--vbase.CLIENT_BC_1_FREQUENCY,
	--vbase.CLIENT_BC_1_TYPES,
	--vbase.CLIENT_SUBPREG_0_BEEN_PREGNANT,
	--vbase.CLIENT_SUBPREG_1_BEGIN_MONTH,
	--vbase.CLIENT_SUBPREG_1_BEGIN_YEAR,
	--vbase.CLIENT_SUBPREG_1_PLANNED,
	--vbase.CLIENT_SUBPREG_1_OUTCOME,
	--vbase.CLIENT_SECOND_0_CHILD_DOB,
	--vbase.CLIENT_SECOND_1_CHILD_GENDER,
	--vbase.CLIENT_SECOND_1_CHILD_BW_POUNDS,
	--vbase.CLIENT_SECOND_1_CHILD_BW_OZ,
	--vbase.CLIENT_SECOND_1_CHILD_NICU,
	--vbase.CLIENT_SECOND_1_CHILD_NICU_DAYS,
	--vbase.CLIENT_BIO_DAD_1_TIME_WITH,
	vbase.ADULTS_1_ENROLL_NO,
	vbase.ADULTS_1_ENROLL_PT,
	vbase.ADULTS_1_CARE_10,
	vbase.ADULTS_1_CARE_20,
	vbase.ADULTS_1_CARE_30,
	vbase.ADULTS_1_CARE_40,
	vbase.ADULTS_1_CARE_LESS10,
	vbase.ADULTS_1_COMPLETE_GED,
	vbase.ADULTS_1_COMPLETE_HS,
	vbase.ADULTS_1_COMPLETE_HS_NO,
	vbase.ADULTS_1_ED_TECH,
	vbase.ADULTS_1_ED_ASSOCIATE,
	vbase.ADULTS_1_ED_BACHELOR,
	vbase.ADULTS_1_ED_MASTER,
	vbase.ADULTS_1_ED_NONE,
	vbase.ADULTS_1_ED_POSTGRAD,
	vbase.ADULTS_1_ED_SOME_COLLEGE,
	vbase.ADULTS_1_ED_UNKNOWN,
	vbase.ADULTS_1_ENROLL_FT,
	vbase.ADULTS_1_INS_NO,
	vbase.ADULTS_1_INS_PRIVATE,
	vbase.ADULTS_1_INS_PUBLIC,
	vbase.ADULTS_1_WORK_10,
	vbase.ADULTS_1_WORK_20,
	vbase.ADULTS_1_WORK_37,
	vbase.ADULTS_1_WORK_LESS10,
	vbase.ADULTS_1_WORK_UNEMPLOY,
	vbase.CLIENT_CARE_0_ER_HOSP,
	vbase.CLIENT_EDUCATION_1_ENROLLED_FTPT,
	vbase.CLIENT_INCOME_1_HH_SOURCES,
	vbase.CLIENT_WORKING_1_CURRENTLY_WORKING_HRS,
	--vbase.DW_AuditDate,
	--vbase.DataSource,
	vbase.CLIENT_EDUCATION_1_ENROLLED_PT_HRS,
	vbase.CLIENT_SCHOOL_MIDDLE_HS,
	vbase.CLIENT_ED_PROG_TYPE,
	vbase.CLIENT_PROVIDE_CHILDCARE,
	--vbase.CLIENT_WORKING_2_CURRENTLY_WORKING_NO,
	vbase.CLIENT_CARE_0_ER,
	vbase.CLIENT_CARE_0_URGENT,
	vbase.CLIENT_CARE_0_ER_TIMES,
	vbase.CLIENT_CARE_0_URGENT_TIMES,
	vbase.CLIENT_INCOME_IN_KIND,
	vbase.CLIENT_INCOME_SOURCES,
	vbase.CLIENT_MILITARY,
	--vbase.DELETE ME,
	vbase.CLIENT_INCOME_AMOUNT,
	vbase.CLIENT_WORKING_1_CURRENTLY_WORKING_NO,
	vbase.CLIENT_INCOME_INKIND_OTHER,
	vbase.CLIENT_INCOME_OTHER_SOURCES,
	--vbase.CLIENT_BC_1_TYPES_NEXT6,
	--vbase.CLIENT_SUBPREG_1_EDD,
	vbase.CLIENT_CARE_0_ER_PURPOSE,
	vbase.CLIENT_CARE_0_URGENT_PURPOSE,
	--vbase.CLIENT_CARE_0_ URGENT_OTHER,
	vbase.CLIENT_CARE_0_ER_OTHER,
	vbase.CLIENT_CARE_0_ER_FEVER_TIMES,
	vbase.CLIENT_CARE_0_ER_INFECTION_TIMES,
	vbase.CLIENT_CARE_0_ER_INGESTION_TIMES,
	vbase.CLIENT_CARE_0_ER_INJURY_TIMES,
	vbase.CLIENT_CARE_0_ER_OTHER_TIMES,
	vbase.CLIENT_CARE_0_URGENT_FEVER_TIMES,
	vbase.CLIENT_CARE_0_URGENT_INFECTION_TIMES,
	vbase.CLIENT_CARE_0_URGENT_INGESTION_TIMES,
	vbase.CLIENT_CARE_0_URGENT_INJURY_TIMES,
	vbase.CLIENT_CARE_0_URGENT_OTHER_TIMES,
	--vbase.CLIENT_SECOND_1_CHILD_BW_MEASURE,
	vbase.CLIENT_CARE_0_URGENT_OTHER,
	--vbase.CLIENT_SECOND_1_CHILD_BW_CONVERT_GRAMS,
	--vbase.CLIENT_SECOND_1_CHILD_BW_GRAMS,
	--vbase.CLIENT_SUBPREG_1_GEST_AGE,
	--vbase.Master_SurveyID,
	vbase.CLIENT_CARE_0_ER_PURPOSE_R6,
	vbase.CLIENT_CARE_0_URGENT_PURPOSE_R6,
	--vbase.CLIENT_SUBPREG,
	vbase.CLIENT_CARE_0_ER_INGESTION_ACCIDENT_TIMES,
	vbase.CLIENT_CARE_0_ER_INGESTION_DECLINE_TIMES,
	vbase.CLIENT_CARE_0_ER_INGESTION_INTENT_OTHER_TIMES,
	vbase.CLIENT_CARE_0_ER_INGESTION_SELF_TIMES,
	vbase.CLIENT_CARE_0_ER_INJURY_ACCIDENT_TIMES,
	vbase.CLIENT_CARE_0_ER_INJURY_DECLINE_TIMES,
	vbase.CLIENT_CARE_0_ER_INJURY_INTENT_OTHER_TIMES,
	vbase.CLIENT_CARE_0_ER_INJURY_SELF_TIMES,
	vbase.CLIENT_CARE_0_URGENT_INGESTION_ACCIDENT_TIMES,
	vbase.CLIENT_CARE_0_URGENT_INGESTION_DECLINE_TIMES,
	vbase.CLIENT_CARE_0_URGENT_INGESTION_INTENT_OTHER_TIMES,
	vbase.CLIENT_CARE_0_URGENT_INGESTION_SELF_TIMES,
	vbase.CLIENT_CARE_0_URGENT_INJURY_ACCIDENT_TIMES,
	vbase.CLIENT_CARE_0_URGENT_INJURY_DECLINE_TIMES,
	vbase.CLIENT_CARE_0_URGENT_INJURY_INTENT_OTHER_TIMES,
	vbase.CLIENT_CARE_0_URGENT_INJURY_SELF_TIMES,
	--vbase.Archive_Record,
	vbase.CLIENT_INSURANCE_TYPE,
	vbase.CLIENT_INSURANCE,
	vbase.CLIENT_LIVING_HOMELESS,
	vbase.CLIENT_LIVING_WHERE,
	vbase.CLIENT_INSURANCE_OTHER

	from survey_views.f_select_Demographics(@_hash_profile,@p_export_profile_id) vbase

		if @p_etl_session_token is not null
		begin

			declare @_completed datetime=getdate();
		
			insert into survey_views.survey_export_sessions (session_token, extract_procedure, number_of_records, time_completed, survey_name, file_name, export_profile_id, profile_name, site_id, agency_name)
			select 
			@p_etl_session_token,
			@_my_name,
			count(responses.SurveyResponseID) as [Count],
			@_completed,
			'Demographics_Survey',
			'Demographics.txt',
			ep.ExportProfileID,
			ep.ProfileName,
			ee.SiteID,
			ee.AgencyName

			from survey_views.ExportEntities ee 
			 inner join survey_views.f_select_Demographics(@_hash_profile,@p_export_profile_id) responses 
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
