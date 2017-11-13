USE [dwh_test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [survey_views].[usp_etl_exportprofiles_select]
as
begin
set nocount on;

/** 
	provides a list of export profile id's to process for client extracts
**/

select distinct 
EE.ExportProfileID, 
EP.ProfileName
from survey_views.ExportEntities EE
inner join survey_views.ExportProfile EP 
on EP.ExportProfileID = EE.ExportProfileID
where EP.Active = 1 
and EE.ExcludeTribal = 0
and isnull(EE.ExportDisabled,0) != 1;



end;
GO
