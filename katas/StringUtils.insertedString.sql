set serveroutput on

declare

  function insertString (str1 varchar2, str2 varchar2, pos number) 
    return varchar2 is
    
    insertedString varchar2(100);
    str1Length pls_integer := length(str1);
    str2Length pls_integer := length(str2);
    
    strNew1 varchar2(100);
    strNew2 varchar2(100);
    strNew3 varchar2(100);
  begin
    dbms_output.put_line('str1Length: ' || str1Length);
    dbms_output.put_line('str2Length: ' || str2Length);
    dbms_output.put_line('pos: ' || pos);
    
    if str1Length < pos then
      dbms_output.put_line('Fehler: pos ist größer als str1Length! Return NULL');
      return null;
    end if;
  
    strNew1 := substr(str1,1, pos-1);
    dbms_output.put_line('strNew1: ' || strNew1);
    strNew2 := str2;
    dbms_output.put_line('strNew2: ' || strNew2);
    strNew3 := substr (str1,length(strNew1 || strNew2)+1);
    dbms_output.put_line('strNew3: ' || strNew3);
    
    insertedString := strNew1 || strNew2 || strNew3;
    return insertedString;
  end insertString;

begin

  dbms_output.put_line ('ergebnis: ' || insertString('asd', 'af', 3));

end;