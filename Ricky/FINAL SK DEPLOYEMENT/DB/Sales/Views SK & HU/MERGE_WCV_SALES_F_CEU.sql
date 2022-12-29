IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[MERGE_WCV_SALES_F_CEU]'))
DROP VIEW [dbo].[MERGE_WCV_SALES_F_CEU]
GO 

CREATE VIEW [dbo].[MERGE_WCV_SALES_F_CEU]
/*******************************************************************************

Versions Change History:2.0

Version#:2.0
Description: New Views for SK & HU markets
Modification Date: 10/06/2021
Process ID:	CHG215150
Development Team:TME-DEPLOYMENT
Modified by:Frank Mingou�

Number:1.1
Description of Changes:New column INTEGRATION_ID2
Release Date: 11/04/2016
Process ID: CHG092901
Development Team:TME-DATA-INTERFACE
Author:Rhishna Ramen

Number:1.0
Description of Changes: 
Release Date: 11/03/2014
Process ID: CHG063705
Development Team:TME-DATA-INTERFACE
Author:Robert Grenade

*******************************************************************************/
 (	[ROW_WID],
	[DATASOURCE_NUM_ID],
	[INTEGRATION_ID],
	[ETL_PROC_WID],
	[SALES_TYPE_WID],
	[START_DT_WID],
	[END_DT_WID],
	[PRODUCT_WID],
	[PROM_MAT_WID],
	[ACCNT_WID],
	[TGT_ACCNT_WID],
	[GEO_WID],
	[VENDING_M_WID],
	[QUOTE_WID],
	[ACTL_SHIPMENT_QTY_C],
	[ACTL_SHIPMENT_QTY],
	[ACTL_GROSS_SHIPMENT_AMT],
	[ACTL_GROSS_SHIPMENT_AMT_USD],
	[ACTL_NET_SHIPMENT_AMT],
	[ACTL_NET_SHIPMENT_AMT_USD],
	[GROSS_MARGIN],
	[GROSS_MARGIN_USD],
	[NET_MARGIN],
	[NET_MARGIN_USD],
	[PRODUCT_MARGIN],
	[PRODUCT_MARGIN_USD],
	[MARKET_EXPENDITURE],
	[MARKET_EXPENDITURE_USD],
	[SALES_EXPENDITURE],
	[SALES_EXPENDITURE_USD],
	[CONTRIBUTION],
	[CONTRIBUTION_USD],
	[OPERATING_PROFIT],
	[OPERATING_PROFIT_USD],
	[TAX_AMOUNT],
	[TAX_AMOUNT_USD],
	[PROM_MAT_QTY],
	[AMT_CURCY],
	[COUNTRY_CODE],
    [CHANNEL_WID],
    [SEGMENT_WID],
    [D_POSTN_WID2],
	[PERIOD_WID],
	[X_BU_ID], 
	[MONTH_WID],
    [YEAR_WID],
	[POSTN_WID],
	[SALES_DISCOUNT],
	[CUSTOMER_ORIENTED_DISCOUNT],
	[CUSTOM_SALES_FIGURES_1],
	[CUSTOM_SALES_FIGURES_2],
	[CUSTOM_SALES_FIGURES_3],
	[CUSTOM_FIELD_1],
	[CUSTOM_FIELD_2],
	[CUSTOM_FIELD_3],
	[CUSTOM_FIELD_4],
	[CUSTOM_FIELD_5],
	[CUSTOM_FIELD_6],
	[CUSTOM_FIELD_7],
	[CUSTOM_FIELD_8],
	[CUSTOM_FIELD_9],
	[CUSTOM_FIELD_10],
	[CUSTOM_FIELD_11],
	[CUSTOM_FIELD_12],
	[MANUFACTURER_COGS],
	[MANUFACTURER_COGS_USD],
	[MANUFACTURER_PRICE],
	[MANUFACTURER_PRICE_USD],
	[MANUFACTURER_TAX],
	[MANUFACTURER_TAX_USD],
	[MANUFACTURER_GROSS_MARGIN],
	[MANUFACTURER_GROSS_MARGIN_USD],
	[WHOLESALER_PRICE],
	[WHOLESALER_PRICE_USD],
	[WHOLESALER_TAX],
	[WHOLESALER_TAX_USD],
	[WHOLESALER_GROSS_MARGIN],
	[WHOLESALER_GROSS_MARGIN_USD],
	[INTERMED1_PRICE],
	[INTERMED1_PRICE_USD],
	[INTERMED1_TAX],
	[INTERMED1_TAX_USD],
	[INTERMED1_GROSS_MARGIN],
	[INTERMED1_GROSS_MARGIN_USD],
	[INTERMED2_PRICE],
	[INTERMED2_PRICE_USD],
	[INTERMED2_TAX],
	[INTERMED2_TAX_USD],
	[INTERMED2_GROSS_MARGIN],
	[INTERMED2_GROSS_MARGIN_USD],
	[INTERMED3_PRICE],
	[INTERMED3_PRICE_USD],
	[INTERMED3_TAX],
	[INTERMED3_TAX_USD],
	[INTERMED3_GROSS_MARGIN],
	[INTERMED3_GROSS_MARGIN_USD],
	[RETAILER_SELLIN_PRICE],
	[RETAILER_SELLIN_PRICE_USD],
	[RETAILER_PRICE],
	[RETAILER_PRICE_USD],
	[RETAILER_TAX],
	[RETAILER_TAX_USD],
	[RETAILER_GROSS_MARGIN],
	[RETAILER_GROSS_MARGIN_USD],
	[X_STANDARD_COST],
	[X_STANDARD_COST_USD],
	[X_DISTRIBUTION_COST],
	[X_DISTRIBUTION_COST_USD],
	[X_OTHER_COSTS_OF_GOODS],
	[X_OTHER_COSTS_OF_GOODS_USD], 
    [SALES_TYPE_DESC],
    [OOS_PRODUCT_WID],
	[X_DELIVERED_QTY],
	[X_DELIVERED_PACK],
	[GROSS_MARGIN_CONF],
	[NET_MARGIN_CONF],
	[PRODUCT_MARGIN_CONF],
	[CONTRIBUTION_CONF],
	[OPERATING_PROFIT_CONF],
	[GROSS_MARGIN_USD_CONF],
	[NET_MARGIN_USD_CONF],
	[PRODUCT_MARGIN_USD_CONF],
	[CONTRIBUTION_USD_CONF],
	[OPERATING_PROFIT_USD_CONF],
	[INTEGRATION_ID2]

)

