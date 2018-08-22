SET SERVEROUTPUT ON

DECLARE
  -- creates a nested table type
  TYPE List_Of_Names_T IS TABLE OF VARCHAR2 (100);

  -- call a constructor function to initializethe nestedtable.
  -- you must initialize a nested table before it can be used.
  Happyfamily   List_Of_Names_T := List_Of_Names_T ();
  Children      List_Of_Names_T := List_Of_Names_T ();
  Parents       List_Of_Names_T := List_Of_Names_T ();
BEGIN
  -- Call the EXTEND method to "make room" in my nested table. Here in contrast to
  -- associative arrays, I must explicitly ask for a row in a nested table before I can place a value in that row.
  Parents.EXTEND (2);
  -- Populate the parents collection
  Parents (1)    := 'Steven';
  Parents (2)    := 'Veva';

  -- extend a single row at a time
  Children.EXTEND;
  Children (1)   := 'Chris';
  Children.EXTEND;
  Children (2)   := 'Eli';

  -- similar to the SQL UNION. Notice that I do not need to call the EXTEND method before filling happyfamily.
  Happyfamily    := Parents MULTISET UNION Children;

  -- Because I know that my happyfamily collection is densely filled from the MULTISET EXCEPT operation, I can use that
  -- numeric FOR loop to iterate through the contents of the collectlon. This construct will raise a NO_DATA_FOUND
  -- exception if used wlth a sparse collection.
  FOR L_Row IN Happyfamily.FIRST .. Happyfamily.LAST LOOP
    DBMS_OUTPUT.Put_Line ('at row ' || L_Row || ' is ' || Happyfamily (L_Row));
  END LOOP;
END;