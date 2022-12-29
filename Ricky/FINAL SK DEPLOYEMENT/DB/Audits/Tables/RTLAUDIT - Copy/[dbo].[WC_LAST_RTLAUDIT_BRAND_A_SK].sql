----------- BEGIN CREATE TABLE [WC_LAST_RTLAUDIT_BRAND_A_SK]--------------------------

PRINT 'CREATE TABLE [WC_LAST_RTLAUDIT_BRAND_A_SK]'
GO


IF  EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[dbo].[WC_LAST_RTLAUDIT_BRAND_A_SK]'))
DROP TABLE [dbo].[WC_LAST_RTLAUDIT_BRAND_A_SK]
GO 

CREATE TABLE [dbo].[WC_LAST_RTLAUDIT_BRAND_A_SK](
	[ROW_WID] [numeric](10, 0) NOT NULL,
	[ETL_PROC_WID] [numeric](10, 0) NOT NULL,
	[ACTIVITY_ID] [nvarchar](30) NOT NULL,
	[BRAND_WID] [numeric](10, 0) NOT NULL,
	[DISPLAY_FLG] [nchar](1) NULL,
	[ATTRIB_117] [numeric](10, 0) NULL,
	[EMP_WID] [numeric](10, 0) NULL,
	[FK_05_WID] [numeric](10, 0) NULL,
	[FK_06_WID] [numeric](10, 0) NULL,
	[OWNER_POSTN_WID] [numeric](10, 0) NULL,
	[RECORD_DATE_WID] [numeric](10, 0) NULL,
	[STORE_WID] [numeric](10, 0) NULL,
	[X_BU_ID] [nvarchar](30) NULL,
	[ATTRIB_04] [numeric](22, 7) NULL,
	[ATTRIB_05_AVG] [numeric](22, 7) NULL,
	[ATTRIB_05_SUM] [numeric](22, 7) NULL,
	[ATTRIB_06] [numeric](22, 7) NULL,
	[ATTRIB_102] [numeric](10, 0) NULL,
	[ATTRIB_103] [numeric](22, 7) NULL,
	[ATTRIB_104] [numeric](22, 7) NULL,
	[ATTRIB_105] [numeric](22, 7) NULL,
	[ATTRIB_106] [numeric](22, 7) NULL,
	[ATTRIB_108] [numeric](22, 7) NULL,
	[ATTRIB_110] [numeric](22, 7) NULL,
	[ATTRIB_112] [numeric](10, 0) NULL,
	[ATTRIB_113] [numeric](10, 0) NULL,
	[ATTRIB_123] [numeric](10, 0) NULL,
	[ATTRIB_52] [numeric](10, 0) NULL,
	[ATTRIB_54] [numeric](10, 0) NULL,
	[ATTRIB_55] [numeric](10, 0) NULL,
	[ATTRIB_56] [numeric](10, 0) NULL,
	[ATTRIB_57] [numeric](10, 0) NULL,
	[ATTRIB_61] [numeric](22, 7) NULL,
	[ATTRIB_62] [numeric](22, 7) NULL,
	[ATTRIB_92] [nchar](1) NULL,
	[BACK_STOCK] [numeric](22, 7) NULL,
	[DISPLAY_STOCK] [numeric](22, 7) NULL,
	[FACING_NUM] [numeric](22, 7) NULL,
	[OUT_OF_STOCK_FLG] [nchar](1) NULL,
	[PRICE_PT] [numeric](22, 7) NULL,
	[U_PRICE_PT] [numeric](22, 7) NULL,
	[X_DAYS_NXT_ORD_NUM] [numeric](10, 0) NULL,
	[X_QTY_MERCHANDISED] [numeric](22, 7) NULL,
	[ATTRIB_111] [numeric](10, 0) NULL,
	[LAST_AUDIT_FLG] [nchar](1) NULL,
	[ACTIVITY_WID] [numeric](10, 0) NOT NULL,
	[LAST_ACTIVITY_FLG] [nchar](1) NOT NULL CONSTRAINT [DF_WC_LAST_RTLAUDIT_BRAND_A_SK_LAST_ACTIVITY_FLG]  DEFAULT ('Y'),
	[X_SELLING_CARTON_AMT] [numeric](18, 3) NULL,
	[X_SELLING_CARTON_AMT_USD] [numeric](18, 3) NULL,
	[X_NB_FACINGS_OOS] [numeric](18, 3) NULL,
	[X_CONTRACT_PRD_FLG] [nchar](1) NULL,
	[X_PRESALE_FLG] [nchar](1) NULL,
	[X_ACTUAL_ORD_QTY_NUM] [numeric](22, 7) NULL,
	[X_CARTON_PLATFORM_CD] [nvarchar](30) NULL,
	[X_CARTON_LOCATION_CD] [nvarchar](30) NULL,
	[X_PACK_LOCATION_CD] [nvarchar](30) NULL,
	[X_PACK_PLATFORM_CD] [nvarchar](30) NULL,
	[X_INDUSTRY_FIXTURE_CD] [nvarchar](30) NULL,
	[X_FIXTURE_SIZE_CD] [nvarchar](30) NULL,
	[FACING_POS_WID] [numeric](10, 0) NULL,
	[LAST_CYCLE_FLG] [nchar](1) NULL,
	[LAST_CYCLE_EMP_FLG] [nchar](1) NULL,
	[X_FACING_IMP_NUM] [numeric](22, 7) NULL,
	[X_BU_WID] [numeric](10, 0) NULL,
	[PROD_POSITION] [nvarchar](30) NULL,
	[ACTIVITY_TYPE] [nvarchar](30) NULL,
	[X_SIS_CONTRACT_FLG] [nchar](1) NULL,
	[X_CAT_FACINGS_2_NUM] [numeric](10, 0) NULL,
	[AVAILABILITY_DURATION] [numeric](10, 0) NULL,
	[OOS_DURATION] [numeric](10, 0) NULL
) ON [PRIMARY]

WITH
(
DATA_COMPRESSION = PAGE
)
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WC_LAST_RTLAUDIT_BRAND_A_SK]') AND name = N'[CCSI-dbo-WC_LAST_RTLAUDIT_BRAND_A_SK]')
CREATE CLUSTERED COLUMNSTORE INDEX [CCSI-dbo-WC_LAST_RTLAUDIT_BRAND_A_SK] ON [dbo].[WC_LAST_RTLAUDIT_BRAND_A_SK] WITH (DROP_EXISTING = OFF)
GO

------------------------- END CREATE TABLE [WC_LAST_RTLAUDIT_BRAND_A_SK] --------------------------
