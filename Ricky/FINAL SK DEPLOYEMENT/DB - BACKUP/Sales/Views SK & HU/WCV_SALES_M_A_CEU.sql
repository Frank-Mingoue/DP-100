IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WCV_SALES_M_A_CEU]'))
DROP VIEW [dbo].[WCV_SALES_M_A_CEU]
GO 

CREATE VIEW [dbo].[WCV_SALES_M_A_CEU] 
/*******************************************************************************
Versions Change History:5.0

Version#:5.0
Description: New Views for SK & HU markets
Modification Date: 10/06/2021
Process ID:	CHG215150
Development Team:TME-DEPLOYMENT
Modified by:Frank Mingou�

Number:4.0
Description of Changes: 10 new fields added
Release Date: 12/08/2014
Process ID: CHG061912
Development Team:TME-DATA-INTERFACE
Author:Gulraaz Usmani

Number:3.0
Description of Changes: New columns in Sales Audit Activity
Release Date: 21/02/2014
Process ID: CHG051881 
Development Team:TME-DATA-INTERFACE
Author:Anjanee Kandhai

Number:2.0
Description of Changes:April 2013:Enhancement in current aggregations
Release Date: 12/04/2013
Process ID: CHG031913
Development Team:TME-DATA-INTERFACE
Author:Robert Grenade

Number:1.0
Description of Changes: To change Sales View for one table per market. Part II (Data)
Release Date: 02/05/2012
Process ID: CHG025165
Development Team:TME-DATA-INTERFACE
Author:Robert Grenade
*******************************************************************************/
(  
	[ROW_WID],  
	[COUNTRY_CODE],  
	[MONTH_WID],  
	[SALES_TYPE_WID],  
	[PRODUCT_WID],  
	[PROM_MAT_WID],  
	[ACCNT_WID],  
	[TGT_ACCNT_WID],  
	[GEO_WID],  
	[VENDING_M_WID],  
	[CHANNEL_WID],  
	[SEGMENT_WID],  
	[D_POSTN_WID2],  
	[AMT_CURCY],  
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
	[PROM_MAT_QTY] ,  
	[SALES_DISCOUNT],  
	[CUSTOMER_ORIENTED_DISCOUNT],
	[CUSTOM_SALES_FIGURES_1],
	[CUSTOM_SALES_FIGURES_2],
	[CUSTOM_SALES_FIGURES_3],  
	[YTD_ACTL_SHIPMENT_QTY_C],  
	[YTD_ACTL_SHIPMENT_QTY],  
	[YTD_ACTL_GROSS_SHIPMENT_AMT],  
	[YTD_ACTL_GROSS_SHIPMENT_AMT_USD],  
	[YTD_ACTL_NET_SHIPMENT_AMT],  
	[YTD_ACTL_NET_SHIPMENT_AMT_USD],  
	[YTD_GROSS_MARGIN],  
	[YTD_GROSS_MARGIN_USD],  
	[YTD_NET_MARGIN],  
	[YTD_NET_MARGIN_USD],  
	[YTD_PRODUCT_MARGIN],  
	[YTD_PRODUCT_MARGIN_USD],  
	[YTD_MARKET_EXPENDITURE],  
	[YTD_MARKET_EXPENDITURE_USD],  
	[YTD_SALES_EXPENDITURE],  
	[YTD_SALES_EXPENDITURE_USD],  
	[YTD_CONTRIBUTION],  
	[YTD_CONTRIBUTION_USD],  
	[YTD_OPERATING_PROFIT],  
	[YTD_OPERATING_PROFIT_USD],  
	[YTD_TAX_AMOUNT],  
	[YTD_TAX_AMOUNT_USD],  
	[YTD_PROM_MAT_QTY],  
	[YTD_SALES_DISCOUNT],  
	[YTD_CUSTOMER_ORIENTED_DISCOUNT],
	[YTD_CUSTOM_SALES_FIGURES_1],
	[YTD_CUSTOM_SALES_FIGURES_2],
	[YTD_CUSTOM_SALES_FIGURES_3],  
	[X_BU_ID],  
	[ASSMT_ST_DT_WID],  
	[ETL_PROC_WID],  
	[MAT_ACTL_SHIPMENT_QTY_C],  
	[MAT_ACTL_SHIPMENT_QTY],  
	[MAT_ACTL_GROSS_SHIPMENT_AMT],  
	[MAT_ACTL_GROSS_SHIPMENT_AMT_USD],  
	[MAT_ACTL_NET_SHIPMENT_AMT],  
	[MAT_ACTL_NET_SHIPMENT_AMT_USD],  
	[MAT_GROSS_MARGIN],  
	[MAT_GROSS_MARGIN_USD],  
	[MAT_NET_MARGIN],  
	[MAT_NET_MARGIN_USD],  
	[MAT_PRODUCT_MARGIN],  
	[MAT_PRODUCT_MARGIN_USD],  
	[MAT_MARKET_EXPENDITURE],  
	[MAT_MARKET_EXPENDITURE_USD],  
	[MAT_SALES_EXPENDITURE],  
	[MAT_SALES_EXPENDITURE_USD],  
	[MAT_CONTRIBUTION],  
	[MAT_CONTRIBUTION_USD],  
	[MAT_OPERATING_PROFIT],  
	[MAT_OPERATING_PROFIT_USD],  
	[MAT_TAX_AMOUNT],  
	[MAT_TAX_AMOUNT_USD],  
	[MAT_PROM_MAT_QTY] ,  
	[MAT_SALES_DISCOUNT],  
	[MAT_CUSTOMER_ORIENTED_DISCOUNT],
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
	[CUSTOM_FIELD_12]   ,
	[X_DELIVERED_QTY],
	[X_DELIVERED_PACK],
	[YTD_X_DELIVERED_QTY],
	[YTD_X_DELIVERED_PACK],
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
	[YTD_GROSS_MARGIN_CONF],
	[YTD_NET_MARGIN_CONF],
	[YTD_PRODUCT_MARGIN_CONF],
	[YTD_CONTRIBUTION_CONF],
	[YTD_OPERATING_PROFIT_CONF],
	[YTD_GROSS_MARGIN_USD_CONF],
	[YTD_NET_MARGIN_USD_CONF],
	[YTD_PRODUCT_MARGIN_USD_CONF],
	[YTD_CONTRIBUTION_USD_CONF],
	[YTD_OPERATING_PROFIT_USD_CONF]
)  
AS  
SELECT  
 	[ROW_WID],  
	[COUNTRY_CODE],  
	[MONTH_WID],  
	[SALES_TYPE_WID],  
	[PRODUCT_WID],  
	[PROM_MAT_WID],  
	[ACCNT_WID],  
	[TGT_ACCNT_WID],  
	[GEO_WID],  
	[VENDING_M_WID],  
	[CHANNEL_WID],  
	[SEGMENT_WID],  
	[D_POSTN_WID2],  
	[AMT_CURCY],  
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
	[PROM_MAT_QTY] ,  
	[SALES_DISCOUNT],  
	[CUSTOMER_ORIENTED_DISCOUNT],
	[CUSTOM_SALES_FIGURES_1],
	[CUSTOM_SALES_FIGURES_2],
	[CUSTOM_SALES_FIGURES_3],  
	[YTD_ACTL_SHIPMENT_QTY_C],  
	[YTD_ACTL_SHIPMENT_QTY],  
	[YTD_ACTL_GROSS_SHIPMENT_AMT],  
	[YTD_ACTL_GROSS_SHIPMENT_AMT_USD],  
	[YTD_ACTL_NET_SHIPMENT_AMT],  
	[YTD_ACTL_NET_SHIPMENT_AMT_USD],  
	[YTD_GROSS_MARGIN],  
	[YTD_GROSS_MARGIN_USD],  
	[YTD_NET_MARGIN],  
	[YTD_NET_MARGIN_USD],  
	[YTD_PRODUCT_MARGIN],  
	[YTD_PRODUCT_MARGIN_USD],  
	[YTD_MARKET_EXPENDITURE],  
	[YTD_MARKET_EXPENDITURE_USD],  
	[YTD_SALES_EXPENDITURE],  
	[YTD_SALES_EXPENDITURE_USD],  
	[YTD_CONTRIBUTION],  
	[YTD_CONTRIBUTION_USD],  
	[YTD_OPERATING_PROFIT],  
	[YTD_OPERATING_PROFIT_USD],  
	[YTD_TAX_AMOUNT],  
	[YTD_TAX_AMOUNT_USD],  
	[YTD_PROM_MAT_QTY],  
	[YTD_SALES_DISCOUNT],  
	[YTD_CUSTOMER_ORIENTED_DISCOUNT],
	[YTD_CUSTOM_SALES_FIGURES_1],
	[YTD_CUSTOM_SALES_FIGURES_2],
	[YTD_CUSTOM_SALES_FIGURES_3],  
	[X_BU_ID],  
	[ASSMT_ST_DT_WID],  
	[ETL_PROC_WID],  
	[MAT_ACTL_SHIPMENT_QTY_C],  
	[MAT_ACTL_SHIPMENT_QTY],  
	[MAT_ACTL_GROSS_SHIPMENT_AMT],  
	[MAT_ACTL_GROSS_SHIPMENT_AMT_USD],  
	[MAT_ACTL_NET_SHIPMENT_AMT],  
	[MAT_ACTL_NET_SHIPMENT_AMT_USD],  
	[MAT_GROSS_MARGIN],  
	[MAT_GROSS_MARGIN_USD],  
	[MAT_NET_MARGIN],  
	[MAT_NET_MARGIN_USD],  
	[MAT_PRODUCT_MARGIN],  
	[MAT_PRODUCT_MARGIN_USD],  
	[MAT_MARKET_EXPENDITURE],  
	[MAT_MARKET_EXPENDITURE_USD],  
	[MAT_SALES_EXPENDITURE],  
	[MAT_SALES_EXPENDITURE_USD],  
	[MAT_CONTRIBUTION],  
	[MAT_CONTRIBUTION_USD],  
	[MAT_OPERATING_PROFIT],  
	[MAT_OPERATING_PROFIT_USD],  
	[MAT_TAX_AMOUNT],  
	[MAT_TAX_AMOUNT_USD],  
	[MAT_PROM_MAT_QTY] ,  
	[MAT_SALES_DISCOUNT],  
	[MAT_CUSTOMER_ORIENTED_DISCOUNT],
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
	[CUSTOM_FIELD_12]  ,
	[X_DELIVERED_QTY],
	[X_DELIVERED_PACK],
	[YTD_X_DELIVERED_QTY],
	[YTD_X_DELIVERED_PACK],
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
	[YTD_GROSS_MARGIN_CONF],
	[YTD_NET_MARGIN_CONF],
	[YTD_PRODUCT_MARGIN_CONF],
	[YTD_CONTRIBUTION_CONF],
	[YTD_OPERATING_PROFIT_CONF],
	[YTD_GROSS_MARGIN_USD_CONF],
	[YTD_NET_MARGIN_USD_CONF],
	[YTD_PRODUCT_MARGIN_USD_CONF],
	[YTD_CONTRIBUTION_USD_CONF],
	[YTD_OPERATING_PROFIT_USD_CONF]
