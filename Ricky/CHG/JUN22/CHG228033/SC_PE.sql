 SELECT DISTINCT
CHEQUE.X_PAYMENT_REQ_NUM_EFT,
CHEQUE.PAYMENT_NUM,
PAY.PAY_AMT,
PAY.ROW_ID,
PAY.REASON_CD,
ISNULL(ORG_CHEQUE.NAME,ISNULL(ORG.NAME,AGREE_ACNT.NAME)) AS NAME,
PAY.PAY_STAT_CD,
PAY.X_EXPORT_STATUS_CD,
PAY.X_APPROVAL_STATUS_CD,
CHEQUE.X_EXPORT_STATUS_CD,
BUD.NAME,
CHEQUE.PAYMENT_REQ_NUM,
CHEQUE.PAY_TYPE_CD,
CHEQUE.PAY_STAT_CD,
CHEQUE_CON.LAST_NAME,
CHEQUE_CON.FST_NAME,
CHEQUE.X_PAYMENT_DEL_METHOD_CD,
CHEQUE.X_PAY_ADDR_TEXT,
S_ADDR_PER.ADDR,
S_ADDR_PER.ADDR_LINE_2, -- added as per defect 689
S_ADDR_PER.ADDR_LINE_4, -- added as per defect 689
S_ADDR_PER.ZIPCODE, -- added as per defect 689
S_ADDR_PER.X_STATE, -- added as per defect 689
S_ADDR_PER.COUNTRY, -- added as per defect 689
S_ADDR_PER.CITY, -- added as per defect 689
S_ADDR_PER.ADDR_TYPE_CD, -- added as per defect 689
CHEQUE.X_PAY_FAX_PH_TEXT,
APPRV.LOGIN AS APPROVER,
SEC_APPRV.LOGIN AS SEC_APPROVER,
PAY.X_APPROVAL_DT,
APPRV_BY.LOGIN AS APPROVER_BY,
PAY.X_BANK_PAYMENT_NUMBER_TEXT,
PAY.X_BANK_PAYMENT_DATE_DT,
PAY.X_BANK_PAYMENT_STATUS_TEXT,
S_DOC_AGREE.AGREE_NUM,
S_DOC_AGREE.NAME,
S_CONTACT.PERSON_UID,
S_PTY_PAY_PRFL.X_GIFT_CARD_NUM,
CXBK.X_BANK_NAME_TEXT,
CXBK.X_BANK_NUMBER_TEXT,
AC_C.X_TRANSIT_NUM,
AC_C.X_LAST_NAME_BA_TEXT,
AC_C.X_FIRST_NAME_BA_TEXT,
ISNULL(CHEQUE.ACCNT_ID,ISNULL (PAY.ACCNT_ID,S_DOC_AGREE.TARGET_OU_ID)) AS ACCNT_ID,
S_BU.NAME AS COUNTRY_NAME,
S_ORG_EXT.LOC AS COUNTRY_CODE,
PAY.PAYMENT_REQ_NUM,
PAY.TYPE_CD,
CHEQUE.TYPE_CD,
CHEQUE.ROW_ID,
CHEQUE_CON.FST_NAME, -- added as per defect 689
CHEQUE_CON.LAST_NAME, -- added as per defect 689
CHEQUE_CON.PER_TITLE, -- added as per defect 689
CHEQUE_CON.CON_CD, -- added as per defect 689
CHEQUE_CON.X_LANGUAGE_CD, -- CHEQUE_LANG.NAME removed as per CHG062324
CHEQUE.X_SIGNATURE_DT, -- added as per defect 689
CHEQUE_SIGN.FST_NAME, -- added as per defect 689
CHEQUE_SIGN.LAST_NAME, -- added as per defect 689
CHEQUE_SIGN.PER_TITLE, -- added as per defect 689
CHEQUE_SIGN.CON_CD, -- added as per defect 689
CHEQUE_SIGN.X_LANGUAGE_CD,  -- CHEQUE_SIGN_LANG.NAME removed as per CHG062324
CHEQUE.ACTL_PAY_DT, -- added as per defect 689
S_USER.LOGIN, -- added as per defect 689
CHEQUE_CREATED.FST_NAME, -- added as per defect 689
CHEQUE_CREATED.LAST_NAME, -- added as per defect 689
-------------CHG062329-------------
CHEQUE.X_VAT_REGN_NUM,
BL_ADR.ADDR,
BL_ADR.ADDR_LINE_2,
BL_ADR.ADDR_LINE_4,
BL_ADR.ZIPCODE,
BL_ADR.CITY,
BL_ADR.X_STATE,
BL_ADR.COUNTRY,
-------------CHG069435-------------
AC_ADDR.ADDR,
AC_ADDR.ADDR_LINE_2,
AC_ADDR.ZIPCODE,
AC_ADDR.CITY,
INV_CONTACT.FST_NAME,
INV_CONTACT.LAST_NAME,
INV_CONTACT.X_LANGUAGE_CD,
INV_CONTACT.PER_TITLE,
CHEQUE.X_PAY_DEL_STAT_CD, --added as per CHG078383
ORG_CHEQUE.ALIAS_NAME, --added as per CHG078383
PAY.X_CONTRACT_PAY_METHOD_CD,--added as per CHG099099
---CHG131815---
-- S_ORDER.ORDER_NUM,
 --S_ORDER.X_SUB_TYPE,
 ---CHG228033---
 PAY.X_TMEC_CREATED_DT AS MOBILE_CREATED_DATE,
 MOB_CREATED_BY.LOGIN AS MOBILE_CREATED_BY