AS
SELECT 
	[ROW_WID],
	[DATASOURCE_NUM_ID],
	[INTEGRATION_ID],
	[ETL_PROC_WID],
	[SALES_TYPE_WID],
	[START_DT_WID],
	[END_DT_WID],
	[PRODUCT_WID],
	[PROM_MAT_WID],
	[ACCNT_WID],
	[TGT_ACCNT_WID],
	[GEO_WID],
	[VENDING_M_WID],
	[QUOTE_WID],
	[ACTL_SHIPMENT_QTY_C],
	[ACTL_SHIPMENT_QTY],
	[ACTL_GROSS_SHIPMENT_AMT],
	[ACTL_GROSS_SHIPMENT_AMT_USD],
	[ACTL_NET_SHIPMENT_AMT],
	[ACTL_NET_SHIPMENT_AMT_USD],
	[GROSS_MARGIN],
	[GROSS_MARGIN_USD],
	[NET_MARGIN],
	[NET_MARGIN_USD],
	[PRODUCT_MARGIN],
	[PRODUCT_MARGIN_USD],
	[MARKET_EXPENDITURE],
	[MARKET_EXPENDITURE_USD],
	[SALES_EXPENDITURE],
	[SALES_EXPENDITURE_USD],
	[CONTRIBUTION],
	[CONTRIBUTION_USD],
	[OPERATING_PROFIT],
	[OPERATING_PROFIT_USD],
	[TAX_AMOUNT],
	[TAX_AMOUNT_USD],
	[PROM_MAT_QTY],
	[AMT_CURCY],
	[COUNTRY_CODE],
    [CHANNEL_WID],
    [SEGMENT_WID],
    [D_POSTN_WID2],
	[PERIOD_WID],
	[X_BU_ID], 
	[MONTH_WID],
    [YEAR_WID],
	[POSTN_WID],
	[SALES_DISCOUNT],
	[CUSTOMER_ORIENTED_DISCOUNT],
	[CUSTOM_SALES_FIGURES_1],
	[CUSTOM_SALES_FIGURES_2],
	[CUSTOM_SALES_FIGURES_3],
	[CUSTOM_FIELD_1],
	[CUSTOM_FIELD_2],
	[CUSTOM_FIELD_3],
	[CUSTOM_FIELD_4],
	[CUSTOM_FIELD_5],
	[CUSTOM_FIELD_6],
	[CUSTOM_FIELD_7],
	[CUSTOM_FIELD_8],
	[CUSTOM_FIELD_9],
	[CUSTOM_FIELD_10],
	[CUSTOM_FIELD_11],
	[CUSTOM_FIELD_12],
	[MANUFACTURER_COGS],
	[MANUFACTURER_COGS_USD],
	[MANUFACTURER_PRICE],
	[MANUFACTURER_PRICE_USD],
	[MANUFACTURER_TAX],
	[MANUFACTURER_TAX_USD],
	[MANUFACTURER_GROSS_MARGIN],
	[MANUFACTURER_GROSS_MARGIN_USD],
	[WHOLESALER_PRICE],
	[WHOLESALER_PRICE_USD],
	[WHOLESALER_TAX],
	[WHOLESALER_TAX_USD],
	[WHOLESALER_GROSS_MARGIN],
	[WHOLESALER_GROSS_MARGIN_USD],
	[INTERMED1_PRICE],
	[INTERMED1_PRICE_USD],
	[INTERMED1_TAX],
	[INTERMED1_TAX_USD],
	[INTERMED1_GROSS_MARGIN],
	[INTERMED1_GROSS_MARGIN_USD],
	[INTERMED2_PRICE],
	[INTERMED2_PRICE_USD],
	[INTERMED2_TAX],
	[INTERMED2_TAX_USD],
	[INTERMED2_GROSS_MARGIN],
	[INTERMED2_GROSS_MARGIN_USD],
	[INTERMED3_PRICE],
	[INTERMED3_PRICE_USD],
	[INTERMED3_TAX],
	[INTERMED3_TAX_USD],
	[INTERMED3_GROSS_MARGIN],
	[INTERMED3_GROSS_MARGIN_USD],
	[RETAILER_SELLIN_PRICE],
	[RETAILER_SELLIN_PRICE_USD],
	[RETAILER_PRICE],
	[RETAILER_PRICE_USD],
	[RETAILER_TAX],
	[RETAILER_TAX_USD],
	[RETAILER_GROSS_MARGIN],
	[RETAILER_GROSS_MARGIN_USD],
	[X_STANDARD_COST],
	[X_STANDARD_COST_USD],
	[X_DISTRIBUTION_COST],
	[X_DISTRIBUTION_COST_USD],
	[X_OTHER_COSTS_OF_GOODS],
	[X_OTHER_COSTS_OF_GOODS_USD], 
    [SALES_TYPE_DESC],
    [OOS_PRODUCT_WID],
	[X_DELIVERED_QTY],
	[X_DELIVERED_PACK],
	[GROSS_MARGIN_CONF],
	[NET_MARGIN_CONF],
	[PRODUCT_MARGIN_CONF],
	[CONTRIBUTION_CONF],
	[OPERATING_PROFIT_CONF],
	[GROSS_MARGIN_USD_CONF],
	[NET_MARGIN_USD_CONF],
	[PRODUCT_MARGIN_USD_CONF],
	[CONTRIBUTION_USD_CONF],
	[OPERATING_PROFIT_USD_CONF],
	[INTEGRATION_ID2]

