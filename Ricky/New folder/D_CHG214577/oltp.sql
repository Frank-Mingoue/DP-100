select  CREATED ,ORDER_DT,* 
from S_ORDER 
where ROW_ID in ('1-7Q8TF2', '1-7Q5M7E', '1-7PQ53Z' )

select  CREATED ,ORDER_DT, CONTACT_ID, BU_ID, * 
from S_ORDER 
where ORDER_NUM = '1-466164971' 

select  CREATED ,ORDER_DT, CONTACT_ID, * 
from S_ORDER 
where CONTACT_ID NOT IN ('No Match Row Id') AND BU_ID = '1-534ZD'

SELECT TIMEZONE_ID, * FROM S_CONTACT WHERE ROW_ID = '1-6WP099'

SELECT * FROM S_TIMEZONE WHERE UTC_OFFSET != 0

select O.CREATED ,O.ORDER_DT, O.CONTACT_ID, O.BU_ID, O.ORDER_NUM, T.UTC_OFFSET
from S_ORDER O
inner join S_CONTACT C ON C.ROW_ID = O.CONTACT_ID
INNER JOIN S_TIMEZONE T ON T.ROW_ID = C.TIMEZONE_ID
where O.BU_ID = '1-534ZD'
AND T.UTC_OFFSET <> 0