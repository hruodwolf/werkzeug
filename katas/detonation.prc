create or replace procedure detonation (in_text in varchar2) is
  anzahl_zeichen_in_text constant pls_integer := coalesce(length(in_text),0);
  max_anzahl_ausgabe_pro_zeile constant pls_integer := (anzahl_zeichen_in_text * 2 ) - 1;
  aktuelle_ausgabe_position pls_integer;
  
  -- für prozedur gib_nextes_zeichen()
  start_zeiger_in_text pls_integer := anzahl_zeichen_in_text; --soll bei jedem loop um 1 reduziert werden
  fliess_zeiger pls_integer; -- bewegt sich innerhalb eines loops nach rechts um jede zwei stelle vorwärts 
  
  function gib_nextes_zeichen return varchar2
    is
    nextes_zeichen varchar2(1);
  begin
    -- nächstes zeichen heisst hier es wird jedes zweite zeichen zurückgegeben
    nextes_zeichen := substr(in_text,fliess_zeiger,1);
    fliess_zeiger := fliess_zeiger + 2;
    return nextes_zeichen;
  end gib_nextes_zeichen;
  
begin
  dbms_output.put_line('in_text: ' || coalesce(in_text, 'NULL'));
  dbms_output.put_line('anzahl_zeichen_in_text: ' || anzahl_zeichen_in_text);
  dbms_output.put_line('start_zeiger_in_text: ' || start_zeiger_in_text);
  dbms_output.put_line('max_anzahl_ausgabe_zeichen_pro_zeile: ' || max_anzahl_ausgabe_pro_zeile);
  dbms_output.put_line('aktuelle_ausgabe_position: ' || coalesce(to_char(aktuelle_ausgabe_position), 'NULL'));

  if anzahl_zeichen_in_text = 0 then
    dbms_output.put_line('ungültiger parameter! eingabe-parameter enthält ' || anzahl_zeichen_in_text || ' zeichen!');
    dbms_output.put_line('vorzeitiger abbruch mit RETURN');
    return;
  end if;
  
  --test gib nextes_zeichen
  fliess_zeiger := 9;
  --hier gehts weiter..
  dbms_output.put_line('gib nächstes zeichen: ' || gib_nextes_zeichen);
  dbms_output.put_line('gib nächstes zeichen: ' || gib_nextes_zeichen);
  dbms_output.put_line('gib nächstes zeichen: ' || gib_nextes_zeichen);
  dbms_output.put_line('gib nächstes zeichen: ' || gib_nextes_zeichen);
  

end detonation;
/

@detonation_ausloesen.sql
