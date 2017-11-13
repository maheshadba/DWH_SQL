USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [survey_views].[ASQ_3] as

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
	max(case sq.pseudonym when 'INFANT_0_ID_NSO ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_0_ID_NSO,
	max(case sq.pseudonym when 'INFANT_AGES_STAGES_1_COMM ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_AGES_STAGES_1_COMM,
	max(case sq.pseudonym when 'INFANT_AGES_STAGES_1_FMOTOR ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_AGES_STAGES_1_FMOTOR,
	max(case sq.pseudonym when 'INFANT_AGES_STAGES_1_GMOTOR ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_AGES_STAGES_1_GMOTOR,
	max(case sq.pseudonym when 'INFANT_AGES_STAGES_1_PSOCIAL ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_AGES_STAGES_1_PSOCIAL,
	max(case sq.pseudonym when 'INFANT_AGES_STAGES_1_PSOLVE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_AGES_STAGES_1_PSOLVE,
	max(case sq.pseudonym when 'INFANT_HEALTH_NO_ASQ_COMM ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_NO_ASQ_COMM,
	max(case sq.pseudonym when 'INFANT_HEALTH_NO_ASQ_FINE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_NO_ASQ_FINE,
	max(case sq.pseudonym when 'INFANT_HEALTH_NO_ASQ_GROSS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_NO_ASQ_GROSS,
	max(case sq.pseudonym when 'INFANT_HEALTH_NO_ASQ_PERSONAL ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_NO_ASQ_PERSONAL,
	max(case sq.pseudonym when 'INFANT_HEALTH_NO_ASQ_PROBLEM ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as INFANT_HEALTH_NO_ASQ_PROBLEM,
	max(case sq.pseudonym when 'NURSE_PERSONAL_0_NAME ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_PERSONAL_0_NAME

   from fact_survey_response fr  
   
    inner join dim_survey_question      sq on fr.survey_question_key          = sq.survey_question_key
    inner join  dim_date                dk on fr.survey_date_key              = dk.date_key
    inner join  xref_organization       xo on fr.organization_key             = xo.organization_key
    inner join  xref_program            xp on xo.programid                    = xp.programid
    inner join  dim_client              dc on dc.client_key                   = fr.client_key
    left  join  dim_nurse               dn on dn.nurse_key                    = fr.nurse_key -- all fsr have nurse id's?
  
  where 
    sq.survey_name = 'ASQ-3'
  
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