FROM MERGE_WC_SALES_F_CZ

UNION ALL

SELECT 
	[ROW_WID],
	[DATASOURCE_NUM_ID],
	[INTEGRATION_ID],
	[ETL_PROC_WID],
	[SALES_TYPE_WID],
	[START_DT_WID],
	[END_DT_WID],
	[PRODUCT_WID],
	[PROM_MAT_WID],
	[ACCNT_WID],
	[TGT_ACCNT_WID],
	[GEO_WID],
	[VENDING_M_WID],
	[QUOTE_WID],
	[ACTL_SHIPMENT_QTY_C],
	[ACTL_SHIPMENT_QTY],
	[ACTL_GROSS_SHIPMENT_AMT],
	[ACTL_GROSS_SHIPMENT_AMT_USD],
	[ACTL_NET_SHIPMENT_AMT],
	[ACTL_NET_SHIPMENT_AMT_USD],
	[GROSS_MARGIN],
	[GROSS_MARGIN_USD],
	[NET_MARGIN],
	[NET_MARGIN_USD],
	[PRODUCT_MARGIN],
	[PRODUCT_MARGIN_USD],
	[MARKET_EXPENDITURE],
	[MARKET_EXPENDITURE_USD],
	[SALES_EXPENDITURE],
	[SALES_EXPENDITURE_USD],
	[CONTRIBUTION],
	[CONTRIBUTION_USD],
	[OPERATING_PROFIT],
	[OPERATING_PROFIT_USD],
	[TAX_AMOUNT],
	[TAX_AMOUNT_USD],
	[PROM_MAT_QTY],
	[AMT_CURCY],
	[COUNTRY_CODE],
    [CHANNEL_WID],
    [SEGMENT_WID],
    [D_POSTN_WID2],
	[PERIOD_WID],
	[X_BU_ID], 
	[MONTH_WID],
    [YEAR_WID],
	[POSTN_WID],
	[SALES_DISCOUNT],
	[CUSTOMER_ORIENTED_DISCOUNT],
	[CUSTOM_SALES_FIGURES_1],
	[CUSTOM_SALES_FIGURES_2],
	[CUSTOM_SALES_FIGURES_3],
	[CUSTOM_FIELD_1],
	[CUSTOM_FIELD_2],
	[CUSTOM_FIELD_3],
	[CUSTOM_FIELD_4],
	[CUSTOM_FIELD_5],
	[CUSTOM_FIELD_6],
	[CUSTOM_FIELD_7],
	[CUSTOM_FIELD_8],
	[CUSTOM_FIELD_9],
	[CUSTOM_FIELD_10],
	[CUSTOM_FIELD_11],
	[CUSTOM_FIELD_12],
	[MANUFACTURER_COGS],
	[MANUFACTURER_COGS_USD],
	[MANUFACTURER_PRICE],
	[MANUFACTURER_PRICE_USD],
	[MANUFACTURER_TAX],
	[MANUFACTURER_TAX_USD],
	[MANUFACTURER_GROSS_MARGIN],
	[MANUFACTURER_GROSS_MARGIN_USD],
	[WHOLESALER_PRICE],
	[WHOLESALER_PRICE_USD],
	[WHOLESALER_TAX],
	[WHOLESALER_TAX_USD],
	[WHOLESALER_GROSS_MARGIN],
	[WHOLESALER_GROSS_MARGIN_USD],
	[INTERMED1_PRICE],
	[INTERMED1_PRICE_USD],
	[INTERMED1_TAX],
	[INTERMED1_TAX_USD],
	[INTERMED1_GROSS_MARGIN],
	[INTERMED1_GROSS_MARGIN_USD],
	[INTERMED2_PRICE],
	[INTERMED2_PRICE_USD],
	[INTERMED2_TAX],
	[INTERMED2_TAX_USD],
	[INTERMED2_GROSS_MARGIN],
	[INTERMED2_GROSS_MARGIN_USD],
	[INTERMED3_PRICE],
	[INTERMED3_PRICE_USD],
	[INTERMED3_TAX],
	[INTERMED3_TAX_USD],
	[INTERMED3_GROSS_MARGIN],
	[INTERMED3_GROSS_MARGIN_USD],
	[RETAILER_SELLIN_PRICE],
	[RETAILER_SELLIN_PRICE_USD],
	[RETAILER_PRICE],
	[RETAILER_PRICE_USD],
	[RETAILER_TAX],
	[RETAILER_TAX_USD],
	[RETAILER_GROSS_MARGIN],
	[RETAILER_GROSS_MARGIN_USD],
	[X_STANDARD_COST],
	[X_STANDARD_COST_USD],
	[X_DISTRIBUTION_COST],
	[X_DISTRIBUTION_COST_USD],
	[X_OTHER_COSTS_OF_GOODS],
	[X_OTHER_COSTS_OF_GOODS_USD], 
    [SALES_TYPE_DESC],
    [OOS_PRODUCT_WID],
	[X_DELIVERED_QTY],
	[X_DELIVERED_PACK],
	[GROSS_MARGIN_CONF],
	[NET_MARGIN_CONF],
	[PRODUCT_MARGIN_CONF],
	[CONTRIBUTION_CONF],
	[OPERATING_PROFIT_CONF],
	[GROSS_MARGIN_USD_CONF],
	[NET_MARGIN_USD_CONF],
	[PRODUCT_MARGIN_USD_CONF],
	[CONTRIBUTION_USD_CONF],
	[OPERATING_PROFIT_USD_CONF],
	[INTEGRATION_ID2]

