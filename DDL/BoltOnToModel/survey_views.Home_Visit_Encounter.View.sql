USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view  [survey_views].[Home_Visit_Encounter] as
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
	max(case sq.pseudonym when 'CLIENT_0_ID_AGENCY ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_0_ID_AGENCY,
	max(case sq.pseudonym when 'CLIENT_0_ID_NSO ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_0_ID_NSO,
	max(case sq.pseudonym when 'CLIENT_ATTENDEES_0_AT_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_ATTENDEES_0_AT_VISIT,
	max(case sq.pseudonym when 'CLIENT_ATTENDEES_0_OTHER_VISIT_DESC ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_ATTENDEES_0_OTHER_VISIT_DESC,
	max(case sq.pseudonym when 'CLIENT_CHILD_DEVELOPMENT_CONCERN ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CHILD_DEVELOPMENT_CONCERN,
	max(case sq.pseudonym when 'CLIENT_CHILD_INJURY_0_PREVENTION ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CHILD_INJURY_0_PREVENTION,
	max(case sq.pseudonym when 'CLIENT_COMPLETE_0_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_COMPLETE_0_VISIT,
	max(case sq.pseudonym when 'CLIENT_CONFLICT_0_CLIENT_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CONFLICT_0_CLIENT_VISIT,
	max(case sq.pseudonym when 'CLIENT_CONFLICT_1_GRNDMTHR_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CONFLICT_1_GRNDMTHR_VISIT,
	max(case sq.pseudonym when 'CLIENT_CONFLICT_1_PARTNER_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CONFLICT_1_PARTNER_VISIT,
	max(case sq.pseudonym when 'CLIENT_CONT_HLTH_INS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CONT_HLTH_INS,
	max(case sq.pseudonym when 'CLIENT_CONTENT_0_PERCENT_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CONTENT_0_PERCENT_VISIT,
	max(case sq.pseudonym when 'CLIENT_DOMAIN_0_ENVIRONHLTH_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_DOMAIN_0_ENVIRONHLTH_VISIT,
	max(case sq.pseudonym when 'CLIENT_DOMAIN_0_FRNDFAM_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_DOMAIN_0_FRNDFAM_VISIT,
	max(case sq.pseudonym when 'CLIENT_DOMAIN_0_LIFECOURSE_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_DOMAIN_0_LIFECOURSE_VISIT,
	max(case sq.pseudonym when 'CLIENT_DOMAIN_0_MATERNAL_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_DOMAIN_0_MATERNAL_VISIT,
	max(case sq.pseudonym when 'CLIENT_DOMAIN_0_PERSHLTH_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_DOMAIN_0_PERSHLTH_VISIT,
	max(case sq.pseudonym when 'CLIENT_DOMAIN_0_TOTAL_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_DOMAIN_0_TOTAL_VISIT,
	max(case sq.pseudonym when 'CLIENT_INVOLVE_0_CLIENT_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_INVOLVE_0_CLIENT_VISIT,
	max(case sq.pseudonym when 'CLIENT_INVOLVE_1_GRNDMTHR_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_INVOLVE_1_GRNDMTHR_VISIT,
	max(case sq.pseudonym when 'CLIENT_INVOLVE_1_PARTNER_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_INVOLVE_1_PARTNER_VISIT,
	max(case sq.pseudonym when 'CLIENT_IPV_0_SAFETY_PLAN ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_IPV_0_SAFETY_PLAN,
	max(case sq.pseudonym when 'CLIENT_LOCATION_0_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_LOCATION_0_VISIT,
	max(case sq.pseudonym when 'CLIENT_NO_REFERRAL ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_NO_REFERRAL,
	max(case sq.pseudonym when 'CLIENT_PERSONAL_0_DOB_INTAKE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_PERSONAL_0_DOB_INTAKE,
	max(case sq.pseudonym when 'CLIENT_PERSONAL_0_NAME_FIRST ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_PERSONAL_0_NAME_FIRST,
	max(case sq.pseudonym when 'CLIENT_PERSONAL_0_NAME_LAST ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_PERSONAL_0_NAME_LAST,
	max(case sq.pseudonym when 'CLIENT_PLANNED_VISIT_SCH ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_PLANNED_VISIT_SCH,
	max(case sq.pseudonym when 'CLIENT_PRENATAL_VISITS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_PRENATAL_VISITS,
	max(case sq.pseudonym when 'CLIENT_PRENATAL_VISITS_WEEKS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_PRENATAL_VISITS_WEEKS,
	max(case sq.pseudonym when 'CLIENT_SCREENED_SRVCS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_SCREENED_SRVCS,
	max(case sq.pseudonym when 'CLIENT_TIME_0_START_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_TIME_0_START_VISIT,
	max(case sq.pseudonym when 'CLIENT_TIME_1_DURATION_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_TIME_1_DURATION_VISIT,
	max(case sq.pseudonym when 'CLIENT_TIME_1_END_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_TIME_1_END_VISIT,
	max(case sq.pseudonym when 'CLIENT_TIME_FROM_AMPM ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_TIME_FROM_AMPM,
	max(case sq.pseudonym when 'CLIENT_TIME_FROM_HR ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_TIME_FROM_HR,
	max(case sq.pseudonym when 'CLIENT_TIME_FROM_MIN ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_TIME_FROM_MIN,
	max(case sq.pseudonym when 'CLIENT_TIME_TO_AMPM ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_TIME_TO_AMPM,
	max(case sq.pseudonym when 'CLIENT_TIME_TO_HR ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_TIME_TO_HR,
	max(case sq.pseudonym when 'CLIENT_TIME_TO_MIN ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_TIME_TO_MIN,
	max(case sq.pseudonym when 'CLIENT_UNDERSTAND_0_CLIENT_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_UNDERSTAND_0_CLIENT_VISIT,
	max(case sq.pseudonym when 'CLIENT_UNDERSTAND_1_GRNDMTHR_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_UNDERSTAND_1_GRNDMTHR_VISIT,
	max(case sq.pseudonym when 'CLIENT_UNDERSTAND_1_PARTNER_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_UNDERSTAND_1_PARTNER_VISIT,
	max(case sq.pseudonym when 'CLIENT_VISIT_SCHEDULE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_VISIT_SCHEDULE,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_0_HAD_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_0_HAD_VISIT,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_DATE1 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INGEST_DATE1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_DATE2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INGEST_DATE2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_DATE3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INGEST_DATE3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_DAYS1 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INGEST_DAYS1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_DAYS2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INGEST_DAYS2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_DAYS3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INGEST_DAYS3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_ERvsUC1 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INGEST_ERvsUC1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_ERvsUC2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INGEST_ERvsUC2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_ERvsUC3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INGEST_ERvsUC3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_TREAT1 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INGEST_TREAT1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_TREAT2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INGEST_TREAT2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INGEST_TREAT3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INGEST_TREAT3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_DATE1 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INJ_DATE1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_DATE2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INJ_DATE2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_DATE3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INJ_DATE3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_DAYS1 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INJ_DAYS1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_DAYS2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INJ_DAYS2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_DAYS3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INJ_DAYS3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_ERvsUC1 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INJ_ERvsUC1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_ERvsUC2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INJ_ERvsUC2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_ERvsUC3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INJ_ERvsUC3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_TREAT1 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INJ_TREAT1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_TREAT2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INJ_TREAT2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_INJ_TREAT3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_INJ_TREAT3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_OTHER ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_OTHER,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_OTHER_ERvsUC1 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_OTHER_ERvsUC1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_OTHER_ERvsUC2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_OTHER_ERvsUC2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_OTHER_ERvsUC3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_OTHER_ERvsUC3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_OTHER_REASON1 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_OTHER_REASON1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_OTHER_REASON2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_OTHER_REASON2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_OTHER_REASON3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_OTHER_REASON3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_OTHERDT1 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_OTHERDT1,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_OTHERDT2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_OTHERDT2,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_OTHERDT3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_OTHERDT3,
	max(case sq.pseudonym when 'INFANT_HEALTH_ER_1_TYPE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_ER_1_TYPE,
	max(case sq.pseudonym when 'INFANT_HEALTH_HOSP_0_HAD_VISIT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_HOSP_0_HAD_VISIT,
	max(case sq.pseudonym when 'INFANT_HEALTH_HOSP_1_INGEST_DATE1 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_HOSP_1_INGEST_DATE1,
	max(case sq.pseudonym when 'INFANT_HEALTH_HOSP_1_INGEST_DATE2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_HOSP_1_INGEST_DATE2,
	max(case sq.pseudonym when 'INFANT_HEALTH_HOSP_1_INGEST_DATE3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_HOSP_1_INGEST_DATE3,
	max(case sq.pseudonym when 'INFANT_HEALTH_HOSP_1_INJ_DATE1 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_HOSP_1_INJ_DATE1,
	max(case sq.pseudonym when 'INFANT_HEALTH_HOSP_1_INJ_DATE2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_HOSP_1_INJ_DATE2,
	max(case sq.pseudonym when 'INFANT_HEALTH_HOSP_1_INJ_DATE3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_HOSP_1_INJ_DATE3,
	max(case sq.pseudonym when 'INFANT_HEALTH_HOSP_1_TYPE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_HOSP_1_TYPE,
	max(case sq.pseudonym when 'INFANT_HEALTH_PROVIDER_0_APPT_DETAILSR2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_PROVIDER_0_APPT_DETAILSR2,
	max(case sq.pseudonym when 'INFANT_HEALTH_PROVIDER_0_APPT_R2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_PROVIDER_0_APPT_R2,
	max(case sq.pseudonym when 'NURSE_MILEAGE_0_VIS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_MILEAGE_0_VIS,
	max(case sq.pseudonym when 'NURSE_PERSONAL_0_NAME ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_PERSONAL_0_NAME


   from fact_survey_response fr  
   
    inner join dim_survey_question      sq on fr.survey_question_key          = sq.survey_question_key
    inner join  dim_date                dk on fr.survey_date_key              = dk.date_key
    inner join  xref_organization       xo on fr.organization_key             = xo.organization_key
    inner join  xref_program            xp on xo.programid                    = xp.programid
    inner join  dim_client              dc on dc.client_key                   = fr.client_key
    left  join  dim_nurse               dn on dn.nurse_key                    = fr.nurse_key -- all fsr have nurse id's?
  
  where 
    sq.survey_name = 'Home Visit Encounter'
  
  group by 
  
    fr.survey_response_id,
    sq.master_survey_id, 
    dk.date_actual,     
    xp.source_auditdate,
    dc.client_key,
    xp.site_id,  
    xp.programid,
    dn.nurse_id,
    dc.client_id
GO
