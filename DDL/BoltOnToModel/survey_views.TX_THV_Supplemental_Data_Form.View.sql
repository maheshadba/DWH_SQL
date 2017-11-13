USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [survey_views].[TX_THV_Supplemental_Data_Form] as
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
	max(case sq.pseudonym when 'CLIENT_0_ID_AGENCY ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_0_ID_AGENCY,
max(case sq.pseudonym when 'CLIENT_0_ID_NSO ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_0_ID_NSO,
max(case sq.pseudonym when 'CLIENT_PERSONAL_0_DOB_INTAKE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_PERSONAL_0_DOB_INTAKE,
max(case sq.pseudonym when 'CLIENT_PERSONAL_0_NAME_FIRST ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_PERSONAL_0_NAME_FIRST,
max(case sq.pseudonym when 'CLIENT_PERSONAL_0_NAME_LAST ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as CLIENT_PERSONAL_0_NAME_LAST,
max(case sq.pseudonym when 'MIECHV_BIRTH_SPACING_SIX_MO_PP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_BIRTH_SPACING_SIX_MO_PP,
max(case sq.pseudonym when 'MIECHV_BIRTH_SPACING_THIRD_TRI ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_BIRTH_SPACING_THIRD_TRI,
max(case sq.pseudonym when 'MIECHV_INTAKE_COMM_REF ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_INTAKE_COMM_REF,
max(case sq.pseudonym when 'MIECHV_PFS_CHILD_DEV_12_12MO_PP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_PFS_CHILD_DEV_12_12MO_PP,
max(case sq.pseudonym when 'MIECHV_PFS_CHILD_DEV_12_2MO_PP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_PFS_CHILD_DEV_12_2MO_PP,
max(case sq.pseudonym when 'MIECHV_PFS_CHILD_DEV_13_12MO_PP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_PFS_CHILD_DEV_13_12MO_PP,
max(case sq.pseudonym when 'MIECHV_PFS_CHILD_DEV_13_2MO_PP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_PFS_CHILD_DEV_13_2MO_PP,
max(case sq.pseudonym when 'MIECHV_PFS_CHILD_DEV_14_12MO_PP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_PFS_CHILD_DEV_14_12MO_PP,
max(case sq.pseudonym when 'MIECHV_PFS_CHILD_DEV_14_2MO_PP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_PFS_CHILD_DEV_14_2MO_PP,
max(case sq.pseudonym when 'MIECHV_PFS_CHILD_DEV_15_12MO_PP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_PFS_CHILD_DEV_15_12MO_PP,
max(case sq.pseudonym when 'MIECHV_PFS_CHILD_DEV_15_2MO_PP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_PFS_CHILD_DEV_15_2MO_PP,
max(case sq.pseudonym when 'MIECHV_PFS_CHILD_DEV_16_12MO_PP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_PFS_CHILD_DEV_16_12MO_PP,
max(case sq.pseudonym when 'MIECHV_PFS_CHILD_DEV_16_2MO_PP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_PFS_CHILD_DEV_16_2MO_PP,
max(case sq.pseudonym when 'MIECHV_PFS_CONCRETE_12MO_PP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_PFS_CONCRETE_12MO_PP,
max(case sq.pseudonym when 'MIECHV_PFS_CONCRETE_INTAKE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_PFS_CONCRETE_INTAKE,
max(case sq.pseudonym when 'MIECHV_PFS_FAMILY_12MO_PP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_PFS_FAMILY_12MO_PP,
max(case sq.pseudonym when 'MIECHV_PFS_FAMILY_INTAKE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_PFS_FAMILY_INTAKE,
max(case sq.pseudonym when 'MIECHV_PFS_NURTURE_12MO_PP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_PFS_NURTURE_12MO_PP,
max(case sq.pseudonym when 'MIECHV_PFS_NURTURE_2MO_PP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_PFS_NURTURE_2MO_PP,
max(case sq.pseudonym when 'MIECHV_PFS_SOCIAL_12MO_PP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_PFS_SOCIAL_12MO_PP,
max(case sq.pseudonym when 'MIECHV_PFS_SOCIAL_INTAKE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_PFS_SOCIAL_INTAKE,
max(case sq.pseudonym when 'MIECHV_READ_12MO_PP_1 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_READ_12MO_PP_1,
max(case sq.pseudonym when 'MIECHV_READ_12MO_PP_2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_READ_12MO_PP_2,
max(case sq.pseudonym when 'MIECHV_READ_12MO_PP_3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_READ_12MO_PP_3,
max(case sq.pseudonym when 'MIECHV_READ_2MO_PP_1 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_READ_2MO_PP_1,
max(case sq.pseudonym when 'MIECHV_READ_2MO_PP_2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_READ_2MO_PP_2,
max(case sq.pseudonym when 'MIECHV_READ_2MO_PP_3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_READ_2MO_PP_3,
max(case sq.pseudonym when 'MIECHV_READ_IID_12MO_PP_1 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_READ_IID_12MO_PP_1,
max(case sq.pseudonym when 'MIECHV_READ_IID_12MO_PP_2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_READ_IID_12MO_PP_2,
max(case sq.pseudonym when 'MIECHV_READ_IID_12MO_PP_3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_READ_IID_12MO_PP_3,
max(case sq.pseudonym when 'MIECHV_READ_IID_2MO_PP_1 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_READ_IID_2MO_PP_1,
max(case sq.pseudonym when 'MIECHV_READ_IID_2MO_PP_2 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_READ_IID_2MO_PP_2,
max(case sq.pseudonym when 'MIECHV_READ_IID_2MO_PP_3 ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_READ_IID_2MO_PP_3,
max(case sq.pseudonym when 'MIECHV_SUPPORTED_BY_INCOME_12MO_PP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_SUPPORTED_BY_INCOME_12MO_PP,
max(case sq.pseudonym when 'MIECHV_SUPPORTED_BY_INCOME_INTAKE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as MIECHV_SUPPORTED_BY_INCOME_INTAKE,
max(case sq.pseudonym when 'NURSE_PERSONAL_0_NAME ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_PERSONAL_0_NAME,
max(case sq.pseudonym when 'TX_FUNDING_SOURCE_12MO_PP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as TX_FUNDING_SOURCE_12MO_PP,
max(case sq.pseudonym when 'TX_FUNDING_SOURCE_2MO_PP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as TX_FUNDING_SOURCE_2MO_PP,
max(case sq.pseudonym when 'TX_FUNDING_SOURCE_6MO_PP ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as TX_FUNDING_SOURCE_6MO_PP,
max(case sq.pseudonym when 'TX_FUNDING_SOURCE_INTAKE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as TX_FUNDING_SOURCE_INTAKE,
max(case sq.pseudonym when 'TX_FUNDING_SOURCE_THIRD_TRI ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as TX_FUNDING_SOURCE_THIRD_TRI

   from fact_survey_response fr  
   
    inner join dim_survey_question      sq on fr.survey_question_key          = sq.survey_question_key
    inner join  dim_date                dk on fr.survey_date_key              = dk.date_key
    inner join  xref_organization       xo on fr.organization_key             = xo.organization_key
    inner join  xref_program            xp on xo.programid                    = xp.programid
    inner join  dim_client              dc on dc.client_key                   = fr.client_key
    left  join  dim_nurse               dn on dn.nurse_key                    = fr.nurse_key -- all fsr have nurse id's?
  
  where 
    sq.survey_name = 'TX_THV Supplemental Data Form'
  
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
