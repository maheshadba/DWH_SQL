USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [survey_views].[Client_Funding_Source] as
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
	max(case sq.pseudonym when 'CLIENT_FUNDING_0_SOURCE_MIECHVP_COM ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_0_SOURCE_MIECHVP_COM,
	max(case sq.pseudonym when 'CLIENT_FUNDING_0_SOURCE_MIECHVP_FORM ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_0_SOURCE_MIECHVP_FORM,
	max(case sq.pseudonym when 'CLIENT_FUNDING_0_SOURCE_MIECHVP_TRIBAL ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_0_SOURCE_MIECHVP_TRIBAL,
	max(case sq.pseudonym when 'CLIENT_FUNDING_0_SOURCE_OTHER1 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_0_SOURCE_OTHER1,
	max(case sq.pseudonym when 'CLIENT_FUNDING_0_SOURCE_OTHER2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_0_SOURCE_OTHER2,
	max(case sq.pseudonym when 'CLIENT_FUNDING_0_SOURCE_OTHER3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_0_SOURCE_OTHER3,
	max(case sq.pseudonym when 'CLIENT_FUNDING_0_SOURCE_OTHER4 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_0_SOURCE_OTHER4,
	max(case sq.pseudonym when 'CLIENT_FUNDING_0_SOURCE_OTHER5 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_0_SOURCE_OTHER5,
	max(case sq.pseudonym when 'CLIENT_FUNDING_0_SOURCE_OTHER6 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_0_SOURCE_OTHER6,
	max(case sq.pseudonym when 'CLIENT_FUNDING_0_SOURCE_PFS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_0_SOURCE_PFS,
	max(case sq.pseudonym when 'CLIENT_FUNDING_1_END_MIECHVP_COM ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_1_END_MIECHVP_COM,
	max(case sq.pseudonym when 'CLIENT_FUNDING_1_END_MIECHVP_FORM ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_1_END_MIECHVP_FORM,
	max(case sq.pseudonym when 'CLIENT_FUNDING_1_END_MIECHVP_TRIBAL ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_1_END_MIECHVP_TRIBAL,
	max(case sq.pseudonym when 'CLIENT_FUNDING_1_END_OTHER1 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_1_END_OTHER1,
	max(case sq.pseudonym when 'CLIENT_FUNDING_1_END_OTHER2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_1_END_OTHER2,
	max(case sq.pseudonym when 'CLIENT_FUNDING_1_END_OTHER3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_1_END_OTHER3,
	max(case sq.pseudonym when 'CLIENT_FUNDING_1_END_OTHER4 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_1_END_OTHER4,
	max(case sq.pseudonym when 'CLIENT_FUNDING_1_END_OTHER5 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_1_END_OTHER5,
	max(case sq.pseudonym when 'CLIENT_FUNDING_1_END_OTHER6 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_1_END_OTHER6,
	max(case sq.pseudonym when 'CLIENT_FUNDING_1_END_PFS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_1_END_PFS,
	max(case sq.pseudonym when 'CLIENT_FUNDING_1_START_MIECHVP_COM ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_1_START_MIECHVP_COM,
	max(case sq.pseudonym when 'CLIENT_FUNDING_1_START_MIECHVP_FORM ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_1_START_MIECHVP_FORM,
	max(case sq.pseudonym when 'CLIENT_FUNDING_1_START_MIECHVP_TRIBAL ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_1_START_MIECHVP_TRIBAL,
	max(case sq.pseudonym when 'CLIENT_FUNDING_1_START_OTHER1 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_1_START_OTHER1,
	max(case sq.pseudonym when 'CLIENT_FUNDING_1_START_OTHER2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_1_START_OTHER2,
	max(case sq.pseudonym when 'CLIENT_FUNDING_1_START_OTHER3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_1_START_OTHER3,
	max(case sq.pseudonym when 'CLIENT_FUNDING_1_START_OTHER4 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_1_START_OTHER4,
	max(case sq.pseudonym when 'CLIENT_FUNDING_1_START_OTHER5 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_1_START_OTHER5,
	max(case sq.pseudonym when 'CLIENT_FUNDING_1_START_OTHER6 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_1_START_OTHER6,
	max(case sq.pseudonym when 'CLIENT_FUNDING_1_START_PFS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_FUNDING_1_START_PFS,
	max(case sq.pseudonym when 'NURSE_PERSONAL_0_NAME ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_PERSONAL_0_NAME

   from fact_survey_response fr  
   
    inner join dim_survey_question      sq on fr.survey_question_key          = sq.survey_question_key
    inner join  dim_date                dk on fr.survey_date_key              = dk.date_key
    inner join  xref_organization       xo on fr.organization_key             = xo.organization_key
    inner join  xref_program            xp on xo.programid                    = xp.programid
    inner join  dim_client              dc on dc.client_key                   = fr.client_key
    left  join  dim_nurse               dn on dn.nurse_key                    = fr.nurse_key -- all fsr have nurse id's?
  
  where 
    sq.survey_name = 'Client Funding Source'
  
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