FROM MERGE_WC_SALES_F_GE

UNION ALL

SELECT 
	[ROW_WID],
	[DATASOURCE_NUM_ID],
	[INTEGRATION_ID],
	[ETL_PROC_WID],
	[SALES_TYPE_WID],
	[START_DT_WID],
	[END_DT_WID],
	[PRODUCT_WID],
	[PROM_MAT_WID],
	[ACCNT_WID],
	[TGT_ACCNT_WID],
	[GEO_WID],
	[VENDING_M_WID],
	[QUOTE_WID],
	[ACTL_SHIPMENT_QTY_C],
	[ACTL_SHIPMENT_QTY],
	[ACTL_GROSS_SHIPMENT_AMT],
	[ACTL_GROSS_SHIPMENT_AMT_USD],
	[ACTL_NET_SHIPMENT_AMT],
	[ACTL_NET_SHIPMENT_AMT_USD],
	[GROSS_MARGIN],
	[GROSS_MARGIN_USD],
	[NET_MARGIN],
	[NET_MARGIN_USD],
	[PRODUCT_MARGIN],
	[PRODUCT_MARGIN_USD],
	[MARKET_EXPENDITURE],
	[MARKET_EXPENDITURE_USD],
	[SALES_EXPENDITURE],
	[SALES_EXPENDITURE_USD],
	[CONTRIBUTION],
	[CONTRIBUTION_USD],
	[OPERATING_PROFIT],
	[OPERATING_PROFIT_USD],
	[TAX_AMOUNT],
	[TAX_AMOUNT_USD],
	[PROM_MAT_QTY],
	[AMT_CURCY],
	[COUNTRY_CODE],
    [CHANNEL_WID],
    [SEGMENT_WID], 
    [D_POSTN_WID2],
	[PERIOD_WID],
	[X_BU_ID], 
	[MONTH_WID],
    [YEAR_WID],
	[POSTN_WID],
	[SALES_DISCOUNT],
	[CUSTOMER_ORIENTED_DISCOUNT],
	[CUSTOM_SALES_FIGURES_1],
	[CUSTOM_SALES_FIGURES_2],
	[CUSTOM_SALES_FIGURES_3],
	[CUSTOM_FIELD_1],
	[CUSTOM_FIELD_2],
	[CUSTOM_FIELD_3],
	[CUSTOM_FIELD_4],
	[CUSTOM_FIELD_5],
	[CUSTOM_FIELD_6],
	[CUSTOM_FIELD_7],
	[CUSTOM_FIELD_8],
	[CUSTOM_FIELD_9],
	[CUSTOM_FIELD_10],
	[CUSTOM_FIELD_11],
	[CUSTOM_FIELD_12],
	[MANUFACTURER_COGS],
	[MANUFACTURER_COGS_USD],
	[MANUFACTURER_PRICE],
	[MANUFACTURER_PRICE_USD],
	[MANUFACTURER_TAX],
	[MANUFACTURER_TAX_USD],
	[MANUFACTURER_GROSS_MARGIN],
	[MANUFACTURER_GROSS_MARGIN_USD],
	[WHOLESALER_PRICE],
	[WHOLESALER_PRICE_USD],
	[WHOLESALER_TAX],
	[WHOLESALER_TAX_USD],
	[WHOLESALER_GROSS_MARGIN],
	[WHOLESALER_GROSS_MARGIN_USD],
	[INTERMED1_PRICE],
	[INTERMED1_PRICE_USD],
	[INTERMED1_TAX],
	[INTERMED1_TAX_USD],
	[INTERMED1_GROSS_MARGIN],
	[INTERMED1_GROSS_MARGIN_USD],
	[INTERMED2_PRICE],
	[INTERMED2_PRICE_USD],
	[INTERMED2_TAX],
	[INTERMED2_TAX_USD],
	[INTERMED2_GROSS_MARGIN],
	[INTERMED2_GROSS_MARGIN_USD],
	[INTERMED3_PRICE],
	[INTERMED3_PRICE_USD],
	[INTERMED3_TAX],
	[INTERMED3_TAX_USD],
	[INTERMED3_GROSS_MARGIN],
	[INTERMED3_GROSS_MARGIN_USD],
	[RETAILER_SELLIN_PRICE],
	[RETAILER_SELLIN_PRICE_USD],
	[RETAILER_PRICE],
	[RETAILER_PRICE_USD],
	[RETAILER_TAX],
	[RETAILER_TAX_USD],
	[RETAILER_GROSS_MARGIN],
	[RETAILER_GROSS_MARGIN_USD],
	[X_STANDARD_COST],
	[X_STANDARD_COST_USD],
	[X_DISTRIBUTION_COST],
	[X_DISTRIBUTION_COST_USD],
	[X_OTHER_COSTS_OF_GOODS],
	[X_OTHER_COSTS_OF_GOODS_USD], 
    [SALES_TYPE_DESC],
    [OOS_PRODUCT_WID],
	[X_DELIVERED_QTY],
	[X_DELIVERED_PACK],
	[GROSS_MARGIN_CONF],
	[NET_MARGIN_CONF],
	[PRODUCT_MARGIN_CONF],
	[CONTRIBUTION_CONF],
	[OPERATING_PROFIT_CONF],
	[GROSS_MARGIN_USD_CONF],
	[NET_MARGIN_USD_CONF],
	[PRODUCT_MARGIN_USD_CONF],
	[CONTRIBUTION_USD_CONF],
	[OPERATING_PROFIT_USD_CONF],
	[INTEGRATION_ID2]

