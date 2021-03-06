USE [dwh_test]
GO
/****** Object:  UserDefinedFunction [survey_views].[f_select_Profile_Of_Program_Staff_UPDATE]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [survey_views].[f_select_Profile_Of_Program_Staff_UPDATE]
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
	NURSE_EDUCATION_0_NURSING_DEGREES varchar(256), 
	NURSE_EDUCATION_1_OTHER_DEGREES varchar(256), 
	NURSE_PRIMARY_ROLE varchar(256), 
	NURSE_PRIMARY_ROLE_FTE varchar(256), 
	NURSE_PROFESSIONAL_1_ADMIN_ASST_FTE varchar(256), 
	NURSE_PROFESSIONAL_1_HOME_VISITOR_FTE varchar(256), 
	NURSE_PROFESSIONAL_1_NEW_ROLE varchar(256), 
	NURSE_PROFESSIONAL_1_OTHER_FTE varchar(256), 
	NURSE_PROFESSIONAL_1_SUPERVISOR_FTE varchar(256), 
	NURSE_PROFESSIONAL_1_TOTAL_FTE varchar(256), 
	NURSE_SECONDARY_ROLE varchar(256), 
	NURSE_SECONDARY_ROLE_FTE varchar(256), 
	NURSE_STATUS_0_CHANGE_LEAVE_END varchar(256), 
	NURSE_STATUS_0_CHANGE_LEAVE_START varchar(256), 
	NURSE_STATUS_0_CHANGE_SPECIFIC varchar(256), 
	NURSE_STATUS_0_CHANGE_START_DATE varchar(256), 
	NURSE_STATUS_0_CHANGE_TERMINATE_DATE varchar(256), 
	NURSE_STATUS_0_CHANGE_TRANSFER varchar(256), 
	NURSE_STATUS_TERM_REASON varchar(256), 
	NURSE_STATUS_TERM_REASON_OTHER varchar(256), 
	NURSE_TEAM_NAME varchar(256), 
	NURSE_TEAM_START_DATE varchar(256)
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
	max(case sq.pseudonym when 'NURSE_EDUCATION_0_NURSING_DEGREES ' then  secured_value else null end) as NURSE_EDUCATION_0_NURSING_DEGREES,
	max(case sq.pseudonym when 'NURSE_EDUCATION_1_OTHER_DEGREES ' then  secured_value else null end) as NURSE_EDUCATION_1_OTHER_DEGREES,
	max(case sq.pseudonym when 'NURSE_PRIMARY_ROLE ' then  secured_value else null end) as NURSE_PRIMARY_ROLE,
	max(case sq.pseudonym when 'NURSE_PRIMARY_ROLE_FTE ' then  secured_value else null end) as NURSE_PRIMARY_ROLE_FTE,
	max(case sq.pseudonym when 'NURSE_PROFESSIONAL_1_ADMIN_ASST_FTE ' then  secured_value else null end) as NURSE_PROFESSIONAL_1_ADMIN_ASST_FTE,
	max(case sq.pseudonym when 'NURSE_PROFESSIONAL_1_HOME_VISITOR_FTE ' then  secured_value else null end) as NURSE_PROFESSIONAL_1_HOME_VISITOR_FTE,
	max(case sq.pseudonym when 'NURSE_PROFESSIONAL_1_NEW_ROLE ' then  secured_value else null end) as NURSE_PROFESSIONAL_1_NEW_ROLE,
	max(case sq.pseudonym when 'NURSE_PROFESSIONAL_1_OTHER_FTE ' then  secured_value else null end) as NURSE_PROFESSIONAL_1_OTHER_FTE,
	max(case sq.pseudonym when 'NURSE_PROFESSIONAL_1_SUPERVISOR_FTE ' then  secured_value else null end) as NURSE_PROFESSIONAL_1_SUPERVISOR_FTE,
	max(case sq.pseudonym when 'NURSE_PROFESSIONAL_1_TOTAL_FTE ' then  secured_value else null end) as NURSE_PROFESSIONAL_1_TOTAL_FTE,
	max(case sq.pseudonym when 'NURSE_SECONDARY_ROLE ' then  secured_value else null end) as NURSE_SECONDARY_ROLE,
	max(case sq.pseudonym when 'NURSE_SECONDARY_ROLE_FTE ' then  secured_value else null end) as NURSE_SECONDARY_ROLE_FTE,
	max(case sq.pseudonym when 'NURSE_STATUS_0_CHANGE_LEAVE_END ' then  secured_value else null end) as NURSE_STATUS_0_CHANGE_LEAVE_END,
	max(case sq.pseudonym when 'NURSE_STATUS_0_CHANGE_LEAVE_START ' then  secured_value else null end) as NURSE_STATUS_0_CHANGE_LEAVE_START,
	max(case sq.pseudonym when 'NURSE_STATUS_0_CHANGE_SPECIFIC ' then  secured_value else null end) as NURSE_STATUS_0_CHANGE_SPECIFIC,
	max(case sq.pseudonym when 'NURSE_STATUS_0_CHANGE_START_DATE ' then  secured_value else null end) as NURSE_STATUS_0_CHANGE_START_DATE,
	max(case sq.pseudonym when 'NURSE_STATUS_0_CHANGE_TERMINATE_DATE ' then  secured_value else null end) as NURSE_STATUS_0_CHANGE_TERMINATE_DATE,
	max(case sq.pseudonym when 'NURSE_STATUS_0_CHANGE_TRANSFER ' then  secured_value else null end) as NURSE_STATUS_0_CHANGE_TRANSFER,
	max(case sq.pseudonym when 'NURSE_STATUS_TERM_REASON ' then  secured_value else null end) as NURSE_STATUS_TERM_REASON,
	max(case sq.pseudonym when 'NURSE_STATUS_TERM_REASON_OTHER ' then  secured_value else null end) as NURSE_STATUS_TERM_REASON_OTHER,
	max(case sq.pseudonym when 'NURSE_TEAM_NAME ' then  secured_value else null end) as NURSE_TEAM_NAME,
	max(case sq.pseudonym when 'NURSE_TEAM_START_DATE ' then  secured_value else null end) as NURSE_TEAM_START_DATE

   from survey_views.f_secure_fact_survey_response('Profile Of Program Staff-UPDATE',@p_requested_security_policy,@p_export_profile_id) fr  
  
   
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
