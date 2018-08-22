SET SERVEROUTPUT ON

DECLARE
  -- creates a nested table type
  TYPE List_Of_Names_T IS TABLE OF VARCHAR2 (100);

  -- call a constructor function to initializethe nestedtable.
  -- you must initialize a nested table before it can be used.
  Happyfamily        List_Of_Names_T := List_Of_Names_T ();
  Very_Happyfamily   List_Of_Names_T := List_Of_Names_T ();
  Equal_Names        List_Of_Names_T := List_Of_Names_T ();
BEGIN
  -- Call the EXTEND method to "make room" in my nested table for the members in my family. Here in contrast to
  -- associative arrays, I must explicitly ask for a row in a nested table before I can place a value in that row.
  Happyfamily.EXTEND (4);
  -- Populate the happyfamily collection with our names.
  Happyfamily (1)        := 'Eli';
  Happyfamily (2)        := 'Steven';
  Happyfamily (3)        := 'Chris';
  Happyfamily (4)        := 'Veva';

  -- extend a single row at a time
  Very_Happyfamily.EXTEND;
  Very_Happyfamily (1)   := 'Chris';
  Very_Happyfamily.EXTEND (3);
  Very_Happyfamily (2)   := 'Eli';
  Very_Happyfamily (3)   := 'Adolpho';
  Very_Happyfamily (4)   := 'Wilma';

  -- similar to the SQL INTERSECT. Notice that I do not need to call the EXTEND method before filling parents.
  Equal_Names            := Happyfamily MULTISET INTERSECT DISTINCT Very_Happyfamily;

  -- Because I know that my parents collection is densely filled from the MULTISET EXCEPT operation, I can use that
  -- numeric FOR loop to iterate through the contents of the collectlon. This construct will raise a NO_DATA_FOUND
  -- exception if used wlth a sparse collection.
  FOR L_Row IN Equal_Names.FIRST .. Equal_Names.LAST LOOP
    DBMS_OUTPUT.Put_Line ('at row ' || L_Row || ' is ' || Equal_Names (L_Row));
  END LOOP;
END;