FROM MERGE_WC_SALES_F_PL

UNION ALL

SELECT 
	[ROW_WID],
	[DATASOURCE_NUM_ID],
	[INTEGRATION_ID],
	[ETL_PROC_WID],
	[SALES_TYPE_WID],
	[START_DT_WID],
	[END_DT_WID],
	[PRODUCT_WID],
	[PROM_MAT_WID],
	[ACCNT_WID],
	[TGT_ACCNT_WID],
	[GEO_WID],	
	[VENDING_M_WID],
	[QUOTE_WID],
	[ACTL_SHIPMENT_QTY_C],
	[ACTL_SHIPMENT_QTY],
	[ACTL_GROSS_SHIPMENT_AMT],
	[ACTL_GROSS_SHIPMENT_AMT_USD],
	[ACTL_NET_SHIPMENT_AMT],
	[ACTL_NET_SHIPMENT_AMT_USD],
	[GROSS_MARGIN],
	[GROSS_MARGIN_USD],
	[NET_MARGIN],
	[NET_MARGIN_USD],
	[PRODUCT_MARGIN],
	[PRODUCT_MARGIN_USD],
	[MARKET_EXPENDITURE],
	[MARKET_EXPENDITURE_USD],
	[SALES_EXPENDITURE],
	[SALES_EXPENDITURE_USD],
	[CONTRIBUTION],
	[CONTRIBUTION_USD],
	[OPERATING_PROFIT],
	[OPERATING_PROFIT_USD],
	[TAX_AMOUNT],
	[TAX_AMOUNT_USD],
	[PROM_MAT_QTY],
	[AMT_CURCY],
	[COUNTRY_CODE],
    [CHANNEL_WID],
    [SEGMENT_WID], 
    [D_POSTN_WID2],
	[PERIOD_WID],
	[X_BU_ID] , 
	[MONTH_WID],
    [YEAR_WID],
	[POSTN_WID],
	[SALES_DISCOUNT],
	[CUSTOMER_ORIENTED_DISCOUNT],
	[CUSTOM_SALES_FIGURES_1],
	[CUSTOM_SALES_FIGURES_2],
	[CUSTOM_SALES_FIGURES_3],
	[CUSTOM_FIELD_1],
	[CUSTOM_FIELD_2],
	[CUSTOM_FIELD_3],
	[CUSTOM_FIELD_4],
	[CUSTOM_FIELD_5],
	[CUSTOM_FIELD_6],
	[CUSTOM_FIELD_7],
	[CUSTOM_FIELD_8],
	[CUSTOM_FIELD_9],
	[CUSTOM_FIELD_10],
	[CUSTOM_FIELD_11],
	[CUSTOM_FIELD_12],
	[MANUFACTURER_COGS],
	[MANUFACTURER_COGS_USD],
	[MANUFACTURER_PRICE],
	[MANUFACTURER_PRICE_USD],
	[MANUFACTURER_TAX],
	[MANUFACTURER_TAX_USD],
	[MANUFACTURER_GROSS_MARGIN],
	[MANUFACTURER_GROSS_MARGIN_USD],
	[WHOLESALER_PRICE],
	[WHOLESALER_PRICE_USD],
	[WHOLESALER_TAX],
	[WHOLESALER_TAX_USD],
	[WHOLESALER_GROSS_MARGIN],
	[WHOLESALER_GROSS_MARGIN_USD],
	[INTERMED1_PRICE],
	[INTERMED1_PRICE_USD],
	[INTERMED1_TAX],
	[INTERMED1_TAX_USD],
	[INTERMED1_GROSS_MARGIN],
	[INTERMED1_GROSS_MARGIN_USD],
	[INTERMED2_PRICE],
	[INTERMED2_PRICE_USD],
	[INTERMED2_TAX],
	[INTERMED2_TAX_USD],
	[INTERMED2_GROSS_MARGIN],
	[INTERMED2_GROSS_MARGIN_USD],
	[INTERMED3_PRICE],
	[INTERMED3_PRICE_USD],
	[INTERMED3_TAX],
	[INTERMED3_TAX_USD],
	[INTERMED3_GROSS_MARGIN],
	[INTERMED3_GROSS_MARGIN_USD],
	[RETAILER_SELLIN_PRICE],
	[RETAILER_SELLIN_PRICE_USD],
	[RETAILER_PRICE],
	[RETAILER_PRICE_USD],
	[RETAILER_TAX],
	[RETAILER_TAX_USD],
	[RETAILER_GROSS_MARGIN],
	[RETAILER_GROSS_MARGIN_USD],
	[X_STANDARD_COST],
	[X_STANDARD_COST_USD],
	[X_DISTRIBUTION_COST],
	[X_DISTRIBUTION_COST_USD],
	[X_OTHER_COSTS_OF_GOODS],
	[X_OTHER_COSTS_OF_GOODS_USD], 
    [SALES_TYPE_DESC],
    [OOS_PRODUCT_WID],
	[X_DELIVERED_QTY],
	[X_DELIVERED_PACK],
	[GROSS_MARGIN_CONF],
	[NET_MARGIN_CONF],
	[PRODUCT_MARGIN_CONF],
	[CONTRIBUTION_CONF],
	[OPERATING_PROFIT_CONF],
	[GROSS_MARGIN_USD_CONF],
	[NET_MARGIN_USD_CONF],
	[PRODUCT_MARGIN_USD_CONF],
	[CONTRIBUTION_USD_CONF],
	[OPERATING_PROFIT_USD_CONF],
	[INTEGRATION_ID2]

