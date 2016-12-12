-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =======================================================================================================================================
-- Author:		William Chen
-- Create date: Aug.29, 2016
-- Description:	Accounting to access to token, get resource by its coverage, and filter by language.  
-- =======================================================================================================================================
ALTER PROCEDURE Proc_Get_Resource_By_Coverage 
 @s nvarchar (255)  ,
 @lang nvarchar(50)  ,
 @token nvarchar(50)  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Set @s = LTRIM(RTRIM(@s))  ;


	SELECT		DISTINCT
						a.ETLLoadID, 
						a.ResourceAgencyNum,
						a.Map, 
						a.SubCategoryID, 
						CASE @lang WHEN 'EN' THEN SC.SubCategory ELSE SC.SubCategory_fr END AS SubCategory, 
						a.TOPCategoryID, 
                        CASE @lang WHEN 'EN' THEN TC.TopCategory ELSE TC.TopCategory_fr END AS TopCategory, 
						a.PublicName AS Name, 
						--CASE c.CityName WHEN 'TBD' THEN a.publicname ELSE CONVERT(NVARCHAR(2000), 
                        --a.publicname + ', ' + c.CityName + ', ' + p.[ProvinceAlias]) END AS PublicNames, 
						a.AgencyDescription, 
						a.PhysicalAddress, 
						a.PhysicalCityID, 
                        CASE c.CityName WHEN 'TBD' THEN '' ELSE c.CityName END AS City, 
						a.PhysicalProvinceID, 
						CASE p.[ProvinceAlias] WHEN 'OTHS' THEN '' WHEN 'Others' THEN '' ELSE p.[ProvinceAlias] END AS Province, 
                        a.PhysicalCountry, 
						a.PhysicalPostalCode, 
						REPLACE(ETL.TaxonomyTerm, '/', ' ') AS STerm, 
						REPLACE(ETL.TaxonomyTerms, '/', ' ') AS LTerms, 
						a.PhysicalAddressIsPrivate, 
						a.Latitude, 
						a.Longitude, 
                        a.HoursOfOperation, 
						a.Phone, 
						a.WebsiteAddress, 
						a.Eligibility, 
						a.DisabilitiesAccess, 
						a.FeeStructureSource, 
						a.ApplicationProcess, 
						a.DocumentsRequired, 
						a.LanguagesOfferedList, 
						a.LanguageOfRecord, 
                        a.WorkHours, 
						a.CustomEligibilitybyAge, 
						a.Coverage, 
						a.CoverageArea, 
						a.NormalWaitTime 
	FROM ramresource as a  
					-- Return only those resources whose TopCategoryID is in the allowing TopCategory list
					JOIN		F_Get_Allow_TopCategory (@token) AS ATC ON ATC.TopCategoryID = A.TOPCategoryID 
					-- Return only those resources whose PhysicalCityID is in the allowing City list
					JOIN		F_Get_ALL_Allow_City  (@token)  AS ACID ON ACID.CityID = A.PhysicalCityID 
		 
					JOIN [dbo].[SubCategory] AS SC	ON SC.[SubCategoryID] = A.SubCategoryID
					JOIN [dbo].[TopCategory] AS TC	ON TC.TopCategoryID = A.TOPCategoryID
					INNER JOIN  CityLocation AS c   ON a.PhysicalCityID = c.CityId 
					INNER JOIN  Province     AS p   ON a.PhysicalProvinceID = p.ProvinceID 
					INNER JOIN  ETLLoad      AS ETL ON a.ETLLoadID = ETL.ETLLoadID 
					CROSS APPLY 	( 
										select ¡¡   f.id,  f.KEYWORD   from   F_Splite_Coverage_into_word   (a.etlloadid )  as f  
									)  AS K	
	WHERE   a.LanguageOfRecord = @lang     
			AND		SC.Active = 1   
			AND		TC.Active = 1   
			AND		K.KEYWORD  like   ''   + @s  +   '%'  +  ''  
	ORDER BY  a.TOPCategoryID,  a.SubCategoryID, a.Map


END
GO
