USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [survey_views].[WA_MIECHV_Supplemental_HVEF] as
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
max(case sq.pseudonym when 'CLIENT_O_ID_NSO ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_O_ID_NSO,
max(case sq.pseudonym when 'CLIENT_PERSONAL_O_DOB_INTAKE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_PERSONAL_O_DOB_INTAKE,
max(case sq.pseudonym when 'CLIENT_PERSONAL_O_NAME_FIRST ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_PERSONAL_O_NAME_FIRST,
max(case sq.pseudonym when 'CLIENT_PERSONAL_O_NAME_LAST ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_PERSONAL_O_NAME_LAST,
max(case sq.pseudonym when 'NURSE_PERSONAL_0_NAME ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_PERSONAL_0_NAME,
max(case sq.pseudonym when 'WA_HVEF_SUPPLEMENT_DELAYED_PREG ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as WA_HVEF_SUPPLEMENT_DELAYED_PREG,
max(case sq.pseudonym when 'WA_HVEF_SUPPLEMENT_IPV ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as WA_HVEF_SUPPLEMENT_IPV
   from fact_survey_response fr  
   
    inner join dim_survey_question      sq on fr.survey_question_key          = sq.survey_question_key
    inner join  dim_date                dk on fr.survey_date_key              = dk.date_key
    inner join  xref_organization       xo on fr.organization_key             = xo.organization_key
    inner join  xref_program            xp on xo.programid                    = xp.programid
    inner join  dim_client              dc on dc.client_key                   = fr.client_key
    left  join  dim_nurse               dn on dn.nurse_key                    = fr.nurse_key -- all fsr have nurse id's?
  
  where 
    sq.survey_name = 'WA MIECHV Supplemental HVEF'
  
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
