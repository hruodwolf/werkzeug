SET SERVEROUTPUT ON

DECLARE
  -- Declare the associative array TYPE
  TYPE List_Of_Names_T IS TABLE OF VARCHAR2 (100)
    INDEX BY PLS_INTEGER;

  -- Declare the happyfamily collection from the list_of_names_t type
  Happyfamily   List_Of_Names_T;
  L_Row_2       PLS_INTEGER;
BEGIN
  -- Populate the collection with four names
  Happyfamily (1)   := 'Eli';
  Happyfamily (2)   := 'Steven';
  Happyfamily (3)   := 'Chris';
  Happyfamily (4)   := 'Veva';

  -- Call the FIRST method (a function that is "attached" to the collection) to get the first or
  -- lowest defined row number in the collection.
  DBMS_OUTPUT.Put_Line ('-- while with NEXT --');
  L_Row_2           := Happyfamily.FIRST;

  WHILE (L_Row_2 IS NOT NULL) LOOP
    DBMS_OUTPUT.Put_Line ('at row ' || L_Row_2 || ' is ' || Happyfamily (L_Row_2));

    -- the NEXT method, which is used to move from the current defined row to the next defined row, "skipping over" any gaps.
    L_Row_2   := Happyfamily.NEXT (L_Row_2);
  END LOOP;

  DBMS_OUTPUT.Put_Line ('-- for with 1 to COUNT --');

  FOR L_Row IN 1 .. Happyfamily.COUNT LOOP
    DBMS_OUTPUT.Put_Line ('at row ' || L_Row || ' is ' || Happyfamily (L_Row));
  END LOOP;


  DBMS_OUTPUT.Put_Line ('-- for with FIRST and LAST --');

  FOR L_Row IN Happyfamily.FIRST .. Happyfamily.LAST LOOP
    DBMS_OUTPUT.Put_Line ('at row ' || L_Row || ' is ' || Happyfamily (L_Row));
  END LOOP;
END;