FROM MERGE_WC_SALES_F_WW


UNION ALL

SELECT 
	[ROW_WID],
	[DATASOURCE_NUM_ID],
	[INTEGRATION_ID],
	[ETL_PROC_WID],
	[SALES_TYPE_WID],
	[START_DT_WID],
	[END_DT_WID],
	[PRODUCT_WID],
	[PROM_MAT_WID],
	[ACCNT_WID],
	[TGT_ACCNT_WID],
	[GEO_WID],	
	[VENDING_M_WID],
	[QUOTE_WID],
	[ACTL_SHIPMENT_QTY_C],
	[ACTL_SHIPMENT_QTY],
	[ACTL_GROSS_SHIPMENT_AMT],
	[ACTL_GROSS_SHIPMENT_AMT_USD],
	[ACTL_NET_SHIPMENT_AMT],
	[ACTL_NET_SHIPMENT_AMT_USD],
	[GROSS_MARGIN],
	[GROSS_MARGIN_USD],
	[NET_MARGIN],
	[NET_MARGIN_USD],
	[PRODUCT_MARGIN],
	[PRODUCT_MARGIN_USD],
	[MARKET_EXPENDITURE],
	[MARKET_EXPENDITURE_USD],
	[SALES_EXPENDITURE],
	[SALES_EXPENDITURE_USD],
	[CONTRIBUTION],
	[CONTRIBUTION_USD],
	[OPERATING_PROFIT],
	[OPERATING_PROFIT_USD],
	[TAX_AMOUNT],
	[TAX_AMOUNT_USD],
	[PROM_MAT_QTY],
	[AMT_CURCY],
	[COUNTRY_CODE],
    [CHANNEL_WID],
    [SEGMENT_WID], 
    [D_POSTN_WID2],
	[PERIOD_WID],
	[X_BU_ID] , 
	[MONTH_WID],
    [YEAR_WID],
	[POSTN_WID],
	[SALES_DISCOUNT],
	[CUSTOMER_ORIENTED_DISCOUNT],
	[CUSTOM_SALES_FIGURES_1],
	[CUSTOM_SALES_FIGURES_2],
	[CUSTOM_SALES_FIGURES_3],
	[CUSTOM_FIELD_1],
	[CUSTOM_FIELD_2],
	[CUSTOM_FIELD_3],
	[CUSTOM_FIELD_4],
	[CUSTOM_FIELD_5],
	[CUSTOM_FIELD_6],
	[CUSTOM_FIELD_7],
	[CUSTOM_FIELD_8],
	[CUSTOM_FIELD_9],
	[CUSTOM_FIELD_10],
	[CUSTOM_FIELD_11],
	[CUSTOM_FIELD_12],
	[MANUFACTURER_COGS],
	[MANUFACTURER_COGS_USD],
	[MANUFACTURER_PRICE],
	[MANUFACTURER_PRICE_USD],
	[MANUFACTURER_TAX],
	[MANUFACTURER_TAX_USD],
	[MANUFACTURER_GROSS_MARGIN],
	[MANUFACTURER_GROSS_MARGIN_USD],
	[WHOLESALER_PRICE],
	[WHOLESALER_PRICE_USD],
	[WHOLESALER_TAX],
	[WHOLESALER_TAX_USD],
	[WHOLESALER_GROSS_MARGIN],
	[WHOLESALER_GROSS_MARGIN_USD],
	[INTERMED1_PRICE],
	[INTERMED1_PRICE_USD],
	[INTERMED1_TAX],
	[INTERMED1_TAX_USD],
	[INTERMED1_GROSS_MARGIN],
	[INTERMED1_GROSS_MARGIN_USD],
	[INTERMED2_PRICE],
	[INTERMED2_PRICE_USD],
	[INTERMED2_TAX],
	[INTERMED2_TAX_USD],
	[INTERMED2_GROSS_MARGIN],
	[INTERMED2_GROSS_MARGIN_USD],
	[INTERMED3_PRICE],
	[INTERMED3_PRICE_USD],
	[INTERMED3_TAX],
	[INTERMED3_TAX_USD],
	[INTERMED3_GROSS_MARGIN],
	[INTERMED3_GROSS_MARGIN_USD],
	[RETAILER_SELLIN_PRICE],
	[RETAILER_SELLIN_PRICE_USD],
	[RETAILER_PRICE],
	[RETAILER_PRICE_USD],
	[RETAILER_TAX],
	[RETAILER_TAX_USD],
	[RETAILER_GROSS_MARGIN],
	[RETAILER_GROSS_MARGIN_USD],
	[X_STANDARD_COST],
	[X_STANDARD_COST_USD],
	[X_DISTRIBUTION_COST],
	[X_DISTRIBUTION_COST_USD],
	[X_OTHER_COSTS_OF_GOODS],
	[X_OTHER_COSTS_OF_GOODS_USD], 
    [SALES_TYPE_DESC],
    [OOS_PRODUCT_WID],
	[X_DELIVERED_QTY],
	[X_DELIVERED_PACK],
	[GROSS_MARGIN_CONF],
	[NET_MARGIN_CONF],
	[PRODUCT_MARGIN_CONF],
	[CONTRIBUTION_CONF],
	[OPERATING_PROFIT_CONF],
	[GROSS_MARGIN_USD_CONF],
	[NET_MARGIN_USD_CONF],
	[PRODUCT_MARGIN_USD_CONF],
	[CONTRIBUTION_USD_CONF],
	[OPERATING_PROFIT_USD_CONF],
	[INTEGRATION_ID2]

