--Necesario para poder imprimir por pantalla en PL/SQL
SET SERVEROUTPUT on;

/*(RA05_d) Se han definido y utilizado guiones para automatizar tareas y 
(RA05_g) Se han utilizado estructuras de control de flujo.*/

DECLARE
    
    nombre_apellidos VARCHAR2(100) :='&Nombre_y_apellidos'; -- variable que almacena nombre_apellido
    
    salario_mensual NUMBER :=&salario_mensual; -- variable que almacena el salario
    
    prima NUMBER; -- variable que almacena el plus del salario
    
    salario_anual NUMBER; -- Variable que almacena el salario anual que obtenemos como resultado final

BEGIN

    IF salario_mensual * 12 > 21000 THEN  -- Si es mayor a  21000...
        prima := 3000;
    ELSIF salario_mensual * 12 BETWEEN 12000 AND 21000 THEN -- Y si es entre 12000 y 21000...
        prima := 1800;
    ELSE -- Sino ...
        prima := 1000;
    END IF;
    
    salario_anual := (salario_mensual * 12) + prima;
     DBMS_OUTPUT.PUT_LINE('El sueldo anual para el empleado "' || nombre_apellidos 
     || '" con un sueldo mensual de "' || salario_mensual || '" es de "' || salario_anual || '"');

END;

/*(RA05_f) Se han definido procedimientos y funciones de usuario y 
(RA05_j) Se han utilizado excepciones*/

CREATE OR REPLACE FUNCTION getNombreApellidos(employee_id IN NUMBER) RETURN VARCHAR2 IS
  nombre_apellidos VARCHAR2(100);
  
BEGIN
  SELECT first_name || ' ' || last_name INTO nombre_apellidos FROM Employees 
  WHERE employee_id = getNombreApellidos.employee_id;
  
  RETURN nombre_apellidos;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No existe un empleado con id ' || TO_CHAR(employee_id);
END;

--Ejecución de la función getNombreApellidos

DECLARE
  resultado VARCHAR2(100); --Declaramos una variable que va a  obtener el resultado de la llamada a la función

BEGIN
--Diferentes resultados con id: 105, 201 y 1111
  resultado := getNombreApellidos(105);
  DBMS_OUTPUT.PUT_LINE(resultado);
  
  resultado := getNombreApellidos(201);
  DBMS_OUTPUT.PUT_LINE(resultado);
  
  resultado := getNombreApellidos(1111);
  DBMS_OUTPUT.PUT_LINE(resultado);
END;



SELECT first_name, last_name FROM Employees where employee_id=105;
SELECT first_name, last_name FROM Employees where employee_id=201;
SELECT first_name, last_name FROM Employees where employee_id=1111;
