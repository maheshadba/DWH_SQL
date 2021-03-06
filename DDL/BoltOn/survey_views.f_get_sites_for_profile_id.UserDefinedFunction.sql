USE [dwh_test]
GO
/****** Object:  UserDefinedFunction [survey_views].[f_get_sites_for_profile_id]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [survey_views].[f_get_sites_for_profile_id]
(
	@p_profile_id		int	= 0
)
RETURNS 
@sites TABLE 
(
	siteid int not null primary key
)
AS
BEGIN

	if @p_profile_id = 0
	begin

		insert into @sites
		select 
			distinct
		ee.SiteID
		from survey_views.ExportEntities ee

		return;
	end
	else
	begin

		insert into @sites
		select 
		distinct
		ee.SiteID
		from survey_views.ExportEntities ee 
		where 
		ee.ExportProfileID=@p_profile_id
		and
		ee.ExcludeTribal=0
		and
		isnull(ee.ExportDisabled,1)!=1
	end;

	
	return; 
END
GO
