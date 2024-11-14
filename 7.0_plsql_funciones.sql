--Cree una función denominada get_anual_comp, que calcule el salario anual de un empleado mediante la siguiente fórmula.
    
--salarioAnual := salary*12+commision_pct*salary*12 
--NVL -> le decimos que valor poner si es nulo 
    
CREATE OR REPLACE FUNCTION get_anual_comp (sal employees.salary%TYPE, comm employees.commission_pct%TYPE)
    RETURN NUMBER IS
BEGIN
    RETURN (NVL(sal,0) * 12 + (NVL(comm,0) * nvl(sal,0)* 12));
END get_anual_comp; 


--Hacemos la consulta con la función
SELECT employee_id, last_name, get_anual_comp(salary,commission_pct) "Salario Anual"
FROM employees WHERE department_id=30; 


--Cree una función denominada get_dept_emp, devuelva el nombre del departamento de un empleado con su ID 

CREATE OR REPLACE FUNCTION get_dept_emp (eid employees.employee_id%TYPE)
    RETURN departments.department_name%TYPE
IS
    dept_name departments.department_name%TYPE;
BEGIN
    SELECT department_name INTO dept_name
    FROM departments JOIN EMPLOYEES USING (department_id)
    WHERE employee_id= eid;

    RETURN dept_name;
END get_dept_emp; 


--Mostramos por pantalla el resultado de la función
SET SERVEROUTPUT ON;
BEGIN
DBMS_OUTPUT.PUT_LINE('El departamento es: ' || get_dept_emp(201) );
END; 


