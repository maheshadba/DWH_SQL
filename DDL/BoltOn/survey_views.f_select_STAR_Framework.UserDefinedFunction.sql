USE [dwh_test]
GO
/****** Object:  UserDefinedFunction [survey_views].[f_select_STAR_Framework]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [survey_views].[f_select_STAR_Framework]
(
	@p_requested_security_policy char(10)=null,
	@p_export_profile_id int=null
)
RETURNS 
@result TABLE 
(
SurveyResponseID int, 
ElementsProcessed int, 
SurveyID int, 
SurveyDate date, 
AuditDate datetime2, 
CL_EN_GEN_ID bigint, 
SiteID int, 
ProgramID int, 
IA_StaffID int, 
ClientID varchar(20), 
RespondentID int, 
CLIENT_0_ID_AGENCY varchar(256), 
Client_0_ID_NSO varchar(256), 
CLIENT_CAREGIVING_FRIENDS_FAM varchar(256), 
CLIENT_CAREGIVING_RISK_LEVEL varchar(256), 
CLIENT_CAREGIVING_SERVICES_GOALS varchar(256), 
CLIENT_CAREGIVING_STAGE_CHANGE varchar(256), 
CLIENT_CAREGIVING_UNDERSTANDS_RISK varchar(256), 
CLIENT_CHLD_CARE_FRIENDS_FAM varchar(256), 
CLIENT_CHLD_CARE_RISK_LEVEL varchar(256), 
CLIENT_CHLD_CARE_SERVICES_GOALS varchar(256), 
CLIENT_CHLD_CARE_STAGE_CHANGE varchar(256), 
CLIENT_CHLD_CARE_UNDERSTANDS_RISK varchar(256), 
CLIENT_CHLD_HEALTH_FRIENDS_FAM varchar(256), 
CLIENT_CHLD_HEALTH_RISK_LEVEL varchar(256), 
CLIENT_CHLD_HEALTH_SERVICES_GOALS varchar(256), 
CLIENT_CHLD_HEALTH_STAGE_CHANGE varchar(256), 
CLIENT_CHLD_HEALTH_UNDERSTANDS_RISK varchar(256), 
CLIENT_CHLD_WELL_FRIENDS_FAM varchar(256), 
CLIENT_CHLD_WELL_RISK_LEVEL varchar(256), 
CLIENT_CHLD_WELL_SERVICES_GOALS varchar(256), 
CLIENT_CHLD_WELL_STAGE_CHANGE varchar(256), 
CLIENT_CHLD_WELL_UNDERSTANDS_RISK varchar(256), 
CLIENT_COMM_SVCS_FRIENDS_FAM varchar(256), 
CLIENT_COMM_SVCS_RISK_LEVEL varchar(256), 
CLIENT_COMM_SVCS_SERVICES_GOALS varchar(256), 
CLIENT_COMM_SVCS_STAGE_CHANGE varchar(256), 
CLIENT_COMM_SVCS_UNDERSTANDS_RISK varchar(256), 
CLIENT_COMPLICATION_ILL_FRIENDS_FAM varchar(256), 
CLIENT_COMPLICATION_ILL_RISK_LEVEL varchar(256), 
CLIENT_COMPLICATION_ILL_SERVICES_GOALS varchar(256), 
CLIENT_COMPLICATION_ILL_STAGE_CHANGE varchar(256), 
CLIENT_COMPLICATION_ILL_UNDERSTANDS_RISK varchar(256), 
CLIENT_CRIMINAL_FRIENDS_FAM varchar(256), 
CLIENT_CRIMINAL_RISK_LEVEL varchar(256), 
CLIENT_CRIMINAL_SERVICES_GOALS varchar(256), 
CLIENT_CRIMINAL_STAGE_CHANGE varchar(256), 
CLIENT_CRIMINAL_UNDERSTANDS_RISK varchar(256), 
CLIENT_DISABILITY_FRIENDS_FAM varchar(256), 
CLIENT_DISABILITY_RISK_LEVEL varchar(256), 
CLIENT_DISABILITY_SERVICES_GOALS varchar(256), 
CLIENT_DISABILITY_STAGE_CHANGE varchar(256), 
CLIENT_DISABILITY_UNDERSTANDS_RISK varchar(256), 
CLIENT_ECONOMIC_FRIENDS_FAM varchar(256), 
CLIENT_ECONOMIC_RISK_LEVEL varchar(256), 
CLIENT_ECONOMIC_SERVICES_GOALS varchar(256), 
CLIENT_ECONOMIC_STAGE_CHANGE varchar(256), 
CLIENT_ECONOMIC_UNDERSTANDS_RISK varchar(256), 
CLIENT_EDUC_FRIENDS_FAM varchar(256), 
CLIENT_EDUC_RISK_LEVEL varchar(256), 
CLIENT_EDUC_SERVICES_GOALS varchar(256), 
CLIENT_EDUC_STAGE_CHANGE varchar(256), 
CLIENT_EDUC_UNDERSTANDS_RISK varchar(256), 
CLIENT_ENGLIT_FRIENDS_FAM varchar(256), 
CLIENT_ENGLIT_RISK_LEVEL varchar(256), 
CLIENT_ENGLIT_SERVICES_GOALS varchar(256), 
CLIENT_ENGLIT_STAGE_CHANGE varchar(256), 
CLIENT_ENGLIT_UNDERSTANDS_RISK varchar(256), 
CLIENT_ENVIRO_HEALTH_FRIENDS_FAM varchar(256), 
CLIENT_ENVIRO_HEALTH_RISK_LEVEL varchar(256), 
CLIENT_ENVIRO_HEALTH_SERVICES_GOALS varchar(256), 
CLIENT_ENVIRO_HEALTH_STAGE_CHANGE varchar(256), 
CLIENT_ENVIRO_HEALTH_UNDERSTANDS_RISK varchar(256), 
CLIENT_GLOBAL_FACTORS varchar(256), 
CLIENT_HLTH_SVCS_FRIENDS_FAM varchar(256), 
CLIENT_HLTH_SVCS_RISK_LEVEL varchar(256), 
CLIENT_HLTH_SVCS_SERVICES_GOALS varchar(256), 
CLIENT_HLTH_SVCS_STAGE_CHANGE varchar(256), 
CLIENT_HLTH_SVCS_UNDERSTANDS_RISK varchar(256), 
CLIENT_HOME_SAFETY_FRIENDS_FAM varchar(256), 
CLIENT_HOME_SAFETY_RISK_LEVEL varchar(256), 
CLIENT_HOME_SAFETY_SERVICES_GOALS varchar(256), 
CLIENT_HOME_SAFETY_STAGE_CHANGE varchar(256), 
CLIENT_HOME_SAFETY_UNDERSTANDS_RISK varchar(256), 
CLIENT_HOMELESS_FRIENDS_FAM varchar(256), 
CLIENT_HOMELESS_RISK_LEVEL varchar(256), 
CLIENT_HOMELESS_SERVICES_GOALS varchar(256), 
CLIENT_HOMELESS_STAGE_CHANGE varchar(256), 
CLIENT_HOMELESS_UNDERSTANDS_RISK varchar(256), 
CLIENT_IPV_FRIENDS_FAM varchar(256), 
CLIENT_IPV_RISK_LEVEL varchar(256), 
CLIENT_IPV_SERVICES_GOALS varchar(256), 
CLIENT_IPV_STAGE_CHANGE varchar(256), 
CLIENT_IPV_UNDERSTANDS_RISK varchar(256), 
CLIENT_LONELY_FRIENDS_FAM varchar(256), 
CLIENT_LONELY_RISK_LEVEL varchar(256), 
CLIENT_LONELY_SERVICES_GOALS varchar(256), 
CLIENT_LONELY_STAGE_CHANGE varchar(256), 
CLIENT_LONELY_UNDERSTANDS_RISK varchar(256), 
CLIENT_MENTAL_HEALTH_FRIENDS_FAM varchar(256), 
CLIENT_MENTAL_HEALTH_RISK_LEVEL varchar(256), 
CLIENT_MENTAL_HEALTH_SERVICES_GOALS varchar(256), 
CLIENT_MENTAL_HEALTH_STAGE_CHANGE varchar(256), 
CLIENT_MENTAL_HEALTH_UNDERSTANDS_RISK varchar(256), 
CLIENT_PERSONAL_0_DOB_INTAKE varchar(256), 
CLIENT_PERSONAL_0_NAME_FIRST varchar(256), 
CLIENT_PERSONAL_0_NAME_LAST varchar(256), 
CLIENT_PREGPLAN_FRIENDS_FAM varchar(256), 
CLIENT_PREGPLAN_RISK_LEVEL varchar(256), 
CLIENT_PREGPLAN_SERVICES_GOALS varchar(256), 
CLIENT_PREGPLAN_STAGE_CHANGE varchar(256), 
CLIENT_PREGPLAN_UNDERSTANDS_RISK varchar(256), 
CLIENT_SUBSTANCE_FRIENDS_FAM varchar(256), 
CLIENT_SUBSTANCE_RISK_LEVEL varchar(256), 
CLIENT_SUBSTANCE_SERVICES_GOALS varchar(256), 
CLIENT_SUBSTANCE_STAGE_CHANGE varchar(256), 
CLIENT_SUBSTANCE_UNDERSTANDS_RISK varchar(256), 
CLIENT_UNSAFE_NTWK_FRIENDS_FAM varchar(256), 
CLIENT_UNSAFE_NTWK_RISK_LEVEL varchar(256), 
CLIENT_UNSAFE_NTWK_SERVICES_GOALS varchar(256), 
CLIENT_UNSAFE_NTWK_STAGE_CHANGE varchar(256), 
CLIENT_UNSAFE_NTWK_UNDERSTANDS_RISK varchar(256), 
NURSE_PERSONAL_0_NAME varchar(256)
)
as
begin

insert into @result
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
	max(case sq.pseudonym when 'CLIENT_0_ID_AGENCY ' then  secured_value else null end) as CLIENT_0_ID_AGENCY,
	max(case sq.pseudonym when 'Client_0_ID_NSO ' then  secured_value else null end) as Client_0_ID_NSO,
	max(case sq.pseudonym when 'CLIENT_CAREGIVING_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_CAREGIVING_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_CAREGIVING_RISK_LEVEL ' then  secured_value else null end) as CLIENT_CAREGIVING_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_CAREGIVING_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_CAREGIVING_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_CAREGIVING_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_CAREGIVING_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_CAREGIVING_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_CAREGIVING_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'CLIENT_CHLD_CARE_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_CHLD_CARE_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_CHLD_CARE_RISK_LEVEL ' then  secured_value else null end) as CLIENT_CHLD_CARE_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_CHLD_CARE_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_CHLD_CARE_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_CHLD_CARE_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_CHLD_CARE_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_CHLD_CARE_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_CHLD_CARE_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'CLIENT_CHLD_HEALTH_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_CHLD_HEALTH_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_CHLD_HEALTH_RISK_LEVEL ' then  secured_value else null end) as CLIENT_CHLD_HEALTH_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_CHLD_HEALTH_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_CHLD_HEALTH_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_CHLD_HEALTH_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_CHLD_HEALTH_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_CHLD_HEALTH_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_CHLD_HEALTH_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'CLIENT_CHLD_WELL_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_CHLD_WELL_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_CHLD_WELL_RISK_LEVEL ' then  secured_value else null end) as CLIENT_CHLD_WELL_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_CHLD_WELL_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_CHLD_WELL_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_CHLD_WELL_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_CHLD_WELL_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_CHLD_WELL_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_CHLD_WELL_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'CLIENT_COMM_SVCS_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_COMM_SVCS_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_COMM_SVCS_RISK_LEVEL ' then  secured_value else null end) as CLIENT_COMM_SVCS_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_COMM_SVCS_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_COMM_SVCS_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_COMM_SVCS_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_COMM_SVCS_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_COMM_SVCS_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_COMM_SVCS_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'CLIENT_COMPLICATION_ILL_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_COMPLICATION_ILL_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_COMPLICATION_ILL_RISK_LEVEL ' then  secured_value else null end) as CLIENT_COMPLICATION_ILL_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_COMPLICATION_ILL_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_COMPLICATION_ILL_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_COMPLICATION_ILL_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_COMPLICATION_ILL_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_COMPLICATION_ILL_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_COMPLICATION_ILL_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'CLIENT_CRIMINAL_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_CRIMINAL_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_CRIMINAL_RISK_LEVEL ' then  secured_value else null end) as CLIENT_CRIMINAL_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_CRIMINAL_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_CRIMINAL_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_CRIMINAL_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_CRIMINAL_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_CRIMINAL_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_CRIMINAL_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'CLIENT_DISABILITY_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_DISABILITY_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_DISABILITY_RISK_LEVEL ' then  secured_value else null end) as CLIENT_DISABILITY_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_DISABILITY_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_DISABILITY_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_DISABILITY_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_DISABILITY_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_DISABILITY_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_DISABILITY_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'CLIENT_ECONOMIC_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_ECONOMIC_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_ECONOMIC_RISK_LEVEL ' then  secured_value else null end) as CLIENT_ECONOMIC_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_ECONOMIC_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_ECONOMIC_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_ECONOMIC_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_ECONOMIC_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_ECONOMIC_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_ECONOMIC_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'CLIENT_EDUC_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_EDUC_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_EDUC_RISK_LEVEL ' then  secured_value else null end) as CLIENT_EDUC_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_EDUC_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_EDUC_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_EDUC_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_EDUC_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_EDUC_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_EDUC_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'CLIENT_ENGLIT_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_ENGLIT_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_ENGLIT_RISK_LEVEL ' then  secured_value else null end) as CLIENT_ENGLIT_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_ENGLIT_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_ENGLIT_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_ENGLIT_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_ENGLIT_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_ENGLIT_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_ENGLIT_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'CLIENT_ENVIRO_HEALTH_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_ENVIRO_HEALTH_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_ENVIRO_HEALTH_RISK_LEVEL ' then  secured_value else null end) as CLIENT_ENVIRO_HEALTH_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_ENVIRO_HEALTH_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_ENVIRO_HEALTH_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_ENVIRO_HEALTH_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_ENVIRO_HEALTH_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_ENVIRO_HEALTH_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_ENVIRO_HEALTH_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'CLIENT_GLOBAL_FACTORS ' then  secured_value else null end) as CLIENT_GLOBAL_FACTORS,
	max(case sq.pseudonym when 'CLIENT_HLTH_SVCS_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_HLTH_SVCS_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_HLTH_SVCS_RISK_LEVEL ' then  secured_value else null end) as CLIENT_HLTH_SVCS_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_HLTH_SVCS_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_HLTH_SVCS_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_HLTH_SVCS_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_HLTH_SVCS_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_HLTH_SVCS_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_HLTH_SVCS_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'CLIENT_HOME_SAFETY_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_HOME_SAFETY_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_HOME_SAFETY_RISK_LEVEL ' then  secured_value else null end) as CLIENT_HOME_SAFETY_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_HOME_SAFETY_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_HOME_SAFETY_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_HOME_SAFETY_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_HOME_SAFETY_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_HOME_SAFETY_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_HOME_SAFETY_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'CLIENT_HOMELESS_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_HOMELESS_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_HOMELESS_RISK_LEVEL ' then  secured_value else null end) as CLIENT_HOMELESS_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_HOMELESS_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_HOMELESS_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_HOMELESS_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_HOMELESS_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_HOMELESS_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_HOMELESS_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'CLIENT_IPV_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_IPV_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_IPV_RISK_LEVEL ' then  secured_value else null end) as CLIENT_IPV_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_IPV_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_IPV_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_IPV_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_IPV_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_IPV_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_IPV_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'CLIENT_LONELY_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_LONELY_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_LONELY_RISK_LEVEL ' then  secured_value else null end) as CLIENT_LONELY_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_LONELY_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_LONELY_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_LONELY_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_LONELY_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_LONELY_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_LONELY_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'CLIENT_MENTAL_HEALTH_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_MENTAL_HEALTH_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_MENTAL_HEALTH_RISK_LEVEL ' then  secured_value else null end) as CLIENT_MENTAL_HEALTH_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_MENTAL_HEALTH_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_MENTAL_HEALTH_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_MENTAL_HEALTH_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_MENTAL_HEALTH_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_MENTAL_HEALTH_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_MENTAL_HEALTH_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'CLIENT_PERSONAL_0_DOB_INTAKE ' then  secured_value else null end) as CLIENT_PERSONAL_0_DOB_INTAKE,
	max(case sq.pseudonym when 'CLIENT_PERSONAL_0_NAME_FIRST ' then  secured_value else null end) as CLIENT_PERSONAL_0_NAME_FIRST,
	max(case sq.pseudonym when 'CLIENT_PERSONAL_0_NAME_LAST ' then  secured_value else null end) as CLIENT_PERSONAL_0_NAME_LAST,
	max(case sq.pseudonym when 'CLIENT_PREGPLAN_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_PREGPLAN_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_PREGPLAN_RISK_LEVEL ' then  secured_value else null end) as CLIENT_PREGPLAN_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_PREGPLAN_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_PREGPLAN_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_PREGPLAN_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_PREGPLAN_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_PREGPLAN_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_PREGPLAN_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'CLIENT_SUBSTANCE_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_SUBSTANCE_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_SUBSTANCE_RISK_LEVEL ' then  secured_value else null end) as CLIENT_SUBSTANCE_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_SUBSTANCE_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_SUBSTANCE_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_SUBSTANCE_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_SUBSTANCE_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_SUBSTANCE_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_SUBSTANCE_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'CLIENT_UNSAFE_NTWK_FRIENDS_FAM ' then  secured_value else null end) as CLIENT_UNSAFE_NTWK_FRIENDS_FAM,
	max(case sq.pseudonym when 'CLIENT_UNSAFE_NTWK_RISK_LEVEL ' then  secured_value else null end) as CLIENT_UNSAFE_NTWK_RISK_LEVEL,
	max(case sq.pseudonym when 'CLIENT_UNSAFE_NTWK_SERVICES_GOALS ' then  secured_value else null end) as CLIENT_UNSAFE_NTWK_SERVICES_GOALS,
	max(case sq.pseudonym when 'CLIENT_UNSAFE_NTWK_STAGE_CHANGE ' then  secured_value else null end) as CLIENT_UNSAFE_NTWK_STAGE_CHANGE,
	max(case sq.pseudonym when 'CLIENT_UNSAFE_NTWK_UNDERSTANDS_RISK ' then  secured_value else null end) as CLIENT_UNSAFE_NTWK_UNDERSTANDS_RISK,
	max(case sq.pseudonym when 'NURSE_PERSONAL_0_NAME ' then  secured_value else null end) as NURSE_PERSONAL_0_NAME

     from survey_views.f_secure_fact_survey_response( 'STAR Framework',@p_requested_security_policy,@p_export_profile_id) fr    
   
    inner join dim_survey_question      sq on fr.survey_question_key          = sq.survey_question_key
    inner join  dim_date                dk on fr.survey_date_key              = dk.date_key
    inner join  xref_organization       xo on fr.organization_key             = xo.organization_key
    inner join  xref_program            xp on xo.programid                    = xp.programid
    inner join  dim_client              dc on dc.client_key                   = fr.client_key
    left  join  dim_nurse               dn on dn.nurse_key                    = fr.nurse_key -- all fsr have nurse id's?
  
  group by 
  
    fr.survey_response_id,
    sq.master_survey_id, 
    dk.date_actual,     
    xp.source_auditdate,
    dc.client_key,
    xp.site_id,  
    xp.programid,
    dn.nurse_id,
    dc.client_id;
return;
end


GO