FROM S_SRC_PAYMENT PAY (NOLOCK)
INNER JOIN S_BU (NOLOCK) ON S_BU.ROW_ID = PAY.X_BU_ID
INNER JOIN S_ORG_EXT (NOLOCK) ON S_BU.ROW_ID = S_ORG_EXT.ROW_ID
LEFT OUTER JOIN S_SRC_PAYMENT CHEQUE (NOLOCK) ON PAY.PAR_PAYMENT_ID= CHEQUE.ROW_ID
LEFT OUTER JOIN S_ORG_EXT ORG_CHEQUE (NOLOCK) ON ORG_CHEQUE.ROW_ID = CHEQUE.ACCNT_ID
LEFT OUTER JOIN S_ORG_EXT ORG (NOLOCK) ON ORG.ROW_ID = PAY.ACCNT_ID
LEFT OUTER JOIN S_MDF BUD (NOLOCK) ON BUD.ROW_ID = PAY.X_AGREE_BUDGET_ID
LEFT OUTER JOIN S_USER APPRV (NOLOCK) ON APPRV.ROW_ID = PAY.X_APPROVER_ID
LEFT OUTER JOIN S_USER SEC_APPRV (NOLOCK) ON SEC_APPRV.ROW_ID = PAY.X_SECONDARY_APPROVER_ID
LEFT OUTER JOIN S_USER APPRV_BY (NOLOCK) ON APPRV_BY.ROW_ID = PAY.X_APPROVED_BY_ID
LEFT OUTER JOIN S_PTY_PAY_PRFL PAY_PRFL (NOLOCK) ON PAY_PRFL.BANK_ACCT_ID = PAY.ACCNT_ID
LEFT OUTER JOIN S_ADDR_PER (NOLOCK) ON CHEQUE.BANK_ADDR_ID = S_ADDR_PER.ROW_ID
LEFT OUTER JOIN S_CONTACT CHEQUE_CON (NOLOCK) ON CHEQUE.CON_ID = CHEQUE_CON.ROW_ID
LEFT OUTER JOIN S_CONTACT (NOLOCK) ON PAY.CON_ID = S_CONTACT.ROW_ID
LEFT OUTER JOIN S_PTY_PAY_PRFL (NOLOCK) ON S_CONTACT.PR_PER_PAY_PRFL_ID = S_PTY_PAY_PRFL.ROW_ID
LEFT OUTER JOIN S_DOC_AGREE (NOLOCK) ON PAY.CONTRACT_ID = S_DOC_AGREE.ROW_ID
LEFT OUTER JOIN S_ORG_EXT AGREE_ACNT (NOLOCK) ON S_DOC_AGREE.TARGET_OU_ID = AGREE_ACNT.ROW_ID
LEFT OUTER JOIN S_ORG_EXT_X AC_C (NOLOCK) ON CHEQUE.ACCNT_ID = AC_C.PAR_ROW_ID
LEFT OUTER JOIN S_ORG_EXT_X AC_P (NOLOCK) ON PAY.ACCNT_ID = ORG.PAR_ROW_ID
--LEFT OUTER JOIN S_LANG CHEQUE_LANG ON CHEQUE_CON.PREF_LANG_ID = CHEQUE_LANG.LANG_CD --commented as per CHG062324
LEFT OUTER JOIN S_CONTACT CHEQUE_SIGN (NOLOCK) ON CHEQUE.X_SIGNED_BY_ID = CHEQUE_SIGN.ROW_ID
--LEFT OUTER JOIN S_LANG CHEQUE_SIGN_LANG ON CHEQUE_SIGN.PREF_LANG_ID = CHEQUE_SIGN_LANG.LANG_CD --commented as per CHG062324
LEFT OUTER JOIN S_CONTACT CHEQUE_CREATED (NOLOCK) ON CHEQUE.CREATED_BY = CHEQUE_CREATED.ROW_ID
LEFT OUTER JOIN S_USER S_USER (NOLOCK) ON CHEQUE.CREATED_BY = S_USER.ROW_ID
LEFT OUTER JOIN S_ADDR_PER BL_ADR (NOLOCK) ON CHEQUE.ADDR_ORG_ID = BL_ADR.ROW_ID --CHG062329
LEFT OUTER JOIN CX_BANK_ADMIN CXBK (NOLOCK) ON CXBK.ROW_ID=AC_C.X_BANK_ID --Defect498
LEFT OUTER JOIN S_ADDR_PER AC_ADDR (NOLOCK)ON AC_ADDR.ROW_ID = ORG_CHEQUE.PR_ADDR_ID --CHG069435
LEFT OUTER JOIN S_CONTACT INV_CONTACT (NOLOCK) ON CHEQUE.X_INVOICE_CON_ID = INV_CONTACT.ROW_ID --CHG069435
LEFT OUTER JOIN S_USER MOB_CREATED_BY (NOLOCK) ON MOB_CREATED_BY.ROW_ID = PAY.X_TMEC_CREATED_BY_ID
$$BUSINESSRULE