FROM WC_SALES_M_A_CZ
  
UNION ALL  

SELECT  
 	[ROW_WID],  
	[COUNTRY_CODE],  
	[MONTH_WID],  
	[SALES_TYPE_WID],  
	[PRODUCT_WID],  
	[PROM_MAT_WID],  
	[ACCNT_WID],  
	[TGT_ACCNT_WID],  
	[GEO_WID],  
	[VENDING_M_WID],  
	[CHANNEL_WID],  
	[SEGMENT_WID],  
	[D_POSTN_WID2],  
	[AMT_CURCY],  
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
	[PROM_MAT_QTY] ,  
	[SALES_DISCOUNT],  
	[CUSTOMER_ORIENTED_DISCOUNT],
	[CUSTOM_SALES_FIGURES_1],
	[CUSTOM_SALES_FIGURES_2],
	[CUSTOM_SALES_FIGURES_3],  
	[YTD_ACTL_SHIPMENT_QTY_C],  
	[YTD_ACTL_SHIPMENT_QTY],  
	[YTD_ACTL_GROSS_SHIPMENT_AMT],  
	[YTD_ACTL_GROSS_SHIPMENT_AMT_USD],  
	[YTD_ACTL_NET_SHIPMENT_AMT],  
	[YTD_ACTL_NET_SHIPMENT_AMT_USD],  
	[YTD_GROSS_MARGIN],  
	[YTD_GROSS_MARGIN_USD],  
	[YTD_NET_MARGIN],  
	[YTD_NET_MARGIN_USD],  
	[YTD_PRODUCT_MARGIN],  
	[YTD_PRODUCT_MARGIN_USD],  
	[YTD_MARKET_EXPENDITURE],  
	[YTD_MARKET_EXPENDITURE_USD],  
	[YTD_SALES_EXPENDITURE],  
	[YTD_SALES_EXPENDITURE_USD],  
	[YTD_CONTRIBUTION],  
	[YTD_CONTRIBUTION_USD],  
	[YTD_OPERATING_PROFIT],  
	[YTD_OPERATING_PROFIT_USD],  
	[YTD_TAX_AMOUNT],  
	[YTD_TAX_AMOUNT_USD],  
	[YTD_PROM_MAT_QTY],  
	[YTD_SALES_DISCOUNT],  
	[YTD_CUSTOMER_ORIENTED_DISCOUNT],
	[YTD_CUSTOM_SALES_FIGURES_1],
	[YTD_CUSTOM_SALES_FIGURES_2],
	[YTD_CUSTOM_SALES_FIGURES_3],  
	[X_BU_ID],  
	[ASSMT_ST_DT_WID],  
	[ETL_PROC_WID],  
	[MAT_ACTL_SHIPMENT_QTY_C],  
	[MAT_ACTL_SHIPMENT_QTY],  
	[MAT_ACTL_GROSS_SHIPMENT_AMT],  
	[MAT_ACTL_GROSS_SHIPMENT_AMT_USD],  
	[MAT_ACTL_NET_SHIPMENT_AMT],  
	[MAT_ACTL_NET_SHIPMENT_AMT_USD],  
	[MAT_GROSS_MARGIN],  
	[MAT_GROSS_MARGIN_USD],  
	[MAT_NET_MARGIN],  
	[MAT_NET_MARGIN_USD],  
	[MAT_PRODUCT_MARGIN],  
	[MAT_PRODUCT_MARGIN_USD],  
	[MAT_MARKET_EXPENDITURE],  
	[MAT_MARKET_EXPENDITURE_USD],  
	[MAT_SALES_EXPENDITURE],  
	[MAT_SALES_EXPENDITURE_USD],  
	[MAT_CONTRIBUTION],  
	[MAT_CONTRIBUTION_USD],  
	[MAT_OPERATING_PROFIT],  
	[MAT_OPERATING_PROFIT_USD],  
	[MAT_TAX_AMOUNT],  
	[MAT_TAX_AMOUNT_USD],  
	[MAT_PROM_MAT_QTY] ,  
	[MAT_SALES_DISCOUNT],  
	[MAT_CUSTOMER_ORIENTED_DISCOUNT],
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
	[CUSTOM_FIELD_12]  ,
	[X_DELIVERED_QTY],
	[X_DELIVERED_PACK],
	[YTD_X_DELIVERED_QTY],
	[YTD_X_DELIVERED_PACK],
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
	[YTD_GROSS_MARGIN_CONF],
	[YTD_NET_MARGIN_CONF],
	[YTD_PRODUCT_MARGIN_CONF],
	[YTD_CONTRIBUTION_CONF],
	[YTD_OPERATING_PROFIT_CONF],
	[YTD_GROSS_MARGIN_USD_CONF],
	[YTD_NET_MARGIN_USD_CONF],
	[YTD_PRODUCT_MARGIN_USD_CONF],
	[YTD_CONTRIBUTION_USD_CONF],
	[YTD_OPERATING_PROFIT_USD_CONF]
