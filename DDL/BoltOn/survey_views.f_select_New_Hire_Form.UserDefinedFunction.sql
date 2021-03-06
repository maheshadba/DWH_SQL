USE [dwh_test]
GO
/****** Object:  UserDefinedFunction [survey_views].[f_select_New_Hire_Form]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [survey_views].[f_select_New_Hire_Form]
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
NEW_HIRE_0_ACCESS_LEVEL varchar(256), 
NEW_HIRE_0_EDUC_COMPLETED varchar(256), 
NEW_HIRE_0_EMAIL varchar(256), 
NEW_HIRE_0_FTE varchar(256), 
NEW_HIRE_0_HIRE_DATE varchar(256), 
NEW_HIRE_0_NAME_LAST varchar(256), 
NEW_HIRE_0_PHONE varchar(256), 
NEW_HIRE_0_PREVIOUS_NFP_WORK varchar(256), 
NEW_HIRE_0_REASON_FOR_HIRE varchar(256), 
NEW_HIRE_0_REASON_FOR_HIRE_REPLACE varchar(256), 
NEW_HIRE_0_REASON_NFP_WORK_DESC varchar(256), 
NEW_HIRE_0_START_DATE varchar(256), 
NEW_HIRE_0_TEAM_NAME varchar(256), 
NEW_HIRE_1_DOB varchar(256), 
NEW_HIRE_1_NAME_FIRST varchar(256), 
NEW_HIRE_1_PREVIOUS_WORK_AGENCY varchar(256), 
NEW_HIRE_1_PREVIOUS_WORK_CITY varchar(256), 
NEW_HIRE_1_PREVIOUS_WORK_DATE1 varchar(256), 
NEW_HIRE_1_PREVIOUS_WORK_DATE2 varchar(256), 
NEW_HIRE_1_PREVIOUS_WORK_NAME varchar(256), 
NEW_HIRE_1_PREVIOUS_WORK_STATE varchar(256), 
NEW_HIRE_1_REPLACE_STAFF_TERM varchar(256), 
NEW_HIRE_1_ROLE varchar(256), 
NEW_HIRE_ADDITIONAL_INFO varchar(256), 
NEW_HIRE_ADDRESS_0_ZIP varchar(256), 
NEW_HIRE_ADDRESS_1_CITY varchar(256), 
NEW_HIRE_ADDRESS_1_STATE varchar(256), 
NEW_HIRE_ADDRESS_1_STATE_OTHR varchar(256), 
NEW_HIRE_ADDRESS_1_STREET varchar(256), 
NEW_HIRE_ER_0_LNAME varchar(256), 
NEW_HIRE_ER_1_FNAME varchar(256), 
NEW_HIRE_ER_1_PHONE varchar(256), 
NEW_HIRE_SUP_0_EMAIL varchar(256), 
NEW_HIRE_SUP_0_NAME varchar(256), 
NEW_HIRE_SUP_0_NAME_OTHR varchar(256), 
NEW_HIRE_SUP_0_PHONE varchar(256)
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
	max(case sq.pseudonym when 'NEW_HIRE_0_ACCESS_LEVEL ' then  secured_value else null end) as NEW_HIRE_0_ACCESS_LEVEL,
	max(case sq.pseudonym when 'NEW_HIRE_0_EDUC_COMPLETED ' then  secured_value else null end) as NEW_HIRE_0_EDUC_COMPLETED,
	max(case sq.pseudonym when 'NEW_HIRE_0_EMAIL ' then  secured_value else null end) as NEW_HIRE_0_EMAIL,
	max(case sq.pseudonym when 'NEW_HIRE_0_FTE ' then  secured_value else null end) as NEW_HIRE_0_FTE,
	max(case sq.pseudonym when 'NEW_HIRE_0_HIRE_DATE ' then  secured_value else null end) as NEW_HIRE_0_HIRE_DATE,
	max(case sq.pseudonym when 'NEW_HIRE_0_NAME_LAST ' then  secured_value else null end) as NEW_HIRE_0_NAME_LAST,
	max(case sq.pseudonym when 'NEW_HIRE_0_PHONE ' then  secured_value else null end) as NEW_HIRE_0_PHONE,
	max(case sq.pseudonym when 'NEW_HIRE_0_PREVIOUS_NFP_WORK ' then  secured_value else null end) as NEW_HIRE_0_PREVIOUS_NFP_WORK,
	max(case sq.pseudonym when 'NEW_HIRE_0_REASON_FOR_HIRE ' then  secured_value else null end) as NEW_HIRE_0_REASON_FOR_HIRE,
	max(case sq.pseudonym when 'NEW_HIRE_0_REASON_FOR_HIRE_REPLACE ' then  secured_value else null end) as NEW_HIRE_0_REASON_FOR_HIRE_REPLACE,
	max(case sq.pseudonym when 'NEW_HIRE_0_REASON_NFP_WORK_DESC ' then  secured_value else null end) as NEW_HIRE_0_REASON_NFP_WORK_DESC,
	max(case sq.pseudonym when 'NEW_HIRE_0_START_DATE ' then  secured_value else null end) as NEW_HIRE_0_START_DATE,
	max(case sq.pseudonym when 'NEW_HIRE_0_TEAM_NAME ' then  secured_value else null end) as NEW_HIRE_0_TEAM_NAME,
	max(case sq.pseudonym when 'NEW_HIRE_1_DOB ' then  secured_value else null end) as NEW_HIRE_1_DOB,
	max(case sq.pseudonym when 'NEW_HIRE_1_NAME_FIRST ' then  secured_value else null end) as NEW_HIRE_1_NAME_FIRST,
	max(case sq.pseudonym when 'NEW_HIRE_1_PREVIOUS_WORK_AGENCY ' then  secured_value else null end) as NEW_HIRE_1_PREVIOUS_WORK_AGENCY,
	max(case sq.pseudonym when 'NEW_HIRE_1_PREVIOUS_WORK_CITY ' then  secured_value else null end) as NEW_HIRE_1_PREVIOUS_WORK_CITY,
	max(case sq.pseudonym when 'NEW_HIRE_1_PREVIOUS_WORK_DATE1 ' then  secured_value else null end) as NEW_HIRE_1_PREVIOUS_WORK_DATE1,
	max(case sq.pseudonym when 'NEW_HIRE_1_PREVIOUS_WORK_DATE2 ' then  secured_value else null end) as NEW_HIRE_1_PREVIOUS_WORK_DATE2,
	max(case sq.pseudonym when 'NEW_HIRE_1_PREVIOUS_WORK_NAME ' then  secured_value else null end) as NEW_HIRE_1_PREVIOUS_WORK_NAME,
	max(case sq.pseudonym when 'NEW_HIRE_1_PREVIOUS_WORK_STATE ' then  secured_value else null end) as NEW_HIRE_1_PREVIOUS_WORK_STATE,
	max(case sq.pseudonym when 'NEW_HIRE_1_REPLACE_STAFF_TERM ' then  secured_value else null end) as NEW_HIRE_1_REPLACE_STAFF_TERM,
	max(case sq.pseudonym when 'NEW_HIRE_1_ROLE ' then  secured_value else null end) as NEW_HIRE_1_ROLE,
	max(case sq.pseudonym when 'NEW_HIRE_ADDITIONAL_INFO ' then  secured_value else null end) as NEW_HIRE_ADDITIONAL_INFO,
	max(case sq.pseudonym when 'NEW_HIRE_ADDRESS_0_ZIP ' then  secured_value else null end) as NEW_HIRE_ADDRESS_0_ZIP,
	max(case sq.pseudonym when 'NEW_HIRE_ADDRESS_1_CITY ' then  secured_value else null end) as NEW_HIRE_ADDRESS_1_CITY,
	max(case sq.pseudonym when 'NEW_HIRE_ADDRESS_1_STATE ' then  secured_value else null end) as NEW_HIRE_ADDRESS_1_STATE,
	max(case sq.pseudonym when 'NEW_HIRE_ADDRESS_1_STATE_OTHR ' then  secured_value else null end) as NEW_HIRE_ADDRESS_1_STATE_OTHR,
	max(case sq.pseudonym when 'NEW_HIRE_ADDRESS_1_STREET ' then  secured_value else null end) as NEW_HIRE_ADDRESS_1_STREET,
	max(case sq.pseudonym when 'NEW_HIRE_ER_0_LNAME ' then  secured_value else null end) as NEW_HIRE_ER_0_LNAME,
	max(case sq.pseudonym when 'NEW_HIRE_ER_1_FNAME ' then  secured_value else null end) as NEW_HIRE_ER_1_FNAME,
	max(case sq.pseudonym when 'NEW_HIRE_ER_1_PHONE ' then  secured_value else null end) as NEW_HIRE_ER_1_PHONE,
	max(case sq.pseudonym when 'NEW_HIRE_SUP_0_EMAIL ' then  secured_value else null end) as NEW_HIRE_SUP_0_EMAIL,
	max(case sq.pseudonym when 'NEW_HIRE_SUP_0_NAME ' then  secured_value else null end) as NEW_HIRE_SUP_0_NAME,
	max(case sq.pseudonym when 'NEW_HIRE_SUP_0_NAME_OTHR ' then  secured_value else null end) as NEW_HIRE_SUP_0_NAME_OTHR,
	max(case sq.pseudonym when 'NEW_HIRE_SUP_0_PHONE ' then  secured_value else null end) as NEW_HIRE_SUP_0_PHONE

   from survey_views.f_secure_fact_survey_response('New Hire Form',@p_requested_security_policy,@p_export_profile_id) fr 
   
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
