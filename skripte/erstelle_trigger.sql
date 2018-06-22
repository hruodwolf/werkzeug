set feedback off
set head off
set linesize 200

spool C:\tmp\erstelle_trigger_skripte.sql


SELECT
      'set feedback off' || chr(10)
  ||  'set head off' || chr(10)
  ||  'set linesize 200' || chr(10)
  FROM DUAL;

SELECT 
      'spool C:\tmp\trg_' || Synonym_Name || '_bri.sql' || chr(10)
  ||  'SELECT ' || chr(10)
  ||  '   rpad(chr(32),0) ||  ''CREATE OR REPLACE TRIGGER TRG_' || Synonym_Name || '_BRI''' || '|| chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  ''BEFORE INSERT'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  ''ON ' || Table_Name || ''' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  ''FOR EACH ROW'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),0) ||  ''BEGIN'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  ''IF :NEW.' || Column_Name || ' IS NULL'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  ''THEN'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),4) ||  '':NEW.' || Column_Name || ' := ' || Synonym_Name || '_SEQ.NEXTVAL;'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  ''END IF;'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),0) ||    chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  '':NEW.INS_USER := NVL (:NEW.INS_USER, BENUTZERVERWALTUNG.HOLE_USERNAMEN);'' || chr(10)' || chr(10) 
  ||  '|| rpad(chr(32),2) ||  '':NEW.INS_DATE := SYSDATE;'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  '':NEW.UPD_USER := NVL (:NEW.UPD_USER, BENUTZERVERWALTUNG.HOLE_USERNAMEN);'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  '':NEW.UPD_DATE := SYSDATE;'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  '':NEW.VERSION  := NVL (:NEW.VERSION, 0);'' || chr(10)' || chr(10)  
  ||  '|| rpad(chr(32),0) ||  ''END;'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),0) ||  ''/''' || chr(10)
  ||  'FROM DUAL;' || chr(10)
  ||  'spool off;' || chr(10)
  ||    'spool C:\tmp\trg_' || Synonym_Name || '_bru.sql' || chr(10)
  ||  'SELECT ' || chr(10)
  ||  '   rpad(chr(32),0) ||  ''CREATE OR REPLACE TRIGGER TRG_' || Synonym_Name || '_BRU''' || '|| chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  ''BEFORE UPDATE'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  ''ON ' || Table_Name || ''' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  ''FOR EACH ROW'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),0) ||  ''BEGIN'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  ''IF NOT UPDATING (''''UPD_USER'''') OR :NEW.UPD_USER IS NULL'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  ''THEN'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  '':NEW.UPD_USER := BENUTZERVERWALTUNG.HOLE_USERNAMEN;'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  ''END IF;'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),0) ||    chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  ''IF NOT UPDATING (''''UPD_DATE'''') OR :NEW.UPD_DATE IS NULL'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  ''THEN'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  '':NEW.UPD_DATE := SYSDATE;'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  ''END IF;'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),0) ||    chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  ''IF NOT UPDATING (''''VERSION'''') OR :NEW.VERSION IS NULL'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  ''THEN'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  '':NEW.VERSION := :OLD.VERSION + 1;'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),2) ||  ''END IF;'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),0) ||    chr(10)' || chr(10)
  ||  '|| rpad(chr(32),0) ||  ''END;'' || chr(10)' || chr(10)
  ||  '|| rpad(chr(32),0) ||  ''/''' || chr(10)
  ||  'FROM DUAL;' || chr(10)
  ||  'spool off;' || chr(10)
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
         WHERE Cons.Constraint_Type = 'P' and table_name in ('VERURSACHER_FEHLERART'));
         
spool off;

@C:\tmp\erstelle_trigger_skripte.sql
/

