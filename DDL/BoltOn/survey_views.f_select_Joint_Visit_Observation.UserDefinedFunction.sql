USE [dwh_test]
GO
/****** Object:  UserDefinedFunction [survey_views].[f_select_Joint_Visit_Observation]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [survey_views].[f_select_Joint_Visit_Observation]
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
NURSE_JVSCALE_GUIDE_0_LINES varchar(256), 
NURSE_JVSCALE_GUIDE_1_LINES_CMT varchar(256), 
NURSE_JVSCALE_MOTIV_1_INTERVIEW varchar(256), 
NURSE_JVSCALE_MOTIV_1_INTERVIEW_CMT varchar(256), 
NURSE_JVSCALE_PC_0_INTERVENTION varchar(256), 
NURSE_JVSCALE_PC_1_INTERVENTION_CMT varchar(256), 
NURSE_JVSCALE_SELF_0_EFFICACY varchar(256), 
NURSE_JVSCALE_SELF_1_EFFICACY_CMT varchar(256), 
NURSE_JVSCALE_THERAPEUTIC_0_CHAR varchar(256), 
NURSE_JVSCALE_THERAPEUTIC_0_CHAR_CMT varchar(256)
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
	max(case sq.pseudonym when 'NURSE_JVSCALE_GUIDE_0_LINES ' then  secured_value else null end) as NURSE_JVSCALE_GUIDE_0_LINES,
	max(case sq.pseudonym when 'NURSE_JVSCALE_GUIDE_1_LINES_CMT ' then  secured_value else null end) as NURSE_JVSCALE_GUIDE_1_LINES_CMT,
	max(case sq.pseudonym when 'NURSE_JVSCALE_MOTIV_1_INTERVIEW ' then  secured_value else null end) as NURSE_JVSCALE_MOTIV_1_INTERVIEW,
	max(case sq.pseudonym when 'NURSE_JVSCALE_MOTIV_1_INTERVIEW_CMT ' then  secured_value else null end) as NURSE_JVSCALE_MOTIV_1_INTERVIEW_CMT,
	max(case sq.pseudonym when 'NURSE_JVSCALE_PC_0_INTERVENTION ' then  secured_value else null end) as NURSE_JVSCALE_PC_0_INTERVENTION,
	max(case sq.pseudonym when 'NURSE_JVSCALE_PC_1_INTERVENTION_CMT ' then  secured_value else null end) as NURSE_JVSCALE_PC_1_INTERVENTION_CMT,
	max(case sq.pseudonym when 'NURSE_JVSCALE_SELF_0_EFFICACY ' then  secured_value else null end) as NURSE_JVSCALE_SELF_0_EFFICACY,
	max(case sq.pseudonym when 'NURSE_JVSCALE_SELF_1_EFFICACY_CMT ' then  secured_value else null end) as NURSE_JVSCALE_SELF_1_EFFICACY_CMT,
	max(case sq.pseudonym when 'NURSE_JVSCALE_THERAPEUTIC_0_CHAR ' then  secured_value else null end) as NURSE_JVSCALE_THERAPEUTIC_0_CHAR,
	max(case sq.pseudonym when 'NURSE_JVSCALE_THERAPEUTIC_0_CHAR_CMT ' then  secured_value else null end) as NURSE_JVSCALE_THERAPEUTIC_0_CHAR_CMT

   from survey_views.f_secure_fact_survey_response('Joint Visit Observation',@p_requested_security_policy,@p_export_profile_id) fr  
   
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
