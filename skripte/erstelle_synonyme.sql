set feedback off
set head off

spool C:\tmp\erstelle_trigger_skripte.sql

SELECT
      'set feedback off' || chr(10)
  ||  'set head off' || chr(10)
  FROM DUAL;

SELECT 
      'spool C:\tmp\TRG_' || Synonym_Name || '.sql' || chr(10)
  ||  'SELECT ''CREATE OR REPLACE SYNONYM ' || Synonym_Name || ';'' FROM DUAL;' || chr(10)
  ||  'spool off;' || chr(10)
  ||  '/' || chr(10)
  FROM (SELECT Table_Name
             , Constraint_Name
             , Cons.Constraint_Type
             , Cols.Column_Name
             , CASE
                 WHEN INSTR (Cols.Column_Name, '_') > 0 THEN
                   SUBSTR (Cols.Column_Name, 1, INSTR (Cols.Column_Name, '_') - 1)
                 ELSE
                   SUBSTR (Cols.Column_Name, 1, 4)
               END
                 Synonym_Name
          FROM User_Tables Tabs
               JOIN User_Constraints Cons USING (Table_Name)
               JOIN User_Cons_Columns Cols USING (Constraint_Name, Table_Name)
         WHERE Cons.Constraint_Type = 'P' and table_name in ('EMPFAENGER', 'ERGEBNIS_P010'));
         
spool off;

--@erstelle_trigger_skripte.sql
/         

