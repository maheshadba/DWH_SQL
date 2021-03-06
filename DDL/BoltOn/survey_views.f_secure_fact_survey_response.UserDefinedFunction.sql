USE [dwh_test]
GO
/****** Object:  UserDefinedFunction [survey_views].[f_secure_fact_survey_response]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [survey_views].[f_secure_fact_survey_response]
(
	@p_survey_name					varchar(100),				-- the name of the survey
	@p_requested_hashing_policy		char(10)		= '',		-- the text token which represents a grouping of fields requiring secure hashing to support contractual and regulatory compliance. 
	@p_export_profile_id			int				= 0		-- profiles are grouping of sites for query filtering purposes 
)
RETURNS 
@result TABLE 
(
	survey_response_id			bigint,
	pseudonym					varchar(256),
	secured_value				varchar(256),
	survey_question_key			bigint,
	survey_date_key				bigint,
	organization_key			bigint,
	client_key					bigint,
	nurse_key					bigint,
	as_of						datetime2
)
AS
BEGIN
/**
	this is a core function of the logical domain model, which transforms user defined pseudos to hashed values
	the function is also responsible for the coalesce/condensing of response values. 
**/
if(@p_requested_hashing_policy = '' and @p_export_profile_id=0) -- no requested hashing policy so just return as requested
begin

	declare @_as_of datetime = null;

	insert into @result
	select 
		fr.survey_response_id,
		sq.pseudonym,
 		coalesce(fr.text_response,
									cast(fr.numeric_response as varchar),
									cast(fr.date_response as varchar), 
									cast(fr.boolean_response as varchar))
		 as secured_response,
		 fr.survey_question_key,
		 fr.survey_date_key,
		 fr.organization_key,
		 fr.client_key,
		 fr.nurse_key,
		 null

	   from fact_survey_response			 fr  
		inner join  dim_survey_question      sq		on fr.survey_question_key			= sq.survey_question_key
		inner join  xref_organization        xo		on fr.organization_key				= xo.organization_key
		inner join  xref_program             xp		on xo.programid						= xp.programid
	  
	  where 
		sq.survey_name = @p_survey_name

	  group by 
  
		fr.survey_response_id,
		sq.pseudonym,
		coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)),
		fr.survey_question_key,
		fr.survey_date_key,
		fr.organization_key,
		fr.client_key,
		fr.nurse_key;
	return;
end
else
begin -- in hashing policy so hash if the pseudo matches the policy

	insert into @result
	select 
		fr.survey_response_id,
		sq.pseudonym,
		case
			when (@p_requested_hashing_policy=hpm.policy_codifier) 
			
			then survey_views.f_hash_field( 
								coalesce(fr.text_response,
									cast(fr.numeric_response as varchar),
									cast(fr.date_response as varchar), 
									cast(fr.boolean_response as varchar)))
			
			else 				coalesce(fr.text_response,
									cast(fr.numeric_response as varchar),
									cast(fr.date_response as varchar), 
									cast(fr.boolean_response as varchar))
		 end
		 as secured_response,
		 fr.survey_question_key,
		 fr.survey_date_key,
		 fr.organization_key,
		 fr.client_key,
		 fr.nurse_key,
		 null


	   from fact_survey_response					fr  
			inner	join dim_survey_question		sq			on fr.survey_question_key			= sq.survey_question_key
			
			left	join (select distinct z.policy_codifier, z.pseudonym
							 from survey_views.pseudo_security z where z.policy_codifier=@p_requested_hashing_policy)			
													hpm			on (hpm.pseudonym = sq.pseudonym )
		
		inner join  xref_organization       xo					on fr.organization_key				= xo.organization_key
		inner join  xref_program            xp					on xo.programid						= xp.programid

  
	  where 
		sq.survey_name			= @p_survey_name
		and
		xp.site_id in (select s.siteid from survey_views.f_get_sites_for_profile_id(@p_export_profile_id) s)

	  group by 
  
		fr.survey_response_id,
		sq.pseudonym,
		coalesce(fr.text_response,cast(fr.numeric_response as varchar),cast(fr.date_response as varchar), cast(fr.boolean_response as varchar)),
		hpm.policy_codifier,
		fr.survey_question_key,
		fr.survey_date_key,
		fr.organization_key,
		fr.client_key,
		fr.nurse_key;

		 return;
end;
 

 return;

END
GO
