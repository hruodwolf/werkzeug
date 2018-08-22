SET SERVEROUTPUT ON
-- BEISPIEL OHNE EXTEND

DECLARE
  TYPE List_Of_Names_T IS VARRAY (4) OF VARCHAR2 (100);

  -- As with nested tables (and unlike with associative arrays), 1 must call the constructor
  -- function of the same name as the TYPE to initialize the structures.
  Happyfamily   List_Of_Names_T
                  := List_Of_Names_T ('Eli'
                                    , 'Steve'
                                    , 'Veva'
                                    , 'Chris');

  L_Row_2       PLS_INTEGER;
BEGIN
  DBMS_OUTPUT.Put_Line ('-- for with 1 to COUNT --');

  FOR L_Row IN 1 .. Happyfamily.COUNT LOOP
    DBMS_OUTPUT.Put_Line ('at row ' || L_Row || ' is ' || Happyfamily (L_Row));
  END LOOP;


  DBMS_OUTPUT.Put_Line ('-- for with FIRST and LAST --');

  FOR L_Row IN Happyfamily.FIRST .. Happyfamily.LAST LOOP
    DBMS_OUTPUT.Put_Line ('at row ' || L_Row || ' is ' || Happyfamily (L_Row));
  END LOOP;

  DBMS_OUTPUT.Put_Line ('-- while with NEXT --');
  L_Row_2   := Happyfamily.FIRST;

  WHILE (L_Row_2 IS NOT NULL) LOOP
    DBMS_OUTPUT.Put_Line ('at row ' || L_Row_2 || ' is ' || Happyfamily (L_Row_2));
    L_Row_2   := Happyfamily.NEXT (L_Row_2);
  END LOOP;
END;