FROM WC_SALES_M_A_GE
  
UNION ALL  

SELECT  
 	[ROW_WID],  
	[COUNTRY_CODE],  
	[MONTH_WID],  
	[SALES_TYPE_WID],  
	[PRODUCT_WID],  
	[PROM_MAT_WID],  
	[ACCNT_WID],  
	[TGT_ACCNT_WID],  
	[GEO_WID],  
	[VENDING_M_WID],  
	[CHANNEL_WID],  
	[SEGMENT_WID],  
	[D_POSTN_WID2],  
	[AMT_CURCY],  
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
	[PROM_MAT_QTY] ,  
	[SALES_DISCOUNT],  
	[CUSTOMER_ORIENTED_DISCOUNT],
	[CUSTOM_SALES_FIGURES_1],
	[CUSTOM_SALES_FIGURES_2],
	[CUSTOM_SALES_FIGURES_3],  
	[YTD_ACTL_SHIPMENT_QTY_C],  
	[YTD_ACTL_SHIPMENT_QTY],  
	[YTD_ACTL_GROSS_SHIPMENT_AMT],  
	[YTD_ACTL_GROSS_SHIPMENT_AMT_USD],  
	[YTD_ACTL_NET_SHIPMENT_AMT],  
	[YTD_ACTL_NET_SHIPMENT_AMT_USD],  
	[YTD_GROSS_MARGIN],  
	[YTD_GROSS_MARGIN_USD],  
	[YTD_NET_MARGIN],  
	[YTD_NET_MARGIN_USD],  
	[YTD_PRODUCT_MARGIN],  
	[YTD_PRODUCT_MARGIN_USD],  
	[YTD_MARKET_EXPENDITURE],  
	[YTD_MARKET_EXPENDITURE_USD],  
	[YTD_SALES_EXPENDITURE],  
	[YTD_SALES_EXPENDITURE_USD],  
	[YTD_CONTRIBUTION],  
	[YTD_CONTRIBUTION_USD],  
	[YTD_OPERATING_PROFIT],  
	[YTD_OPERATING_PROFIT_USD],  
	[YTD_TAX_AMOUNT],  
	[YTD_TAX_AMOUNT_USD],  
	[YTD_PROM_MAT_QTY],  
	[YTD_SALES_DISCOUNT],  
	[YTD_CUSTOMER_ORIENTED_DISCOUNT],
	[YTD_CUSTOM_SALES_FIGURES_1],
	[YTD_CUSTOM_SALES_FIGURES_2],
	[YTD_CUSTOM_SALES_FIGURES_3],  
	[X_BU_ID],  
	[ASSMT_ST_DT_WID],  
	[ETL_PROC_WID],  
	[MAT_ACTL_SHIPMENT_QTY_C],  
	[MAT_ACTL_SHIPMENT_QTY],  
	[MAT_ACTL_GROSS_SHIPMENT_AMT],  
	[MAT_ACTL_GROSS_SHIPMENT_AMT_USD],  
	[MAT_ACTL_NET_SHIPMENT_AMT],  
	[MAT_ACTL_NET_SHIPMENT_AMT_USD],  
	[MAT_GROSS_MARGIN],  
	[MAT_GROSS_MARGIN_USD],  
	[MAT_NET_MARGIN],  
	[MAT_NET_MARGIN_USD],  
	[MAT_PRODUCT_MARGIN],  
	[MAT_PRODUCT_MARGIN_USD],  
	[MAT_MARKET_EXPENDITURE],  
	[MAT_MARKET_EXPENDITURE_USD],  
	[MAT_SALES_EXPENDITURE],  
	[MAT_SALES_EXPENDITURE_USD],  
	[MAT_CONTRIBUTION],  
	[MAT_CONTRIBUTION_USD],  
	[MAT_OPERATING_PROFIT],  
	[MAT_OPERATING_PROFIT_USD],  
	[MAT_TAX_AMOUNT],  
	[MAT_TAX_AMOUNT_USD],  
	[MAT_PROM_MAT_QTY] ,  
	[MAT_SALES_DISCOUNT],  
	[MAT_CUSTOMER_ORIENTED_DISCOUNT],
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
	[CUSTOM_FIELD_12]  ,
	[X_DELIVERED_QTY],
	[X_DELIVERED_PACK],
	[YTD_X_DELIVERED_QTY],
	[YTD_X_DELIVERED_PACK],
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
	[YTD_GROSS_MARGIN_CONF],
	[YTD_NET_MARGIN_CONF],
	[YTD_PRODUCT_MARGIN_CONF],
	[YTD_CONTRIBUTION_CONF],
	[YTD_OPERATING_PROFIT_CONF],
	[YTD_GROSS_MARGIN_USD_CONF],
	[YTD_NET_MARGIN_USD_CONF],
	[YTD_PRODUCT_MARGIN_USD_CONF],
	[YTD_CONTRIBUTION_USD_CONF],
	[YTD_OPERATING_PROFIT_USD_CONF]
