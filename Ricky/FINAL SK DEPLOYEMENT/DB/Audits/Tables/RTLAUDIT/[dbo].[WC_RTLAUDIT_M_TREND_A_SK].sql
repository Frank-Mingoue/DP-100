----------- BEGIN CREATE TABLE [dbo].[WC_RTLAUDIT_ML_M_TREND_A_SK]--------------------------

PRINT 'CREATE TABLE [WC_RTLAUDIT_ML_M_TREND_A_SK]'
GO


IF  EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[dbo].[WC_RTLAUDIT_M_TREND_A_SK]'))
DROP TABLE [dbo].[WC_RTLAUDIT_M_TREND_A_SK]
GO 

CREATE TABLE [dbo].[WC_RTLAUDIT_M_TREND_A_SK](
	[ROW_WID] [numeric](10, 0) NULL,
	[MONTH_WID] [numeric](10, 0) NOT NULL DEFAULT ((0)),
	[PROD_WID] [numeric](10, 0) NOT NULL DEFAULT ((0)),
	[ACCNT_WID] [numeric](10, 0) NULL DEFAULT ((0)),
	[INVLOC_WID] [numeric](10, 0) NULL DEFAULT ((0)),
	[DISPLAY_FLG] [nchar](1) NULL,
	[OUT_OF_STOCK_FLG] [nchar](1) NULL,
	[FACING_NUM] [numeric](22, 7) NULL,
	[SLOTS_NUM] [numeric](10, 0) NULL,
	[ACTIVITY_TYPE] [numeric](10, 0) NULL DEFAULT ((0)),
	[REPLENISH_FLG] [nchar](1) NULL,
	[REPLENISH_QTY] [numeric](22, 7) NULL,
	[ACTL_SHIPMENT_QTY] [numeric](22, 7) NULL,
	[BASE_ENTRY_FLG] [nvarchar](3) NULL,
	[OWNER_POSTN_WID] [numeric](10, 0) NULL,
	[EMP_WID] [numeric](10, 0) NULL,
	[TC_FACING_NUM] [numeric](22, 7) NULL,
	[BU_ID] [nvarchar](30) NULL,
	[ATTRIB_117] [numeric](22, 7) NULL,
	[CORRECTED_OOS] [nchar](1) NULL,
	[ATTRIB_52] [numeric](10, 0) NULL,
	[ATTRIB_96] [nchar](1) NULL,
	[STOCK_NUM] [numeric](10, 0) NULL,
	[ATTRIB_121] [numeric](10, 0) NULL,
	[ATTRIB_122] [numeric](10, 0) NULL,
	[X_SELLING_CARTON_AMT] [numeric](18, 3) NULL,
	[X_SELLING_CARTON_AMT_USD] [numeric](18, 3) NULL,
	[ATTRIB_119] [nchar](1) NULL,
	[X_NB_FACINGS_OOS] [numeric](18, 3) NULL,
	[X_SKU_POS_CD1] [nvarchar](30) NULL,
	[X_SKU_POS_CD2] [nvarchar](30) NULL,
	[X_OOS_REASON_CD] [nvarchar](30) NULL,
	[X_CONTRACT_PRD_FLG] [nchar](1) NULL,
	[U_PRICE_PT] [numeric](22, 7) NULL,
	[X_STD_PRICE_PACK_REACHED] [nchar](1) NULL,
	[X_STD_PRICE_CARTON_REACHED] [nchar](1) NULL,
	[U_CURCY_CD] [nvarchar](20) NULL,
	[ATTRIB_115] [nvarchar](20) NULL,
	[PRICE_PT] [numeric](22, 7) NULL,
	[ATTRIB_106] [numeric](22, 7) NULL,
	[ATTRIB_116] [numeric](22, 7) NULL,
	[X_SKU_POS_CD4] [nvarchar](30) NULL,
	[INVLOV_SLOTS_NUM] [numeric](10, 0) NULL,
	[INVLOC_FACINGS_NUM] [numeric](10, 0) NULL,
	[X_EXPIRED_PRODUCTS_FLG] [nchar](1) NULL,
	[PROD_POSITION] [nvarchar](30) NULL,
	[ACTIVITY_TYPE_VAL] [nvarchar](30) NULL,
	[PROD_IMPORTANCE] [nvarchar](30) NULL,
	[X_SIS_CONTRACT_FLG] [nchar](1) NULL,
	[RTLAUDIT_PREV_WID] [numeric](10, 0) NULL DEFAULT ((0)),
	[ATTRIB_02] [numeric](22, 7) NULL,
	[X_PMP_FLG] [nvarchar](1) NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WC_RTLAUDIT_ML_M_TREND_A_SK]') AND name = N'[CCSI-dbo-WC_RTLAUDIT_ML_M_TREND_A_SK]')
CREATE CLUSTERED COLUMNSTORE INDEX [CCSI-dbo-WC_RTLAUDIT_ML_M_TREND_A_SK] ON [dbo].[WC_RTLAUDIT_ML_M_TREND_A_SK] WITH (DROP_EXISTING = OFF)
GO 

---------------------------------- END CREATE TABLE [dbo].[WC_RTLAUDIT_ML_M_TREND_A_SK] -----------------------------

