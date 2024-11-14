--LOOP

set serveroutput on

DECLARE
contador NUMBER(6) := 1;

BEGIN
    LOOP
    
    DBMS_OUTPUT.PUT_LINE('Estoy dentro del bucle LOOP en la iteración: ' ||
    TO_CHAR(contador));
    contador := contador + 1; -- Incrementamos la variable contador
    EXIT WHEN contador > 10;
    
    END LOOP;

END;

--WHILE

set serveroutput on

DECLARE
contador NUMBER := 1;

BEGIN
    WHILE contador <= 10 LOOP
    DBMS_OUTPUT.PUT_LINE('Estoy dentro del bucle WHILE en la iteración: ' ||
    TO_CHAR(contador));
    contador := contador + 1;
    
    END LOOP;

END;

--FOR

SET SERVEROUTPUT ON;

BEGIN
    FOR contador IN 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE('Estoy dentro del bucle FOR en la iteración: ' ||
    TO_CHAR(contador));
    
    END LOOP;
END;