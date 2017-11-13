USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view  [survey_views].[Nurse_Assessment] as
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
	max(case sq.pseudonym when 'NURSE_ASSESS_ DATA_0_USES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as [NURSE_ASSESS_ DATA_0_USES],
max(case sq.pseudonym when 'NURSE_ASSESS_ DATA_1_USES_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as [NURSE_ASSESS_ DATA_1_USES_CMT],
max(case sq.pseudonym when 'NURSE_ASSESS_6DOMAINS_0_UTILIZES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_6DOMAINS_0_UTILIZES,
max(case sq.pseudonym when 'NURSE_ASSESS_6DOMAINS_1_UTILIZES_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_6DOMAINS_1_UTILIZES_CMT,
max(case sq.pseudonym when 'NURSE_ASSESS_ADAPTS_PRACTICE_0_TO_CULTURE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_ADAPTS_PRACTICE_0_TO_CULTURE,
max(case sq.pseudonym when 'NURSE_ASSESS_ADAPTS_PRACTICE_0_TO_CULTURE_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_ADAPTS_PRACTICE_0_TO_CULTURE_CMT,
max(case sq.pseudonym when 'NURSE_ASSESS_BOUNDARIES_0_THERAPEUTIC ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_BOUNDARIES_0_THERAPEUTIC,
max(case sq.pseudonym when 'NURSE_ASSESS_BOUNDARIES_0_THERAPEUTIC_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_BOUNDARIES_0_THERAPEUTIC_CMT,
max(case sq.pseudonym when 'NURSE_ASSESS_CARE_0_SELF ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_CARE_0_SELF,
max(case sq.pseudonym when 'NURSE_ASSESS_CARE_0_SELF_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_CARE_0_SELF_CMT,
max(case sq.pseudonym when 'NURSE_ASSESS_COMMUNITY_0_RELATIONSHIPS_PARTNERS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_COMMUNITY_0_RELATIONSHIPS_PARTNERS,
max(case sq.pseudonym when 'NURSE_ASSESS_COMMUNITY_0_RELATIONSHIPS_PARTNERS_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_COMMUNITY_0_RELATIONSHIPS_PARTNERS_CMT,
max(case sq.pseudonym when 'NURSE_ASSESS_CONTRIBUTES_0_TO_TEAM ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_CONTRIBUTES_0_TO_TEAM,
max(case sq.pseudonym when 'NURSE_ASSESS_CONTRIBUTES_0_TO_TEAM_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_CONTRIBUTES_0_TO_TEAM_CMT,
max(case sq.pseudonym when 'NURSE_ASSESS_CULTURE_0_IMPACT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_CULTURE_0_IMPACT,
max(case sq.pseudonym when 'NURSE_ASSESS_CULTURE_0_IMPACT_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_CULTURE_0_IMPACT_CMT,
max(case sq.pseudonym when 'NURSE_ASSESS_DOCUMENTATION_0_TIMELY ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_DOCUMENTATION_0_TIMELY,
max(case sq.pseudonym when 'NURSE_ASSESS_DOCUMENTATION_0_TIMELY_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_DOCUMENTATION_0_TIMELY_CMT,
max(case sq.pseudonym when 'NURSE_ASSESS_FIDELITY_0_PRACTICES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_FIDELITY_0_PRACTICES,
max(case sq.pseudonym when 'NURSE_ASSESS_FIDELITY_0_PRACTICES_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_FIDELITY_0_PRACTICES_CMT,
max(case sq.pseudonym when 'NURSE_ASSESS_GOALS_0_SETTING_ACHIEVING ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_GOALS_0_SETTING_ACHIEVING,
max(case sq.pseudonym when 'NURSE_ASSESS_GOALS_0_SETTING_ACHIEVING_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_GOALS_0_SETTING_ACHIEVING_CMT,
max(case sq.pseudonym when 'NURSE_ASSESS_GUIDELINES_0_ADAPTS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_GUIDELINES_0_ADAPTS,
max(case sq.pseudonym when 'NURSE_ASSESS_GUIDELINES_0_ADAPTS_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_GUIDELINES_0_ADAPTS_CMT,
max(case sq.pseudonym when 'NURSE_ASSESS_MOTIVATIONAL_0_INTERVIEW_TECHNIQUES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_MOTIVATIONAL_0_INTERVIEW_TECHNIQUES,
max(case sq.pseudonym when 'NURSE_ASSESS_MOTIVATIONAL_0_INTERVIEW_TECHNIQUES_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_MOTIVATIONAL_0_INTERVIEW_TECHNIQUES_CMT,
max(case sq.pseudonym when 'NURSE_ASSESS_PRIORITIES_0_EST_MNG_TIME ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_PRIORITIES_0_EST_MNG_TIME,
max(case sq.pseudonym when 'NURSE_ASSESS_PRIORITIES_0_EST_MNG_TIME_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_PRIORITIES_0_EST_MNG_TIME_CMT,
max(case sq.pseudonym when 'NURSE_ASSESS_QUALITIES_0_THERAPEUTIC ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_QUALITIES_0_THERAPEUTIC,
max(case sq.pseudonym when 'NURSE_ASSESS_QUALITIES_0_THERAPEUTIC_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_QUALITIES_0_THERAPEUTIC_CMT,
max(case sq.pseudonym when 'NURSE_ASSESS_REFLECTION_0_SELF ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_REFLECTION_0_SELF,
max(case sq.pseudonym when 'NURSE_ASSESS_REFLECTION_0_SELF_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_REFLECTION_0_SELF_CMT,
max(case sq.pseudonym when 'NURSE_ASSESS_REGULAR_0_SUPERVISION ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_REGULAR_0_SUPERVISION,
max(case sq.pseudonym when 'NURSE_ASSESS_REGULAR_0_SUPERVISION_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_REGULAR_0_SUPERVISION_CMT,
max(case sq.pseudonym when 'NURSE_ASSESS_RELATIONSHIPS_0_THERAPEUTIC ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_RELATIONSHIPS_0_THERAPEUTIC,
max(case sq.pseudonym when 'NURSE_ASSESS_RELATIONSHIPS_0_THERAPEUTIC_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_RELATIONSHIPS_0_THERAPEUTIC_CMT,
max(case sq.pseudonym when 'NURSE_ASSESS_RESOURCES_0_IDENTIFY_UTILIZE ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_RESOURCES_0_IDENTIFY_UTILIZE,
max(case sq.pseudonym when 'NURSE_ASSESS_RESOURCES_0_IDENTIFY_UTILIZE_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_RESOURCES_0_IDENTIFY_UTILIZE_CMT,
max(case sq.pseudonym when 'NURSE_ASSESS_SELF_ADVOCACY_0_BUILD ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_SELF_ADVOCACY_0_BUILD,
max(case sq.pseudonym when 'NURSE_ASSESS_SELF_ADVOCACY_0_BUILD_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_SELF_ADVOCACY_0_BUILD_CMT,
max(case sq.pseudonym when 'NURSE_ASSESS_THEORIES_0_PRINCIPLES ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_THEORIES_0_PRINCIPLES,
max(case sq.pseudonym when 'NURSE_ASSESS_THEORIES_0_PRINCIPLES_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_THEORIES_0_PRINCIPLES_CMT,
max(case sq.pseudonym when 'NURSE_ASSESS_UNDERSTAND_0_GOALS ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_UNDERSTAND_0_GOALS,
max(case sq.pseudonym when 'NURSE_ASSESS_UNDERSTAND_0_GOALS_CMT ' then coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)) else null end) as NURSE_ASSESS_UNDERSTAND_0_GOALS_CMT
   from fact_survey_response fr  
   
    inner join dim_survey_question      sq on fr.survey_question_key          = sq.survey_question_key
    inner join  dim_date                dk on fr.survey_date_key              = dk.date_key
    inner join  xref_organization       xo on fr.organization_key             = xo.organization_key
    inner join  xref_program            xp on xo.programid                    = xp.programid
    inner join  dim_client              dc on dc.client_key                   = fr.client_key
    left  join  dim_nurse               dn on dn.nurse_key                    = fr.nurse_key -- all fsr have nurse id's?
  
  where 
    sq.survey_name = 'Nurse Assessment'
  
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
