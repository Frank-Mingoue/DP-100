--------MERGE_WC_RTLAUDIT_F_SK_P1 CLUSTERED INDEX-----------------------------------------

IF EXISTS (SELECT * FROM sys.indexes  WHERE name = N'MERGE_WC_RTLAUDIT_F_SK_P1')
DROP INDEX [MERGE_WC_RTLAUDIT_F_SK_P1] ON [dbo].[MERGE_WC_RTLAUDIT_F_SK] WITH ( ONLINE = OFF )
GO
CREATE UNIQUE CLUSTERED INDEX [MERGE_WC_RTLAUDIT_F_SK_P1] ON [dbo].[MERGE_WC_RTLAUDIT_F_SK]
(
	[RECORD_DATE_WID] ASC,
	[ROW_WID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 95)
GO 




