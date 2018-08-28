SET SERVEROUTPUT ON

DECLARE
  TYPE List_T IS TABLE OF VARCHAR2 (88);

  L_Auto   List_T := List_T ();
  L_Row    PLS_INTEGER;
BEGIN
  L_Auto.EXTEND (4);
  L_Auto (1)   := 'BMW';
  L_Auto (2)   := 'Audi';
  L_Auto (3)   := 'VW';
  L_Auto (4)   := 'Tatra';

  L_Row        := L_Auto.FIRST;

  WHILE L_Row IS NOT NULL LOOP
    DBMS_OUTPUT.Put_Line ('at row ' || L_Row || ' is ' || L_Auto (L_Row));
    L_Row   := L_Auto.NEXT (L_Row);
  END LOOP;

  DBMS_OUTPUT.Put_Line ('-- jetzt wird ein auto gelöscht --');

  L_Auto.Delete (3);

  L_Row        := L_Auto.FIRST;

  WHILE L_Row IS NOT NULL LOOP
    DBMS_OUTPUT.Put_Line ('at row ' || L_Row || ' is ' || L_Auto (L_Row));
    L_Row   := L_Auto.NEXT (L_Row);
  END LOOP;
END;

/*
at row 1 is BMW
at row 2 is Audi
at row 3 is VW
at row 4 is Tatra
-- jetzt wird ein auto gelöscht --
at row 1 is BMW
at row 2 is Audi
at row 4 is Tatra
 PL/SQL procedure successfully completed.
*/