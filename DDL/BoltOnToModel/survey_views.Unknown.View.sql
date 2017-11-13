USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [survey_views].[Unknown] as
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
	max(case sq.pseudonym when 'GHP_Client_DOB ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as GHP_Client_DOB,
max(case sq.pseudonym when 'GHP_Client_FName ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as GHP_Client_FName,
max(case sq.pseudonym when 'GHP_Client_LName ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as GHP_Client_LName,
max(case sq.pseudonym when 'GHP_Client_PlanEnd ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as GHP_Client_PlanEnd,
max(case sq.pseudonym when 'GHP_Client_PlanStart ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as GHP_Client_PlanStart,
max(case sq.pseudonym when 'GHP_Infant_DOB ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as GHP_Infant_DOB,
max(case sq.pseudonym when 'GHP_Infant_FName ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as GHP_Infant_FName,
max(case sq.pseudonym when 'GHP_Infant_LName ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as GHP_Infant_LName,
max(case sq.pseudonym when 'GHP_Infant_PlanEnd ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as GHP_Infant_PlanEnd,
max(case sq.pseudonym when 'GHP_Infant_PlanStart ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as GHP_Infant_PlanStart,
max(case sq.pseudonym when 'HSH_Client_DOB ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as HSH_Client_DOB,
max(case sq.pseudonym when 'HSH_Client_FName ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as HSH_Client_FName,
max(case sq.pseudonym when 'HSH_Client_LName ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as HSH_Client_LName,
max(case sq.pseudonym when 'HSH_Client_PlanEnd ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as HSH_Client_PlanEnd,
max(case sq.pseudonym when 'HSH_Client_PlanStart  ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as HSH_Client_PlanStart ,
max(case sq.pseudonym when 'HSH_Infant_DOB ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as HSH_Infant_DOB,
max(case sq.pseudonym when 'HSH_Infant_FName ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as HSH_Infant_FName,
max(case sq.pseudonym when 'HSH_Infant_LName ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as HSH_Infant_LName,
max(case sq.pseudonym when 'HSH_Infant_PlanEnd ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as HSH_Infant_PlanEnd,
max(case sq.pseudonym when 'HSH_Infant_PlanStart ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as HSH_Infant_PlanStart,
max(case sq.pseudonym when 'NEW_HIRE_0_ACCESS_LEVEL ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_0_ACCESS_LEVEL,
max(case sq.pseudonym when 'NEW_HIRE_0_EDUC_COMPLETED ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_0_EDUC_COMPLETED,
max(case sq.pseudonym when 'NEW_HIRE_0_EMAIL ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_0_EMAIL,
max(case sq.pseudonym when 'NEW_HIRE_0_FTE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_0_FTE,
max(case sq.pseudonym when 'NEW_HIRE_0_HIRE_DATE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_0_HIRE_DATE,
max(case sq.pseudonym when 'NEW_HIRE_0_NAME_LAST ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_0_NAME_LAST,
max(case sq.pseudonym when 'NEW_HIRE_0_PHONE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_0_PHONE,
max(case sq.pseudonym when 'NEW_HIRE_0_PREVIOUS_NFP_WORK ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_0_PREVIOUS_NFP_WORK,
max(case sq.pseudonym when 'NEW_HIRE_0_REASON_FOR_HIRE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_0_REASON_FOR_HIRE,
max(case sq.pseudonym when 'NEW_HIRE_0_REASON_FOR_HIRE_REPLACE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_0_REASON_FOR_HIRE_REPLACE,
max(case sq.pseudonym when 'NEW_HIRE_0_REASON_NFP_WORK_DESC ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_0_REASON_NFP_WORK_DESC,
max(case sq.pseudonym when 'NEW_HIRE_0_START_DATE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_0_START_DATE,
max(case sq.pseudonym when 'NEW_HIRE_0_TEAM_NAME ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_0_TEAM_NAME,
max(case sq.pseudonym when 'NEW_HIRE_1_NAME_FIRST ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_1_NAME_FIRST,
max(case sq.pseudonym when 'NEW_HIRE_1_ROLE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_1_ROLE,
max(case sq.pseudonym when 'NEW_HIRE_ADDRESS_0_ZIP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_ADDRESS_0_ZIP,
max(case sq.pseudonym when 'NEW_HIRE_ADDRESS_1_CITY ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_ADDRESS_1_CITY,
max(case sq.pseudonym when 'NEW_HIRE_ADDRESS_1_STATE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_ADDRESS_1_STATE,
max(case sq.pseudonym when 'NEW_HIRE_ADDRESS_1_STREET ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_ADDRESS_1_STREET,
max(case sq.pseudonym when 'NEW_HIRE_SUP_0_EMAIL ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_SUP_0_EMAIL,
max(case sq.pseudonym when 'NEW_HIRE_SUP_0_NAME ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_SUP_0_NAME,
max(case sq.pseudonym when 'NEW_HIRE_SUP_0_PHONE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NEW_HIRE_SUP_0_PHONE

   from fact_survey_response fr  
   
    inner join dim_survey_question      sq on fr.survey_question_key          = sq.survey_question_key
    inner join  dim_date                dk on fr.survey_date_key              = dk.date_key
    inner join  xref_organization       xo on fr.organization_key             = xo.organization_key
    inner join  xref_program            xp on xo.programid                    = xp.programid
    inner join  dim_client              dc on dc.client_key                   = fr.client_key
    left  join  dim_nurse               dn on dn.nurse_key                    = fr.nurse_key -- all fsr have nurse id's?
  
  where 
    sq.survey_name = 'Unknown'
  
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
