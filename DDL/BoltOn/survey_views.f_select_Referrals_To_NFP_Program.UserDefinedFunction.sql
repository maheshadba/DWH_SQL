USE [dwh_test]
GO
/****** Object:  UserDefinedFunction [survey_views].[f_select_Referrals_To_NFP_Program]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [survey_views].[f_select_Referrals_To_NFP_Program]
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
CLIENT_0_ID_NSO varchar(256), 
REFERRAL_PROSPECT_0_FOLLOWUP_NURSE varchar(256), 
REFERRAL_PROSPECT_0_MARKETING_SOURCE varchar(256), 
REFERRAL_PROSPECT_0_NOTES varchar(256), 
REFERRAL_PROSPECT_0_SOURCE_CODE varchar(256), 
REFERRAL_PROSPECT_0_WAIT_LIST varchar(256), 
REFERRAL_PROSPECT_DEMO_0_NAME_LAST varchar(256), 
REFERRAL_PROSPECT_DEMO_1_CELL varchar(256), 
REFERRAL_PROSPECT_DEMO_1_DOB varchar(256), 
REFERRAL_PROSPECT_DEMO_1_EDD varchar(256), 
REFERRAL_PROSPECT_DEMO_1_EMAIL varchar(256), 
REFERRAL_PROSPECT_DEMO_1_NAME_FIRST varchar(256), 
REFERRAL_PROSPECT_DEMO_1_PHONE_HOME varchar(256), 
REFERRAL_PROSPECT_DEMO_1_PLANG varchar(256), 
REFERRAL_PROSPECT_DEMO_1_STREET varchar(256), 
REFERRAL_PROSPECT_DEMO_1_STREET2 varchar(256), 
REFERRAL_PROSPECT_DEMO_1_WORK varchar(256), 
REFERRAL_PROSPECT_DEMO_1_ZIP varchar(256), 
REFERRAL_SOURCE_PRIMARY_0_NAME varchar(256), 
REFERRAL_SOURCE_PRIMARY_1_LOCATION varchar(256), 
REFERRAL_SOURCE_SECONDARY_0_NAME varchar(256), 
REFERRAL_SOURCE_SECONDARY_1_LOCATION varchar(256)
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
	max(case sq.pseudonym when 'CLIENT_0_ID_NSO ' then  secured_value else null end) as CLIENT_0_ID_NSO,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_0_FOLLOWUP_NURSE ' then  secured_value else null end) as REFERRAL_PROSPECT_0_FOLLOWUP_NURSE,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_0_MARKETING_SOURCE ' then  secured_value else null end) as REFERRAL_PROSPECT_0_MARKETING_SOURCE,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_0_NOTES ' then  secured_value else null end) as REFERRAL_PROSPECT_0_NOTES,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_0_SOURCE_CODE ' then  secured_value else null end) as REFERRAL_PROSPECT_0_SOURCE_CODE,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_0_WAIT_LIST ' then  secured_value else null end) as REFERRAL_PROSPECT_0_WAIT_LIST,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_0_NAME_LAST ' then  secured_value else null end) as REFERRAL_PROSPECT_DEMO_0_NAME_LAST,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_CELL ' then  secured_value else null end) as REFERRAL_PROSPECT_DEMO_1_CELL,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_DOB ' then  secured_value else null end) as REFERRAL_PROSPECT_DEMO_1_DOB,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_EDD ' then  secured_value else null end) as REFERRAL_PROSPECT_DEMO_1_EDD,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_EMAIL ' then  secured_value else null end) as REFERRAL_PROSPECT_DEMO_1_EMAIL,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_NAME_FIRST ' then  secured_value else null end) as REFERRAL_PROSPECT_DEMO_1_NAME_FIRST,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_PHONE_HOME ' then  secured_value else null end) as REFERRAL_PROSPECT_DEMO_1_PHONE_HOME,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_PLANG ' then  secured_value else null end) as REFERRAL_PROSPECT_DEMO_1_PLANG,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_STREET ' then  secured_value else null end) as REFERRAL_PROSPECT_DEMO_1_STREET,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_STREET2 ' then  secured_value else null end) as REFERRAL_PROSPECT_DEMO_1_STREET2,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_WORK ' then  secured_value else null end) as REFERRAL_PROSPECT_DEMO_1_WORK,
	max(case sq.pseudonym when 'REFERRAL_PROSPECT_DEMO_1_ZIP ' then  secured_value else null end) as REFERRAL_PROSPECT_DEMO_1_ZIP,
	max(case sq.pseudonym when 'REFERRAL_SOURCE_PRIMARY_0_NAME ' then  secured_value else null end) as REFERRAL_SOURCE_PRIMARY_0_NAME,
	max(case sq.pseudonym when 'REFERRAL_SOURCE_PRIMARY_1_LOCATION ' then  secured_value else null end) as REFERRAL_SOURCE_PRIMARY_1_LOCATION,
	max(case sq.pseudonym when 'REFERRAL_SOURCE_SECONDARY_0_NAME ' then  secured_value else null end) as REFERRAL_SOURCE_SECONDARY_0_NAME,
	max(case sq.pseudonym when 'REFERRAL_SOURCE_SECONDARY_1_LOCATION ' then  secured_value else null end) as REFERRAL_SOURCE_SECONDARY_1_LOCATION

   from survey_views.f_secure_fact_survey_response('Referrals To NFP Program',@p_requested_security_policy,@p_export_profile_id) fr 
   
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
