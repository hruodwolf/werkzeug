SET SERVEROUTPUT ON

DECLARE
  -- creates a nested table type
  TYPE List_Of_Names_T IS TABLE OF VARCHAR2 (100);

  -- call a constructor function to initializethe nestedtable.
  -- you must initialize a nested table before it can be used.
  Happyfamily   List_Of_Names_T := List_Of_Names_T ();
  L_Row_2       PLS_INTEGER;
BEGIN
  -- Call the EXTEND method to "make room" in my nested table for the members in my family. Here in contrast to
  -- associative arrays, I must explicitly ask for a row in a nested table before I can place a value in that row.
  Happyfamily.EXTEND (4);
  -- Populate the happyfamily collection with our names.
  Happyfamily (1)   := 'Eli';
  Happyfamily (2)   := 'Steven';
  Happyfamily (3)   := 'Chris';
  Happyfamily (4)   := 'Veva';


  DBMS_OUTPUT.Put_Line ('-- for with 1 to COUNT --');

  FOR L_Row IN 1 .. Happyfamily.COUNT LOOP
    DBMS_OUTPUT.Put_Line ('at row ' || L_Row || ' is ' || Happyfamily (L_Row));
  END LOOP;


  DBMS_OUTPUT.Put_Line ('-- for with FIRST and LAST --');

  FOR L_Row IN Happyfamily.FIRST .. Happyfamily.LAST LOOP
    DBMS_OUTPUT.Put_Line ('at row ' || L_Row || ' is ' || Happyfamily (L_Row));
  END LOOP;

  DBMS_OUTPUT.Put_Line ('-- while with NEXT --');
  L_Row_2           := Happyfamily.FIRST;

  WHILE (L_Row_2 IS NOT NULL) LOOP
    DBMS_OUTPUT.Put_Line ('at row ' || L_Row_2 || ' is ' || Happyfamily (L_Row_2));
    L_Row_2   := Happyfamily.NEXT (L_Row_2);
  END LOOP;
END;