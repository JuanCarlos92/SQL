--Necesario para ejecutar  PL/SQL
SET SERVEROUTPUT on;

--bloque anonimo que permite almacenar el nombre del departamento  cuyo id 
--sea 10 en la variable d_name y mostrarlo por consola.
--
Declare

d_name VARCHAR2(50);

BEGIN

SELECT department_name
    INTO d_name
    FROM departments
    WHERE department_id = 10;
    
    DBMS_OUTPUT.PUT_LINE('El nombre del departamento es ' ||d_name);
    
END;

--bloque anónimo que permita consultar el nombre de un 
--departamento, a través del id de dicho department_id (department_id). Utilice
--para declarar la variable el atributo %TYPE. --

DECLARE
 d_id departments.department_id%TYPE := &id_departamento_insertado;
 d_name departments.department_name%TYPE;
BEGIN
 SELECT department_name INTO d_name FROM departments WHERE department_id = d_id;
 DBMS_OUTPUT.PUT_LINE ('El nombre del departamento cuyo id es: ' || d_id || ' es :' || d_name);
END;

--Mejorar el anterior bloque anónimo que permita poner mensajes diferentes según
--el id de departamento. 

DECLARE
d_id HR.departments.department_id%Type:=&id_departamento;
d_name HR.departments.department_name%type;
BEGIN
SELECT department_name INTO d_name FROM hr.departments WHERE department_id=d_id;
 if (d_id > 110) then
 DBMS_OUTPUT.PUT_LINE('El nombre del departamento sin empleados cuyo id es: ' ||d_id ||' es '
||d_name );
 else
 DBMS_OUTPUT.PUT_LINE('El nombre del departamento cuyo id es: ' ||d_id ||' es ' ||d_name );
 END IF;

END;
    