FROM WC_SALES_M_A_PL
 
UNION ALL  

SELECT  
 	[ROW_WID],  
	[COUNTRY_CODE],  
	[MONTH_WID],  
	[SALES_TYPE_WID],  
	[PRODUCT_WID],  
	[PROM_MAT_WID],  
	[ACCNT_WID],  
	[TGT_ACCNT_WID],  
	[GEO_WID],  
	[VENDING_M_WID],  
	[CHANNEL_WID],  
	[SEGMENT_WID],  
	[D_POSTN_WID2],  
	[AMT_CURCY],  
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
	[PROM_MAT_QTY] ,  
	[SALES_DISCOUNT],  
	[CUSTOMER_ORIENTED_DISCOUNT],
	[CUSTOM_SALES_FIGURES_1],
	[CUSTOM_SALES_FIGURES_2],
	[CUSTOM_SALES_FIGURES_3],  
	[YTD_ACTL_SHIPMENT_QTY_C],  
	[YTD_ACTL_SHIPMENT_QTY],  
	[YTD_ACTL_GROSS_SHIPMENT_AMT],  
	[YTD_ACTL_GROSS_SHIPMENT_AMT_USD],  
	[YTD_ACTL_NET_SHIPMENT_AMT],  
	[YTD_ACTL_NET_SHIPMENT_AMT_USD],  
	[YTD_GROSS_MARGIN],  
	[YTD_GROSS_MARGIN_USD],  
	[YTD_NET_MARGIN],  
	[YTD_NET_MARGIN_USD],  
	[YTD_PRODUCT_MARGIN],  
	[YTD_PRODUCT_MARGIN_USD],  
	[YTD_MARKET_EXPENDITURE],  
	[YTD_MARKET_EXPENDITURE_USD],  
	[YTD_SALES_EXPENDITURE],  
	[YTD_SALES_EXPENDITURE_USD],  
	[YTD_CONTRIBUTION],  
	[YTD_CONTRIBUTION_USD],  
	[YTD_OPERATING_PROFIT],  
	[YTD_OPERATING_PROFIT_USD],  
	[YTD_TAX_AMOUNT],  
	[YTD_TAX_AMOUNT_USD],  
	[YTD_PROM_MAT_QTY],  
	[YTD_SALES_DISCOUNT],  
	[YTD_CUSTOMER_ORIENTED_DISCOUNT],
	[YTD_CUSTOM_SALES_FIGURES_1],
	[YTD_CUSTOM_SALES_FIGURES_2],
	[YTD_CUSTOM_SALES_FIGURES_3],  
	[X_BU_ID],  
	[ASSMT_ST_DT_WID],  
	[ETL_PROC_WID],  
	[MAT_ACTL_SHIPMENT_QTY_C],  
	[MAT_ACTL_SHIPMENT_QTY],  
	[MAT_ACTL_GROSS_SHIPMENT_AMT],  
	[MAT_ACTL_GROSS_SHIPMENT_AMT_USD],  
	[MAT_ACTL_NET_SHIPMENT_AMT],  
	[MAT_ACTL_NET_SHIPMENT_AMT_USD],  
	[MAT_GROSS_MARGIN],  
	[MAT_GROSS_MARGIN_USD],  
	[MAT_NET_MARGIN],  
	[MAT_NET_MARGIN_USD],  
	[MAT_PRODUCT_MARGIN],  
	[MAT_PRODUCT_MARGIN_USD],  
	[MAT_MARKET_EXPENDITURE],  
	[MAT_MARKET_EXPENDITURE_USD],  
	[MAT_SALES_EXPENDITURE],  
	[MAT_SALES_EXPENDITURE_USD],  
	[MAT_CONTRIBUTION],  
	[MAT_CONTRIBUTION_USD],  
	[MAT_OPERATING_PROFIT],  
	[MAT_OPERATING_PROFIT_USD],  
	[MAT_TAX_AMOUNT],  
	[MAT_TAX_AMOUNT_USD],  
	[MAT_PROM_MAT_QTY] ,  
	[MAT_SALES_DISCOUNT],  
	[MAT_CUSTOMER_ORIENTED_DISCOUNT],
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
	[CUSTOM_FIELD_12]  ,
	[X_DELIVERED_QTY],
	[X_DELIVERED_PACK],
	[YTD_X_DELIVERED_QTY],
	[YTD_X_DELIVERED_PACK],
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
	[YTD_GROSS_MARGIN_CONF],
	[YTD_NET_MARGIN_CONF],
	[YTD_PRODUCT_MARGIN_CONF],
	[YTD_CONTRIBUTION_CONF],
	[YTD_OPERATING_PROFIT_CONF],
	[YTD_GROSS_MARGIN_USD_CONF],
	[YTD_NET_MARGIN_USD_CONF],
	[YTD_PRODUCT_MARGIN_USD_CONF],
	[YTD_CONTRIBUTION_USD_CONF],
	[YTD_OPERATING_PROFIT_USD_CONF]