FROM MERGE_WC_SALES_F_GR

UNION ALL

SELECT 
	[ROW_WID],
	[DATASOURCE_NUM_ID],
	[INTEGRATION_ID],
	[ETL_PROC_WID],
	[SALES_TYPE_WID],
	[START_DT_WID],
	[END_DT_WID],
	[PRODUCT_WID],
	[PROM_MAT_WID],
	[ACCNT_WID],
	[TGT_ACCNT_WID],
	[GEO_WID],	
	[VENDING_M_WID],
	[QUOTE_WID],
	[ACTL_SHIPMENT_QTY_C],
	[ACTL_SHIPMENT_QTY],
	[ACTL_GROSS_SHIPMENT_AMT],
	[ACTL_GROSS_SHIPMENT_AMT_USD],
	[ACTL_NET_SHIPMENT_AMT],
	[ACTL_NET_SHIPMENT_AMT_USD],
	[GROSS_MARGIN],
	[GROSS_MARGIN_USD],
	[NET_MARGIN],
	[NET_MARGIN_USD],
	[PRODUCT_MARGIN],
	[PRODUCT_MARGIN_USD],
	[MARKET_EXPENDITURE],
	[MARKET_EXPENDITURE_USD],
	[SALES_EXPENDITURE],
	[SALES_EXPENDITURE_USD],
	[CONTRIBUTION],
	[CONTRIBUTION_USD],
	[OPERATING_PROFIT],
	[OPERATING_PROFIT_USD],
	[TAX_AMOUNT],
	[TAX_AMOUNT_USD],
	[PROM_MAT_QTY],
	[AMT_CURCY],
	[COUNTRY_CODE],
    [CHANNEL_WID],
    [SEGMENT_WID], 
    [D_POSTN_WID2],
	[PERIOD_WID],
	[X_BU_ID] , 
	[MONTH_WID],
    [YEAR_WID],
	[POSTN_WID],
	[SALES_DISCOUNT],
	[CUSTOMER_ORIENTED_DISCOUNT],
	[CUSTOM_SALES_FIGURES_1],
	[CUSTOM_SALES_FIGURES_2],
	[CUSTOM_SALES_FIGURES_3],
	[CUSTOM_FIELD_1],
	[CUSTOM_FIELD_2],
	[CUSTOM_FIELD_3],
	[CUSTOM_FIELD_4],
	[CUSTOM_FIELD_5],
	[CUSTOM_FIELD_6],
	[CUSTOM_FIELD_7],
	[CUSTOM_FIELD_8],
	[CUSTOM_FIELD_9],
	[CUSTOM_FIELD_10],
	[CUSTOM_FIELD_11],
	[CUSTOM_FIELD_12],
	[MANUFACTURER_COGS],
	[MANUFACTURER_COGS_USD],
	[MANUFACTURER_PRICE],
	[MANUFACTURER_PRICE_USD],
	[MANUFACTURER_TAX],
	[MANUFACTURER_TAX_USD],
	[MANUFACTURER_GROSS_MARGIN],
	[MANUFACTURER_GROSS_MARGIN_USD],
	[WHOLESALER_PRICE],
	[WHOLESALER_PRICE_USD],
	[WHOLESALER_TAX],
	[WHOLESALER_TAX_USD],
	[WHOLESALER_GROSS_MARGIN],
	[WHOLESALER_GROSS_MARGIN_USD],
	[INTERMED1_PRICE],
	[INTERMED1_PRICE_USD],
	[INTERMED1_TAX],
	[INTERMED1_TAX_USD],
	[INTERMED1_GROSS_MARGIN],
	[INTERMED1_GROSS_MARGIN_USD],
	[INTERMED2_PRICE],
	[INTERMED2_PRICE_USD],
	[INTERMED2_TAX],
	[INTERMED2_TAX_USD],
	[INTERMED2_GROSS_MARGIN],
	[INTERMED2_GROSS_MARGIN_USD],
	[INTERMED3_PRICE],
	[INTERMED3_PRICE_USD],
	[INTERMED3_TAX],
	[INTERMED3_TAX_USD],
	[INTERMED3_GROSS_MARGIN],
	[INTERMED3_GROSS_MARGIN_USD],
	[RETAILER_SELLIN_PRICE],
	[RETAILER_SELLIN_PRICE_USD],
	[RETAILER_PRICE],
	[RETAILER_PRICE_USD],
	[RETAILER_TAX],
	[RETAILER_TAX_USD],
	[RETAILER_GROSS_MARGIN],
	[RETAILER_GROSS_MARGIN_USD],
	[X_STANDARD_COST],
	[X_STANDARD_COST_USD],
	[X_DISTRIBUTION_COST],
	[X_DISTRIBUTION_COST_USD],
	[X_OTHER_COSTS_OF_GOODS],
	[X_OTHER_COSTS_OF_GOODS_USD], 
    [SALES_TYPE_DESC],
    [OOS_PRODUCT_WID],
	[X_DELIVERED_QTY],
	[X_DELIVERED_PACK],
	[GROSS_MARGIN_CONF],
	[NET_MARGIN_CONF],
	[PRODUCT_MARGIN_CONF],
	[CONTRIBUTION_CONF],
	[OPERATING_PROFIT_CONF],
	[GROSS_MARGIN_USD_CONF],
	[NET_MARGIN_USD_CONF],
	[PRODUCT_MARGIN_USD_CONF],
	[CONTRIBUTION_USD_CONF],
	[OPERATING_PROFIT_USD_CONF],
	[INTEGRATION_ID2]

