USE [dwh_test]
GO
/****** Object:  UserDefinedFunction [survey_views].[f_list_surveys]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [survey_views].[f_list_surveys]
(
)
RETURNS 
@t_response table
(
	
	survey_unique_name varchar(200) not null primary key,
	survey_name varchar(100) not null,
	survey_time_period varchar(75) not null
)
AS
BEGIN
-- awnsers the question - what surveys do we have loaded ?
	insert into @t_response (survey_unique_name, survey_name, survey_time_period) 
	select 
		distinct
	
		--convert(varchar,(survey_question_key)) + ':' + 
		survey_name + ' (' + time_period + ')',
		survey_name,
		time_period

	from dbo.dim_survey_question sq
	order by 
		survey_name;

	return;
END
GO