FROM WC_SALES_M_A_WW 

UNION ALL  

SELECT  
 	[ROW_WID],  
	[COUNTRY_CODE],  
	[MONTH_WID],  
	[SALES_TYPE_WID],  
	[PRODUCT_WID],  
	[PROM_MAT_WID],  
	[ACCNT_WID],  
	[TGT_ACCNT_WID],  
	[GEO_WID],  
	[VENDING_M_WID],  
	[CHANNEL_WID],  
	[SEGMENT_WID],  
	[D_POSTN_WID2],  
	[AMT_CURCY],  
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
	[PROM_MAT_QTY] ,  
	[SALES_DISCOUNT],  
	[CUSTOMER_ORIENTED_DISCOUNT],
	[CUSTOM_SALES_FIGURES_1],
	[CUSTOM_SALES_FIGURES_2],
	[CUSTOM_SALES_FIGURES_3],  
	[YTD_ACTL_SHIPMENT_QTY_C],  
	[YTD_ACTL_SHIPMENT_QTY],  
	[YTD_ACTL_GROSS_SHIPMENT_AMT],  
	[YTD_ACTL_GROSS_SHIPMENT_AMT_USD],  
	[YTD_ACTL_NET_SHIPMENT_AMT],  
	[YTD_ACTL_NET_SHIPMENT_AMT_USD],  
	[YTD_GROSS_MARGIN],  
	[YTD_GROSS_MARGIN_USD],  
	[YTD_NET_MARGIN],  
	[YTD_NET_MARGIN_USD],  
	[YTD_PRODUCT_MARGIN],  
	[YTD_PRODUCT_MARGIN_USD],  
	[YTD_MARKET_EXPENDITURE],  
	[YTD_MARKET_EXPENDITURE_USD],  
	[YTD_SALES_EXPENDITURE],  
	[YTD_SALES_EXPENDITURE_USD],  
	[YTD_CONTRIBUTION],  
	[YTD_CONTRIBUTION_USD],  
	[YTD_OPERATING_PROFIT],  
	[YTD_OPERATING_PROFIT_USD],  
	[YTD_TAX_AMOUNT],  
	[YTD_TAX_AMOUNT_USD],  
	[YTD_PROM_MAT_QTY],  
	[YTD_SALES_DISCOUNT],  
	[YTD_CUSTOMER_ORIENTED_DISCOUNT],
	[YTD_CUSTOM_SALES_FIGURES_1],
	[YTD_CUSTOM_SALES_FIGURES_2],
	[YTD_CUSTOM_SALES_FIGURES_3],  
	[X_BU_ID],  
	[ASSMT_ST_DT_WID],  
	[ETL_PROC_WID],  
	[MAT_ACTL_SHIPMENT_QTY_C],  
	[MAT_ACTL_SHIPMENT_QTY],  
	[MAT_ACTL_GROSS_SHIPMENT_AMT],  
	[MAT_ACTL_GROSS_SHIPMENT_AMT_USD],  
	[MAT_ACTL_NET_SHIPMENT_AMT],  
	[MAT_ACTL_NET_SHIPMENT_AMT_USD],  
	[MAT_GROSS_MARGIN],  
	[MAT_GROSS_MARGIN_USD],  
	[MAT_NET_MARGIN],  
	[MAT_NET_MARGIN_USD],  
	[MAT_PRODUCT_MARGIN],  
	[MAT_PRODUCT_MARGIN_USD],  
	[MAT_MARKET_EXPENDITURE],  
	[MAT_MARKET_EXPENDITURE_USD],  
	[MAT_SALES_EXPENDITURE],  
	[MAT_SALES_EXPENDITURE_USD],  
	[MAT_CONTRIBUTION],  
	[MAT_CONTRIBUTION_USD],  
	[MAT_OPERATING_PROFIT],  
	[MAT_OPERATING_PROFIT_USD],  
	[MAT_TAX_AMOUNT],  
	[MAT_TAX_AMOUNT_USD],  
	[MAT_PROM_MAT_QTY] ,  
	[MAT_SALES_DISCOUNT],  
	[MAT_CUSTOMER_ORIENTED_DISCOUNT],
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
	[CUSTOM_FIELD_12] ,
	[X_DELIVERED_QTY],
	[X_DELIVERED_PACK],
	[YTD_X_DELIVERED_QTY],
	[YTD_X_DELIVERED_PACK],
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
	[YTD_GROSS_MARGIN_CONF],
	[YTD_NET_MARGIN_CONF],
	[YTD_PRODUCT_MARGIN_CONF],
	[YTD_CONTRIBUTION_CONF],
	[YTD_OPERATING_PROFIT_CONF],
	[YTD_GROSS_MARGIN_USD_CONF],
	[YTD_NET_MARGIN_USD_CONF],
	[YTD_PRODUCT_MARGIN_USD_CONF],
	[YTD_CONTRIBUTION_USD_CONF],
	[YTD_OPERATING_PROFIT_USD_CONF] 
