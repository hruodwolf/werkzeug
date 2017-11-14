create or replace procedure detonation (in_text in varchar2) is
  anzahl_zeichen_in_text constant pls_integer := coalesce(length(in_text),0);
  
  -- anzahl zeichen pro zeile entspricht auch der anzahl der ausgabe zeilen - für for-loop relevant
  max_anzahl_ausgabe_pro_zeile constant pls_integer := (anzahl_zeichen_in_text * 2 ) - 1;
  
  -- für prozedur gib_nextes_zeichen()
  start_zeiger_in_text pls_integer := anzahl_zeichen_in_text; --soll bei jedem loop um 1 reduziert werden
  fliess_zeiger_in_text pls_integer; -- bewegt sich innerhalb eines loops nach rechts um jede zwei stelle vorwärts 
  
  -- variablen für die ausgabe
  aktuelle_ausgabe_position pls_integer := max_anzahl_ausgabe_pro_zeile;
  fliess_ausgabe_position pls_integer;
  
  zeiger_vorwaerts boolean := false;
  
  ausgabe varchar2(100);
  
  function gib_nextes_zeichen return varchar2
    is
    nextes_zeichen varchar2(1);
  begin
    -- nächstes zeichen heisst hier es wird jedes zweite zeichen zurückgegeben
    nextes_zeichen := substr(in_text,fliess_zeiger_in_text,1);
    fliess_zeiger_in_text := fliess_zeiger_in_text + 2;
    return nextes_zeichen;
  end gib_nextes_zeichen;
  
  function insertString (str1 varchar2, str2 varchar2, pos number) 
    return varchar2 is
    
    insertedString varchar2(100);
    str1Length pls_integer := length(str1);
    str2Length pls_integer := length(str2);
    
    strNew1 varchar2(100);
    strNew2 varchar2(100);
    strNew3 varchar2(100);
  begin
    --dbms_output.put_line('str1Length: ' || str1Length);
    --dbms_output.put_line('str2Length: ' || str2Length);
    --dbms_output.put_line('pos: ' || pos);
    
    if str1Length < pos then
      --dbms_output.put_line('Fehler: pos ist größer als str1Length! Return NULL');
      return null;
    end if;
  
    strNew1 := substr(str1,1, pos-1);
    --dbms_output.put_line('strNew1: ' || strNew1);
    strNew2 := str2;
    --dbms_output.put_line('strNew2: ' || strNew2);
    strNew3 := substr (str1,length(strNew1 || strNew2)+1);
    --dbms_output.put_line('strNew3: ' || strNew3);
    
    insertedString := strNew1 || strNew2 || strNew3;
    return insertedString;
  end insertString;
  
  function leerzeichen(anzahl number)
    return varchar2
  is
  begin
    return lpad(chr(32), anzahl);
  end leerzeichen;
  
begin
  --dbms_output.put_line('in_text: ' || coalesce(in_text, 'NULL'));
  --dbms_output.put_line('anzahl_zeichen_in_text: ' || anzahl_zeichen_in_text);
  --dbms_output.put_line('start_zeiger_in_text: ' || start_zeiger_in_text);
  --dbms_output.put_line('max_anzahl_ausgabe_zeichen_pro_zeile: ' || max_anzahl_ausgabe_pro_zeile);
  --dbms_output.put_line('aktuelle_ausgabe_position: ' || coalesce(to_char(aktuelle_ausgabe_position), 'NULL'));

  if anzahl_zeichen_in_text = 0 then
    --dbms_output.put_line('ungültiger parameter! eingabe-parameter enthält ' || anzahl_zeichen_in_text || ' zeichen!');
    --dbms_output.put_line('vorzeitiger abbruch mit RETURN');
    return;
  end if;
  
  ausgabe := leerzeichen(max_anzahl_ausgabe_pro_zeile); --initial mit leerzeichen befüllen
  
  for i in 1 .. max_anzahl_ausgabe_pro_zeile loop
    
    fliess_ausgabe_position := aktuelle_ausgabe_position;
    fliess_zeiger_in_text   := start_zeiger_in_text;
    
    loop
      --dbms_output.put_line ('im inner loop: fliess_ausgabe_position:' || fliess_ausgabe_position);
    
      ausgabe := insertString(ausgabe, gib_nextes_zeichen, fliess_ausgabe_position);
      
      fliess_ausgabe_position := fliess_ausgabe_position + 4;
      
      exit when max_anzahl_ausgabe_pro_zeile < fliess_ausgabe_position;
    end loop;
    --dbms_output.put_line('im for-loop: ' || i || '. Ausgabezeile beendet.');
    dbms_output.put_line(ausgabe);
    ausgabe := leerzeichen(max_anzahl_ausgabe_pro_zeile); -- zurücksetzen für die nächste zeile
    
    if aktuelle_ausgabe_position in (0,1) then
      --dbms_output.put_line('aktuelle_ausgabe_position: ' || aktuelle_ausgabe_position || '/ zeiger_vorwaerts := true'); 
      zeiger_vorwaerts := true;
    end if;
      
    if zeiger_vorwaerts then
      aktuelle_ausgabe_position := aktuelle_ausgabe_position + 2;
      start_zeiger_in_text      := start_zeiger_in_text + 1;
    else
      aktuelle_ausgabe_position := aktuelle_ausgabe_position - 2;
      start_zeiger_in_text      := start_zeiger_in_text - 1;
    end if;

  end loop;

end detonation;
/

@detonation_ausloesen.sql
