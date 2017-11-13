USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view  [survey_views].[Referrals_To_NFP_Program] as
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
	max(case sq.pseudonym when 'CLIENT_0_ID_NSO ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_0_ID_NSO,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_0_FOLLOWUP_NURSE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_PROSPECT_0_FOLLOWUP_NURSE,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_0_MARKETING_SOURCE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_PROSPECT_0_MARKETING_SOURCE,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_0_NOTES ' then coalesce(survey_views.f_replace_chars(fr.text_response),cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_PROSPECT_0_NOTES,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_0_SOURCE_CODE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_PROSPECT_0_SOURCE_CODE,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_0_WAIT_LIST ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_PROSPECT_0_WAIT_LIST,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_0_NAME_LAST ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_PROSPECT_DEMO_0_NAME_LAST,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_CELL ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_PROSPECT_DEMO_1_CELL,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_DOB ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_PROSPECT_DEMO_1_DOB,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_EDD ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_PROSPECT_DEMO_1_EDD,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_EMAIL ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_PROSPECT_DEMO_1_EMAIL,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_NAME_FIRST ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_PROSPECT_DEMO_1_NAME_FIRST,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_PHONE_HOME ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_PROSPECT_DEMO_1_PHONE_HOME,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_PLANG ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_PROSPECT_DEMO_1_PLANG,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_STREET ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_PROSPECT_DEMO_1_STREET,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_STREET2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_PROSPECT_DEMO_1_STREET2,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_WORK ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_PROSPECT_DEMO_1_WORK,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_ZIP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_PROSPECT_DEMO_1_ZIP,
	max(case sq.pseudonym when 'REFERRAL_SOURCE_PRIMARY_0_NAME ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_SOURCE_PRIMARY_0_NAME,
	max(case sq.pseudonym when 'REFERRAL_SOURCE_PRIMARY_1_LOCATION ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_SOURCE_PRIMARY_1_LOCATION,
	max(case sq.pseudonym when 'REFERRAL_SOURCE_SECONDARY_0_NAME ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_SOURCE_SECONDARY_0_NAME,
	max(case sq.pseudonym when 'REFERRAL_SOURCE_SECONDARY_1_LOCATION ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as REFERRAL_SOURCE_SECONDARY_1_LOCATION

   from fact_survey_response fr  
   
    inner join dim_survey_question      sq on fr.survey_question_key          = sq.survey_question_key
    inner join  dim_date                dk on fr.survey_date_key              = dk.date_key
    inner join  xref_organization       xo on fr.organization_key             = xo.organization_key
    inner join  xref_program            xp on xo.programid                    = xp.programid
    inner join  dim_client              dc on dc.client_key                   = fr.client_key
    left  join  dim_nurse               dn on dn.nurse_key                    = fr.nurse_key -- all fsr have nurse id's?
  
  where 
    sq.survey_name = 'Referrals To NFP Program'
  
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
