DECLARE
  -- Declare the associative array TYPE
  TYPE List_Of_Names_T IS TABLE OF VARCHAR2 (100)
    INDEX BY PLS_INTEGER;

  -- Declare the happyfamily collection from the list_of_names_t type
  Happyfamily   List_Of_Names_T;
BEGIN
  -- Populate the collection with four names
  Happyfamily (-3)   := 'Eli';
  Happyfamily (-2)   := 'Steven';
  Happyfamily (-1)   := 'Chris';
  Happyfamily (0)    := 'Veva';

  DBMS_OUTPUT.Put_Line ('Happyfamily.FIRST ' || Happyfamily.FIRST);
  DBMS_OUTPUT.Put_Line ('Happyfamily.LAST ' || Happyfamily.LAST);
  DBMS_OUTPUT.Put_Line ('----');

  -- Jetzt funktioniert die FOR-Schleife, da der Index zwar negativ aber sequenziell ist
  FOR L_Row IN Happyfamily.FIRST .. Happyfamily.LAST LOOP
    DBMS_OUTPUT.Put_Line ('at row ' || L_Row || ' is ' || Happyfamily (L_Row));
  END LOOP;
END;