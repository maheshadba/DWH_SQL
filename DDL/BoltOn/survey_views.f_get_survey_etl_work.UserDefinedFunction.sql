USE [dwh_test]
GO
/****** Object:  UserDefinedFunction [survey_views].[f_get_survey_etl_work]    Script Date: 11/27/2017 1:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [survey_views].[f_get_survey_etl_work]
(	
)
RETURNS TABLE 
AS
RETURN 
(
		select 

		ep.ProfileName,
		ee.AgencyName,
		ee.SiteID,
		ep.ExportProfileID,
		ep.ExportTypeID,

		case 
			when ep.ExportTypeID in (0,2,4) then 'BAA' 
			when ep.ExportTypeID in (1,3,5) then 'DUA'
			when ep.ExportTypeID in (6,7,8) then 'SA'
		else 'NA'
		end
		as hash_policy,

		case 
			when ep.ExportTypeID in (4,5,8) then 'BCP'
		else 'TAB' 
		end
		as export_format_code,

		case 
			when ep.ExportTypeID in (2,3,7) then 1  
		else 0
		end
		as miechv_only,

		ee.ExcludeTribal 
		as exclude_tribal

 
		from survey_views.ExportProfile ep 
		inner join survey_views.ExportEntities ee 
			on ep.ExportProfileID=ee.ExportProfileID

		where 
		isnull(ee.ExportDisabled,1)=0

)
GO
