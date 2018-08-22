SET SERVEROUTPUT ON
-- BEISPIEL MIT EXTEND
DECLARE
  TYPE List_Of_Names_T IS VARRAY (4) OF VARCHAR2 (100);

  -- As with nested tables (and unlike with associative arrays), 1 must call the constructor
  -- function of the same name as the TYPE to initialize the structures.
  Happyfamily   List_Of_Names_T := List_Of_Names_T ();
BEGIN
  -- Extend and populate the collections with the names of parents and then the single child. lf I try to extend to a
  -- second row, the database will raise the ORA-06532: Subscript outside oflimit error.
  Happyfamily.EXTEND;
  Happyfamily (1)   := 'Veva';

  Happyfamily.EXTEND (3);
  Happyfamily (2)   := 'Steve';
  Happyfamily (3)   := 'Chris';
  Happyfamily (4)   := 'Eli';

  FOR L_Row IN 1 .. Happyfamily.COUNT LOOP
    DBMS_OUTPUT.Put_Line ('at row ' || L_Row || ' is ' || Happyfamily (L_Row));
  END LOOP;
END;