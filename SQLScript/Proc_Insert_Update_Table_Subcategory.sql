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
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Proc_Insert_Update_Table_Subcategory
	-- Add the parameters for the stored procedure here
@SubCategory NVARCHAR(255),
@SubCategoryDesc NVARCHAR (500) = '',
@SubCategory_fr NVARCHAR(500) = N'',
@SubCategoryDesc_fr NVARCHAR(500) = N'',
@Active bit = 1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
  IF EXISTS (SELECT SubCategoryid FROM [RAM].[dbo].[SubCategory] WHERE SubCategory = @SubCategory )
	  BEGIN
		  UPDATE [RAM].[dbo].[SubCategory] SET
		  Active = @Active,
		  ChangedDate = GETDATE()
		  WHERE SubCategory = @SubCategory
	  END
	ELSE
		BEGIN
			INSERT INTO [RAM].[dbo].[SubCategory] 
				([SubCategory],[SubCategoryDesc],[SubCategory_fr],[SubCategoryDesc_fr],[Active],[ChangedDate])
			VALUES
				(@SubCategory,@SubCategoryDesc,@SubCategory_fr,@SubCategoryDesc_fr,  @Active  ,  getdate())
		END

END
GO
