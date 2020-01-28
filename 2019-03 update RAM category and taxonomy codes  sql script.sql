---
---   March 2019 update RAM
---   add one new subcategory, some new Taxonomy codes, active some txonomy codes that has been edited but flegged "inactive"
---   
---   insert 5 new taxonomy codes
---
exec [dbo].[Proc_Insert_update_Table_InterestTaxonomy]
@InterestTaxonomyID =104,
@InterestTaxonomyDelivery = N'mapped',
@InterestTaxonomyCode =N'BM-6500.1500',
@InterestTaxonomyTerms = N'Clothing',
@InterestTaxonomyDesc = '',
@Active = 1,
@Phase = 4
GO
exec [dbo].[Proc_Insert_update_Table_InterestTaxonomy]
@InterestTaxonomyID =105,
@InterestTaxonomyDelivery = N'mapped',
@InterestTaxonomyCode =N'LN-7800',
@InterestTaxonomyTerms = N'Sexual Health Centres',
@InterestTaxonomyDesc = '',
@Active = 1,
@Phase = 4
GO
exec [dbo].[Proc_Insert_update_Table_InterestTaxonomy]
@InterestTaxonomyID =106,
@InterestTaxonomyDelivery = N'mapped',
@InterestTaxonomyCode =N'RX-8470.1900-610',
@InterestTaxonomyTerms = N'needle exchange',
@InterestTaxonomyDesc = 'this taxonomy term appears in two main categories',
@Active = 1,
@Phase = 4
GO
exec [dbo].[Proc_Insert_update_Table_InterestTaxonomy]
@InterestTaxonomyID =107,
@InterestTaxonomyDelivery = N'mapped',
@InterestTaxonomyCode =N'RX-8470.1900-840',
@InterestTaxonomyTerms = N'supervised injection sites',
@InterestTaxonomyDesc = 'this taxonomy term appears in two main categories',
@Active = 1,
@Phase = 4
GO
exec [dbo].[Proc_Insert_update_Table_InterestTaxonomy]
@InterestTaxonomyID =108,
@InterestTaxonomyDelivery = N'Both',
@InterestTaxonomyCode =N'TJ-3000',
@InterestTaxonomyTerms = N'Information and Referral',
@InterestTaxonomyDesc = 'we want this tax term to show up in any search result but we do not want to see duplicate records',
@Active = 1,
@Phase = 4
GO

---
--- active 12 code; changing 1 code from list to mapped
---
update [dbo].[InterestTaxonomy] set Active = 1,Phase = 4, changedDate = getdate() where InterestTaxonomyCode = 'BD-1800.2000'
update [dbo].[InterestTaxonomy] set Active = 1,Phase = 4, changedDate = getdate() where InterestTaxonomyCode = 'BD-5000.8300'
update [dbo].[InterestTaxonomy] set Active = 1,Phase = 4, changedDate = getdate() where InterestTaxonomyCode = 'BH-8600'
update [dbo].[InterestTaxonomy] set Active = 1,Phase = 4, changedDate = getdate() where InterestTaxonomyCode = 'FP-0500'
update [dbo].[InterestTaxonomy] set Active = 1,Phase = 4, changedDate = getdate() where InterestTaxonomyCode = 'LJ-2000.0100-050'
update [dbo].[InterestTaxonomy] set Active = 1,Phase = 4, changedDate = getdate() where InterestTaxonomyCode = 'LT-1750.7935'
update [dbo].[InterestTaxonomy] set Active = 1,Phase = 4, changedDate = getdate() where InterestTaxonomyCode = 'RM-7000'
update [dbo].[InterestTaxonomy] set Active = 1,Phase = 4, changedDate = getdate() where InterestTaxonomyCode = 'RP-6400.1900'
update [dbo].[InterestTaxonomy] set Active = 1,Phase = 4, changedDate = getdate() where InterestTaxonomyCode = 'RP-6400.8000-620'
update [dbo].[InterestTaxonomy] set Active = 1,Phase = 4, changedDate = getdate() where InterestTaxonomyCode = 'RX-8450.1150'
update [dbo].[InterestTaxonomy] set Active = 1,Phase = 4, changedDate = getdate() where InterestTaxonomyCode = 'RX-8450.3300'
update [dbo].[InterestTaxonomy] set Active = 1,Phase = 4, changedDate = getdate() where InterestTaxonomyCode = 'RX-8450.7900'
update [dbo].[InterestTaxonomy] set [InterestTaxonomyDelivery] = 'Mapped', Active = 1,Phase = 4, changedDate = getdate() where InterestTaxonomyCode = 'RP-1500.1400'

