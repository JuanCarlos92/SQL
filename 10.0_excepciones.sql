/*
Cree un bloque PL/SQL que maneje una excepción, de la siguiente forma:

    -Previamente cree la tabla analysis, con el siguiente formato:

        +Ename: Cadena de texto de 20 caracteres.
        +Years: Entero de 2 dígitos.
        +Salario: Número de 8 dígitos enteros y 2 decimales.


    -Si el empleado lleva en la organización más de cinco años y su salario es Inferior
    a 3.500, emita una excepción. En el manejador de excepciones, realice lo
    siguiente Genere la salida de la siguiente información: el apellido del empleado y
    el mensaje “Merece un aumento”:

        +Si no hay ninguna excepción, genere la salida del apellido del empleado
        y el mensaje “No merece un aumento”.

        +Verifique los resultados consultando la tabla analysis
*/
SET SERVEROUTPUT ON;

CREATE TABLE analysis(
    Ename VARCHAR2(20);
    Years NUMBER (2);
    Salario NUMBER(10,2);
);

DECLARE
    /**/incremento_salario EXCEPTION; --Declarar la excepcion
    sal employees.salary%type;
    fecha employees.hire_date%type;
    apellido employees.last_name%type :='&introduzca_un_apellido';

BEGIN
    SELECT salary, hire_date INTO sal, fecha
        FROM employees 
        WHERE last_name = apellido;

    antiguedad := TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - TO_NUMBER(TO_CHAR(fecha, 'YYYY'));

    IF sal < 3500 AND antiguedad > 5 THEN
    /**/RAISE incremento_salario; --Llamamos a la excepcion con RAISE
    
    ELSE 
        DBMS_OUTPUT.PUT_LINE(apellido || 'No merece un aumento');

    END IF;

EXCEPTION
        WHEN no_data_found THEN --Excepción predefinida (no devuelve filas)
            DBMS_OUTPUT.PUT_LINE('No se ha recuperado ninguna fila en la sentencia SELECT');
        WHEN too_many_rows THEN --Excepción predefinida (devuelve mas de una fila)
            DBMS_OUTPUT.PUT_LINE('Se han recuperado varias filas en la sentencia SELECT. Sería interesante utilizar un cursor');
    /**/WHEN incremento_salario THEN --Excepcion definidas por el usuario
            DBMS_OUTPUT.PUT_LINE(apellido || 'Merece un aumento');
    
END;


SELECT * FROM employees;