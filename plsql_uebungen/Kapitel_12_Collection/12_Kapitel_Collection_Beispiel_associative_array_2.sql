DECLARE
  -- Declare the associative array TYPE
  TYPE List_Of_Names_T IS TABLE OF VARCHAR2 (100)
    INDEX BY PLS_INTEGER;

  -- Declare the happyfamily collection from the list_of_names_t type
  Happyfamily   List_Of_Names_T;
BEGIN
  -- Populate the collection with four names
  Happyfamily (2020202020)   := 'Eli';
  Happyfamily (-15070)       := 'Steven';
  Happyfamily (-90900)       := 'Chris';
  Happyfamily (88)           := 'Veva';

  DBMS_OUTPUT.Put_Line ('Happyfamily.FIRST ' || Happyfamily.FIRST);
  DBMS_OUTPUT.Put_Line ('Happyfamily.LAST ' || Happyfamily.LAST);
  DBMS_OUTPUT.Put_Line ('----');

  -- FOR-Schleife funktioniert nicht, da Lücken in der Collection enthalten sind.
  -- Die FOR-Schleife zählt immer sequenziell z.B. 1, 2, 3,.. oder -3, -2, -1, 0, 1,..
  -- In diesem Beispiel wäre der Index für die zweite Iteration -90899, unter diesem gibt es
  -- keinen Wert in der Collection, daher kommt es zu NO_DATA_FOUND.
  FOR L_Row IN Happyfamily.FIRST .. Happyfamily.LAST LOOP
    BEGIN
      DBMS_OUTPUT.Put_Line ('at row ' || L_Row || ' is ' || Happyfamily (L_Row));
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.Put_Line ('no value at row ' || L_Row || '. exit!');
        EXIT;
    END;
  END LOOP;
END;