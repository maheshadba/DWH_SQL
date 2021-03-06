USE [dwh_test]
GO
/****** Object:  StoredProcedure [survey_views].[usp_etl_exportprofiles_select]    Script Date: 11/27/2017 1:27:29 PM ******/
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

select 
 distinct
etlw.ExportProfileID,
etlw.ProfileName

from  survey_views.f_get_survey_etl_work() etlw;



end;
GO
