SET SERVEROUTPUT ON

DECLARE
  -- Declare the associative array TYPE
  TYPE List_Of_Names_T IS TABLE OF VARCHAR2 (100)
    INDEX BY PLS_INTEGER;

  -- Declare the happyfamily collection from the list_of_names_t type
  Happyfamily   List_Of_Names_T;
  L_Row         PLS_INTEGER;
BEGIN
  -- Populate the collection with four names
  Happyfamily (2020202020)   := 'Eli';
  Happyfamily (-15070)       := 'Steven';
  Happyfamily (-90900)       := 'Chris';
  Happyfamily (88)           := 'Veva';

  -- Call the FIRST method (a function that is "attached" to the collection) to get the first or
  -- lowest defined row number in the collection.
  L_Row                      := Happyfamily.FIRST;

  WHILE (L_Row IS NOT NULL) LOOP
    DBMS_OUTPUT.Put_Line ('at row ' || L_Row || ' is ' || Happyfamily (L_Row));

    -- the NEXT method, which is used to move from the current defined row to the next defined row, "skipping over" any gaps.
    L_Row   := Happyfamily.NEXT (L_Row);
  END LOOP;
END;