FROM MERGE_WC_SALES_F_SK

UNION ALL

SELECT 
	[ROW_WID],
	[DATASOURCE_NUM_ID],
	[INTEGRATION_ID],
	[ETL_PROC_WID],
	[SALES_TYPE_WID],
	[START_DT_WID],
	[END_DT_WID],
	[PRODUCT_WID],
	[PROM_MAT_WID],
	[ACCNT_WID],
	[TGT_ACCNT_WID],
	[GEO_WID],	
	[VENDING_M_WID],
	[QUOTE_WID],
	[ACTL_SHIPMENT_QTY_C],
	[ACTL_SHIPMENT_QTY],
	[ACTL_GROSS_SHIPMENT_AMT],
	[ACTL_GROSS_SHIPMENT_AMT_USD],
	[ACTL_NET_SHIPMENT_AMT],
	[ACTL_NET_SHIPMENT_AMT_USD],
	[GROSS_MARGIN],
	[GROSS_MARGIN_USD],
	[NET_MARGIN],
	[NET_MARGIN_USD],
	[PRODUCT_MARGIN],
	[PRODUCT_MARGIN_USD],
	[MARKET_EXPENDITURE],
	[MARKET_EXPENDITURE_USD],
	[SALES_EXPENDITURE],
	[SALES_EXPENDITURE_USD],
	[CONTRIBUTION],
	[CONTRIBUTION_USD],
	[OPERATING_PROFIT],
	[OPERATING_PROFIT_USD],
	[TAX_AMOUNT],
	[TAX_AMOUNT_USD],
	[PROM_MAT_QTY],
	[AMT_CURCY],
	[COUNTRY_CODE],
    [CHANNEL_WID],
    [SEGMENT_WID], 
    [D_POSTN_WID2],
	[PERIOD_WID],
	[X_BU_ID] , 
	[MONTH_WID],
    [YEAR_WID],
	[POSTN_WID],
	[SALES_DISCOUNT],
	[CUSTOMER_ORIENTED_DISCOUNT],
	[CUSTOM_SALES_FIGURES_1],
	[CUSTOM_SALES_FIGURES_2],
	[CUSTOM_SALES_FIGURES_3],
	[CUSTOM_FIELD_1],
	[CUSTOM_FIELD_2],
	[CUSTOM_FIELD_3],
	[CUSTOM_FIELD_4],
	[CUSTOM_FIELD_5],
	[CUSTOM_FIELD_6],
	[CUSTOM_FIELD_7],
	[CUSTOM_FIELD_8],
	[CUSTOM_FIELD_9],
	[CUSTOM_FIELD_10],
	[CUSTOM_FIELD_11],
	[CUSTOM_FIELD_12],
	[MANUFACTURER_COGS],
	[MANUFACTURER_COGS_USD],
	[MANUFACTURER_PRICE],
	[MANUFACTURER_PRICE_USD],
	[MANUFACTURER_TAX],
	[MANUFACTURER_TAX_USD],
	[MANUFACTURER_GROSS_MARGIN],
	[MANUFACTURER_GROSS_MARGIN_USD],
	[WHOLESALER_PRICE],
	[WHOLESALER_PRICE_USD],
	[WHOLESALER_TAX],
	[WHOLESALER_TAX_USD],
	[WHOLESALER_GROSS_MARGIN],
	[WHOLESALER_GROSS_MARGIN_USD],
	[INTERMED1_PRICE],
	[INTERMED1_PRICE_USD],
	[INTERMED1_TAX],
	[INTERMED1_TAX_USD],
	[INTERMED1_GROSS_MARGIN],
	[INTERMED1_GROSS_MARGIN_USD],
	[INTERMED2_PRICE],
	[INTERMED2_PRICE_USD],
	[INTERMED2_TAX],
	[INTERMED2_TAX_USD],
	[INTERMED2_GROSS_MARGIN],
	[INTERMED2_GROSS_MARGIN_USD],
	[INTERMED3_PRICE],
	[INTERMED3_PRICE_USD],
	[INTERMED3_TAX],
	[INTERMED3_TAX_USD],
	[INTERMED3_GROSS_MARGIN],
	[INTERMED3_GROSS_MARGIN_USD],
	[RETAILER_SELLIN_PRICE],
	[RETAILER_SELLIN_PRICE_USD],
	[RETAILER_PRICE],
	[RETAILER_PRICE_USD],
	[RETAILER_TAX],
	[RETAILER_TAX_USD],
	[RETAILER_GROSS_MARGIN],
	[RETAILER_GROSS_MARGIN_USD],
	[X_STANDARD_COST],
	[X_STANDARD_COST_USD],
	[X_DISTRIBUTION_COST],
	[X_DISTRIBUTION_COST_USD],
	[X_OTHER_COSTS_OF_GOODS],
	[X_OTHER_COSTS_OF_GOODS_USD], 
    [SALES_TYPE_DESC],
    [OOS_PRODUCT_WID],
	[X_DELIVERED_QTY],
	[X_DELIVERED_PACK],
	[GROSS_MARGIN_CONF],
	[NET_MARGIN_CONF],
	[PRODUCT_MARGIN_CONF],
	[CONTRIBUTION_CONF],
	[OPERATING_PROFIT_CONF],
	[GROSS_MARGIN_USD_CONF],
	[NET_MARGIN_USD_CONF],
	[PRODUCT_MARGIN_USD_CONF],
	[CONTRIBUTION_USD_CONF],
	[OPERATING_PROFIT_USD_CONF],
	[INTEGRATION_ID2]

FROM MERGE_WC_SALES_F_HU

GO


