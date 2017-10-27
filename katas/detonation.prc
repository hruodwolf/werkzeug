create or replace procedure detonation (in_text in varchar2) is
  max_anzahl_zeichen_pro_zeile constant number(4) := (length(in_text) * 2 ) - 1;
begin  
  dbms_output.put_line('in_text: ' || in_text);
  dbms_output.put_line('max_anzahl_zeichen_pro_zeile: ' || max_anzahl_zeichen_pro_zeile);
end detonation;
/

@detonation_ausloesen.sql
