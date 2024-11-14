/*
Pedimos dos números por variable de sustitución que van a ser el numerador y el
denominador. Realizaremos la operación de división entre ellos.
Debemos controlar la excepción de que el denominador sea 0. 
*/

SET SERVEROUTPUT ON;
--Declaramos las variables donde vamos a guardar el los valores
DECLARE
 numerador NUMBER:= &introduce_el_numerador;
 denominador NUMBER:= &introduce_el_denominador;
 resultado NUMBER;
BEGIN
 resultado:=numerador/denominador;
 --Imprimimos el resultado por pantalla
 DBMS_OUTPUT.PUT_LINE ('El resultado de dividir '|| numerador || ' entre '|| denominador || ' es '||
resultado);
EXCEPTION

 WHEN ZERO_DIVIDE THEN
 DBMS_OUTPUT.PUT_LINE ('Has intentado dividir entre 0');
END; 


/*
Pedimos un apellido por variable de sustitución que se va a usar para eliminar los
empleados con ese ese apellido.
Debemos controlar la excepción de que no haya coincidencias con ese apellido
diciendo que el apellido no existe. 
*/

DECLARE
 --Recuerda poner comillas en la variable de sustitución para que se pueda almacenar en la variable
una cadena de caracteres
 v_last_name employees.last_name%TYPE := '&Introduce_Apellido';
BEGIN
 --Elimina el usuario con ese apellido
 DELETE FROM employees WHERE last_name = v_last_name;
 --Si no encuentra el resultado hacemos que salte un error de aplicación
IF SQL%NOTFOUND THEN
 RAISE_APPLICATION_ERROR (-20201, v_last_name || ' no existe');
END IF;
END;