SET SERVEROUTPUT ON

DECLARE
  TYPE List_T IS VARRAY (2) OF VARCHAR2 (68);

  L_Autos   List_T;
BEGIN
  L_Autos       := List_T ();
  L_Autos.EXTEND (2);

  L_Autos (1)   := 'BMW';
  L_Autos (2)   := 'Audi';

  FOR L_Row IN L_Autos.FIRST .. L_Autos.LAST LOOP
    DBMS_OUTPUT.Put_Line ('at row ' || L_Row || ' is ' || L_Autos (L_Row));
  END LOOP;

  DBMS_OUTPUT.Put_Line ('-- DELETE doesn''t work for varray, use TRIM --');
  --L_Autos.Delete; -- funktioniert nicht!!

  L_Autos.TRIM;  -- entfernt das letzte element

  FOR L_Row IN L_Autos.FIRST .. L_Autos.LAST LOOP
    DBMS_OUTPUT.Put_Line ('at row ' || L_Row || ' is ' || L_Autos (L_Row));
  END LOOP;
END;