FROM WC_SALES_M_A_GR 
UNION ALL  

SELECT  
 	[ROW_WID],  
	[COUNTRY_CODE],  
	[MONTH_WID],  
	[SALES_TYPE_WID],  
	[PRODUCT_WID],  
	[PROM_MAT_WID],  
	[ACCNT_WID],  
	[TGT_ACCNT_WID],  
	[GEO_WID],  
	[VENDING_M_WID],  
	[CHANNEL_WID],  
	[SEGMENT_WID],  
	[D_POSTN_WID2],  
	[AMT_CURCY],  
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
	[PROM_MAT_QTY] ,  
	[SALES_DISCOUNT],  
	[CUSTOMER_ORIENTED_DISCOUNT],
	[CUSTOM_SALES_FIGURES_1],
	[CUSTOM_SALES_FIGURES_2],
	[CUSTOM_SALES_FIGURES_3],  
	[YTD_ACTL_SHIPMENT_QTY_C],  
	[YTD_ACTL_SHIPMENT_QTY],  
	[YTD_ACTL_GROSS_SHIPMENT_AMT],  
	[YTD_ACTL_GROSS_SHIPMENT_AMT_USD],  
	[YTD_ACTL_NET_SHIPMENT_AMT],  
	[YTD_ACTL_NET_SHIPMENT_AMT_USD],  
	[YTD_GROSS_MARGIN],  
	[YTD_GROSS_MARGIN_USD],  
	[YTD_NET_MARGIN],  
	[YTD_NET_MARGIN_USD],  
	[YTD_PRODUCT_MARGIN],  
	[YTD_PRODUCT_MARGIN_USD],  
	[YTD_MARKET_EXPENDITURE],  
	[YTD_MARKET_EXPENDITURE_USD],  
	[YTD_SALES_EXPENDITURE],  
	[YTD_SALES_EXPENDITURE_USD],  
	[YTD_CONTRIBUTION],  
	[YTD_CONTRIBUTION_USD],  
	[YTD_OPERATING_PROFIT],  
	[YTD_OPERATING_PROFIT_USD],  
	[YTD_TAX_AMOUNT],  
	[YTD_TAX_AMOUNT_USD],  
	[YTD_PROM_MAT_QTY],  
	[YTD_SALES_DISCOUNT],  
	[YTD_CUSTOMER_ORIENTED_DISCOUNT],
	[YTD_CUSTOM_SALES_FIGURES_1],
	[YTD_CUSTOM_SALES_FIGURES_2],
	[YTD_CUSTOM_SALES_FIGURES_3],  
	[X_BU_ID],  
	[ASSMT_ST_DT_WID],  
	[ETL_PROC_WID],  
	[MAT_ACTL_SHIPMENT_QTY_C],  
	[MAT_ACTL_SHIPMENT_QTY],  
	[MAT_ACTL_GROSS_SHIPMENT_AMT],  
	[MAT_ACTL_GROSS_SHIPMENT_AMT_USD],  
	[MAT_ACTL_NET_SHIPMENT_AMT],  
	[MAT_ACTL_NET_SHIPMENT_AMT_USD],  
	[MAT_GROSS_MARGIN],  
	[MAT_GROSS_MARGIN_USD],  
	[MAT_NET_MARGIN],  
	[MAT_NET_MARGIN_USD],  
	[MAT_PRODUCT_MARGIN],  
	[MAT_PRODUCT_MARGIN_USD],  
	[MAT_MARKET_EXPENDITURE],  
	[MAT_MARKET_EXPENDITURE_USD],  
	[MAT_SALES_EXPENDITURE],  
	[MAT_SALES_EXPENDITURE_USD],  
	[MAT_CONTRIBUTION],  
	[MAT_CONTRIBUTION_USD],  
	[MAT_OPERATING_PROFIT],  
	[MAT_OPERATING_PROFIT_USD],  
	[MAT_TAX_AMOUNT],  
	[MAT_TAX_AMOUNT_USD],  
	[MAT_PROM_MAT_QTY] ,  
	[MAT_SALES_DISCOUNT],  
	[MAT_CUSTOMER_ORIENTED_DISCOUNT],
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
	[CUSTOM_FIELD_12]  ,
	[X_DELIVERED_QTY],
	[X_DELIVERED_PACK],
	[YTD_X_DELIVERED_QTY],
	[YTD_X_DELIVERED_PACK],
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
	[YTD_GROSS_MARGIN_CONF],
	[YTD_NET_MARGIN_CONF],
	[YTD_PRODUCT_MARGIN_CONF],
	[YTD_CONTRIBUTION_CONF],
	[YTD_OPERATING_PROFIT_CONF],
	[YTD_GROSS_MARGIN_USD_CONF],
	[YTD_NET_MARGIN_USD_CONF],
	[YTD_PRODUCT_MARGIN_USD_CONF],
	[YTD_CONTRIBUTION_USD_CONF],
	[YTD_OPERATING_PROFIT_USD_CONF]
