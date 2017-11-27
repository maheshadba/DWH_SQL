USE [dwh_test]
GO
/****** Object:  UserDefinedFunction [survey_views].[f_select_Infant_Health_Care]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [survey_views].[f_select_Infant_Health_Care]
(
	@p_requested_security_policy char(10)=null,
	@p_export_profile_id int=null
)
RETURNS 
@result TABLE 
(
SurveyResponseID int, 
ElementsProcessed int, 
SurveyID int, 
SurveyDate date, 
AuditDate datetime2, 
CL_EN_GEN_ID bigint, 
SiteID int, 
ProgramID int, 
IA_StaffID int, 
ClientID varchar(20), 
RespondentID int, 
CLIENT_0_ID_AGENCY varchar(256), 
CLIENT_0_ID_NSO varchar(256), 
CLIENT_PERSONAL_0_NAME_FIRST varchar(256), 
CLIENT_PERSONAL_0_NAME_LAST varchar(256), 
INFANT_0_ID_NSO varchar(256), 
INFANT_AGES_STAGES_0_VERSION varchar(256), 
INFANT_AGES_STAGES_1_COMM varchar(256), 
INFANT_AGES_STAGES_1_FMOTOR varchar(256), 
INFANT_AGES_STAGES_1_GMOTOR varchar(256), 
INFANT_AGES_STAGES_1_PSOCIAL varchar(256), 
INFANT_AGES_STAGES_1_PSOLVE varchar(256), 
INFANT_AGES_STAGES_SE_0_EMOTIONAL varchar(256), 
INFANT_AGES_STAGES_SE_VERSION varchar(256), 
INFANT_BIRTH_0_DOB varchar(256), 
INFANT_BIRTH_COSLEEP varchar(256), 
INFANT_BIRTH_READ varchar(256), 
INFANT_BIRTH_SLEEP_BACK varchar(256), 
INFANT_BIRTH_SLEEP_BEDDING varchar(256), 
INFANT_BREASTMILK_0_EVER_IHC varchar(256), 
INFANT_BREASTMILK_1_AGE_STOP varchar(256), 
INFANT_BREASTMILK_1_CONT varchar(256), 
INFANT_BREASTMILK_1_EXCLUSIVE_WKS varchar(256), 
INFANT_BREASTMILK_1_WEEK_STOP varchar(256), 
INFANT_HEALTH_DENTAL_SOURCE varchar(256), 
INFANT_HEALTH_DENTIST varchar(256), 
INFANT_HEALTH_DENTIST_STILL_EBF varchar(256), 
INFANT_HEALTH_ER_0_HAD_VISIT varchar(256), 
INFANT_HEALTH_ER_1_INGEST_DATE1 varchar(256), 
INFANT_HEALTH_ER_1_INGEST_DATE2 varchar(256), 
INFANT_HEALTH_ER_1_INGEST_DATE3 varchar(256), 
INFANT_HEALTH_ER_1_INGEST_DAYS1 varchar(256), 
INFANT_HEALTH_ER_1_INGEST_DAYS2 varchar(256), 
INFANT_HEALTH_ER_1_INGEST_DAYS3 varchar(256), 
INFANT_HEALTH_ER_1_INGEST_ERvsUC1 varchar(256), 
INFANT_HEALTH_ER_1_INGEST_ERvsUC2 varchar(256), 
INFANT_HEALTH_ER_1_INGEST_ERvsUC3 varchar(256), 
INFANT_HEALTH_ER_1_INGEST_TREAT1 varchar(256), 
INFANT_HEALTH_ER_1_INGEST_TREAT2 varchar(256), 
INFANT_HEALTH_ER_1_INGEST_TREAT3 varchar(256), 
INFANT_HEALTH_ER_1_INJ_DATE1 varchar(256), 
INFANT_HEALTH_ER_1_INJ_DATE2 varchar(256), 
INFANT_HEALTH_ER_1_INJ_DATE3 varchar(256), 
INFANT_HEALTH_ER_1_INJ_DAYS1 varchar(256), 
INFANT_HEALTH_ER_1_INJ_DAYS2 varchar(256), 
INFANT_HEALTH_ER_1_INJ_DAYS3 varchar(256), 
INFANT_HEALTH_ER_1_INJ_ERvsUC1 varchar(256), 
INFANT_HEALTH_ER_1_INJ_ERvsUC2 varchar(256), 
INFANT_HEALTH_ER_1_INJ_ERvsUC3 varchar(256), 
INFANT_HEALTH_ER_1_INJ_TREAT1 varchar(256), 
INFANT_HEALTH_ER_1_INJ_TREAT2 varchar(256), 
INFANT_HEALTH_ER_1_INJ_TREAT3 varchar(256), 
INFANT_HEALTH_ER_1_OTHER varchar(256), 
INFANT_HEALTH_ER_1_OTHER_ERvsUC1 varchar(256), 
INFANT_HEALTH_ER_1_OTHER_ERvsUC2 varchar(256), 
INFANT_HEALTH_ER_1_OTHER_ERvsUC3 varchar(256), 
INFANT_HEALTH_ER_1_OTHER_REASON1 varchar(256), 
INFANT_HEALTH_ER_1_OTHER_REASON2 varchar(256), 
INFANT_HEALTH_ER_1_OTHER_REASON3 varchar(256), 
INFANT_HEALTH_ER_1_OTHERDT1 varchar(256), 
INFANT_HEALTH_ER_1_OTHERDT2 varchar(256), 
INFANT_HEALTH_ER_1_OTHERDT3 varchar(256), 
INFANT_HEALTH_ER_1_TYPE varchar(256), 
INFANT_HEALTH_HEAD_0_CIRC_INCHES varchar(256), 
INFANT_HEALTH_HEAD_1_REPORT varchar(256), 
INFANT_HEALTH_HEIGHT_0_INCHES varchar(256), 
INFANT_HEALTH_HEIGHT_1_PERCENT varchar(256), 
INFANT_HEALTH_HEIGHT_1_REPORT varchar(256), 
INFANT_HEALTH_HOSP_0_HAD_VISIT varchar(256), 
INFANT_HEALTH_HOSP_1_INGEST_DATE1 varchar(256), 
INFANT_HEALTH_HOSP_1_INGEST_DATE2 varchar(256), 
INFANT_HEALTH_HOSP_1_INGEST_DATE3 varchar(256), 
INFANT_HEALTH_HOSP_1_INJ_DATE1 varchar(256), 
INFANT_HEALTH_HOSP_1_INJ_DATE2 varchar(256), 
INFANT_HEALTH_HOSP_1_INJ_DATE3 varchar(256), 
INFANT_HEALTH_HOSP_1_TYPE varchar(256), 
INFANT_HEALTH_IMMUNIZ_0_UPDATE varchar(256), 
INFANT_HEALTH_IMMUNIZ_1_RECORD varchar(256), 
INFANT_HEALTH_IMMUNIZ_UPDATE_NO varchar(256), 
INFANT_HEALTH_IMMUNIZ_UPDATE_YES varchar(256), 
INFANT_HEALTH_LEAD_0_TEST varchar(256), 
INFANT_HEALTH_NO_ASQ_COMM varchar(256), 
INFANT_HEALTH_NO_ASQ_FINE varchar(256), 
INFANT_HEALTH_NO_ASQ_GROSS varchar(256), 
INFANT_HEALTH_NO_ASQ_PERSONAL varchar(256), 
INFANT_HEALTH_NO_ASQ_PROBLEM varchar(256), 
INFANT_HEALTH_NO_ASQ_TOTAL varchar(256), 
INFANT_HEALTH_PROVIDER_0_APPT varchar(256), 
INFANT_HEALTH_PROVIDER_0_APPT_DETAILSR2 varchar(256), 
INFANT_HEALTH_PROVIDER_0_APPT_R2 varchar(256), 
INFANT_HEALTH_PROVIDER_0_PRIMARY varchar(256), 
INFANT_HEALTH_WEIGHT_0_POUNDS varchar(256), 
INFANT_HEALTH_WEIGHT_1_OUNCES varchar(256), 
INFANT_HEALTH_WEIGHT_1_OZ varchar(256), 
INFANT_HEALTH_WEIGHT_1_PERCENT varchar(256), 
INFANT_HEALTH_WEIGHT_1_REPORT varchar(256), 
INFANT_HOME_0_TOTAL varchar(256), 
INFANT_HOME_1_ACCEPTANCE varchar(256), 
INFANT_HOME_1_EXPERIENCE varchar(256), 
INFANT_HOME_1_INVOLVEMENT varchar(256), 
INFANT_HOME_1_LEARNING varchar(256), 
INFANT_HOME_1_ORGANIZATION varchar(256), 
INFANT_HOME_1_RESPONSIVITY varchar(256), 
INFANT_INSURANCE varchar(256), 
INFANT_INSURANCE_OTHER varchar(256), 
INFANT_INSURANCE_TYPE varchar(256), 
INFANT_PERSONAL_0_NAME_FIRST varchar(256), 
INFANT_PERSONAL_0_NAME_LAST varchar(256), 
INFANT_PERSONAL_0_SSN varchar(256), 
INFANT_SOCIAL_SERVICES_0_REFERRAL varchar(256), 
INFANT_SOCIAL_SERVICES_1_NHV_REASON1 varchar(256), 
INFANT_SOCIAL_SERVICES_1_NHV_REASON1_OTHER varchar(256), 
INFANT_SOCIAL_SERVICES_1_NHV_REASON2 varchar(256), 
INFANT_SOCIAL_SERVICES_1_NHV_REASON2_OTHER varchar(256), 
INFANT_SOCIAL_SERVICES_1_NHV_REASON3 varchar(256), 
INFANT_SOCIAL_SERVICES_1_NHV_REASON3_OTHER varchar(256), 
INFANT_SOCIAL_SERVICES_1_NHV_REFDATE1 varchar(256), 
INFANT_SOCIAL_SERVICES_1_NHV_REFDATE2 varchar(256), 
INFANT_SOCIAL_SERVICES_1_NHV_REFDATE3 varchar(256), 
INFANT_SOCIAL_SERVICES_1_NHV_REFERRAL varchar(256), 
INFANT_SOCIAL_SERVICES_1_REASON1 varchar(256), 
INFANT_SOCIAL_SERVICES_1_REASON1_OTHER varchar(256), 
INFANT_SOCIAL_SERVICES_1_REASON2 varchar(256), 
INFANT_SOCIAL_SERVICES_1_REASON2_OTHER varchar(256), 
INFANT_SOCIAL_SERVICES_1_REASON3 varchar(256), 
INFANT_SOCIAL_SERVICES_1_REASON3_OTHER varchar(256), 
INFANT_SOCIAL_SERVICES_1_REFDATE1 varchar(256), 
INFANT_SOCIAL_SERVICES_1_REFDATE2 varchar(256), 
INFANT_SOCIAL_SERVICES_1_REFDATE3 varchar(256), 
NURSE_PERSONAL_0_NAME varchar(256)
)
as
begin

insert into @result
select 
  
    fr.survey_response_id     as SurveyResponseID,
    1                         as ElementsProcessed,
    sq.master_survey_id       as SurveyID,
    dk.date_actual            as SurveyDate,
    xp.source_auditdate       as AuditDate,
    dc.client_key             as CL_EN_GEN_ID,
    xp.site_id                as SiteID,
    xp.programid              as ProgramID, 
    dn.nurse_id               as IA_StaffID,
    dc.client_id              as ClientID,
    null                      as RespondentID,
	max(case sq.pseudonym when 'CLIENT_0_ID_AGENCY ' then  secured_value else null end) as CLIENT_0_ID_AGENCY,
	max(case sq.pseudonym when 'CLIENT_0_ID_NSO ' then  secured_value else null end) as CLIENT_0_ID_NSO,
	max(case sq.pseudonym when 'CLIENT_PERSONAL_0_NAME_FIRST ' then  secured_value else null end) as CLIENT_PERSONAL_0_NAME_FIRST,
	max(case sq.pseudonym when 'CLIENT_PERSONAL_0_NAME_LAST ' then  secured_value else null end) as CLIENT_PERSONAL_0_NAME_LAST,
	max(case sq.pseudonym when 'INFANT_0_ID_NSO ' then  secured_value else null end) as INFANT_0_ID_NSO,
	max(case sq.pseudonym when 'INFANT_AGES_STAGES_0_VERSION ' then  secured_value else null end) as INFANT_AGES_STAGES_0_VERSION,
	max(case sq.pseudonym when 'INFANT_AGES_STAGES_1_COMM ' then  secured_value else null end) as INFANT_AGES_STAGES_1_COMM,
	max(case sq.pseudonym when 'INFANT_AGES_STAGES_1_FMOTOR ' then  secured_value else null end) as INFANT_AGES_STAGES_1_FMOTOR,
	max(case sq.pseudonym when 'INFANT_AGES_STAGES_1_GMOTOR ' then  secured_value else null end) as INFANT_AGES_STAGES_1_GMOTOR,
	max(case sq.pseudonym when 'INFANT_AGES_STAGES_1_PSOCIAL ' then  secured_value else null end) as INFANT_AGES_STAGES_1_PSOCIAL,
	max(case sq.pseudonym when 'INFANT_AGES_STAGES_1_PSOLVE ' then  secured_value else null end) as INFANT_AGES_STAGES_1_PSOLVE,
	max(case sq.pseudonym when 'INFANT_AGES_STAGES_SE_0_EMOTIONAL ' then  secured_value else null end) as INFANT_AGES_STAGES_SE_0_EMOTIONAL,
	max(case sq.pseudonym when 'INFANT_AGES_STAGES_SE_VERSION ' then  secured_value else null end) as INFANT_AGES_STAGES_SE_VERSION,
	max(case sq.pseudonym when 'INFANT_BIRTH_0_DOB ' then  secured_value else null end) as INFANT_BIRTH_0_DOB,
	max(case sq.pseudonym when 'INFANT_BIRTH_COSLEEP ' then  secured_value else null end) as INFANT_BIRTH_COSLEEP,
	max(case sq.pseudonym when 'INFANT_BIRTH_READ ' then  secured_value else null end) as INFANT_BIRTH_READ,
	max(case sq.pseudonym when 'INFANT_BIRTH_SLEEP_BACK ' then  secured_value else null end) as INFANT_BIRTH_SLEEP_BACK,
	max(case sq.pseudonym when 'INFANT_BIRTH_SLEEP_BEDDING ' then  secured_value else null end) as INFANT_BIRTH_SLEEP_BEDDING,
	max(case sq.pseudonym when 'INFANT_BREASTMILK_0_EVER_IHC ' then  secured_value else null end) as INFANT_BREASTMILK_0_EVER_IHC,
	max(case sq.pseudonym when 'INFANT_BREASTMILK_1_AGE_STOP ' then  secured_value else null end) as INFANT_BREASTMILK_1_AGE_STOP,
	max(case sq.pseudonym when 'INFANT_BREASTMILK_1_CONT ' then  secured_value else null end) as INFANT_BREASTMILK_1_CONT,
	max(case sq.pseudonym when 'INFANT_BREASTMILK_1_EXCLUSIVE_WKS ' then  secured_value else null end) as INFANT_BREASTMILK_1_EXCLUSIVE_WKS,
	max(case sq.pseudonym when 'INFANT_BREASTMILK_1_WEEK_STOP ' then  secured_value else null end) as INFANT_BREASTMILK_1_WEEK_STOP,
	max(case sq.pseudonym when 'INFANT_HEALTH_DENTAL_SOURCE ' then  secured_value else null end) as INFANT_HEALTH_DENTAL_SOURCE,
	max(case sq.pseudonym when 'INFANT_HEALTH_DENTIST ' then  secured_value else null end) as INFANT_HEALTH_DENTIST,
	max(case sq.pseudonym when 'INFANT_HEALTH_DENTIST_STILL_EBF ' then  secured_value else null end) as INFANT_HEALTH_DENTIST_STILL_EBF,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_0_HAD_VISIT ' then  secured_value else null end) as INFANT_HEALTH_ER_0_HAD_VISIT,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_DATE1 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INGEST_DATE1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_DATE2 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INGEST_DATE2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_DATE3 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INGEST_DATE3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_DAYS1 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INGEST_DAYS1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_DAYS2 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INGEST_DAYS2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_DAYS3 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INGEST_DAYS3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_ERvsUC1 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INGEST_ERvsUC1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_ERvsUC2 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INGEST_ERvsUC2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_ERvsUC3 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INGEST_ERvsUC3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_TREAT1 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INGEST_TREAT1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_TREAT2 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INGEST_TREAT2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_TREAT3 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INGEST_TREAT3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_DATE1 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INJ_DATE1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_DATE2 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INJ_DATE2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_DATE3 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INJ_DATE3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_DAYS1 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INJ_DAYS1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_DAYS2 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INJ_DAYS2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_DAYS3 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INJ_DAYS3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_ERvsUC1 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INJ_ERvsUC1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_ERvsUC2 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INJ_ERvsUC2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_ERvsUC3 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INJ_ERvsUC3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_TREAT1 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INJ_TREAT1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_TREAT2 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INJ_TREAT2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_TREAT3 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_INJ_TREAT3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_OTHER ' then  secured_value else null end) as INFANT_HEALTH_ER_1_OTHER,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_OTHER_ERvsUC1 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_OTHER_ERvsUC1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_OTHER_ERvsUC2 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_OTHER_ERvsUC2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_OTHER_ERvsUC3 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_OTHER_ERvsUC3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_OTHER_REASON1 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_OTHER_REASON1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_OTHER_REASON2 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_OTHER_REASON2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_OTHER_REASON3 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_OTHER_REASON3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_OTHERDT1 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_OTHERDT1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_OTHERDT2 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_OTHERDT2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_OTHERDT3 ' then  secured_value else null end) as INFANT_HEALTH_ER_1_OTHERDT3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_TYPE ' then  secured_value else null end) as INFANT_HEALTH_ER_1_TYPE,
	max(case sq.pseudonym when 'INFANT_HEALTH_HEAD_0_CIRC_INCHES ' then  secured_value else null end) as INFANT_HEALTH_HEAD_0_CIRC_INCHES,
	max(case sq.pseudonym when 'INFANT_HEALTH_HEAD_1_REPORT ' then  secured_value else null end) as INFANT_HEALTH_HEAD_1_REPORT,
	max(case sq.pseudonym when 'INFANT_HEALTH_HEIGHT_0_INCHES ' then  secured_value else null end) as INFANT_HEALTH_HEIGHT_0_INCHES,
	max(case sq.pseudonym when 'INFANT_HEALTH_HEIGHT_1_PERCENT ' then  secured_value else null end) as INFANT_HEALTH_HEIGHT_1_PERCENT,
	max(case sq.pseudonym when 'INFANT_HEALTH_HEIGHT_1_REPORT ' then  secured_value else null end) as INFANT_HEALTH_HEIGHT_1_REPORT,
	max(case sq.pseudonym when 'INFANT_HEALTH_HOSP_0_HAD_VISIT ' then  secured_value else null end) as INFANT_HEALTH_HOSP_0_HAD_VISIT,
	max(case sq.pseudonym when 'INFANT_HEALTH_HOSP_1_INGEST_DATE1 ' then  secured_value else null end) as INFANT_HEALTH_HOSP_1_INGEST_DATE1,
	max(case sq.pseudonym when 'INFANT_HEALTH_HOSP_1_INGEST_DATE2 ' then  secured_value else null end) as INFANT_HEALTH_HOSP_1_INGEST_DATE2,
	max(case sq.pseudonym when 'INFANT_HEALTH_HOSP_1_INGEST_DATE3 ' then  secured_value else null end) as INFANT_HEALTH_HOSP_1_INGEST_DATE3,
	max(case sq.pseudonym when 'INFANT_HEALTH_HOSP_1_INJ_DATE1 ' then  secured_value else null end) as INFANT_HEALTH_HOSP_1_INJ_DATE1,
	max(case sq.pseudonym when 'INFANT_HEALTH_HOSP_1_INJ_DATE2 ' then  secured_value else null end) as INFANT_HEALTH_HOSP_1_INJ_DATE2,
	max(case sq.pseudonym when 'INFANT_HEALTH_HOSP_1_INJ_DATE3 ' then  secured_value else null end) as INFANT_HEALTH_HOSP_1_INJ_DATE3,
	max(case sq.pseudonym when 'INFANT_HEALTH_HOSP_1_TYPE ' then  secured_value else null end) as INFANT_HEALTH_HOSP_1_TYPE,
	max(case sq.pseudonym when 'INFANT_HEALTH_IMMUNIZ_0_UPDATE ' then  secured_value else null end) as INFANT_HEALTH_IMMUNIZ_0_UPDATE,
	max(case sq.pseudonym when 'INFANT_HEALTH_IMMUNIZ_1_RECORD ' then  secured_value else null end) as INFANT_HEALTH_IMMUNIZ_1_RECORD,
	max(case sq.pseudonym when 'INFANT_HEALTH_IMMUNIZ_UPDATE_NO ' then  secured_value else null end) as INFANT_HEALTH_IMMUNIZ_UPDATE_NO,
	max(case sq.pseudonym when 'INFANT_HEALTH_IMMUNIZ_UPDATE_YES ' then  secured_value else null end) as INFANT_HEALTH_IMMUNIZ_UPDATE_YES,
	max(case sq.pseudonym when 'INFANT_HEALTH_LEAD_0_TEST ' then  secured_value else null end) as INFANT_HEALTH_LEAD_0_TEST,
	max(case sq.pseudonym when 'INFANT_HEALTH_NO_ASQ_COMM ' then  secured_value else null end) as INFANT_HEALTH_NO_ASQ_COMM,
	max(case sq.pseudonym when 'INFANT_HEALTH_NO_ASQ_FINE ' then  secured_value else null end) as INFANT_HEALTH_NO_ASQ_FINE,
	max(case sq.pseudonym when 'INFANT_HEALTH_NO_ASQ_GROSS ' then  secured_value else null end) as INFANT_HEALTH_NO_ASQ_GROSS,
	max(case sq.pseudonym when 'INFANT_HEALTH_NO_ASQ_PERSONAL ' then  secured_value else null end) as INFANT_HEALTH_NO_ASQ_PERSONAL,
	max(case sq.pseudonym when 'INFANT_HEALTH_NO_ASQ_PROBLEM ' then  secured_value else null end) as INFANT_HEALTH_NO_ASQ_PROBLEM,
	max(case sq.pseudonym when 'INFANT_HEALTH_NO_ASQ_TOTAL ' then  secured_value else null end) as INFANT_HEALTH_NO_ASQ_TOTAL,
	max(case sq.pseudonym when 'INFANT_HEALTH_PROVIDER_0_APPT ' then  secured_value else null end) as INFANT_HEALTH_PROVIDER_0_APPT,
	max(case sq.pseudonym when 'INFANT_HEALTH_PROVIDER_0_APPT_DETAILSR2 ' then  secured_value else null end) as INFANT_HEALTH_PROVIDER_0_APPT_DETAILSR2,
	max(case sq.pseudonym when 'INFANT_HEALTH_PROVIDER_0_APPT_R2 ' then  secured_value else null end) as INFANT_HEALTH_PROVIDER_0_APPT_R2,
	max(case sq.pseudonym when 'INFANT_HEALTH_PROVIDER_0_PRIMARY ' then  secured_value else null end) as INFANT_HEALTH_PROVIDER_0_PRIMARY,
	max(case sq.pseudonym when 'INFANT_HEALTH_WEIGHT_0_POUNDS ' then  secured_value else null end) as INFANT_HEALTH_WEIGHT_0_POUNDS,
	max(case sq.pseudonym when 'INFANT_HEALTH_WEIGHT_1_OUNCES ' then  secured_value else null end) as INFANT_HEALTH_WEIGHT_1_OUNCES,
	max(case sq.pseudonym when 'INFANT_HEALTH_WEIGHT_1_OZ ' then  secured_value else null end) as INFANT_HEALTH_WEIGHT_1_OZ,
	max(case sq.pseudonym when 'INFANT_HEALTH_WEIGHT_1_PERCENT ' then  secured_value else null end) as INFANT_HEALTH_WEIGHT_1_PERCENT,
	max(case sq.pseudonym when 'INFANT_HEALTH_WEIGHT_1_REPORT ' then  secured_value else null end) as INFANT_HEALTH_WEIGHT_1_REPORT,
	max(case sq.pseudonym when 'INFANT_HOME_0_TOTAL ' then  secured_value else null end) as INFANT_HOME_0_TOTAL,
	max(case sq.pseudonym when 'INFANT_HOME_1_ACCEPTANCE ' then  secured_value else null end) as INFANT_HOME_1_ACCEPTANCE,
	max(case sq.pseudonym when 'INFANT_HOME_1_EXPERIENCE ' then  secured_value else null end) as INFANT_HOME_1_EXPERIENCE,
	max(case sq.pseudonym when 'INFANT_HOME_1_INVOLVEMENT ' then  secured_value else null end) as INFANT_HOME_1_INVOLVEMENT,
	max(case sq.pseudonym when 'INFANT_HOME_1_LEARNING ' then  secured_value else null end) as INFANT_HOME_1_LEARNING,
	max(case sq.pseudonym when 'INFANT_HOME_1_ORGANIZATION ' then  secured_value else null end) as INFANT_HOME_1_ORGANIZATION,
	max(case sq.pseudonym when 'INFANT_HOME_1_RESPONSIVITY ' then  secured_value else null end) as INFANT_HOME_1_RESPONSIVITY,
	max(case sq.pseudonym when 'INFANT_INSURANCE ' then  secured_value else null end) as INFANT_INSURANCE,
	max(case sq.pseudonym when 'INFANT_INSURANCE_OTHER ' then  secured_value else null end) as INFANT_INSURANCE_OTHER,
	max(case sq.pseudonym when 'INFANT_INSURANCE_TYPE ' then  secured_value else null end) as INFANT_INSURANCE_TYPE,
	max(case sq.pseudonym when 'INFANT_PERSONAL_0_NAME_FIRST ' then  secured_value else null end) as INFANT_PERSONAL_0_NAME_FIRST,
	max(case sq.pseudonym when 'INFANT_PERSONAL_0_NAME_LAST ' then  secured_value else null end) as INFANT_PERSONAL_0_NAME_LAST,
	max(case sq.pseudonym when 'INFANT_PERSONAL_0_SSN ' then  secured_value else null end) as INFANT_PERSONAL_0_SSN,
	max(case sq.pseudonym when 'INFANT_SOCIAL_SERVICES_0_REFERRAL ' then  secured_value else null end) as INFANT_SOCIAL_SERVICES_0_REFERRAL,
	max(case sq.pseudonym when 'INFANT_SOCIAL_SERVICES_1_NHV_REASON1 ' then  secured_value else null end) as INFANT_SOCIAL_SERVICES_1_NHV_REASON1,
	max(case sq.pseudonym when 'INFANT_SOCIAL_SERVICES_1_NHV_REASON1_OTHER ' then  secured_value else null end) as INFANT_SOCIAL_SERVICES_1_NHV_REASON1_OTHER,
	max(case sq.pseudonym when 'INFANT_SOCIAL_SERVICES_1_NHV_REASON2 ' then  secured_value else null end) as INFANT_SOCIAL_SERVICES_1_NHV_REASON2,
	max(case sq.pseudonym when 'INFANT_SOCIAL_SERVICES_1_NHV_REASON2_OTHER ' then  secured_value else null end) as INFANT_SOCIAL_SERVICES_1_NHV_REASON2_OTHER,
	max(case sq.pseudonym when 'INFANT_SOCIAL_SERVICES_1_NHV_REASON3 ' then  secured_value else null end) as INFANT_SOCIAL_SERVICES_1_NHV_REASON3,
	max(case sq.pseudonym when 'INFANT_SOCIAL_SERVICES_1_NHV_REASON3_OTHER ' then  secured_value else null end) as INFANT_SOCIAL_SERVICES_1_NHV_REASON3_OTHER,
	max(case sq.pseudonym when 'INFANT_SOCIAL_SERVICES_1_NHV_REFDATE1 ' then  secured_value else null end) as INFANT_SOCIAL_SERVICES_1_NHV_REFDATE1,
	max(case sq.pseudonym when 'INFANT_SOCIAL_SERVICES_1_NHV_REFDATE2 ' then  secured_value else null end) as INFANT_SOCIAL_SERVICES_1_NHV_REFDATE2,
	max(case sq.pseudonym when 'INFANT_SOCIAL_SERVICES_1_NHV_REFDATE3 ' then  secured_value else null end) as INFANT_SOCIAL_SERVICES_1_NHV_REFDATE3,
	max(case sq.pseudonym when 'INFANT_SOCIAL_SERVICES_1_NHV_REFERRAL ' then  secured_value else null end) as INFANT_SOCIAL_SERVICES_1_NHV_REFERRAL,
	max(case sq.pseudonym when 'INFANT_SOCIAL_SERVICES_1_REASON1 ' then  secured_value else null end) as INFANT_SOCIAL_SERVICES_1_REASON1,
	max(case sq.pseudonym when 'INFANT_SOCIAL_SERVICES_1_REASON1_OTHER ' then  secured_value else null end) as INFANT_SOCIAL_SERVICES_1_REASON1_OTHER,
	max(case sq.pseudonym when 'INFANT_SOCIAL_SERVICES_1_REASON2 ' then  secured_value else null end) as INFANT_SOCIAL_SERVICES_1_REASON2,
	max(case sq.pseudonym when 'INFANT_SOCIAL_SERVICES_1_REASON2_OTHER ' then  secured_value else null end) as INFANT_SOCIAL_SERVICES_1_REASON2_OTHER,
	max(case sq.pseudonym when 'INFANT_SOCIAL_SERVICES_1_REASON3 ' then  secured_value else null end) as INFANT_SOCIAL_SERVICES_1_REASON3,
	max(case sq.pseudonym when 'INFANT_SOCIAL_SERVICES_1_REASON3_OTHER ' then  secured_value else null end) as INFANT_SOCIAL_SERVICES_1_REASON3_OTHER,
	max(case sq.pseudonym when 'INFANT_SOCIAL_SERVICES_1_REFDATE1 ' then  secured_value else null end) as INFANT_SOCIAL_SERVICES_1_REFDATE1,
	max(case sq.pseudonym when 'INFANT_SOCIAL_SERVICES_1_REFDATE2 ' then  secured_value else null end) as INFANT_SOCIAL_SERVICES_1_REFDATE2,
	max(case sq.pseudonym when 'INFANT_SOCIAL_SERVICES_1_REFDATE3 ' then  secured_value else null end) as INFANT_SOCIAL_SERVICES_1_REFDATE3,
	max(case sq.pseudonym when 'NURSE_PERSONAL_0_NAME ' then  secured_value else null end) as NURSE_PERSONAL_0_NAME


    from survey_views.f_secure_fact_survey_response('Infant Health Care',@p_requested_security_policy,@p_export_profile_id) fr  
   
    inner join dim_survey_question      sq on fr.survey_question_key          = sq.survey_question_key
    inner join  dim_date                dk on fr.survey_date_key              = dk.date_key
    inner join  xref_organization       xo on fr.organization_key             = xo.organization_key
    inner join  xref_program            xp on xo.programid                    = xp.programid
    inner join  dim_client              dc on dc.client_key                   = fr.client_key
    left  join  dim_nurse               dn on dn.nurse_key                    = fr.nurse_key -- all fsr have nurse id's?

	  
  group by 
  
    fr.survey_response_id,
    sq.master_survey_id, 
    dk.date_actual,     
    xp.source_auditdate,
    dc.client_key,
    xp.site_id,  
    xp.programid,
    dn.nurse_id,
    dc.client_id;

return;
end

GO
