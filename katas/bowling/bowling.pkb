CREATE OR REPLACE PACKAGE BODY Bowling IS
  PROCEDURE Roll (Pins IN PLS_INTEGER) IS
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
      DBMS_OUTPUT.Put_Line ('bou: ' || Reihe (I));
    END LOOP;

    NULL;
  END Spiel;
END Bowling;