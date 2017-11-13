USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view  [survey_views].[Infant_Birth] as
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
	max(case sq.pseudonym when 'CLIENT_PERSONAL_0_NAME_FIRST ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_PERSONAL_0_NAME_FIRST,
	max(case sq.pseudonym when 'CLIENT_PERSONAL_0_NAME_LAST ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_PERSONAL_0_NAME_LAST,
	max(case sq.pseudonym when 'CLIENT_WEIGHT_0_PREG_GAIN ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_WEIGHT_0_PREG_GAIN,
	max(case sq.pseudonym when 'INFANT_0_ID_NSO ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_0_ID_NSO,
	max(case sq.pseudonym when 'INFANT_0_ID_NSO2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_0_ID_NSO2,
	max(case sq.pseudonym when 'INFANT_0_ID_NSO3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_0_ID_NSO3,
	max(case sq.pseudonym when 'INFANT_BIRTH_0_CLIENT_ER ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_0_CLIENT_ER,
	max(case sq.pseudonym when 'INFANT_BIRTH_0_CLIENT_ER_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_0_CLIENT_ER_TIMES,
	max(case sq.pseudonym when 'INFANT_BIRTH_0_CLIENT_URGENT CARE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as [INFANT_BIRTH_0_CLIENT_URGENT CARE],
	max(case sq.pseudonym when 'INFANT_BIRTH_0_CLIENT_URGENT CARE_TIMES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as [INFANT_BIRTH_0_CLIENT_URGENT CARE_TIMES],
	max(case sq.pseudonym when 'INFANT_BIRTH_0_DOB ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_0_DOB,
	max(case sq.pseudonym when 'INFANT_BIRTH_0_DOB2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_0_DOB2,
	max(case sq.pseudonym when 'INFANT_BIRTH_0_DOB3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_0_DOB3,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_DELIVERY ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_DELIVERY,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_GEST_AGE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_GEST_AGE,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_GEST_AGE2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_GEST_AGE2,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_GEST_AGE3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_GEST_AGE3,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_HEARING_SCREEN ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_HEARING_SCREEN,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_HEARING_SCREEN2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_HEARING_SCREEN2,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_HEARING_SCREEN3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_HEARING_SCREEN3,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_LABOR ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_LABOR,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_MULTIPLE_BIRTHS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_MULTIPLE_BIRTHS,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NEWBORN_SCREEN ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NEWBORN_SCREEN,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NEWBORN_SCREEN2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NEWBORN_SCREEN2,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NEWBORN_SCREEN3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NEWBORN_SCREEN3,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NICU ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NICU,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NICU_DAYS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NICU_DAYS,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NICU_DAYS_R2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NICU_DAYS_R2,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NICU_DAYS_R2_2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NICU_DAYS_R2_2,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NICU_DAYS_R2_3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NICU_DAYS_R2_3,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NICU_DAYS2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NICU_DAYS2,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NICU_DAYS3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NICU_DAYS3,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NICU_NURSERY_PURPOSE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NICU_NURSERY_PURPOSE,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NICU_NURSERY_PURPOSE_OTHER ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NICU_NURSERY_PURPOSE_OTHER,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NICU_NURSERY_PURPOSE_OTHER2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NICU_NURSERY_PURPOSE_OTHER2,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NICU_NURSERY_PURPOSE_OTHER3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NICU_NURSERY_PURPOSE_OTHER3,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NICU_NURSERY_PURPOSE2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NICU_NURSERY_PURPOSE2,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NICU_NURSERY_PURPOSE3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NICU_NURSERY_PURPOSE3,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NICU_R2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NICU_R2,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NICU_R2_2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NICU_R2_2,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NICU_R2_3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NICU_R2_3,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NICU2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NICU2,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NICU3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NICU3,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NURSERY_DAYS_R2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NURSERY_DAYS_R2,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NURSERY_DAYS_R2_2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NURSERY_DAYS_R2_2,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NURSERY_DAYS_R2_3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NURSERY_DAYS_R2_3,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NURSERY_R2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NURSERY_R2,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NURSERY_R2_2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NURSERY_R2_2,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_NURSERY_R2_3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_NURSERY_R2_3,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_WEIGHT_CONVERT_GRAMS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_WEIGHT_CONVERT_GRAMS,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_WEIGHT_CONVERT_GRAMS2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_WEIGHT_CONVERT_GRAMS2,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_WEIGHT_CONVERT_GRAMS3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_WEIGHT_CONVERT_GRAMS3,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_WEIGHT_GRAMS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_WEIGHT_GRAMS,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_WEIGHT_GRAMS2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_WEIGHT_GRAMS2,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_WEIGHT_GRAMS3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_WEIGHT_GRAMS3,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_WEIGHT_MEASURE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_WEIGHT_MEASURE,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_WEIGHT_MEASURE2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_WEIGHT_MEASURE2,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_WEIGHT_MEASURE3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_WEIGHT_MEASURE3,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_WEIGHT_OUNCES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_WEIGHT_OUNCES,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_WEIGHT_OUNCES2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_WEIGHT_OUNCES2,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_WEIGHT_OUNCES3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_WEIGHT_OUNCES3,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_WEIGHT_POUNDS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_WEIGHT_POUNDS,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_WEIGHT_POUNDS2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_WEIGHT_POUNDS2,
	max(case sq.pseudonym when 'INFANT_BIRTH_1_WEIGHT_POUNDS3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_1_WEIGHT_POUNDS3,
	max(case sq.pseudonym when 'INFANT_BIRTH_COSLEEP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_COSLEEP,
	max(case sq.pseudonym when 'INFANT_BIRTH_COSLEEP2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_COSLEEP2,
	max(case sq.pseudonym when 'INFANT_BIRTH_COSLEEP3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_COSLEEP3,
	max(case sq.pseudonym when 'INFANT_BIRTH_READ ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_READ,
	max(case sq.pseudonym when 'INFANT_BIRTH_READ2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_READ2,
	max(case sq.pseudonym when 'INFANT_BIRTH_READ3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_READ3,
	max(case sq.pseudonym when 'INFANT_BIRTH_SLEEP_BACK ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_SLEEP_BACK,
	max(case sq.pseudonym when 'INFANT_BIRTH_SLEEP_BACK2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_SLEEP_BACK2,
	max(case sq.pseudonym when 'INFANT_BIRTH_SLEEP_BACK3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_SLEEP_BACK3,
	max(case sq.pseudonym when 'INFANT_BIRTH_SLEEP_BEDDING ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_SLEEP_BEDDING,
	max(case sq.pseudonym when 'INFANT_BIRTH_SLEEP_BEDDING2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_SLEEP_BEDDING2,
	max(case sq.pseudonym when 'INFANT_BIRTH_SLEEP_BEDDING3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BIRTH_SLEEP_BEDDING3,
	max(case sq.pseudonym when 'INFANT_BREASTMILK_0_EVER_BIRTH ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BREASTMILK_0_EVER_BIRTH,
	max(case sq.pseudonym when 'INFANT_BREASTMILK_0_EVER_BIRTH2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BREASTMILK_0_EVER_BIRTH2,
	max(case sq.pseudonym when 'INFANT_BREASTMILK_0_EVER_BIRTH3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_BREASTMILK_0_EVER_BIRTH3,
	max(case sq.pseudonym when 'INFANT_INSURANCE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_INSURANCE,
	max(case sq.pseudonym when 'INFANT_INSURANCE_OTHER ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_INSURANCE_OTHER,
	max(case sq.pseudonym when 'INFANT_INSURANCE_OTHER2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_INSURANCE_OTHER2,
	max(case sq.pseudonym when 'INFANT_INSURANCE_OTHER3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_INSURANCE_OTHER3,
	max(case sq.pseudonym when 'INFANT_INSURANCE_TYPE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_INSURANCE_TYPE,
	max(case sq.pseudonym when 'INFANT_INSURANCE_TYPE2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_INSURANCE_TYPE2,
	max(case sq.pseudonym when 'INFANT_INSURANCE_TYPE3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_INSURANCE_TYPE3,
	max(case sq.pseudonym when 'INFANT_INSURANCE2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_INSURANCE2,
	max(case sq.pseudonym when 'INFANT_INSURANCE3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_INSURANCE3,
	max(case sq.pseudonym when 'INFANT_PERSONAL_0_ETHNICITY ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_PERSONAL_0_ETHNICITY,
	max(case sq.pseudonym when 'INFANT_PERSONAL_0_ETHNICITY2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_PERSONAL_0_ETHNICITY2,
	max(case sq.pseudonym when 'INFANT_PERSONAL_0_ETHNICITY3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_PERSONAL_0_ETHNICITY3,
	max(case sq.pseudonym when 'INFANT_PERSONAL_0_FIRST NAME ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as [INFANT_PERSONAL_0_FIRST NAME],
	max(case sq.pseudonym when 'INFANT_PERSONAL_0_FIRST NAME2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as [INFANT_PERSONAL_0_FIRST NAME2],
	max(case sq.pseudonym when 'INFANT_PERSONAL_0_FIRST NAME3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as [INFANT_PERSONAL_0_FIRST NAME3],
	max(case sq.pseudonym when 'INFANT_PERSONAL_0_GENDER ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_PERSONAL_0_GENDER,
	max(case sq.pseudonym when 'INFANT_PERSONAL_0_GENDER2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_PERSONAL_0_GENDER2,
	max(case sq.pseudonym when 'INFANT_PERSONAL_0_GENDER3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_PERSONAL_0_GENDER3,
	max(case sq.pseudonym when 'INFANT_PERSONAL_0_LAST NAME ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as [INFANT_PERSONAL_0_LAST NAME],
	max(case sq.pseudonym when 'INFANT_PERSONAL_0_RACE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_PERSONAL_0_RACE,
	max(case sq.pseudonym when 'INFANT_PERSONAL_0_RACE2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_PERSONAL_0_RACE2,
	max(case sq.pseudonym when 'INFANT_PERSONAL_0_RACE3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_PERSONAL_0_RACE3,
	max(case sq.pseudonym when 'NURSE_PERSONAL_0_NAME ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_PERSONAL_0_NAME


   from fact_survey_response fr  
   
    inner join dim_survey_question      sq on fr.survey_question_key          = sq.survey_question_key
    inner join  dim_date                dk on fr.survey_date_key              = dk.date_key
    inner join  xref_organization       xo on fr.organization_key             = xo.organization_key
    inner join  xref_program            xp on xo.programid                    = xp.programid
    inner join  dim_client              dc on dc.client_key                   = fr.client_key
    left  join  dim_nurse               dn on dn.nurse_key                    = fr.nurse_key -- all fsr have nurse id's?
  
  where 
    sq.survey_name = 'Infant Birth'
  
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
