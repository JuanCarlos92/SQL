CREATE OR REPLACE TRIGGER prueba
BEFORE DELETE ON employees --Antes de ...
DECLARE
BEGIN
    RAISE_APLICATION_ERROR(-20151, 'VAS A BORRAR UN EMPLEADO')
END prueba;

--Comprobar la tabla employees
SELECT * FROM employees

-- no se podria eliminar
DELETE FROM employees where employee_id = 1000; 



CREATE OR REPLACE TRIGGER delete_emp_trg
BEFORE DELETE ON employees --Antes de ...

DECLARE
dia VARCHAR2(4) := TO_CHAR(SYSDATE,'DY');
hora number(2) :=  TO_CHAR(SYSDATE,'HH24')

BEGIN
    IF(hora not between  9 and 18) or (dia IN('SAT','SUN'))
    THEN
    RAISE_APLICATION_ERROR(-20151, 'VAS A BORRAR UN EMPLEADO')
END delete_emp_trg;


--(Disparador por  cada fila) Ejemplo de uso de los cualificadores OLD y NEW
CREATE TABLE audit_emp(
    user_name VARCHAR2(30);
    time_stamp date;
    id number(6)
    old_last_name VARCHAR2(25),
    new_last_name VARCHAR2(25),
    old_title VARCHAR2(10);
    new_title VARCHAR2(10);
    old_salary NUMBER(8,2);
    new_salary NUMBER(8,2); 
)
--Disparador

CREATE OR REPLACE TRIGGER audit_emp_values
AFTER DELETE OR INSERT OR UPDATE ON employees
FOR EACH ROW

BEGIN
    INSERT INTO audit_emp(user_name, time_stamp, id,
        old_last_name, new_last_name, old_title,
        new_title, old_salary, new_salary)
    VALUES (USER, SYSDATE, :OLD.employee_id,
        :OLD.last_name, :NEW.last_name, :OLD.job_id,
        :NEW.job_id, :OLD.salary, :NEW.salary);

END audit_emp_values;

--Insertar el empleado (saltará el disparador despues del INSERT y realizará la copia en audit_emp_values)

INSERT INTO employees (employee_id, last_name, job_id, salary, email, hire_date)
VALUES (999, 'Temp emp', 'SA_REP', 6000, 'TEMPEMP', TRUNC (SYSDATE) )

--Actualizar el empleado
UPDATE employees SET salary = 7000, last_name = 'Smith'
WHERE employee_id = 999

--Mostrar la tabla creada
SELECT * FROM audit_emp;












--Escribe un disparador que controle que los nuevos departamentos creados se situen ubicados en la ciudad de 'Oxford'
--Solo se  ejecuta una vez
CREATE OR REPLACE TRIGGER ubicacion_departamentos
BEFORE INSERT ON departments --Antes de ...

DECLARE
    loc_oxford departments.location_id%type;
BEGIN
    SELECT location_id into loc_oxford
        FROM locations
        WHERE city ='Oxford';
    
END ubicacion_departamentos;

        SELECT location_id
            FROM locations
            WHERE city = 'Oxford';


--Escribe un disparador que controle que los nuevos departamentos creados se situen ubicados en la ciudad de 'Oxford'
-- se ejecuta por cada fila
CREATE OR REPLACE TRIGGER ubicacion_departamentos
BEFORE INSERT ON departments --Antes de ...
FOR EACH ROW 

DECLARE
    loc_oxford departments.location_id%type;
BEGIN
    SELECT location_id into loc_oxford
        FROM locations
        WHERE city ='Oxford';
    
    IF :new.location_id !=loc_oxford THEN
        RAISE_APLICATION_ERROR(20040, 'LOS NUEVOS DEPARTAMENTOS DEBEN ESTAR UBICADOS EN OXFORD');
    END IF;


END ubicacion_departamentos;

        INSERT INTO departments
        VALUES (280, 'Education', 103, 250)