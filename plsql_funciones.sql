SET SERVEROUTPUT on;

    ---------------------------------------------------------------------------
    --?Creaci�n de una funci�n para sumar dos n�meros, visualizando el resultado
    --directamente y tambi�n almacen�ndolo para mostrarlo posteriormente.
    
    --? Almacenar la funci�n anterior en la base de datos.
    
    --? Utilizar la funci�n almacenada anteriormente en bloques an�nimos.
    
    --? Realizar una consulta que nos muestre el c�digo de trabajo, el nombre del
    --trabajo, el salario m�nimo, el salario m�ximo junto con la suma de estos dos
    --trabajos, utilizando la funci�n almacenada. 
    ---------------------------------------------------------------------------


--1. Creaci�n de una funci�n para sumar dos n�meros, visualizando el resultado
--directamente y tambi�n almacen�ndolo para mostrarlo posteriormente.


FUNCTION SUMA_NUMEROS(NUMEROA NUMBER, NUMEROB NUMBER)
RETURN NUMBER IS --El tipo de dato que devolver� la funci�n es NUMBER 
RESULTADO NUMBER;
BEGIN
    
    RESULTADO := NUMEROA + NUMEROB; -- Realizamos la operaci�n de suma 
    RETURN RESULTADO; -- Y el valor de Resultado ser� devuelto como el valor de la funci�n. 
END;


DECLARE
--Declaramos las variables de nuestro bloque an�nimo. 
VARIABLE_SUMA NUMBER;

BEGIN
-- Usamos la funci�n directamente. 
DBMS_OUTPUT.PUT_LINE('La suma es: ' || SUMA_NUMEROS(13,72));

--Almacenamos el valor de la funci�n en una variable para imprimirlo posteriormente. 
VARIABLE_SUMA := SUMA_NUMEROS(120,75);
DBMS_OUTPUT.PUT_LINE('La suma es: ' || VARIABLE_SUMA);

END;

--2. Almacenar la funci�n anterior en la base de datos.
--Para ello, s�lo debemos adicionar la palabra CREATE a la declaraci�n de la funci�n, y
--ejecutar solo el c�digo de la declaraci�n de la funci�n sin el bloque an�nimo. 


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

--3. Realizar una consulta que nos muestre el c�digo de trabajo, el nombre del trabajo, el
--salario m�nimo, el salario m�ximo junto con la suma de estos dos trabajos, utilizando la
--funci�n almacenada.

SELECT job_id,
    job_title,
    min_salary,
    max_salary,
        SUMA_NUMEROS (min_salary, max_salary) as SUMA 
FROM jobs;

