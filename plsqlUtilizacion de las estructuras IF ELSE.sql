SET SERVEROUTPUT on;

DECLARE
numero number(3):=&Introducir_valor;

BEGIN

IF numero >= 0 AND numero <= 100 THEN
    IF(numero =10) THEN
    dbms_output.put_line('Enhorabuena, ha ganado el primer premio');
    
    ELSIF(numero =20) THEN
    dbms_output.put_line('Enhorabuena, ha ganado el segundo premio');
    
    ELSIF(numero =30) THEN
    dbms_output.put_line('Enhorabuena, ha ganado el tercer premio');
    
    ELSE
    dbms_output.put_line('El valor no ha sido premiado');
    
    END IF;
    
ELSE
dbms_output.put_line('El valor indicando no está entre 0 y 100');

END IF;

END;

    