SELECT DISTINCT CHEQUE.X_PAYMENT_REQ_NUM_EFT, CHEQUE.PAYMENT_NUM, PAY.PAY_AMT, PAY.ROW_ID, PAY.REASON_CD, ORG_CHEQUE.NAME AS NAME, CHEQUE.PAY_STAT_CD, CHEQUE.X_EXPORT_STATUS_CD, CHEQUE.X_APPROVAL_STATUS_CD, CHEQUE.X_EXPORT_STATUS_CD, BUD.NAME, CHEQUE.PAYMENT_REQ_NUM, CHEQUE.PAY_TYPE_CD, CHEQUE.PAY_STAT_CD, CHEQUE_CON.LAST_NAME, CHEQUE_CON.FST_NAME, CHEQUE.X_PAYMENT_DEL_METHOD_CD, CHEQUE.X_PAY_ADDR_TEXT, S_ADDR_PER.ADDR, S_ADDR_PER.ADDR_LINE_2, S_ADDR_PER.ADDR_LINE_4, S_ADDR_PER.ZIPCODE, S_ADDR_PER.X_STATE, S_ADDR_PER.COUNTRY, S_ADDR_PER.CITY, S_ADDR_PER.ADDR_TYPE_CD, CHEQUE.X_PAY_FAX_PH_TEXT, APPRV.LOGIN AS APPROVER, SEC_APPRV.LOGIN AS SEC_APPROVER, CHEQUE.X_APPROVAL_DT, APPRV_BY.LOGIN AS APPROVER_BY, CHEQUE.X_BANK_PAYMENT_NUMBER_TEXT, CHEQUE.X_BANK_PAYMENT_DATE_DT, CHEQUE.X_BANK_PAYMENT_STATUS_TEXT, S_DOC_AGREE.AGREE_NUM, S_DOC_AGREE.NAME, CHEQUE_CON.PERSON_UID, S_PTY_PAY_PRFL.X_GIFT_CARD_NUM, CXBK.X_BANK_NAME_TEXT, CXBK.X_BANK_NUMBER_TEXT, AC_C.X_TRANSIT_NUM, AC_C.X_LAST_NAME_BA_TEXT, AC_C.X_FIRST_NAME_BA_TEXT, CHEQUE.ACCNT_ID AS ACCNT_ID, S_BU.NAME AS COUNTRY_NAME, S_ORG_EXT.LOC AS COUNTRY_CODE, PAY.PAYMENT_REQ_NUM, PAY.TYPE_CD, CHEQUE.TYPE_CD, CHEQUE.ROW_ID, CHEQUE_CON.FST_NAME, CHEQUE_CON.LAST_NAME, CHEQUE_CON.PER_TITLE, CHEQUE_CON.CON_CD, CHEQUE_CON.X_LANGUAGE_CD, CHEQUE.X_SIGNATURE_DT, CHEQUE_SIGN.FST_NAME, CHEQUE_SIGN.LAST_NAME, CHEQUE_SIGN.PER_TITLE, CHEQUE_SIGN.CON_CD, CHEQUE_SIGN.X_LANGUAGE_CD, CHEQUE.ACTL_PAY_DT, S_USER.LOGIN, CHEQUE_CREATED.FST_NAME, CHEQUE_CREATED.LAST_NAME, CHEQUE.X_VAT_REGN_NUM, BL_ADR.ADDR, BL_ADR.ADDR_LINE_2, BL_ADR.ADDR_LINE_4, BL_ADR.ZIPCODE, BL_ADR.CITY, BL_ADR.X_STATE, BL_ADR.COUNTRY, AC_ADDR.ADDR, AC_ADDR.ADDR_LINE_2, AC_ADDR.ZIPCODE, AC_ADDR.CITY, INV_CONTACT.FST_NAME, INV_CONTACT.LAST_NAME, INV_CONTACT.X_LANGUAGE_CD, INV_CONTACT.PER_TITLE, CHEQUE.X_PAY_DEL_STAT_CD, ORG_CHEQUE.ALIAS_NAME, CHEQUE.X_CONTRACT_PAY_METHOD_CD, S_ORDER.ORDER_NUM, S_ORDER.X_SUB_TYPE, PAY.X_TMEC_CREATED_DT AS MOBILE_CREATED_DATE, MOB_CREATED_BY.LOGIN AS MOBILE_CREATED_BY 
FROM S_SRC_PAYMENT PAY INNER JOIN S_BU ON S_BU.ROW_ID = PAY.X_BU_ID INNER JOIN S_ORG_EXT ON S_BU.ROW_ID = S_ORG_EXT.ROW_ID INNER JOIN S_SRC_PAYMENT CHEQUE ON PAY.PAR_PAYMENT_ID = CHEQUE.ROW_ID  LEFT OUTER JOIN S_ORG_EXT ORG_CHEQUE ON ORG_CHEQUE.ROW_ID = CHEQUE.ACCNT_ID LEFT OUTER JOIN S_MDF BUD ON BUD.ROW_ID = CHEQUE.X_AGREE_BUDGET_ID LEFT OUTER JOIN S_USER APPRV ON APPRV.ROW_ID = CHEQUE.X_APPROVER_ID LEFT OUTER JOIN S_USER SEC_APPRV ON SEC_APPRV.ROW_ID = CHEQUE.X_SECONDARY_APPROVER_ID LEFT OUTER JOIN S_USER APPRV_BY ON APPRV_BY.ROW_ID = CHEQUE.X_APPROVED_BY_ID LEFT OUTER JOIN S_ADDR_PER ON CHEQUE.BANK_ADDR_ID = S_ADDR_PER.ROW_ID LEFT OUTER JOIN S_CONTACT CHEQUE_CON ON CHEQUE.CON_ID = CHEQUE_CON.ROW_ID LEFT OUTER JOIN S_PTY_PAY_PRFL ON CHEQUE_CON.PR_PER_PAY_PRFL_ID = S_PTY_PAY_PRFL.ROW_ID LEFT OUTER JOIN S_DOC_AGREE ON CHEQUE.CONTRACT_ID = S_DOC_AGREE.ROW_ID LEFT OUTER JOIN S_ORG_EXT AGREE_ACNT ON S_DOC_AGREE.TARGET_OU_ID = AGREE_ACNT.ROW_ID LEFT OUTER JOIN S_ORG_EXT_X AC_C ON CHEQUE.ACCNT_ID = AC_C.PAR_ROW_ID LEFT OUTER JOIN S_CONTACT CHEQUE_SIGN ON CHEQUE.X_SIGNED_BY_ID = CHEQUE_SIGN.ROW_ID LEFT OUTER JOIN S_CONTACT CHEQUE_CREATED ON CHEQUE.CREATED_BY = CHEQUE_CREATED.ROW_ID LEFT OUTER JOIN S_USER S_USER ON CHEQUE.CREATED_BY = S_USER.ROW_ID LEFT OUTER JOIN CX_BANK_ADMIN CXBK ON CXBK.ROW_ID = AC_C.X_BANK_ID LEFT OUTER JOIN S_ADDR_PER BL_ADR(NOLOCK) ON CHEQUE.ADDR_ORG_ID = BL_ADR.ROW_ID LEFT OUTER JOIN S_ADDR_PER AC_ADDR(NOLOCK) ON AC_ADDR.ROW_ID = ORG_CHEQUE.PR_ADDR_ID LEFT OUTER JOIN S_CONTACT INV_CONTACT(NOLOCK) ON CHEQUE.X_INVOICE_CON_ID = INV_CONTACT.ROW_ID LEFT OUTER JOIN S_ORDER(NOLOCK) ON CHEQUE.ORDER_ID = S_ORDER.ROW_ID LEFT OUTER JOIN S_USER MOB_CREATED_BY (NOLOCK) ON MOB_CREATED_BY.ROW_ID = PAY.X_TMEC_CREATED_BY_ID
WHERE PAY.X_BU_ID = '1-2O83'

SELECT * FROM  S_SRC_PAYMENT 
WHERE X_BU_ID = '1-2O83' --AND PAY_STAT_CD = 'Sent to Bank'

UPDATE S_SRC_PAYMENT
SET  X_EXPORT_STATUS_CD = null
where ROW_ID ='1-25R3UD'

SELECT * FROM S_SRC_PAYMENT
WHERE ROW_ID ='1-25R3UD'
