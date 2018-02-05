SET SERVEROUTPUT ON

DECLARE
  Reihe1   Bowling.Feld  := Bowling.Feld (1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6);

  Reihe2   Bowling.Feld  := Bowling.Feld (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  Reihe3   Bowling.Feld  := Bowling.Feld (5, 5, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  Reihe4   Bowling.Feld  := Bowling.Feld (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5);
  Reihe5   Bowling.Feld  := Bowling.Feld (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 2, 3);
  Reihe6   Bowling.Feld  := Bowling.Feld (10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10);
BEGIN
  Bowling.Spiel (Reihe => Reihe1);
END;
/

/*
drop package body bowling;
drop package bowling;

*/