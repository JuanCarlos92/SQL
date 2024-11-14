--Necesario para ejecutar  PL/SQL
SET SERVEROUTPUT on;

DECLARE
dep_id Departments.department_id%TYPE := &introduce_ID_departamento ;
dep_name Departments.department_name%TYPE;

BEGIN
--Usamos into para almacenar el resultado del select
SELECT department_id, department_name INTO dep_id, dep_name
FROM Departments WHERE department_id=dep_id;
--Imprimimos el resultado por pantalla
DBMS_OUTPUT.PUT_LINE ('El departamento con id '|| dep_id || ' se llama '||
dep_name);
END;