---
-- changing 2 subcategory 
---
update SubCategory set SubCategory = 'Treatment Services'
, SubCategory_fr = N'Services de traitement'
, Active = 1
, changedDate = getdate()
where SubCategoryID = 2
go

update SubCategory set  
  SubCategory_fr = N'Ligne d’assistance'
, Active = 1
, changedDate = getdate()
where SubCategoryID = 18


---
---  insert or update Table "TopCategoryID_SubCategoryID"
---
EXEC [dbo].[Proc_Insert_Update_Table_TopCategoryID_SubCategoryID] @Tid = 4, @SID = 11, @active = 1
EXEC [dbo].[Proc_Insert_Update_Table_TopCategoryID_SubCategoryID] @Tid = 10, @SID = 23, @active = 1
EXEC [dbo].[Proc_Insert_Update_Table_TopCategoryID_SubCategoryID]  @Tid = 3, @SID = 7, @active = 1
EXEC [dbo].[Proc_Insert_Update_Table_TopCategoryID_SubCategoryID]  @Tid = 2, @SID = 5, @active = 1
EXEC [dbo].[Proc_Insert_Update_Table_TopCategoryID_SubCategoryID]  @Tid = 1, @SID = 2, @active = 1
EXEC [dbo].[Proc_Insert_Update_Table_TopCategoryID_SubCategoryID]  @Tid = 3, @SID = 8, @active = 1
EXEC [dbo].[Proc_Insert_Update_Table_TopCategoryID_SubCategoryID]  @Tid = 7, @SID = 17, @active = 1
EXEC [dbo].[Proc_Insert_Update_Table_TopCategoryID_SubCategoryID]  @Tid = 8, @SID = 18, @active = 1


---
--- modifying Table [RAM].[dbo].[SubcategoryID_InterestTaxonomyID]
---
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'BD-1800.2000', @subcategoryID = 11
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'BD-5000.8300', @subcategoryID = 11
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'BH-8600', @subcategoryID = 11
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'BM-6500.1500', @subcategoryID = 11
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'FP-0500', @subcategoryID = 23
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'LJ-2000.0100-050', @subcategoryID = 7
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'LN-7800', @subcategoryID = 7
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'LT-1750.7935', @subcategoryID = 5
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'RM-7000', @subcategoryID = 2
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'RP-6400.1900', @subcategoryID = 2
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'RP-6400.8000-620', @subcategoryID = 2
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'RX-8450.1150', @subcategoryID = 2
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'RX-8450.3300', @subcategoryID = 2
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'RX-8450.7900', @subcategoryID = 8
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'RX-8470.1900-610', @subcategoryID = 8
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'RX-8470.1900-610', @subcategoryID = 17
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'Rx-8470.1900-840', @subcategoryID = 8
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'Rx-8470.1900-840', @subcategoryID = 17
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'RP-1500.1400', @subcategoryID = 18
GO

---
--- adding taxonomy "TJ-3000" to all subcatery 
--- 
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 1
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 2
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 4
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 5
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 6
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 7
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 8
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 9
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 10
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 11
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 12
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 13
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 14
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 15
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 16
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 17
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 18
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 19
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 22
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 23
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 24
GO
EXEC [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] @taxonomyCode = N'TJ-3000', @subcategoryID = 25
GO