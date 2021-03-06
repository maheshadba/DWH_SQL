USE [dwh_test]
GO
/****** Object:  UserDefinedFunction [survey_views].[f_select_Staff_Team_to_Team_Transfer_Request]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [survey_views].[f_select_Staff_Team_to_Team_Transfer_Request]
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
STAFF_XFER_CLIENTS varchar(256), 
STAFF_XFER_FROM_TEAM_A varchar(256), 
STAFF_XFER_LAST_DAY_TEAM_A varchar(256), 
STAFF_XFER_NAME varchar(256), 
STAFF_XFER_NEW_TEAM_B varchar(256), 
STAFF_XFER_PRIMARY_FTE varchar(256), 
STAFF_XFER_PRIMARY_ROLE varchar(256), 
STAFF_XFER_SECOND_FTE varchar(256), 
STAFF_XFER_SECOND_ROLE varchar(256), 
STAFF_XFER_START_DATE_TEAM_B varchar(256), 
STAFF_XFER_SUP_PROMO varchar(256)

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
	max(case sq.pseudonym when 'STAFF_XFER_CLIENTS ' then  secured_value else null end) as STAFF_XFER_CLIENTS,
	max(case sq.pseudonym when 'STAFF_XFER_FROM_TEAM_A ' then  secured_value else null end) as STAFF_XFER_FROM_TEAM_A,
	max(case sq.pseudonym when 'STAFF_XFER_LAST_DAY_TEAM_A ' then  secured_value else null end) as STAFF_XFER_LAST_DAY_TEAM_A,
	max(case sq.pseudonym when 'STAFF_XFER_NAME ' then  secured_value else null end) as STAFF_XFER_NAME,
	max(case sq.pseudonym when 'STAFF_XFER_NEW_TEAM_B ' then  secured_value else null end) as STAFF_XFER_NEW_TEAM_B,
	max(case sq.pseudonym when 'STAFF_XFER_PRIMARY_FTE ' then  secured_value else null end) as STAFF_XFER_PRIMARY_FTE,
	max(case sq.pseudonym when 'STAFF_XFER_PRIMARY_ROLE ' then  secured_value else null end) as STAFF_XFER_PRIMARY_ROLE,
	max(case sq.pseudonym when 'STAFF_XFER_SECOND_FTE ' then  secured_value else null end) as STAFF_XFER_SECOND_FTE,
	max(case sq.pseudonym when 'STAFF_XFER_SECOND_ROLE ' then  secured_value else null end) as STAFF_XFER_SECOND_ROLE,
	max(case sq.pseudonym when 'STAFF_XFER_START_DATE_TEAM_B ' then  secured_value else null end) as STAFF_XFER_START_DATE_TEAM_B,
	max(case sq.pseudonym when 'STAFF_XFER_SUP_PROMO ' then  secured_value else null end) as STAFF_XFER_SUP_PROMO


   from survey_views.f_secure_fact_survey_response('Staff Team-to-Team Transfer Request',@p_requested_security_policy,@p_export_profile_id) fr  
   
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
