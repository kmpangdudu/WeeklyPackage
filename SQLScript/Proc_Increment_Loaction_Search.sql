-- =============================================
-- Author:		WILLIAM CHEN
-- Create date: Nov. 26, 2015
-- Description:	Loaction Increment search for auto-complete
-- =============================================
CREATE PROCEDURE [dbo].[Proc_Increment_Loaction_Search]
	-- Add the parameters for the stored procedure here
@L nvarchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT TOP (30) c.cityid, c.ProvinceID, c.[CityName]+ ', '+ p.ProvinceAlias AS Location  
	FROM [dbo].[CityLocation] AS c join province AS p ON c.ProvinceID = p.ProvinceID
	WHERE p.ProvinceID < 15 and c.[CityName] like ''+ @L+'%'
	ORDER BY c.[CityName], p.ProvinceAlias
END