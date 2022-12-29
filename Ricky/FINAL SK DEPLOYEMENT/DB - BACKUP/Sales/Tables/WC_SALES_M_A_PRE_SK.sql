IF  EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[dbo].[WC_SALES_M_A_PRE_SK]'))
DROP TABLE [dbo].[WC_SALES_M_A_PRE_SK]
GO 

CREATE TABLE [dbo].[WC_SALES_M_A_PRE_SK](
	[COUNTRY_CODE] [nvarchar](2) NULL,
	[MONTH_WID] [numeric](10, 0) NULL,
	[SALES_TYPE_WID] [numeric](10, 0) NULL,
	[PRODUCT_WID] [numeric](10, 0) NULL,
	[PROM_MAT_WID] [numeric](10, 0) NULL,
	[ACCNT_WID] [numeric](10, 0) NULL,
	[TGT_ACCNT_WID] [numeric](10, 0) NULL,
	[GEO_WID] [numeric](10, 0) NULL,
	[VENDING_M_WID] [numeric](10, 0) NULL,
	[CHANNEL_WID] [numeric](10, 0) NULL,
	[SEGMENT_WID] [numeric](10, 0) NULL,
	[D_POSTN_WID2] [numeric](10, 0) NULL,
	[AMT_CURCY] [nvarchar](15) NULL,
	[ACTL_SHIPMENT_QTY_C] [numeric](22, 7) NULL,
	[ACTL_SHIPMENT_QTY] [numeric](22, 7) NULL,
	[ACTL_GROSS_SHIPMENT_AMT] [numeric](21, 7) NULL,
	[ACTL_GROSS_SHIPMENT_AMT_USD] [numeric](21, 7) NULL,
	[ACTL_NET_SHIPMENT_AMT] [numeric](21, 7) NULL,
	[ACTL_NET_SHIPMENT_AMT_USD] [numeric](21, 7) NULL,
	[GROSS_MARGIN] [numeric](21, 7) NULL,
	[GROSS_MARGIN_USD] [numeric](21, 7) NULL,
	[NET_MARGIN] [numeric](21, 7) NULL,
	[NET_MARGIN_USD] [numeric](21, 7) NULL,
	[PRODUCT_MARGIN] [numeric](21, 7) NULL,
	[PRODUCT_MARGIN_USD] [numeric](21, 7) NULL,
	[MARKET_EXPENDITURE] [numeric](21, 7) NULL,
	[MARKET_EXPENDITURE_USD] [numeric](21, 7) NULL,
	[SALES_EXPENDITURE] [numeric](21, 7) NULL,
	[SALES_EXPENDITURE_USD] [numeric](21, 7) NULL,
	[CONTRIBUTION] [numeric](21, 7) NULL,
	[CONTRIBUTION_USD] [numeric](21, 7) NULL,
	[OPERATING_PROFIT] [numeric](21, 7) NULL,
	[OPERATING_PROFIT_USD] [numeric](21, 7) NULL,
	[TAX_AMOUNT] [numeric](21, 7) NULL,
	[TAX_AMOUNT_USD] [numeric](21, 7) NULL,
	[PROM_MAT_QTY] [numeric](15, 0) NULL,
	[QUOTE_WID] [numeric](10, 0) NULL,
	[X_BU_ID] [nvarchar](30) NULL,
	[ASSMT_ST_DT_WID] [numeric](10, 0) NULL,
	[ROW_WID] [numeric](10, 0) IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO


