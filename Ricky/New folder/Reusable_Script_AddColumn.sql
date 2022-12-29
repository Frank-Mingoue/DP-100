-------------------WC_RTLAUDIT_F-------------------------------------
BEGIN
       DECLARE @COUNTRY_TABLE  NVARCHAR (50),
			   @BU_ID  NVARCHAR (15),
               @SQL1 NVARCHAR(MAX)
                     
                     
BEGIN
DECLARE COUNTRY_CURSOR CURSOR FOR 
       
       SELECT 'WC_RTLAUDIT_F_'+RIGHT(COUNTRY_CODE, 2 ), INTEGRATION_ID FROM  WC_BU_D 
        WHERE ACTIVE_FLG='Y'                                                   
              END 
			      
              --Open the Country cursor
              OPEN COUNTRY_CURSOR

              FETCH NEXT FROM COUNTRY_CURSOR 
              INTO @COUNTRY_TABLE, @BU_ID
              
              WHILE @@FETCH_STATUS = 0
              BEGIN 
                         
SET @SQL1 ='IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = '''+@COUNTRY_TABLE+''' AND COLUMN_NAME = ''PROD_IMPORTANCE'')
BEGIN
   ALTER TABLE '+@COUNTRY_TABLE+' ADD  PROD_IMPORTANCE NVARCHAR(30)
END
GO'

PRINT @SQL1

FETCH NEXT FROM COUNTRY_CURSOR INTO @COUNTRY_TABLE,@BU_ID
      END
       
              CLOSE COUNTRY_CURSOR
              DEALLOCATE COUNTRY_CURSOR
END
GO