FROM WC_SALES_M_A_SK

UNION ALL  

SELECT  
 	[ROW_WID],  
	[COUNTRY_CODE],  
	[MONTH_WID],  
	[SALES_TYPE_WID],  
	[PRODUCT_WID],  
	[PROM_MAT_WID],  
	[ACCNT_WID],  
	[TGT_ACCNT_WID],  
	[GEO_WID],  
	[VENDING_M_WID],  
	[CHANNEL_WID],  
	[SEGMENT_WID],  
	[D_POSTN_WID2],  
	[AMT_CURCY],  
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
	[PROM_MAT_QTY] ,  
	[SALES_DISCOUNT],  
	[CUSTOMER_ORIENTED_DISCOUNT],
	[CUSTOM_SALES_FIGURES_1],
	[CUSTOM_SALES_FIGURES_2],
	[CUSTOM_SALES_FIGURES_3],  
	[YTD_ACTL_SHIPMENT_QTY_C],  
	[YTD_ACTL_SHIPMENT_QTY],  
	[YTD_ACTL_GROSS_SHIPMENT_AMT],  
	[YTD_ACTL_GROSS_SHIPMENT_AMT_USD],  
	[YTD_ACTL_NET_SHIPMENT_AMT],  
	[YTD_ACTL_NET_SHIPMENT_AMT_USD],  
	[YTD_GROSS_MARGIN],  
	[YTD_GROSS_MARGIN_USD],  
	[YTD_NET_MARGIN],  
	[YTD_NET_MARGIN_USD],  
	[YTD_PRODUCT_MARGIN],  
	[YTD_PRODUCT_MARGIN_USD],  
	[YTD_MARKET_EXPENDITURE],  
	[YTD_MARKET_EXPENDITURE_USD],  
	[YTD_SALES_EXPENDITURE],  
	[YTD_SALES_EXPENDITURE_USD],  
	[YTD_CONTRIBUTION],  
	[YTD_CONTRIBUTION_USD],  
	[YTD_OPERATING_PROFIT],  
	[YTD_OPERATING_PROFIT_USD],  
	[YTD_TAX_AMOUNT],  
	[YTD_TAX_AMOUNT_USD],  
	[YTD_PROM_MAT_QTY],  
	[YTD_SALES_DISCOUNT],  
	[YTD_CUSTOMER_ORIENTED_DISCOUNT],
	[YTD_CUSTOM_SALES_FIGURES_1],
	[YTD_CUSTOM_SALES_FIGURES_2],
	[YTD_CUSTOM_SALES_FIGURES_3],  
	[X_BU_ID],  
	[ASSMT_ST_DT_WID],  
	[ETL_PROC_WID],  
	[MAT_ACTL_SHIPMENT_QTY_C],  
	[MAT_ACTL_SHIPMENT_QTY],  
	[MAT_ACTL_GROSS_SHIPMENT_AMT],  
	[MAT_ACTL_GROSS_SHIPMENT_AMT_USD],  
	[MAT_ACTL_NET_SHIPMENT_AMT],  
	[MAT_ACTL_NET_SHIPMENT_AMT_USD],  
	[MAT_GROSS_MARGIN],  
	[MAT_GROSS_MARGIN_USD],  
	[MAT_NET_MARGIN],  
	[MAT_NET_MARGIN_USD],  
	[MAT_PRODUCT_MARGIN],  
	[MAT_PRODUCT_MARGIN_USD],  
	[MAT_MARKET_EXPENDITURE],  
	[MAT_MARKET_EXPENDITURE_USD],  
	[MAT_SALES_EXPENDITURE],  
	[MAT_SALES_EXPENDITURE_USD],  
	[MAT_CONTRIBUTION],  
	[MAT_CONTRIBUTION_USD],  
	[MAT_OPERATING_PROFIT],  
	[MAT_OPERATING_PROFIT_USD],  
	[MAT_TAX_AMOUNT],  
	[MAT_TAX_AMOUNT_USD],  
	[MAT_PROM_MAT_QTY] ,  
	[MAT_SALES_DISCOUNT],  
	[MAT_CUSTOMER_ORIENTED_DISCOUNT],
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
	[CUSTOM_FIELD_12]  ,
	[X_DELIVERED_QTY],
	[X_DELIVERED_PACK],
	[YTD_X_DELIVERED_QTY],
	[YTD_X_DELIVERED_PACK],
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
	[YTD_GROSS_MARGIN_CONF],
	[YTD_NET_MARGIN_CONF],
	[YTD_PRODUCT_MARGIN_CONF],
	[YTD_CONTRIBUTION_CONF],
	[YTD_OPERATING_PROFIT_CONF],
	[YTD_GROSS_MARGIN_USD_CONF],
	[YTD_NET_MARGIN_USD_CONF],
	[YTD_PRODUCT_MARGIN_USD_CONF],
	[YTD_CONTRIBUTION_USD_CONF],
	[YTD_OPERATING_PROFIT_USD_CONF]
FROM WC_SALES_M_A_HU

GO

