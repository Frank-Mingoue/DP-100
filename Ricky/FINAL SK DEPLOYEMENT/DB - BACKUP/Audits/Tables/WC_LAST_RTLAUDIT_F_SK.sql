IF  EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[dbo].[WC_LAST_RTLAUDIT_F_SK]'))
DROP TABLE [dbo].[WC_LAST_RTLAUDIT_F_SK]
GO 

CREATE TABLE [dbo].[WC_LAST_RTLAUDIT_F_SK](
	[ACCT_GEO_WID] [numeric](10, 0) NOT NULL ,
	[EMP_WID] [numeric](10, 0) NOT NULL ,
	[ETL_PROC_WID] [numeric](10, 0) NOT NULL,
	[FACING_POS_WID] [numeric](10, 0) NOT NULL ,
	[INTEGRATION_ID] [nvarchar](30) NOT NULL,
	[INVLOC_WID] [numeric](10, 0) NOT NULL ,
	[LAST_AUDIT_FLG] [nchar](1) NOT NULL,
	[OBJECTIVE_WID] [numeric](10, 0) NOT NULL ,
	[OWNER_POSTN_WID] [numeric](10, 0) NOT NULL ,
	[PROD_WID] [numeric](10, 0) NOT NULL ,
	[RECORD_DATE_WID] [numeric](10, 0) NOT NULL ,
	[ROW_WID] [numeric](10, 0) NOT NULL,
	[STORE_WID] [numeric](10, 0) NOT NULL ,
	[BACK_STOCK] [numeric](22, 7) NULL,
	[DISPLAY_FLG] [nchar](1) NULL,
	[DISPLAY_STOCK] [numeric](22, 7) NULL,
	[FACING_NUM] [numeric](22, 7) NULL,
	[FEATURE_FLG] [nchar](1) NULL,
	[LAST_REPLENISH_DT] [datetime] NULL,
	[OUT_OF_STOCK_FLG] [nchar](1) NULL,
	[PRICE_PT] [numeric](22, 7) NULL,
	[ROTATED_FLG] [nchar](1) NULL,
	[SHELF_STOCK] [numeric](22, 7) NULL,
	[TPR_FLG] [nchar](1) NULL,
	[TPR_PCT] [numeric](22, 7) NULL,
	[U_EXCH_DT] [datetime] NULL,
	[U_PRICE_PT] [numeric](22, 7) NULL,
	[VOID_FLG] [nchar](1) NULL,
	[U_CURCY_CD] [nvarchar](20) NULL,
	[ROW_LOAD_DT] [datetime] NOT NULL,
	[ATTRIB_06] [numeric](22, 7) NULL,
	[FK_01_WID] [numeric](10, 0) NULL,
	[ATTRIB_31] [nvarchar](30) NULL,
	[ATTRIB_92] [nchar](1) NULL,
	[ATTRIB_93] [nchar](1) NULL,
	[ATTRIB_96] [nchar](1) NULL,
	[ATTRIB_61] [numeric](22, 7) NULL,
	[ATTRIB_62] [numeric](22, 7) NULL,
	[ATTRIB_52] [numeric](22, 7) NULL,
	[ATTRIB_91] [nvarchar](255) NULL,
	[FK_04_WID] [numeric](10, 0) NULL,
	[ATTRIB_54] [numeric](10, 0) NULL,
	[ATTRIB_55] [numeric](10, 0) NULL,
	[ATTRIB_56] [numeric](10, 0) NULL,
	[ATTRIB_57] [numeric](10, 0) NULL,
	[ATTRIB_60] [numeric](22, 7) NULL,
	[ATTRIB_102] [numeric](10, 0) NULL,
	[ATTRIB_103] [numeric](22, 7) NULL,
	[ATTRIB_104] [numeric](22, 7) NULL,
	[ATTRIB_105] [numeric](22, 7) NULL,
	[FK_05_WID] [numeric](10, 0) NULL,
	[FK_06_WID] [numeric](10, 0) NULL,
	[ATTRIB_106] [numeric](22, 7) NULL,
	[ATTRIB_107] [nvarchar](100) NULL,
	[ATTRIB_108] [numeric](22, 7) NULL,
	[X_BU_ID] [nvarchar](30) NULL,
	[ATTRIB_109] [nchar](1) NULL,
	[ATTRIB_110] [numeric](22, 7) NULL,
	[ATTRIB_111] [numeric](10, 0) NULL,
	[ATTRIB_112] [numeric](10, 0) NULL,
	[ATTRIB_113] [numeric](10, 0) NULL,
	[ATTRIB_114] [nchar](1) NULL,
	[ATTRIB_115] [nvarchar](20) NULL,
	[ATTRIB_116] [numeric](22, 7) NULL,
	[ATTRIB_117] [numeric](10, 0) NULL,
	[ATTRIB_118] [nvarchar](30) NULL,
	[ATTRIB_119] [nvarchar](1) NULL,
	[ATTRIB_120] [nvarchar](10) NULL,
	[MONTH_WID] [numeric](10, 0) NULL,
	[X_EXPIRED_QTY_RECALL] [numeric](22, 7) NULL,
	[X_LAST_REPLENISH_DT] [datetime] NULL,
	[X_SALESMEN_PRESENCE_FLG] [nchar](1) NULL,
	[X_UNKNOWN_SOURCE_FLG] [nchar](1) NULL,
	[X_AVAILABILITY] [nvarchar](30) NULL,
	[X_OUT_OF_STOCK_FLG] [nchar](1) NULL,
	[ACTIVITY_WID] [numeric](10, 0) NOT NULL,
	[ACTIVITY_ID] [nvarchar](30) NULL,
	[ACTIVITY_ACTUAL_START_DT_WID] [numeric](10, 0) NULL,
	[LAST_ACTIVITY_FLG] [nchar](1) NOT NULL ,
	[STOCK_NUM] [numeric](10, 0) NULL,
	[X_QTY_MERCHANDISED] [numeric](22, 7) NULL,
	[X_SUGGESTED_FLG] [nchar](1) NULL,
	[X_DAYS_NXT_ORD_NUM] [numeric](10, 0) NULL,
	[ATTRIB_04] [numeric](22, 7) NULL,
	[ATTRIB_05] [numeric](22, 7) NULL,
	[ATTRIB_121] [numeric](10, 0) NULL,
	[ATTRIB_122] [numeric](10, 0) NULL,
	[ATTRIB_123] [numeric](10, 0) NULL,
	[GEO_WID] [numeric](10, 0) NULL ,
	[GEO_SEC_WID] [numeric](10, 0) NULL ,
	[X_DOMESTIC_PRICE] [numeric](22, 7) NULL,
	[X_AVAILABLE_STOCK_NUM] [numeric](22, 7) NULL,
	[X_CONTRACTED_FLG] [nvarchar](1) NULL,
	[X_EXCHANGED_LABEL_NUM] [numeric](22, 7) NULL,
	[X_RETRO_FLG] [nvarchar](1) NULL ,
	[VISIT_INPUT_DT] [datetime] NULL,
	[X_IN_STOCK_CD] [nvarchar](30) NULL,
	[X_PMP_FLG] [nvarchar](1) NULL ,
	[X_EXPIRED_PRODUCTS_FLG] [nvarchar](1) NULL,
	[RTLAUDIT_PREV_WID] [numeric](10, 0) NULL,
	[PERIOD_WID] [numeric](10, 0) NULL,
	[DEVELOPMENT_DAY_FLG] [nvarchar](1) NULL,
	[X_REASON_CODE] [nvarchar](30) NULL,
	[X_IMPORTANCE_INDICATOR] [nvarchar](30) NULL,
	[X_SELLING_CARTON_AMT] [numeric](18, 3) NULL,
	[X_SELLING_CARTON_AMT_USD] [numeric](18, 3) NULL,
	[X_NB_FACINGS_OOS] [numeric](18, 3) NULL,
	[X_SKU_POS_CD1] [nvarchar](30) NULL,
	[X_SKU_POS_CD2] [nvarchar](30) NULL,
	[X_OOS_REASON_CD] [nvarchar](30) NULL,
	[X_CONTRACT_PRD_FLG] [nchar](1) NULL,
	[X_JTI_OOS_EXIT_REASON_CD] [nvarchar](30) NULL,
	[X_AUDIT_WRONG_FLG] [nchar](1) NULL,
	[X_AUDIT_COMMENTS_TEXT] [nvarchar](255) NULL,
	[X_STD_PRICE_PACK_REACHED] [nchar](1) NULL,
	[X_STD_PRICE_CARTON_REACHED] [nchar](1) NULL,
	[X_ATTRIBUTE_1] [numeric](22, 7) NULL,
	[X_SKU_POS_CD4] [nvarchar](30) NULL,
	[X_PRESALE_FLG] [nchar](1) NULL,
	[X_ACTUAL_ORD_QTY_NUM] [numeric](22, 7) NULL,
	[X_CARTON_PLATFORM_CD] [nvarchar](30) NULL,
	[X_CARTON_LOCATION_CD] [nvarchar](30) NULL,
	[X_PACK_LOCATION_CD] [nvarchar](30) NULL,
	[X_PACK_PLATFORM_CD] [nvarchar](30) NULL,
	[X_INDUSTRY_FIXTURE_CD] [nvarchar](30) NULL,
	[X_FIXTURE_SIZE_CD] [nvarchar](30) NULL,
	[LAST_CYCLE_FLG] [nchar](1) NULL,
	[LAST_CYCLE_EMP_FLG] [nchar](1) NULL,
	[X_FACING_IMP_NUM] [numeric](22, 7) NULL,
	[X_BU_WID] [numeric](10, 0) NULL,
	[PROD_POSITION] [nvarchar](30) NULL,
	[ACTIVITY_TYPE] [nvarchar](30) NULL,
	[PROD_IMPORTANCE] [nvarchar](30) NULL,
	[TARGET_POS] [nvarchar](30) NULL,
	[FACING_POS] [nvarchar](30) NULL,
	[X_OUT_STOCK_CD] [nvarchar](30) NULL,
	[X_SIS_CONTRACT_FLG] [nchar](1) NULL,
	[X_OOS_REASON_CD_VAL] [nvarchar](30) NULL,
	[X_MPLS_INCREASED_NUM] [numeric](10, 0) NULL,
	[X_W_SALER_RRP_NUM] [numeric](22, 7) NULL,
	[X_W_SALER_OUTER_PRICE_NUM] [numeric](22, 7) NULL,
	[X_W_SALER_POR_NUM] [numeric](22, 7) NULL,
	[X_JTI_RRP_NUM] [numeric](22, 7) NULL,
	[X_NO_PACKS_ON_SHELF_NUM] [numeric](10, 0) NULL,
	[X_NO_OUTERS_ON_SHELF_NUM] [numeric](10, 0) NULL,
	[X_OOS_RISK] [numeric](22, 7) NULL,
	[X_WRONG_OOS_RISK_CD] [nvarchar](30) NULL,
	[ATTRIB_02] [numeric](22, 7) NULL,
	[X_CAT_FACINGS_2_NUM] [numeric](10, 0) NULL,
	[ROTATION_FLAG] [nvarchar](1) NULL,
	[SIS_ROTATION_FLAG] [nvarchar](1) NULL,
	[X_POR_NUM] [numeric](22, 7) NULL,
	[X_PROMO_PRICE_CD] [nvarchar](30) NULL,
	[X_SALES_DISTRIB_NUM] [numeric](22, 7) NULL,
	[AVAILABILITY_DURATION] [numeric](10, 0) NULL,
	[OOS_DURATION] [numeric](10, 0) NULL,
	[RTLAUDIT_PREV_DISPLAY_FLG] [nchar](1) NULL,
	[CYCLE_WID] [numeric](10, 0) NULL,
	[X_PREV_VISIT_PRICE] [numeric](22, 7) NULL,
	[X_PRICE_AUDIT_FLG] [nvarchar](1) NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[WC_LAST_RTLAUDIT_F_SK] ADD  DEFAULT ((0)) FOR [ACCT_GEO_WID]
GO

ALTER TABLE [dbo].[WC_LAST_RTLAUDIT_F_SK] ADD  DEFAULT ((0)) FOR [EMP_WID]
GO

ALTER TABLE [dbo].[WC_LAST_RTLAUDIT_F_SK] ADD  DEFAULT ((0)) FOR [FACING_POS_WID]
GO

ALTER TABLE [dbo].[WC_LAST_RTLAUDIT_F_SK] ADD  DEFAULT ((0)) FOR [INVLOC_WID]
GO

ALTER TABLE [dbo].[WC_LAST_RTLAUDIT_F_SK] ADD  DEFAULT ((0)) FOR [OBJECTIVE_WID]
GO

ALTER TABLE [dbo].[WC_LAST_RTLAUDIT_F_SK] ADD  DEFAULT ((0)) FOR [OWNER_POSTN_WID]
GO

ALTER TABLE [dbo].[WC_LAST_RTLAUDIT_F_SK] ADD  DEFAULT ((0)) FOR [RECORD_DATE_WID]
GO

ALTER TABLE [dbo].[WC_LAST_RTLAUDIT_F_SK] ADD  DEFAULT ((0)) FOR [STORE_WID]
GO

ALTER TABLE [dbo].[WC_LAST_RTLAUDIT_F_SK] ADD  DEFAULT ('Y') FOR [LAST_ACTIVITY_FLG]
GO

ALTER TABLE [dbo].[WC_LAST_RTLAUDIT_F_SK] ADD  DEFAULT ((0)) FOR [GEO_WID]
GO

ALTER TABLE [dbo].[WC_LAST_RTLAUDIT_F_SK] ADD  DEFAULT ((0)) FOR [GEO_SEC_WID]
GO

ALTER TABLE [dbo].[WC_LAST_RTLAUDIT_F_SK] ADD  DEFAULT ('N') FOR [X_RETRO_FLG]
GO

ALTER TABLE [dbo].[WC_LAST_RTLAUDIT_F_SK] ADD  DEFAULT ('N') FOR [X_PMP_FLG]
GO


