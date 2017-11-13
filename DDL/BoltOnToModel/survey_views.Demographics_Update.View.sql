USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [survey_views].[Demographics_Update] as
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
	max(case sq.pseudonym when 'ADULTS_1_CARE_10 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_CARE_10,
max(case sq.pseudonym when 'ADULTS_1_CARE_20 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_CARE_20,
max(case sq.pseudonym when 'ADULTS_1_CARE_30 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_CARE_30,
max(case sq.pseudonym when 'ADULTS_1_CARE_40 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_CARE_40,
max(case sq.pseudonym when 'ADULTS_1_CARE_LESS10 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_CARE_LESS10,
max(case sq.pseudonym when 'ADULTS_1_COMPLETE_GED ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_COMPLETE_GED,
max(case sq.pseudonym when 'ADULTS_1_COMPLETE_HS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_COMPLETE_HS,
max(case sq.pseudonym when 'ADULTS_1_COMPLETE_HS_NO ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_COMPLETE_HS_NO,
max(case sq.pseudonym when 'ADULTS_1_ED_ASSOCIATE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_ED_ASSOCIATE,
max(case sq.pseudonym when 'ADULTS_1_ED_BACHELOR ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_ED_BACHELOR,
max(case sq.pseudonym when 'ADULTS_1_ED_MASTER ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_ED_MASTER,
max(case sq.pseudonym when 'ADULTS_1_ED_NONE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_ED_NONE,
max(case sq.pseudonym when 'ADULTS_1_ED_POSTGRAD ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_ED_POSTGRAD,
max(case sq.pseudonym when 'ADULTS_1_ED_SOME_COLLEGE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_ED_SOME_COLLEGE,
max(case sq.pseudonym when 'ADULTS_1_ED_TECH ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_ED_TECH,
max(case sq.pseudonym when 'ADULTS_1_ED_UNKNOWN ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_ED_UNKNOWN,
max(case sq.pseudonym when 'ADULTS_1_ENROLL_FT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_ENROLL_FT,
max(case sq.pseudonym when 'ADULTS_1_ENROLL_NO ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_ENROLL_NO,
max(case sq.pseudonym when 'ADULTS_1_ENROLL_PT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_ENROLL_PT,
max(case sq.pseudonym when 'ADULTS_1_INS_NO ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_INS_NO,
max(case sq.pseudonym when 'ADULTS_1_INS_PRIVATE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_INS_PRIVATE,
max(case sq.pseudonym when 'ADULTS_1_INS_PUBLIC ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_INS_PUBLIC,
max(case sq.pseudonym when 'ADULTS_1_WORK_10 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_WORK_10,
max(case sq.pseudonym when 'ADULTS_1_WORK_20 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_WORK_20,
max(case sq.pseudonym when 'ADULTS_1_WORK_37 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_WORK_37,
max(case sq.pseudonym when 'ADULTS_1_WORK_LESS10 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_WORK_LESS10,
max(case sq.pseudonym when 'ADULTS_1_WORK_UNEMPLOY ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as ADULTS_1_WORK_UNEMPLOY,
max(case sq.pseudonym when 'CLIENT_0_ID_AGENCY ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_0_ID_AGENCY,
max(case sq.pseudonym when 'CLIENT_0_ID_NSO ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_0_ID_NSO,
max(case sq.pseudonym when 'CLIENT_BC_0_USED_6MONTHS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_BC_0_USED_6MONTHS,
max(case sq.pseudonym when 'CLIENT_BC_1_FREQUENCY ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_BC_1_FREQUENCY,
max(case sq.pseudonym when 'CLIENT_BC_1_NOT_USED_REASON ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_BC_1_NOT_USED_REASON,
max(case sq.pseudonym when 'CLIENT_BC_1_TYPES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_BC_1_TYPES,
max(case sq.pseudonym when 'CLIENT_BC_1_TYPES_NEXT6 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_BC_1_TYPES_NEXT6,
max(case sq.pseudonym when 'CLIENT_BIO_DAD_0_CONTACT_WITH ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_BIO_DAD_0_CONTACT_WITH,
max(case sq.pseudonym when 'CLIENT_BIO_DAD_1_TIME_WITH ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_BIO_DAD_1_TIME_WITH,
max(case sq.pseudonym when 'CLIENT_CARE_0_ER ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_ER,
max(case sq.pseudonym when 'CLIENT_CARE_0_ER_FEVER_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_ER_FEVER_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_ER_HOSP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_ER_HOSP,
max(case sq.pseudonym when 'CLIENT_CARE_0_ER_INFECTION_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_ER_INFECTION_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_ER_INGESTION_ACCIDENT_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_ER_INGESTION_ACCIDENT_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_ER_INGESTION_DECLINE_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_ER_INGESTION_DECLINE_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_ER_INGESTION_INTENT_OTHER_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_ER_INGESTION_INTENT_OTHER_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_ER_INGESTION_SELF_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_ER_INGESTION_SELF_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_ER_INGESTION_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_ER_INGESTION_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_ER_INJURY_ACCIDENT_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_ER_INJURY_ACCIDENT_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_ER_INJURY_DECLINE_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_ER_INJURY_DECLINE_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_ER_INJURY_INTENT_OTHER_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_ER_INJURY_INTENT_OTHER_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_ER_INJURY_SELF_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_ER_INJURY_SELF_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_ER_INJURY_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_ER_INJURY_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_ER_OTHER ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_ER_OTHER,
max(case sq.pseudonym when 'CLIENT_CARE_0_ER_OTHER_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_ER_OTHER_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_ER_PURPOSE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_ER_PURPOSE,
max(case sq.pseudonym when 'CLIENT_CARE_0_ER_PURPOSE_R6 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_ER_PURPOSE_R6,
max(case sq.pseudonym when 'CLIENT_CARE_0_ER_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_ER_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_URGENT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_URGENT,
max(case sq.pseudonym when 'CLIENT_CARE_0_URGENT_FEVER_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_URGENT_FEVER_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_URGENT_INFECTION_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_URGENT_INFECTION_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_URGENT_INGESTION_ACCIDENT_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_URGENT_INGESTION_ACCIDENT_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_URGENT_INGESTION_DECLINE_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_URGENT_INGESTION_DECLINE_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_URGENT_INGESTION_INTENT_OTHER_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_URGENT_INGESTION_INTENT_OTHER_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_URGENT_INGESTION_SELF_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_URGENT_INGESTION_SELF_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_URGENT_INGESTION_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_URGENT_INGESTION_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_URGENT_INJURY_ACCIDENT_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_URGENT_INJURY_ACCIDENT_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_URGENT_INJURY_DECLINE_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_URGENT_INJURY_DECLINE_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_URGENT_INJURY_INTENT_OTHER_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_URGENT_INJURY_INTENT_OTHER_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_URGENT_INJURY_SELF_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_URGENT_INJURY_SELF_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_URGENT_INJURY_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_URGENT_INJURY_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_URGENT_OTHER ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_URGENT_OTHER,
max(case sq.pseudonym when 'CLIENT_CARE_0_URGENT_OTHER_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_URGENT_OTHER_TIMES,
max(case sq.pseudonym when 'CLIENT_CARE_0_URGENT_PURPOSE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_URGENT_PURPOSE,
max(case sq.pseudonym when 'CLIENT_CARE_0_URGENT_PURPOSE_R6 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_URGENT_PURPOSE_R6,
max(case sq.pseudonym when 'CLIENT_CARE_0_URGENT_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_CARE_0_URGENT_TIMES,
max(case sq.pseudonym when 'CLIENT_ED_PROG_TYPE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_ED_PROG_TYPE,
max(case sq.pseudonym when 'CLIENT_EDUCATION_0_HS_GED ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_EDUCATION_0_HS_GED,
max(case sq.pseudonym when 'CLIENT_EDUCATION_1_ENROLLED_CURRENT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_EDUCATION_1_ENROLLED_CURRENT,
max(case sq.pseudonym when 'CLIENT_EDUCATION_1_ENROLLED_FTPT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_EDUCATION_1_ENROLLED_FTPT,
max(case sq.pseudonym when 'CLIENT_EDUCATION_1_ENROLLED_PLAN ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_EDUCATION_1_ENROLLED_PLAN,
max(case sq.pseudonym when 'CLIENT_EDUCATION_1_ENROLLED_PT_HRS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_EDUCATION_1_ENROLLED_PT_HRS,
max(case sq.pseudonym when 'CLIENT_EDUCATION_1_ENROLLED_TYPE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_EDUCATION_1_ENROLLED_TYPE,
max(case sq.pseudonym when 'CLIENT_EDUCATION_1_HIGHER_EDUC_COMP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_EDUCATION_1_HIGHER_EDUC_COMP,
max(case sq.pseudonym when 'CLIENT_EDUCATION_1_HS_GED_LAST_GRADE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_EDUCATION_1_HS_GED_LAST_GRADE,
max(case sq.pseudonym when 'CLIENT_INCOME_0_HH_INCOME ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_INCOME_0_HH_INCOME,
max(case sq.pseudonym when 'CLIENT_INCOME_1_HH_SOURCES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_INCOME_1_HH_SOURCES,
max(case sq.pseudonym when 'CLIENT_INCOME_1_LOW_INCOME_QUALIFY ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_INCOME_1_LOW_INCOME_QUALIFY,
max(case sq.pseudonym when 'CLIENT_INCOME_AMOUNT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_INCOME_AMOUNT,
max(case sq.pseudonym when 'CLIENT_INCOME_IN_KIND ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_INCOME_IN_KIND,
max(case sq.pseudonym when 'CLIENT_INCOME_INKIND_OTHER ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_INCOME_INKIND_OTHER,
max(case sq.pseudonym when 'CLIENT_INCOME_OTHER_SOURCES  ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_INCOME_OTHER_SOURCES ,
max(case sq.pseudonym when 'CLIENT_INCOME_SOURCES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_INCOME_SOURCES,
max(case sq.pseudonym when 'CLIENT_INSURANCE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_INSURANCE,
max(case sq.pseudonym when 'CLIENT_INSURANCE_OTHER ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_INSURANCE_OTHER,
max(case sq.pseudonym when 'CLIENT_INSURANCE_TYPE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_INSURANCE_TYPE,
max(case sq.pseudonym when 'CLIENT_LIVING_0_WITH ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_LIVING_0_WITH,
max(case sq.pseudonym when 'CLIENT_LIVING_1_WITH_OTHERS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_LIVING_1_WITH_OTHERS,
max(case sq.pseudonym when 'CLIENT_LIVING_HOMELESS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_LIVING_HOMELESS,
max(case sq.pseudonym when 'CLIENT_LIVING_WHERE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_LIVING_WHERE,
max(case sq.pseudonym when 'CLIENT_MARITAL_0_STATUS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_MARITAL_0_STATUS,
max(case sq.pseudonym when 'CLIENT_MILITARY ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_MILITARY,
max(case sq.pseudonym when 'CLIENT_PERSONAL_0_DOB_INTAKE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_PERSONAL_0_DOB_INTAKE,
max(case sq.pseudonym when 'CLIENT_PERSONAL_0_NAME_FIRST ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_PERSONAL_0_NAME_FIRST,
max(case sq.pseudonym when 'CLIENT_PERSONAL_0_NAME_LAST ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_PERSONAL_0_NAME_LAST,
max(case sq.pseudonym when 'CLIENT_PROVIDE_CHILDCARE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_PROVIDE_CHILDCARE,
max(case sq.pseudonym when 'CLIENT_SCHOOL_MIDDLE_HS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_SCHOOL_MIDDLE_HS,
max(case sq.pseudonym when 'CLIENT_SECOND_0_CHILD_DOB ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_SECOND_0_CHILD_DOB,
max(case sq.pseudonym when 'CLIENT_SECOND_1_CHILD_BW_CONVERT_GRAMS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_SECOND_1_CHILD_BW_CONVERT_GRAMS,
max(case sq.pseudonym when 'CLIENT_SECOND_1_CHILD_BW_GRAMS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_SECOND_1_CHILD_BW_GRAMS,
max(case sq.pseudonym when 'CLIENT_SECOND_1_CHILD_BW_MEASURE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_SECOND_1_CHILD_BW_MEASURE,
max(case sq.pseudonym when 'CLIENT_SECOND_1_CHILD_BW_OZ ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_SECOND_1_CHILD_BW_OZ,
max(case sq.pseudonym when 'CLIENT_SECOND_1_CHILD_BW_POUNDS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_SECOND_1_CHILD_BW_POUNDS,
max(case sq.pseudonym when 'CLIENT_SECOND_1_CHILD_GENDER ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_SECOND_1_CHILD_GENDER,
max(case sq.pseudonym when 'CLIENT_SECOND_1_CHILD_NICU ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_SECOND_1_CHILD_NICU,
max(case sq.pseudonym when 'CLIENT_SECOND_1_CHILD_NICU_DAYS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_SECOND_1_CHILD_NICU_DAYS,
max(case sq.pseudonym when 'CLIENT_SUBPREG ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_SUBPREG,
max(case sq.pseudonym when 'CLIENT_SUBPREG_0_BEEN_PREGNANT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_SUBPREG_0_BEEN_PREGNANT,
max(case sq.pseudonym when 'CLIENT_SUBPREG_1_BEGIN_MONTH ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_SUBPREG_1_BEGIN_MONTH,
max(case sq.pseudonym when 'CLIENT_SUBPREG_1_BEGIN_YEAR ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_SUBPREG_1_BEGIN_YEAR,
max(case sq.pseudonym when 'CLIENT_SUBPREG_1_EDD ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_SUBPREG_1_EDD,
max(case sq.pseudonym when 'CLIENT_SUBPREG_1_GEST_AGE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_SUBPREG_1_GEST_AGE,
max(case sq.pseudonym when 'CLIENT_SUBPREG_1_OUTCOME ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_SUBPREG_1_OUTCOME,
max(case sq.pseudonym when 'CLIENT_SUBPREG_1_PLANNED ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_SUBPREG_1_PLANNED,
max(case sq.pseudonym when 'CLIENT_WORKING_0_CURRENTLY_WORKING ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_WORKING_0_CURRENTLY_WORKING,
max(case sq.pseudonym when 'CLIENT_WORKING_1_CURRENTLY_WORKING_HRS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_WORKING_1_CURRENTLY_WORKING_HRS,
max(case sq.pseudonym when 'CLIENT_WORKING_1_CURRENTLY_WORKING_NO ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_WORKING_1_CURRENTLY_WORKING_NO,
max(case sq.pseudonym when 'CLIENT_WORKING_1_WORKED_SINCE_BIRTH ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_WORKING_1_WORKED_SINCE_BIRTH,
max(case sq.pseudonym when 'CLIENT_WORKING_1_WORKED_SINCE_BIRTH_MONTHS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_WORKING_1_WORKED_SINCE_BIRTH_MONTHS,
max(case sq.pseudonym when 'NURSE_PERSONAL_0_NAME ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_PERSONAL_0_NAME


   from fact_survey_response fr  
   
    inner join dim_survey_question      sq on fr.survey_question_key          = sq.survey_question_key
    inner join  dim_date                dk on fr.survey_date_key              = dk.date_key
    inner join  xref_organization       xo on fr.organization_key             = xo.organization_key
    inner join  xref_program            xp on xo.programid                    = xp.programid
    inner join  dim_client              dc on dc.client_key                   = fr.client_key
    left  join  dim_nurse               dn on dn.nurse_key                    = fr.nurse_key -- all fsr have nurse id's?
  
  where 
    sq.survey_name = 'Demographics Update'
  
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
