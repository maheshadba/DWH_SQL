USE [dwh_test]
GO
/****** Object:  UserDefinedFunction [survey_views].[f_select_Referrals_To_Services]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [survey_views].[f_select_Referrals_To_Services]
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
[SERIVCE_REFER_0_OTHER1_DESC] varchar(256),
[SERIVCE_REFER_0_OTHER2_DESC] varchar(256),
[SERIVCE_REFER_0_OTHER3_DESC] varchar(256),
[CLIENT_0_ID_NSO] varchar(256),
[CLIENT_PERSONAL_0_NAME_FIRST] varchar(256),
[CLIENT_PERSONAL_0_NAME_LAST] varchar(256),
[CLIENT_PERSONAL_0_DOB_INTAKE] varchar(256),
[NURSE_PERSONAL_0_NAME] varchar(256),
[REFERRALS_TO_0_FORM_TYPE] varchar(256),
[SERVICE_REFER_0_DEVELOPMENTAL_DISABILITY] varchar(256),
[SERVICE_REFER_0_INTERVENTION] varchar(256),
[SERVICE_REFER_0_WIC_CLIENT] varchar(256),
[SERVICE_REFER_0_CHILD_CARE] varchar(256),
[SERVICE_REFER_0_JOB_TRAINING] varchar(256),
[SERVICE_REFER_0_HOUSING] varchar(256),
[SERVICE_REFER_0_TRANSPORTATION] varchar(256),
[SERVICE_REFER_0_PREVENT_INJURY] varchar(256),
[SERVICE_REFER_0_BIRTH_EDUC_CLASS] varchar(256),
[SERVICE_REFER_0_LACTATION] varchar(256),
[SERVICE_REFER_0_CHARITY] varchar(256),
[SERVICE_REFER_0_LEGAL_CLIENT] varchar(256),
[SERVICE_REFER_0_PATERNITY] varchar(256),
[SERVICE_REFER_0_CHILD_SUPPORT] varchar(256),
[SERVICE_REFER_0_ADOPTION] varchar(256),
[SERVICE_REFER_0_DENTAL] varchar(256),
[SERVICE_REFER_0_OTHER] varchar(256),
[SERVICE_REFER_0_TANF] varchar(256),
[SERVICE_REFER_0_SMOKE] varchar(256),
[SERVICE_REFER_0_ALCOHOL_ABUSE] varchar(256),
[SERVICE_REFER_0_DRUG_ABUSE] varchar(256),
[SERVICE_REFER_0_MEDICAID] varchar(256),
[SERVICE_REFER_0_SCHIP] varchar(256),
[SERVICE_REFER_0_PRIVATE_INSURANCE] varchar(256),
[SERVICE_REFER_MILITARY_INS] varchar(256),
[SERVICE_REFER_INDIAN_HEALTH] varchar(256),
[SERVICE_REFER_0_SPECIAL_NEEDS] varchar(256),
[SERVICE_REFER_0_PCP_R2] varchar(256),
[SERVICE_REFER_0_FOODSTAMP] varchar(256),
[SERVICE_REFER_0_SOCIAL_SECURITY] varchar(256),
[SERVICE_REFER_0_GED] varchar(256),
[SERVICE_REFER_0_HIGHER_EDUC] varchar(256),
[SERVICE_REFER_0_UNEMPLOYMENT] varchar(256),
[SERVICE_REFER_0_SUBSID_CHILD_CARE] varchar(256),
[SERVICE_REFER_0_IPV] varchar(256),
[SERVICE_REFER_0_CPS] varchar(256),
[SERVICE_REFER_0_MENTAL] varchar(256),
[SERVICE_REFER_0_RELATIONSHIP_COUNSELING] varchar(256),
[SERVICE_REFER_0_PCP] varchar(256),
[CLIENT_0_ID_AGENCY] varchar(256)
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
max(case sq.pseudonym when 'SERIVCE_REFER_0_OTHER1_DESC'  then  fr.secured_value else null end) as [SERIVCE_REFER_0_OTHER1_DESC],
max(case sq.pseudonym when 'SERIVCE_REFER_0_OTHER2_DESC'  then  fr.secured_value else null end) as [SERIVCE_REFER_0_OTHER2_DESC],
max(case sq.pseudonym when 'SERIVCE_REFER_0_OTHER3_DESC'  then  fr.secured_value else null end) as [SERIVCE_REFER_0_OTHER3_DESC],
max(case sq.pseudonym when 'CLIENT_0_ID_NSO'  then  fr.secured_value else null end) as [CLIENT_0_ID_NSO],
max(case sq.pseudonym when 'CLIENT_PERSONAL_0_NAME_FIRST'  then  fr.secured_value else null end) as [CLIENT_PERSONAL_0_NAME_FIRST],
max(case sq.pseudonym when 'CLIENT_PERSONAL_0_NAME_LAST'  then  fr.secured_value else null end) as [CLIENT_PERSONAL_0_NAME_LAST],
max(case sq.pseudonym when 'CLIENT_PERSONAL_0_DOB_INTAKE'  then  fr.secured_value else null end) as [CLIENT_PERSONAL_0_DOB_INTAKE],
max(case sq.pseudonym when 'NURSE_PERSONAL_0_NAME'  then  fr.secured_value else null end) as [NURSE_PERSONAL_0_NAME],
max(case sq.pseudonym when 'REFERRALS_TO_0_FORM_TYPE'  then  fr.secured_value else null end) as [REFERRALS_TO_0_FORM_TYPE],
max(case sq.pseudonym when 'SERVICE_REFER_0_DEVELOPMENTAL_DISABILITY'  then  fr.secured_value else null end) as [SERVICE_REFER_0_DEVELOPMENTAL_DISABILITY],
max(case sq.pseudonym when 'SERVICE_REFER_0_INTERVENTION'  then  fr.secured_value else null end) as [SERVICE_REFER_0_INTERVENTION],
max(case sq.pseudonym when 'SERVICE_REFER_0_WIC_CLIENT'  then  fr.secured_value else null end) as [SERVICE_REFER_0_WIC_CLIENT],
max(case sq.pseudonym when 'SERVICE_REFER_0_CHILD_CARE'  then  fr.secured_value else null end) as [SERVICE_REFER_0_CHILD_CARE],
max(case sq.pseudonym when 'SERVICE_REFER_0_JOB_TRAINING'  then  fr.secured_value else null end) as [SERVICE_REFER_0_JOB_TRAINING],
max(case sq.pseudonym when 'SERVICE_REFER_0_HOUSING'  then  fr.secured_value else null end) as [SERVICE_REFER_0_HOUSING],
max(case sq.pseudonym when 'SERVICE_REFER_0_TRANSPORTATION'  then  fr.secured_value else null end) as [SERVICE_REFER_0_TRANSPORTATION],
max(case sq.pseudonym when 'SERVICE_REFER_0_PREVENT_INJURY'  then  fr.secured_value else null end) as [SERVICE_REFER_0_PREVENT_INJURY],
max(case sq.pseudonym when 'SERVICE_REFER_0_BIRTH_EDUC_CLASS'  then  fr.secured_value else null end) as [SERVICE_REFER_0_BIRTH_EDUC_CLASS],
max(case sq.pseudonym when 'SERVICE_REFER_0_LACTATION'  then  fr.secured_value else null end) as [SERVICE_REFER_0_LACTATION],
max(case sq.pseudonym when 'SERVICE_REFER_0_CHARITY'  then  fr.secured_value else null end) as [SERVICE_REFER_0_CHARITY],
max(case sq.pseudonym when 'SERVICE_REFER_0_LEGAL_CLIENT'  then  fr.secured_value else null end) as [SERVICE_REFER_0_LEGAL_CLIENT],
max(case sq.pseudonym when 'SERVICE_REFER_0_PATERNITY'  then  fr.secured_value else null end) as [SERVICE_REFER_0_PATERNITY],
max(case sq.pseudonym when 'SERVICE_REFER_0_CHILD_SUPPORT'  then  fr.secured_value else null end) as [SERVICE_REFER_0_CHILD_SUPPORT],
max(case sq.pseudonym when 'SERVICE_REFER_0_ADOPTION'  then  fr.secured_value else null end) as [SERVICE_REFER_0_ADOPTION],
max(case sq.pseudonym when 'SERVICE_REFER_0_DENTAL'  then  fr.secured_value else null end) as [SERVICE_REFER_0_DENTAL],
max(case sq.pseudonym when 'SERVICE_REFER_0_OTHER'  then  fr.secured_value else null end) as [SERVICE_REFER_0_OTHER],
max(case sq.pseudonym when 'SERVICE_REFER_0_TANF'  then  fr.secured_value else null end) as [SERVICE_REFER_0_TANF],
max(case sq.pseudonym when 'SERVICE_REFER_0_SMOKE'  then  fr.secured_value else null end) as [SERVICE_REFER_0_SMOKE],
max(case sq.pseudonym when 'SERVICE_REFER_0_ALCOHOL_ABUSE'  then  fr.secured_value else null end) as [SERVICE_REFER_0_ALCOHOL_ABUSE],
max(case sq.pseudonym when 'SERVICE_REFER_0_DRUG_ABUSE'  then  fr.secured_value else null end) as [SERVICE_REFER_0_DRUG_ABUSE],
max(case sq.pseudonym when 'SERVICE_REFER_0_MEDICAID'  then  fr.secured_value else null end) as [SERVICE_REFER_0_MEDICAID],
max(case sq.pseudonym when 'SERVICE_REFER_0_SCHIP'  then  fr.secured_value else null end) as [SERVICE_REFER_0_SCHIP],
max(case sq.pseudonym when 'SERVICE_REFER_0_PRIVATE_INSURANCE'  then  fr.secured_value else null end) as [SERVICE_REFER_0_PRIVATE_INSURANCE],
max(case sq.pseudonym when 'SERVICE_REFER_MILITARY_INS'  then  fr.secured_value else null end) as [SERVICE_REFER_MILITARY_INS],
max(case sq.pseudonym when 'SERVICE_REFER_INDIAN_HEALTH'  then  fr.secured_value else null end) as [SERVICE_REFER_INDIAN_HEALTH],
max(case sq.pseudonym when 'SERVICE_REFER_0_SPECIAL_NEEDS'  then  fr.secured_value else null end) as [SERVICE_REFER_0_SPECIAL_NEEDS],
max(case sq.pseudonym when 'SERVICE_REFER_0_PCP_R2'  then  fr.secured_value else null end) as [SERVICE_REFER_0_PCP_R2],
max(case sq.pseudonym when 'SERVICE_REFER_0_FOODSTAMP'  then  fr.secured_value else null end) as [SERVICE_REFER_0_FOODSTAMP],
max(case sq.pseudonym when 'SERVICE_REFER_0_SOCIAL_SECURITY'  then  fr.secured_value else null end) as [SERVICE_REFER_0_SOCIAL_SECURITY],
max(case sq.pseudonym when 'SERVICE_REFER_0_GED'  then  fr.secured_value else null end) as [SERVICE_REFER_0_GED],
max(case sq.pseudonym when 'SERVICE_REFER_0_HIGHER_EDUC'  then  fr.secured_value else null end) as [SERVICE_REFER_0_HIGHER_EDUC],
max(case sq.pseudonym when 'SERVICE_REFER_0_UNEMPLOYMENT'  then  fr.secured_value else null end) as [SERVICE_REFER_0_UNEMPLOYMENT],
max(case sq.pseudonym when 'SERVICE_REFER_0_SUBSID_CHILD_CARE'  then  fr.secured_value else null end) as [SERVICE_REFER_0_SUBSID_CHILD_CARE],
max(case sq.pseudonym when 'SERVICE_REFER_0_IPV'  then  fr.secured_value else null end) as [SERVICE_REFER_0_IPV],
max(case sq.pseudonym when 'SERVICE_REFER_0_CPS'  then  fr.secured_value else null end) as [SERVICE_REFER_0_CPS],
max(case sq.pseudonym when 'SERVICE_REFER_0_MENTAL'  then  fr.secured_value else null end) as [SERVICE_REFER_0_MENTAL],
max(case sq.pseudonym when 'SERVICE_REFER_0_RELATIONSHIP_COUNSELING'  then  fr.secured_value else null end) as [SERVICE_REFER_0_RELATIONSHIP_COUNSELING],
max(case sq.pseudonym when 'SERVICE_REFER_0_PCP'  then  fr.secured_value else null end) as [SERVICE_REFER_0_PCP],
max(case sq.pseudonym when 'CLIENT_0_ID_AGENCY'  then  fr.secured_value else null end) as [CLIENT_0_ID_AGENCY]

   from survey_views.f_secure_fact_survey_response('Referrals to Services',@p_requested_security_policy,@p_export_profile_id) fr 
   
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
