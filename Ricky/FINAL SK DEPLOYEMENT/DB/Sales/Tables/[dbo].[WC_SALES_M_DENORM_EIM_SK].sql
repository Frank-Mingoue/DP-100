----------- BEGIN CREATE TABLE [dbo].[MERGE_WC_RTLAUDIT_F_SK]--------------------------

PRINT 'CREATE TABLE [WC_SALES_M_DENORM_EIM_SK]'
GO

IF  EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'[dbo].[WC_SALES_M_DENORM_EIM_SK]'))
DROP TABLE [dbo].[WC_SALES_M_DENORM_EIM_SK]
GO 

CREATE TABLE [dbo].[WC_SALES_M_DENORM_EIM_SK](
	[ROW_WID] [numeric](10, 0) IDENTITY(1,1) NOT NULL,
	[PERIOD_NAME] [nvarchar](50) NOT NULL,
	[SALES_TYPE] [nvarchar](30) NOT NULL,
	[ACCNT_LOC] [nvarchar](50) NULL,
	[ACCNT_NAME] [nvarchar](100) NOT NULL,
	[PROD_NAME] [nvarchar](100) NOT NULL,
	[PROD_VENDOR_LOC] [nvarchar](50) NULL,
	[PROD_VENDOR_NAME] [nvarchar](100) NULL,
	[ACTL_SHIPMENT_QTY_CASES] [numeric](22, 7) NULL,
	[ACTL_SHIPMENT_QTY] [numeric](22, 7) NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)
GO
------------------------- END CREATE TABLE [WC_SALES_M_DENORM_EIM_SK] --------------------------
