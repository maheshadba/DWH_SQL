USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [survey_views].[f_replace_chars]
(
	@p_input_string varchar(max)
)
RETURNS varchar(max)
AS
BEGIN
	
	if (@p_input_string is null or @p_input_string='') return null;

	return replace(replace(replace(@p_input_string,char(13),' '),char(9),' '),char(10),' ');
END
GO
