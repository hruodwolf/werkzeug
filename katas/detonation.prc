create or replace procedure detonation (in_text in varchar2) is
  anzahl_zeichen_in_text constant pls_integer := coalesce(length(in_text),0);
  max_anzahl_zeichen_pro_zeile constant pls_integer := (anzahl_zeichen_in_text * 2 ) - 1;
  aktuelle_ausgabe_position pls_integer;
begin
  dbms_output.put_line('in_text: ' || coalesce(in_text, 'NULL'));
  dbms_output.put_line('anzahl_zeichen_in_text: ' || anzahl_zeichen_in_text);
  dbms_output.put_line('max_anzahl_zeichen_pro_zeile: ' || max_anzahl_zeichen_pro_zeile);
  dbms_output.put_line('aktuelle_ausgabe_position: ' || coalesce(to_char(aktuelle_ausgabe_position), 'NULL'));

  if anzahl_zeichen_in_text = 0 then
    dbms_output.put_line('ungültiger parameter! eingabe-parameter enthält ' || anzahl_zeichen_in_text || ' zeichen!');
    dbms_output.put_line('vorzeitiger abbruch mit RETURN');
    return;
  end if;

end detonation;
/

@detonation_ausloesen.sql
