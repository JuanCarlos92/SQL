SET SERVEROUTPUT on;

    ---------------------------------------------------------------------------
    --?Creación de una función para sumar dos números, visualizando el resultado
    --directamente y también almacenándolo para mostrarlo posteriormente.
    
    --? Almacenar la función anterior en la base de datos.
    
    --? Utilizar la función almacenada anteriormente en bloques anónimos.
    
    --? Realizar una consulta que nos muestre el código de trabajo, el nombre del
    --trabajo, el salario mínimo, el salario máximo junto con la suma de estos dos
    --trabajos, utilizando la función almacenada. 
    ---------------------------------------------------------------------------


--1. Creación de una función para sumar dos números, visualizando el resultado
--directamente y también almacenándolo para mostrarlo posteriormente.


FUNCTION SUMA_NUMEROS(NUMEROA NUMBER, NUMEROB NUMBER)
RETURN NUMBER IS --El tipo de dato que devolverá la función es NUMBER 
RESULTADO NUMBER;
BEGIN
    
    RESULTADO := NUMEROA + NUMEROB; -- Realizamos la operación de suma 
    RETURN RESULTADO; -- Y el valor de Resultado será devuelto como el valor de la función. 
END;


DECLARE
--Declaramos las variables de nuestro bloque anónimo. 
VARIABLE_SUMA NUMBER;

BEGIN
-- Usamos la función directamente. 
DBMS_OUTPUT.PUT_LINE('La suma es: ' || SUMA_NUMEROS(13,72));

--Almacenamos el valor de la función en una variable para imprimirlo posteriormente. 
VARIABLE_SUMA := SUMA_NUMEROS(120,75);
DBMS_OUTPUT.PUT_LINE('La suma es: ' || VARIABLE_SUMA);

END;

--2. Almacenar la función anterior en la base de datos.
--Para ello, sólo debemos adicionar la palabra CREATE a la declaración de la función, y
--ejecutar solo el código de la declaración de la función sin el bloque anónimo. 


CREATE OR REPLACE FUNCTION SUMA_NUMEROS(NUMEROA NUMBER, NUMEROB NUMBER)
RETURN NUMBER IS 
RESULTADO NUMBER; 
BEGIN

RESULTADO := NUMEROA + NUMEROB; 
    RETURN RESULTADO; 
    
END;


DECLARE
VARIABLE_SUMA NUMBER;
BEGIN

DBMS_OUTPUT.PUT_LINE('La suma es: ' || SUMA_NUMEROS(13,72));
VARIABLE_SUMA := SUMA_NUMEROS(120,75);
DBMS_OUTPUT.PUT_LINE('La suma es: ' || VARIABLE_SUMA);

END;

--3. Realizar una consulta que nos muestre el código de trabajo, el nombre del trabajo, el
--salario mínimo, el salario máximo junto con la suma de estos dos trabajos, utilizando la
--función almacenada.

SELECT job_id,
    job_title,
    min_salary,
    max_salary,
        SUMA_NUMEROS (min_salary, max_salary) as SUMA 
FROM jobs;

