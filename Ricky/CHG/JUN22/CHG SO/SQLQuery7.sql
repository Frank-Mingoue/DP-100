--1-734M1  1-734LU
--1-7SLTTS 1-7SLTTH

SELECT DISTINCT 
SO.X_EXPORT_STATUS , SO.STATUS_CD , OI.QTY_REQ , OI.DLVRY_STATUS_CD, BU.NAME, SO.X_SUB_TYPE
FROM S_ORDER SO
RIGHT JOIN S_ORDER_ITEM OI(NOLOCK) ON SO.ROW_ID = OI.ORDER_ID
INNER JOIN S_BU BU(NOLOCK) ON SO.BU_ID = BU.ROW_ID
where SO.ROW_ID in ( '1-734LU', '1-7SLTTH')


select IF_ROW_STAT, X_EXPORT_STATUS, ORD_STATUS_CD,* from EIM_ORDER where IF_ROW_BATCH_NUM between 1000 and 1999