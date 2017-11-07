create or replace procedure detonation (in_text in varchar2) is
  anzahl_zeichen_in_text constant pls_integer := coalesce(length(in_text),0);
  max_anzahl_ausgabe_pro_zeile constant pls_integer := (anzahl_zeichen_in_text * 2 ) - 1;
  
  -- für prozedur gib_nextes_zeichen()
  start_zeiger_in_text pls_integer := anzahl_zeichen_in_text; --soll bei jedem loop um 1 reduziert werden
  fliess_zeiger pls_integer; -- bewegt sich innerhalb eines loops nach rechts um jede zwei stelle vorwärts 
  
  -- variablen für die ausgabe
  aktuelle_ausgabe_position pls_integer := max_anzahl_ausgabe_pro_zeile;
  fliess_ausgabe_position pls_integer;
  
  zeiger_vorwaerts boolean := false;
  
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
  
  for i in 1 .. 21 loop
    
    fliess_ausgabe_position := aktuelle_ausgabe_position;
    
      loop
        
        dbms_output.put_line ('im inner loop: fliess_ausgabe_position:' || fliess_ausgabe_position);
        
        fliess_ausgabe_position := fliess_ausgabe_position + 4;
        exit when max_anzahl_ausgabe_pro_zeile < fliess_ausgabe_position;
      end loop;
      dbms_output.put_line('im for-loop: ' || i || '. Ausgabezeile beendet.');
      
      if aktuelle_ausgabe_position in (0,1) then
        zeiger_vorwaerts := true;
      end if;
      
      if zeiger_vorwaerts then
        aktuelle_ausgabe_position := aktuelle_ausgabe_position + 2;
      else
        aktuelle_ausgabe_position := aktuelle_ausgabe_position - 2;
      end if;
    


  end loop;

  

end detonation;
/

@detonation_ausloesen.sql
