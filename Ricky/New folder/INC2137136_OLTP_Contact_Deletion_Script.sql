--If exist drop the stating tables
DROP TABLE StagingDB.dbo.CN_TO_BE_DELETED
DROP TABLE StagingDB.dbo.CN_IMPACTED_TAB_TO_BACKUP

--Populate Impacted ROW_ID in a staging table.
SELECT ROW_ID 
INTO StagingDB.dbo.CN_TO_BE_DELETED
FROM S_CONTACT
WHERE ROW_ID IN  ('xxxx') --Contact UIDs provided by the client.

--Verify that the staging table was correctly populated.
SELECT * FROM StagingDB.dbo.CN_TO_BE_DELETED

--Verify impacted tables 
SELECT * FROM (
SELECT 'S_CONTACT' AS TAB , COUNT(1) as REC_COUNT , 'ROW_ID' as COL FROM S_CONTACT WHERE ROW_ID IN (SELECT ROW_ID  FROM StagingDB.dbo.CN_TO_BE_DELETED) UNION
SELECT 'S_PARTY' ,COUNT(1), 'ROW_ID'  FROM  S_PARTY P  INNER JOIN S_CONTACT C ON C.PAR_ROW_ID=P.ROW_ID where C.ROW_ID IN (SELECT ROW_ID  FROM StagingDB.dbo.CN_TO_BE_DELETED) UNION
SELECT	'S_ADDR_PER'	,COUNT(1)	,'PER_ID' 	FROM	S_ADDR_PER	WHERE	PER_ID	IN	(SELECT	ROW_ID	FROM	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
SELECT	'S_CONTACT_BU'	,COUNT(1)	,'CONTACT_ID' 	FROM	S_CONTACT_BU	WHERE	CONTACT_ID	IN	(SELECT	ROW_ID	FROM	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
SELECT	'S_CONTACT_INFO'	,COUNT(1)	,'TARGET_PER_ID' 	FROM	S_CONTACT_INFO	WHERE	TARGET_PER_ID	IN	(SELECT	ROW_ID	FROM	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ACT_CONTACT'	,COUNT(1)	,'CON_ID' 	from	S_ACT_CONTACT	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_AGENT_DETAIL'	,COUNT(1)	,'AGENT_ID' 	from	S_AGENT_DETAIL	where	AGENT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ALGN_POS_CON'	,COUNT(1)	,'CON_ID' 	from	S_ALGN_POS_CON	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_APPL_CON'	,COUNT(1)	,'CON_ID' 	from	S_APPL_CON	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ARREST'	,COUNT(1)	,'ARRESTEE_ID' 	from	S_ARREST	where	ARRESTEE_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ARREST_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_ARREST_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ASSET_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_ASSET_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_AUC_ALRT'	,COUNT(1)	,'PER_USER_ID' 	from	S_AUC_ALRT	where	PER_USER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_AUC_ALRT_DEF'	,COUNT(1)	,'PER_USER_ID' 	from	S_AUC_ALRT_DEF	where	PER_USER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_AUC_BID'	,COUNT(1)	,'BID_PER_ID' 	from	S_AUC_BID	where	BID_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_AUC_RATING'	,COUNT(1)	,'RATED_BY_PER_ID' 	from	S_AUC_RATING	where	RATED_BY_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_AUC_RATING'	,COUNT(1)	,'RATED_PER_ID' 	from	S_AUC_RATING	where	RATED_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_AUC_WATCH'	,COUNT(1)	,'PER_USER_ID' 	from	S_AUC_WATCH	where	PER_USER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_BNFT_PLAN_ITM'	,COUNT(1)	,'BNFT_RECIPIENT_ID' 	from	S_BNFT_PLAN_ITM	where	BNFT_RECIPIENT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_BP_CON_LS'	,COUNT(1)	,'KEY_CON_ID' 	from	S_BP_CON_LS	where	KEY_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CASE_LD_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_CASE_LD_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CASE_PER'	,COUNT(1)	,'PER_ID' 	from	S_CASE_PER	where	PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CERT_ATTR_PER'	,COUNT(1)	,'PER_ID' 	from	S_CERT_ATTR_PER	where	PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CIF_CON_MAP'	,COUNT(1)	,'CON_ID' 	from	S_CIF_CON_MAP	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_ALIAS'	,COUNT(1)	,'PER_ID' 	from	S_CONTACT_ALIAS	where	PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_ATT'	,COUNT(1)	,'PAR_ROW_ID' 	from	S_CONTACT_ATT	where	PAR_ROW_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_BU'	,COUNT(1)	,'CONTACT_ID' 	from	S_CONTACT_BU	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_FNXM'	,COUNT(1)	,'PAR_ROW_ID' 	from	S_CONTACT_FNXM	where	PAR_ROW_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_INFO'	,COUNT(1)	,'TARGET_PER_ID' 	from	S_CONTACT_INFO	where	TARGET_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_ISS'	,COUNT(1)	,'CONTACT_ID' 	from	S_CONTACT_ISS	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_KEY'	,COUNT(1)	,'CONTACT_ID' 	from	S_CONTACT_KEY	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_LSXM'	,COUNT(1)	,'PAR_ROW_ID' 	from	S_CONTACT_LSXM	where	PAR_ROW_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_REL'	,COUNT(1)	,'CONTACT_ID' 	from	S_CONTACT_REL	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_REL'	,COUNT(1)	,'REL_CONTACT_ID' 	from	S_CONTACT_REL	where	REL_CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_TNTX'	,COUNT(1)	,'PAR_ROW_ID' 	from	S_CONTACT_TNTX	where	PAR_ROW_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_TNXM'	,COUNT(1)	,'PAR_ROW_ID' 	from	S_CONTACT_TNXM	where	PAR_ROW_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_XM'	,COUNT(1)	,'PAR_ROW_ID' 	from	S_CONTACT_XM	where	PAR_ROW_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_BRD_SPEC'	,COUNT(1)	,'CON_ID' 	from	S_CON_BRD_SPEC	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_CHRCTR'	,COUNT(1)	,'CONTACT_ID' 	from	S_CON_CHRCTR	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_CLASS_RNK'	,COUNT(1)	,'CON_ID' 	from	S_CON_CLASS_RNK	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_DMGRPHC'	,COUNT(1)	,'CONTACT_ID' 	from	S_CON_DMGRPHC	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_EDU'	,COUNT(1)	,'CON_ID' 	from	S_CON_EDU	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_INDUST'	,COUNT(1)	,'CON_ID' 	from	S_CON_INDUST	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_LOCTN'	,COUNT(1)	,'CONTACT_ID' 	from	S_CON_LOCTN	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_PGROUP'	,COUNT(1)	,'CONTACT_ID' 	from	S_CON_PGROUP	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_PHONE'	,COUNT(1)	,'CON_ID' 	from	S_CON_PHONE	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_PRDEXT'	,COUNT(1)	,'PER_ID' 	from	S_CON_PRDEXT	where	PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_PRDINT_M'	,COUNT(1)	,'CON_ID' 	from	S_CON_PRDINT_M	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_PRFTBLTY'	,COUNT(1)	,'CON_ID' 	from	S_CON_PRFTBLTY	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_SKILL'	,COUNT(1)	,'CON_ID' 	from	S_CON_SKILL	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_TERR'	,COUNT(1)	,'CONTACT_ID' 	from	S_CON_TERR	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_WELL_PROG'	,COUNT(1)	,'CONTACT_ID' 	from	S_CON_WELL_PROG	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_XPERIENCE'	,COUNT(1)	,'CON_ID' 	from	S_CON_XPERIENCE	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CRDT_RPT_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_CRDT_RPT_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CURRCLM_PER'	,COUNT(1)	,'PERSON_ID' 	from	S_CURRCLM_PER	where	PERSON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DISEASE_PER'	,COUNT(1)	,'PER_ID' 	from	S_DISEASE_PER	where	PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DRVR_LICENSE'	,COUNT(1)	,'CON_ID' 	from	S_DRVR_LICENSE	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DRVR_RECORD'	,COUNT(1)	,'CON_ID' 	from	S_DRVR_RECORD	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ENTLMNT_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_ENTLMNT_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EVIDENCE_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_EVIDENCE_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EVT_STAFF'	,COUNT(1)	,'PERSON_ID' 	from	S_EVT_STAFF	where	PERSON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EVT_TRVL_PER'	,COUNT(1)	,'PER_ID' 	from	S_EVT_TRVL_PER	where	PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EXP_ITEM_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_EXP_ITEM_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_AAGSVC_CON'	,COUNT(1)	,'CON_ID' 	from	S_FN_AAGSVC_CON	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_ASSET_LIAB'	,COUNT(1)	,'PR_CON_ID' 	from	S_FN_ASSET_LIAB	where	PR_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_ASTLB_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_FN_ASTLB_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_INCEXP_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_FN_INCEXP_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_INCM_EXP'	,COUNT(1)	,'PR_CON_ID' 	from	S_FN_INCM_EXP	where	PR_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_INSCOB_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_FN_INSCOB_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_NEED'	,COUNT(1)	,'PR_CON_ID' 	from	S_FN_NEED	where	PR_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_NEED_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_FN_NEED_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_PER_APPR'	,COUNT(1)	,'PERSON_ID' 	from	S_FN_PER_APPR	where	PERSON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_RCMD_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_FN_RCMD_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FUNC_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_FUNC_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_GROUP_CONTACT'	,COUNT(1)	,'CON_ID' 	from	S_GROUP_CONTACT	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'CX_AGR_PL_ITEM'	,COUNT(1)	,'X_CON_ID' 	from	CX_AGR_PL_ITEM	where	X_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'CX_AGR_PTS_TXN'	,COUNT(1)	,'X_SIGNED_BY_ID' 	from	CX_AGR_PTS_TXN	where	X_SIGNED_BY_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'CX_PTS_TXN'	,COUNT(1)	,'X_CONTACT_ID' 	from	CX_PTS_TXN	where	X_CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'CX_PTS_TXN'	,COUNT(1)	,'X_SIGNED_BY_ID' 	from	CX_PTS_TXN	where	X_SIGNED_BY_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'CX_TERR'	,COUNT(1)	,'X_PR_EMP_ID' 	from	CX_TERR	where	X_PR_EMP_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ACT_SIGN'	,COUNT(1)	,'CONTACT_ID' 	from	S_ACT_SIGN	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ADDR_PER'	,COUNT(1)	,'PER_ID' 	from	S_ADDR_PER	where	PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ALERT_CUT'	,COUNT(1)	,'CONTACT_ID' 	from	S_ALERT_CUT	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ASSESS'	,COUNT(1)	,'CONTACT_ID' 	from	S_ASSESS	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ASSESS_TNTX'	,COUNT(1)	,'ACCEPTED_BY_ID' 	from	S_ASSESS_TNTX	where	ACCEPTED_BY_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ASSESS_TNTX'	,COUNT(1)	,'TURNOVER_TO_ID' 	from	S_ASSESS_TNTX	where	TURNOVER_TO_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ASSET'	,COUNT(1)	,'OWNER_CON_ID' 	from	S_ASSET	where	OWNER_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_AUC_ITEM'	,COUNT(1)	,'LISTED_BY_PER_ID' 	from	S_AUC_ITEM	where	LISTED_BY_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CALL_LST_CON'	,COUNT(1)	,'CON_PER_ID' 	from	S_CALL_LST_CON	where	CON_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CAMP_CON'	,COUNT(1)	,'CON_PER_ID' 	from	S_CAMP_CON	where	CON_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CAMP_CON'	,COUNT(1)	,'REFERRED_BY_CON_ID' 	from	S_CAMP_CON	where	REFERRED_BY_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CASE'	,COUNT(1)	,'APPLICANT_ID' 	from	S_CASE	where	APPLICANT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CF_INSURANCE'	,COUNT(1)	,'AGENCY_CONTACT_ID' 	from	S_CF_INSURANCE	where	AGENCY_CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CL_PTCL_LS'	,COUNT(1)	,'CNTL_LAB_CON_ID' 	from	S_CL_PTCL_LS	where	CNTL_LAB_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CL_PTCL_LS'	,COUNT(1)	,'CRO_CON_ID' 	from	S_CL_PTCL_LS	where	CRO_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CL_ST_ADDR_LS'	,COUNT(1)	,'ST_ADDR_CON_ID' 	from	S_CL_ST_ADDR_LS	where	ST_ADDR_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CM_MSG_STAT'	,COUNT(1)	,'RECIP_PER_ID' 	from	S_CM_MSG_STAT	where	RECIP_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_COMMUNICATION'	,COUNT(1)	,'PR_CON_ID' 	from	S_COMMUNICATION	where	PR_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_COMM_CON'	,COUNT(1)	,'PER_ID' 	from	S_COMM_CON	where	PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_COMM_LOG'	,COUNT(1)	,'CONTACT_ID' 	from	S_COMM_LOG	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT'	,COUNT(1)	,'CON_ASST_PER_ID' 	from	S_CONTACT	where	CON_ASST_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT'	,COUNT(1)	,'CON_INFLUNC_ID' 	from	S_CONTACT	where	CON_INFLUNC_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT'	,COUNT(1)	,'CON_MANAGER_PER_ID' 	from	S_CONTACT	where	CON_MANAGER_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_LOYX'	,COUNT(1)	,'EMGC_PER_ID' 	from	S_CONTACT_LOYX	where	EMGC_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_TNTX'	,COUNT(1)	,'REFERRED_BY_ID' 	from	S_CONTACT_TNTX	where	REFERRED_BY_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_ADDR'	,COUNT(1)	,'CONTACT_ID' 	from	S_CON_ADDR	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_MKT_SEG'	,COUNT(1)	,'CONTACT_ID' 	from	S_CON_MKT_SEG	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_PAYEE'	,COUNT(1)	,'CON_ID' 	from	S_CON_PAYEE	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_XPERIENCE'	,COUNT(1)	,'EMP_CONTACT_NAME' 	from	S_CON_XPERIENCE	where	EMP_CONTACT_NAME	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CRSE_TSTRUN'	,COUNT(1)	,'PERSON_ID' 	from	S_CRSE_TSTRUN	where	PERSON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CS_RUN'	,COUNT(1)	,'CON_ID' 	from	S_CS_RUN	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CUST_SURVEY'	,COUNT(1)	,'CON_ID' 	from	S_CUST_SURVEY	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DD_USER_KEY'	,COUNT(1)	,'CON_ID' 	from	S_DD_USER_KEY	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_AGREE'	,COUNT(1)	,'BILL_TO_CON_ID' 	from	S_DOC_AGREE	where	BILL_TO_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_AGREE'	,COUNT(1)	,'CON_PER_ID' 	from	S_DOC_AGREE	where	CON_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_AGREE'	,COUNT(1)	,'LEGAL_CON_ID' 	from	S_DOC_AGREE	where	LEGAL_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_AGREE'	,COUNT(1)	,'SHIP_TO_CON_ID' 	from	S_DOC_AGREE	where	SHIP_TO_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_AGREE'	,COUNT(1)	,'X_SIGNED_BY_ID' 	from	S_DOC_AGREE	where	X_SIGNED_BY_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_CORR'	,COUNT(1)	,'CON_PER_ID' 	from	S_DOC_CORR	where	CON_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_PPSL'	,COUNT(1)	,'CONTACT_RECIP_ID' 	from	S_DOC_PPSL	where	CONTACT_RECIP_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_QUOTE'	,COUNT(1)	,'ADDR_1_CON_ID' 	from	S_DOC_QUOTE	where	ADDR_1_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_QUOTE'	,COUNT(1)	,'ADDR_2_CON_ID' 	from	S_DOC_QUOTE	where	ADDR_2_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_QUOTE'	,COUNT(1)	,'ADDR_3_CON_ID' 	from	S_DOC_QUOTE	where	ADDR_3_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_QUOTE'	,COUNT(1)	,'ADDR_4_CON_ID' 	from	S_DOC_QUOTE	where	ADDR_4_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_QUOTE'	,COUNT(1)	,'BL_CON_ID' 	from	S_DOC_QUOTE	where	BL_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_QUOTE'	,COUNT(1)	,'CON_PER_ID' 	from	S_DOC_QUOTE	where	CON_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_QUOTE'	,COUNT(1)	,'SHIP_CON_ID' 	from	S_DOC_QUOTE	where	SHIP_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ESCL_ACTION'	,COUNT(1)	,'CONTACT_ID' 	from	S_ESCL_ACTION	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EVTLOC'	,COUNT(1)	,'LOC_CONTACT_ID' 	from	S_EVTLOC	where	LOC_CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EVT_ACT_LSX'	,COUNT(1)	,'SUPERVISOR_ID' 	from	S_EVT_ACT_LSX	where	SUPERVISOR_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EVT_ACT_X'	,COUNT(1)	,'X_LOGIN_CONTACT_ID' 	from	S_EVT_ACT_X	where	X_LOGIN_CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EVT_ACT_X'	,COUNT(1)	,'X_SIGNED_BY_ID' 	from	S_EVT_ACT_X	where	X_SIGNED_BY_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EVT_FUL_REQ'	,COUNT(1)	,'TARGET_PER_ID' 	from	S_EVT_FUL_REQ	where	TARGET_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EVT_VENUE_RVW'	,COUNT(1)	,'REVIEWER_ID' 	from	S_EVT_VENUE_RVW	where	REVIEWER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EVT_VNDR_RVW'	,COUNT(1)	,'REVIEWER_ID' 	from	S_EVT_VNDR_RVW	where	REVIEWER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EXP_RPT'	,COUNT(1)	,'CONTACT_ID' 	from	S_EXP_RPT	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FCST_ITEM'	,COUNT(1)	,'CONTACT_ID' 	from	S_FCST_ITEM	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FINAN_PROF'	,COUNT(1)	,'PER_ID' 	from	S_FINAN_PROF	where	PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FNCVRG_ELMNTS'	,COUNT(1)	,'APPLD_CVRG_ID' 	from	S_FNCVRG_ELMNTS	where	APPLD_CVRG_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FNCVRG_ELMNTS'	,COUNT(1)	,'PCP_ID' 	from	S_FNCVRG_ELMNTS	where	PCP_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_ACCNT1_FNX'	,COUNT(1)	,'CC_AFF_RWD_CON_ID' 	from	S_FN_ACCNT1_FNX	where	CC_AFF_RWD_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_BILL'	,COUNT(1)	,'CON_ID' 	from	S_FN_BILL	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_CVRG_ROLE'	,COUNT(1)	,'CONTACT_ID' 	from	S_FN_CVRG_ROLE	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_HLTH_ENCTR'	,COUNT(1)	,'MEMBER_ID' 	from	S_FN_HLTH_ENCTR	where	MEMBER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_HLTH_ENCTR'	,COUNT(1)	,'PROVIDER_ID' 	from	S_FN_HLTH_ENCTR	where	PROVIDER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_OFFR_COLT'	,COUNT(1)	,'CON_ID' 	from	S_FN_OFFR_COLT	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_RCMD'	,COUNT(1)	,'PR_CON_ID' 	from	S_FN_RCMD	where	PR_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_STMT_ADDR'	,COUNT(1)	,'CON_ID' 	from	S_FN_STMT_ADDR	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FUL_RECIP'	,COUNT(1)	,'RECIP_PER_ID' 	from	S_FUL_RECIP	where	RECIP_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_HLTH_CARE_SR'	,COUNT(1)	,'PROVIDER_ID' 	from	S_HLTH_CARE_SR	where	PROVIDER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_HLTH_RISK'	,COUNT(1)	,'CONTACT_ID' 	from	S_HLTH_RISK	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_INCIDENT'	,COUNT(1)	,'SOURCE_CON_ID' 	from	S_INCIDENT	where	SOURCE_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED) UNION
SELECT 'S_PARTY_PER' ,COUNT(1) ,'PERSON_ID' FROM S_PARTY_PER WHERE PERSON_ID IN ( SELECT ROW_ID FROM StagingDB.dbo.CN_TO_BE_DELETED) UNION
SELECT 'S_CONTACT_X' ,COUNT(1) ,'ROW_ID' FROM S_CONTACT WHERE ROW_ID IN ( SELECT ROW_ID FROM StagingDB.dbo.CN_TO_BE_DELETED) UNION
SELECT 'S_POSTN_CON' ,COUNT(1) ,'CON_ID' FROM S_CONTACT WHERE ROW_ID IN ( SELECT ROW_ID FROM StagingDB.dbo.CN_TO_BE_DELETED)
)v where REC_COUNT > 0 

--Populate staging table with tables impacted and rows.
SELECT * into StagingDB.dbo.CN_IMPACTED_TAB_TO_BACKUP FROM (
SELECT 'S_CONTACT' AS TAB , COUNT(1) as REC_COUNT , 'ROW_ID' as COL FROM S_CONTACT WHERE ROW_ID IN (SELECT ROW_ID  FROM StagingDB.dbo.CN_TO_BE_DELETED) UNION
SELECT 'S_PARTY' ,COUNT(1), 'ROW_ID'  FROM  S_PARTY P  INNER JOIN S_CONTACT C ON C.PAR_ROW_ID=P.ROW_ID where C.ROW_ID IN (SELECT ROW_ID  FROM StagingDB.dbo.CN_TO_BE_DELETED) UNION
SELECT	'S_ADDR_PER'	,COUNT(1)	,'PER_ID' 	FROM	S_ADDR_PER	WHERE	PER_ID	IN	(SELECT	ROW_ID	FROM	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
SELECT	'S_CONTACT_BU'	,COUNT(1)	,'CONTACT_ID' 	FROM	S_CONTACT_BU	WHERE	CONTACT_ID	IN	(SELECT	ROW_ID	FROM	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
SELECT	'S_CONTACT_INFO'	,COUNT(1)	,'TARGET_PER_ID' 	FROM	S_CONTACT_INFO	WHERE	TARGET_PER_ID	IN	(SELECT	ROW_ID	FROM	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ACT_CONTACT'	,COUNT(1)	,'CON_ID' 	from	S_ACT_CONTACT	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_AGENT_DETAIL'	,COUNT(1)	,'AGENT_ID' 	from	S_AGENT_DETAIL	where	AGENT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ALGN_POS_CON'	,COUNT(1)	,'CON_ID' 	from	S_ALGN_POS_CON	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_APPL_CON'	,COUNT(1)	,'CON_ID' 	from	S_APPL_CON	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ARREST'	,COUNT(1)	,'ARRESTEE_ID' 	from	S_ARREST	where	ARRESTEE_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ARREST_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_ARREST_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ASSET_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_ASSET_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_AUC_ALRT'	,COUNT(1)	,'PER_USER_ID' 	from	S_AUC_ALRT	where	PER_USER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_AUC_ALRT_DEF'	,COUNT(1)	,'PER_USER_ID' 	from	S_AUC_ALRT_DEF	where	PER_USER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_AUC_BID'	,COUNT(1)	,'BID_PER_ID' 	from	S_AUC_BID	where	BID_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_AUC_RATING'	,COUNT(1)	,'RATED_BY_PER_ID' 	from	S_AUC_RATING	where	RATED_BY_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_AUC_RATING'	,COUNT(1)	,'RATED_PER_ID' 	from	S_AUC_RATING	where	RATED_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_AUC_WATCH'	,COUNT(1)	,'PER_USER_ID' 	from	S_AUC_WATCH	where	PER_USER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_BNFT_PLAN_ITM'	,COUNT(1)	,'BNFT_RECIPIENT_ID' 	from	S_BNFT_PLAN_ITM	where	BNFT_RECIPIENT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_BP_CON_LS'	,COUNT(1)	,'KEY_CON_ID' 	from	S_BP_CON_LS	where	KEY_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CASE_LD_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_CASE_LD_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CASE_PER'	,COUNT(1)	,'PER_ID' 	from	S_CASE_PER	where	PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CERT_ATTR_PER'	,COUNT(1)	,'PER_ID' 	from	S_CERT_ATTR_PER	where	PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CIF_CON_MAP'	,COUNT(1)	,'CON_ID' 	from	S_CIF_CON_MAP	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_ALIAS'	,COUNT(1)	,'PER_ID' 	from	S_CONTACT_ALIAS	where	PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_ATT'	,COUNT(1)	,'PAR_ROW_ID' 	from	S_CONTACT_ATT	where	PAR_ROW_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_BU'	,COUNT(1)	,'CONTACT_ID' 	from	S_CONTACT_BU	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_FNXM'	,COUNT(1)	,'PAR_ROW_ID' 	from	S_CONTACT_FNXM	where	PAR_ROW_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_INFO'	,COUNT(1)	,'TARGET_PER_ID' 	from	S_CONTACT_INFO	where	TARGET_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_ISS'	,COUNT(1)	,'CONTACT_ID' 	from	S_CONTACT_ISS	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_KEY'	,COUNT(1)	,'CONTACT_ID' 	from	S_CONTACT_KEY	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_LSXM'	,COUNT(1)	,'PAR_ROW_ID' 	from	S_CONTACT_LSXM	where	PAR_ROW_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_REL'	,COUNT(1)	,'CONTACT_ID' 	from	S_CONTACT_REL	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_REL'	,COUNT(1)	,'REL_CONTACT_ID' 	from	S_CONTACT_REL	where	REL_CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_TNTX'	,COUNT(1)	,'PAR_ROW_ID' 	from	S_CONTACT_TNTX	where	PAR_ROW_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_TNXM'	,COUNT(1)	,'PAR_ROW_ID' 	from	S_CONTACT_TNXM	where	PAR_ROW_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_XM'	,COUNT(1)	,'PAR_ROW_ID' 	from	S_CONTACT_XM	where	PAR_ROW_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_BRD_SPEC'	,COUNT(1)	,'CON_ID' 	from	S_CON_BRD_SPEC	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_CHRCTR'	,COUNT(1)	,'CONTACT_ID' 	from	S_CON_CHRCTR	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_CLASS_RNK'	,COUNT(1)	,'CON_ID' 	from	S_CON_CLASS_RNK	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_DMGRPHC'	,COUNT(1)	,'CONTACT_ID' 	from	S_CON_DMGRPHC	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_EDU'	,COUNT(1)	,'CON_ID' 	from	S_CON_EDU	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_INDUST'	,COUNT(1)	,'CON_ID' 	from	S_CON_INDUST	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_LOCTN'	,COUNT(1)	,'CONTACT_ID' 	from	S_CON_LOCTN	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_PGROUP'	,COUNT(1)	,'CONTACT_ID' 	from	S_CON_PGROUP	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_PHONE'	,COUNT(1)	,'CON_ID' 	from	S_CON_PHONE	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_PRDEXT'	,COUNT(1)	,'PER_ID' 	from	S_CON_PRDEXT	where	PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_PRDINT_M'	,COUNT(1)	,'CON_ID' 	from	S_CON_PRDINT_M	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_PRFTBLTY'	,COUNT(1)	,'CON_ID' 	from	S_CON_PRFTBLTY	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_SKILL'	,COUNT(1)	,'CON_ID' 	from	S_CON_SKILL	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_TERR'	,COUNT(1)	,'CONTACT_ID' 	from	S_CON_TERR	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_WELL_PROG'	,COUNT(1)	,'CONTACT_ID' 	from	S_CON_WELL_PROG	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_XPERIENCE'	,COUNT(1)	,'CON_ID' 	from	S_CON_XPERIENCE	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CRDT_RPT_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_CRDT_RPT_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CURRCLM_PER'	,COUNT(1)	,'PERSON_ID' 	from	S_CURRCLM_PER	where	PERSON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DISEASE_PER'	,COUNT(1)	,'PER_ID' 	from	S_DISEASE_PER	where	PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DRVR_LICENSE'	,COUNT(1)	,'CON_ID' 	from	S_DRVR_LICENSE	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DRVR_RECORD'	,COUNT(1)	,'CON_ID' 	from	S_DRVR_RECORD	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ENTLMNT_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_ENTLMNT_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EVIDENCE_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_EVIDENCE_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EVT_STAFF'	,COUNT(1)	,'PERSON_ID' 	from	S_EVT_STAFF	where	PERSON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EVT_TRVL_PER'	,COUNT(1)	,'PER_ID' 	from	S_EVT_TRVL_PER	where	PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EXP_ITEM_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_EXP_ITEM_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_AAGSVC_CON'	,COUNT(1)	,'CON_ID' 	from	S_FN_AAGSVC_CON	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_ASSET_LIAB'	,COUNT(1)	,'PR_CON_ID' 	from	S_FN_ASSET_LIAB	where	PR_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_ASTLB_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_FN_ASTLB_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_INCEXP_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_FN_INCEXP_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_INCM_EXP'	,COUNT(1)	,'PR_CON_ID' 	from	S_FN_INCM_EXP	where	PR_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_INSCOB_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_FN_INSCOB_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_NEED'	,COUNT(1)	,'PR_CON_ID' 	from	S_FN_NEED	where	PR_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_NEED_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_FN_NEED_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_PER_APPR'	,COUNT(1)	,'PERSON_ID' 	from	S_FN_PER_APPR	where	PERSON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_RCMD_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_FN_RCMD_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FUNC_CON'	,COUNT(1)	,'CONTACT_ID' 	from	S_FUNC_CON	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_GROUP_CONTACT'	,COUNT(1)	,'CON_ID' 	from	S_GROUP_CONTACT	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'CX_AGR_PL_ITEM'	,COUNT(1)	,'X_CON_ID' 	from	CX_AGR_PL_ITEM	where	X_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'CX_AGR_PTS_TXN'	,COUNT(1)	,'X_SIGNED_BY_ID' 	from	CX_AGR_PTS_TXN	where	X_SIGNED_BY_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'CX_PTS_TXN'	,COUNT(1)	,'X_CONTACT_ID' 	from	CX_PTS_TXN	where	X_CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'CX_PTS_TXN'	,COUNT(1)	,'X_SIGNED_BY_ID' 	from	CX_PTS_TXN	where	X_SIGNED_BY_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'CX_TERR'	,COUNT(1)	,'X_PR_EMP_ID' 	from	CX_TERR	where	X_PR_EMP_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ACT_SIGN'	,COUNT(1)	,'CONTACT_ID' 	from	S_ACT_SIGN	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ADDR_PER'	,COUNT(1)	,'PER_ID' 	from	S_ADDR_PER	where	PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ALERT_CUT'	,COUNT(1)	,'CONTACT_ID' 	from	S_ALERT_CUT	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ASSESS'	,COUNT(1)	,'CONTACT_ID' 	from	S_ASSESS	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ASSESS_TNTX'	,COUNT(1)	,'ACCEPTED_BY_ID' 	from	S_ASSESS_TNTX	where	ACCEPTED_BY_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ASSESS_TNTX'	,COUNT(1)	,'TURNOVER_TO_ID' 	from	S_ASSESS_TNTX	where	TURNOVER_TO_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ASSET'	,COUNT(1)	,'OWNER_CON_ID' 	from	S_ASSET	where	OWNER_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_AUC_ITEM'	,COUNT(1)	,'LISTED_BY_PER_ID' 	from	S_AUC_ITEM	where	LISTED_BY_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CALL_LST_CON'	,COUNT(1)	,'CON_PER_ID' 	from	S_CALL_LST_CON	where	CON_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CAMP_CON'	,COUNT(1)	,'CON_PER_ID' 	from	S_CAMP_CON	where	CON_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CAMP_CON'	,COUNT(1)	,'REFERRED_BY_CON_ID' 	from	S_CAMP_CON	where	REFERRED_BY_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CASE'	,COUNT(1)	,'APPLICANT_ID' 	from	S_CASE	where	APPLICANT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CF_INSURANCE'	,COUNT(1)	,'AGENCY_CONTACT_ID' 	from	S_CF_INSURANCE	where	AGENCY_CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CL_PTCL_LS'	,COUNT(1)	,'CNTL_LAB_CON_ID' 	from	S_CL_PTCL_LS	where	CNTL_LAB_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CL_PTCL_LS'	,COUNT(1)	,'CRO_CON_ID' 	from	S_CL_PTCL_LS	where	CRO_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CL_ST_ADDR_LS'	,COUNT(1)	,'ST_ADDR_CON_ID' 	from	S_CL_ST_ADDR_LS	where	ST_ADDR_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CM_MSG_STAT'	,COUNT(1)	,'RECIP_PER_ID' 	from	S_CM_MSG_STAT	where	RECIP_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_COMMUNICATION'	,COUNT(1)	,'PR_CON_ID' 	from	S_COMMUNICATION	where	PR_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_COMM_CON'	,COUNT(1)	,'PER_ID' 	from	S_COMM_CON	where	PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_COMM_LOG'	,COUNT(1)	,'CONTACT_ID' 	from	S_COMM_LOG	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT'	,COUNT(1)	,'CON_ASST_PER_ID' 	from	S_CONTACT	where	CON_ASST_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT'	,COUNT(1)	,'CON_INFLUNC_ID' 	from	S_CONTACT	where	CON_INFLUNC_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT'	,COUNT(1)	,'CON_MANAGER_PER_ID' 	from	S_CONTACT	where	CON_MANAGER_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_LOYX'	,COUNT(1)	,'EMGC_PER_ID' 	from	S_CONTACT_LOYX	where	EMGC_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CONTACT_TNTX'	,COUNT(1)	,'REFERRED_BY_ID' 	from	S_CONTACT_TNTX	where	REFERRED_BY_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_ADDR'	,COUNT(1)	,'CONTACT_ID' 	from	S_CON_ADDR	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_MKT_SEG'	,COUNT(1)	,'CONTACT_ID' 	from	S_CON_MKT_SEG	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_PAYEE'	,COUNT(1)	,'CON_ID' 	from	S_CON_PAYEE	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CON_XPERIENCE'	,COUNT(1)	,'EMP_CONTACT_NAME' 	from	S_CON_XPERIENCE	where	EMP_CONTACT_NAME	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CRSE_TSTRUN'	,COUNT(1)	,'PERSON_ID' 	from	S_CRSE_TSTRUN	where	PERSON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CS_RUN'	,COUNT(1)	,'CON_ID' 	from	S_CS_RUN	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_CUST_SURVEY'	,COUNT(1)	,'CON_ID' 	from	S_CUST_SURVEY	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DD_USER_KEY'	,COUNT(1)	,'CON_ID' 	from	S_DD_USER_KEY	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_AGREE'	,COUNT(1)	,'BILL_TO_CON_ID' 	from	S_DOC_AGREE	where	BILL_TO_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_AGREE'	,COUNT(1)	,'CON_PER_ID' 	from	S_DOC_AGREE	where	CON_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_AGREE'	,COUNT(1)	,'LEGAL_CON_ID' 	from	S_DOC_AGREE	where	LEGAL_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_AGREE'	,COUNT(1)	,'SHIP_TO_CON_ID' 	from	S_DOC_AGREE	where	SHIP_TO_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_AGREE'	,COUNT(1)	,'X_SIGNED_BY_ID' 	from	S_DOC_AGREE	where	X_SIGNED_BY_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_CORR'	,COUNT(1)	,'CON_PER_ID' 	from	S_DOC_CORR	where	CON_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_PPSL'	,COUNT(1)	,'CONTACT_RECIP_ID' 	from	S_DOC_PPSL	where	CONTACT_RECIP_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_QUOTE'	,COUNT(1)	,'ADDR_1_CON_ID' 	from	S_DOC_QUOTE	where	ADDR_1_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_QUOTE'	,COUNT(1)	,'ADDR_2_CON_ID' 	from	S_DOC_QUOTE	where	ADDR_2_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_QUOTE'	,COUNT(1)	,'ADDR_3_CON_ID' 	from	S_DOC_QUOTE	where	ADDR_3_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_QUOTE'	,COUNT(1)	,'ADDR_4_CON_ID' 	from	S_DOC_QUOTE	where	ADDR_4_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_QUOTE'	,COUNT(1)	,'BL_CON_ID' 	from	S_DOC_QUOTE	where	BL_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_QUOTE'	,COUNT(1)	,'CON_PER_ID' 	from	S_DOC_QUOTE	where	CON_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_DOC_QUOTE'	,COUNT(1)	,'SHIP_CON_ID' 	from	S_DOC_QUOTE	where	SHIP_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_ESCL_ACTION'	,COUNT(1)	,'CONTACT_ID' 	from	S_ESCL_ACTION	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EVTLOC'	,COUNT(1)	,'LOC_CONTACT_ID' 	from	S_EVTLOC	where	LOC_CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EVT_ACT_LSX'	,COUNT(1)	,'SUPERVISOR_ID' 	from	S_EVT_ACT_LSX	where	SUPERVISOR_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EVT_ACT_X'	,COUNT(1)	,'X_LOGIN_CONTACT_ID' 	from	S_EVT_ACT_X	where	X_LOGIN_CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EVT_ACT_X'	,COUNT(1)	,'X_SIGNED_BY_ID' 	from	S_EVT_ACT_X	where	X_SIGNED_BY_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EVT_FUL_REQ'	,COUNT(1)	,'TARGET_PER_ID' 	from	S_EVT_FUL_REQ	where	TARGET_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EVT_VENUE_RVW'	,COUNT(1)	,'REVIEWER_ID' 	from	S_EVT_VENUE_RVW	where	REVIEWER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EVT_VNDR_RVW'	,COUNT(1)	,'REVIEWER_ID' 	from	S_EVT_VNDR_RVW	where	REVIEWER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_EXP_RPT'	,COUNT(1)	,'CONTACT_ID' 	from	S_EXP_RPT	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FCST_ITEM'	,COUNT(1)	,'CONTACT_ID' 	from	S_FCST_ITEM	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FINAN_PROF'	,COUNT(1)	,'PER_ID' 	from	S_FINAN_PROF	where	PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FNCVRG_ELMNTS'	,COUNT(1)	,'APPLD_CVRG_ID' 	from	S_FNCVRG_ELMNTS	where	APPLD_CVRG_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FNCVRG_ELMNTS'	,COUNT(1)	,'PCP_ID' 	from	S_FNCVRG_ELMNTS	where	PCP_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_ACCNT1_FNX'	,COUNT(1)	,'CC_AFF_RWD_CON_ID' 	from	S_FN_ACCNT1_FNX	where	CC_AFF_RWD_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_BILL'	,COUNT(1)	,'CON_ID' 	from	S_FN_BILL	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_CVRG_ROLE'	,COUNT(1)	,'CONTACT_ID' 	from	S_FN_CVRG_ROLE	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_HLTH_ENCTR'	,COUNT(1)	,'MEMBER_ID' 	from	S_FN_HLTH_ENCTR	where	MEMBER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_HLTH_ENCTR'	,COUNT(1)	,'PROVIDER_ID' 	from	S_FN_HLTH_ENCTR	where	PROVIDER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_OFFR_COLT'	,COUNT(1)	,'CON_ID' 	from	S_FN_OFFR_COLT	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_RCMD'	,COUNT(1)	,'PR_CON_ID' 	from	S_FN_RCMD	where	PR_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FN_STMT_ADDR'	,COUNT(1)	,'CON_ID' 	from	S_FN_STMT_ADDR	where	CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_FUL_RECIP'	,COUNT(1)	,'RECIP_PER_ID' 	from	S_FUL_RECIP	where	RECIP_PER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_HLTH_CARE_SR'	,COUNT(1)	,'PROVIDER_ID' 	from	S_HLTH_CARE_SR	where	PROVIDER_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_HLTH_RISK'	,COUNT(1)	,'CONTACT_ID' 	from	S_HLTH_RISK	where	CONTACT_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
select	'S_INCIDENT'	,COUNT(1)	,'SOURCE_CON_ID' 	from	S_INCIDENT	where	SOURCE_CON_ID	in	(select	ROW_ID	from	StagingDB.dbo.CN_TO_BE_DELETED)	UNION
SELECT 'S_PARTY_PER' ,COUNT(1) ,'PERSON_ID' FROM S_PARTY_PER WHERE PERSON_ID IN ( SELECT ROW_ID FROM StagingDB.dbo.CN_TO_BE_DELETED) UNION
SELECT 'S_CONTACT_X' ,COUNT(1) ,'ROW_ID' FROM S_CONTACT WHERE ROW_ID IN ( SELECT ROW_ID FROM StagingDB.dbo.CN_TO_BE_DELETED) UNION
SELECT 'S_POSTN_CON' ,COUNT(1) ,'CON_ID' FROM S_CONTACT WHERE ROW_ID IN ( SELECT ROW_ID FROM StagingDB.dbo.CN_TO_BE_DELETED)
)v where REC_COUNT > 0 

--Check impacted tables with impacted number of records
SELECT * FROM StagingDB.dbo.CN_IMPACTED_TAB_TO_BACKUP

--Generate back up script.Replace with correct incident number and date.INCXXXXX_YYYYMMDD  .E.g INC0012010_20171002
SELECT 'SELECT * INTO StagingDB.dbo.'+TAB+'_INCXXXXX_YYYYMMDD  FROM ' + TAB+ ' WHERE '+COL +' IN(SELECT ROW_ID FROM StagingDB.dbo.CN_TO_BE_DELETED)'
FROM StagingDB.dbo.CN_IMPACTED_TAB_TO_BACKUP

--E.g
SELECT * INTO StagingDB.dbo.CX_TERR_INCXXXXX_YYYYMMDD  FROM CX_TERR WHERE X_PR_EMP_ID IN(SELECT ROW_ID FROM StagingDB.dbo.CN_TO_BE_DELETED)
SELECT * INTO StagingDB.dbo.S_CONTACT_INCXXXXX_YYYYMMDD  FROM S_CONTACT WHERE ROW_ID IN(SELECT ROW_ID FROM StagingDB.dbo.CN_TO_BE_DELETED)
SELECT * INTO StagingDB.dbo.S_CONTACT_BU_INCXXXXX_YYYYMMDD  FROM S_CONTACT_BU WHERE CONTACT_ID IN(SELECT ROW_ID FROM StagingDB.dbo.CN_TO_BE_DELETED)
SELECT * INTO StagingDB.dbo.S_PARTY_INCXXXXX_YYYYMMDD  FROM S_PARTY WHERE ROW_ID IN(SELECT ROW_ID FROM StagingDB.dbo.CN_TO_BE_DELETED)

 --Valid backup was correctly done. Replace with correct incident number and date.INCXXXXX_YYYYYMMDD 
 SELECT 'SELECT ''' + name+''' ,COUNT(1) FROM StagingDB.dbo.'+name FROM StagingDB.sys.objects WHERE name like '%_INCXXXXX_YYYYMMDD%'

SELECT 'CX_TERR_INCXXXXX_YYYYMMDD' ,COUNT(1) FROM StagingDB.dbo.CX_TERR_INCXXXXX_YYYYMMDD
SELECT 'S_CONTACT_BU_INCXXXXX_YYYYMMDD' ,COUNT(1) FROM StagingDB.dbo.S_CONTACT_BU_INCXXXXX_YYYYMMDD
SELECT 'S_CONTACT_INCXXXXX_YYYYMMDD' ,COUNT(1) FROM StagingDB.dbo.S_CONTACT_INCXXXXX_YYYYMMDD
SELECT 'S_PARTY_INCXXXXX_YYYYMMDD' ,COUNT(1) FROM StagingDB.dbo.S_PARTY_INCXXXXX_YYYYMMDD
