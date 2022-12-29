SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_INSERT_WC_DUMMY]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_INSERT_WC_DUMMY]
GO


CREATE PROCEDURE [dbo].[sp_INSERT_WC_DUMMY]
AS
/*******************************************************************************
Name: sp_INSERT_WC_DUMMY 
Execution: Periodically through ETL process

Description:  Insert the values into the WC_DUMMY table if necessary

Versions Change History: 1.0
Release Date: 14/03/2022
Development Team: Data
Author: Frank

*******************************************************************************/

DECLARE 
@temp as NUMERIC(15,0),
@maxrowwid as NUMERIC(15,0)

BEGIN

with test as (select 'a' as 'a',MAX(ROW_WID) as 'max'
from WC_DUMMY
)
, test2 as (select 'a' as 'a',MAX(ROW_WID) as 'max'
from WC_ORG_D
)
select @temp = test.max-test2.max
from test inner join test2 on test.a = test2.a
where test.max-test2.max < 1000000

--print @temp
  
select @maxrowwid = MAX(ROW_WID)+1
from WC_DUMMY

-- temp table
IF OBJECT_ID('StagingDB.dbo.Digits', 'U') IS NOT NULL DROP TABLE StagingDB.dbo.Digits; 
CREATE TABLE StagingDB.dbo.Digits(digit INT NOT NULL PRIMARY KEY); 
INSERT INTO StagingDB.dbo.Digits
  VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9); 
  
-- 1M records (repeat the script for 1M more)
INSERT INTO WC_DUMMY
SELECT D6.digit * 100000 + D5.digit * 10000 + D4.digit * 1000 + D3.digit * 100 + D2.digit * 10 + D1.digit + @maxrowwid,
D6.digit * 100000 + D5.digit * 10000 + D4.digit * 1000 + D3.digit * 100 + D2.digit * 10 + D1.digit + @maxrowwid
FROM         StagingDB.dbo.Digits AS D1 
  CROSS JOIN StagingDB.dbo.Digits AS D2 
  CROSS JOIN StagingDB.dbo.Digits AS D3 
  CROSS JOIN StagingDB.dbo.Digits AS D4 
  CROSS JOIN StagingDB.dbo.Digits AS D5 
  CROSS JOIN StagingDB.dbo.Digits AS D6
where @temp < 1000000

END
GO