

SELECT ATTRIB_39, * 
FROM WC_ORDER_D 
where INTEGRATION_ID in ('1-7Q8TF2', '1-7Q5M7E', , '1-7PQ53Z' )


SELECT ATTRIB_39,ORDER_DT,ORDER_NUM,* 
FROM WC_ORDER_DS
where ORDER_NUM in ('1-466164971', '1-466198101')

DELETE FROM WC_ORDER_DS
where ORDER_NUM in ('1-466164971', '1-466198101')
