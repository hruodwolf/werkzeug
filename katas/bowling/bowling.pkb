CREATE OR REPLACE PACKAGE BODY Bowling IS
  PROCEDURE Roll (Pins IN PLS_INTEGER) IS
  
  -- varraay mit zwei zellen, diese füllen. wenn zwei würfe erfolgt sind dann varray an score übergeben
  -- oder wenn im ersten wurf bereits 10 (strike) oder spare bei zwei würfen 10 pins umgefallen sind
  
  -- wenn summe von zwei zellen kleiner 10 ist dann nach zwei würfen löschen
  -- wenn summe 10 ist, dann werte beibehalten da der nächste oder nächsten zwei würfe dazuzählen 
  
  BEGIN
    
    
    NULL;
  END Roll;

  FUNCTION Score
    RETURN PLS_INTEGER IS
  BEGIN
    RETURN NULL;
  END Score;

  PROCEDURE Spiel (Reihe IN Bowling.Feld) IS
  BEGIN
    FOR I IN 1 .. Reihe.COUNT LOOP
      --DBMS_OUTPUT.Put_Line ('bou: ' || Reihe (I));
      roll(pins => reihe(i));
      
    
    END LOOP;

    NULL;
  END Spiel;
END Bowling;