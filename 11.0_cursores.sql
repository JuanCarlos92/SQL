/*
Cree un bloque PL/SQL que realice las siguientes acciones:

    -En la sección de declaraciones, declare e inicialice una variable llamada
    v_deptno de tipo NUMBER. Asigne un valor de identificador de departamento
    válido.
    
    -Declare un cursor llamado c_emp_cursor, que recupere last_name, salary
    manager_id de los empleados que trabajan en el departamento especificado en
    v_deptno.

    -En la sección ejecutable, utilice el bucle FOR de cursor para realizar operaciones
    en los datos recuperados. Si el salario del empleado es menor que 5.000 y si el
    identificador de su superior es 101 o 124, aparece el mensaje “<<last_name>>
    Merece un aumento”. De lo contrario, aparece el mensaje “<<last_name>> No
    merece un aumento”
*/
SET SERVEROUTPUT ON;

--CON FOR
DECLARE

    v_deptno employees.department_id%TYPE := &introduzca_un_id_de_departamento;
    
    -- Declaracion cursor
    CURSOR c_emp_cursor IS 
        SELECT last_name, salary, manager_id 
            FROM employees
            WHERE department_id = v_deptno;

BEGIN

    FOR emp IN c_emp_cursor
    LOOP
        IF emp.salary <5000 AND emp.manager_id IN (101,124) THEN
            DBMS_OUTPUT.PUT_LINE(emp.last_name || 'merece un aumento')
        ELSE
            DBMS_OUTPUT.PUT_LINE(emp.last_name || 'no merece un aumento')
        END IF;

    END LOOP;


END;

--CON FETCH
DECLARE

    v_deptno employees.department_id%TYPE := &introduzca_un_id_de_departamento;
    
    -- Declaracion cursor
    CURSOR c_emp_cursor IS 
        SELECT last_name, salary, manager_id 
            FROM employees
            WHERE department_id = v_deptno;
    
    v_last_name employees.last_name%type:
    v_salary employees.salary%type;
    v_manager_id employees.manager_id%type;

BEGIN

    --Abrir cursor
    OPEN c_emp_cursor;

    LOOP
    --Almacenamos la informacion de cada fila (una por iteracion del bucle) en variables con INTO
    FETCH c_emp_cursor INTO v_last_name, v_salary, v_manager_id;

        IF v_salary <5000 AND v_manager_id IN (101,124) THEN
            DBMS_OUTPUT.PUT_LINE(v_last_name || 'merece un aumento')
        ELSE
            DBMS_OUTPUT.PUT_LINE(v_last_name || 'no merece un aumento')
        END IF;
    --Condicion de salida del bucle
    EXIT WHEN c_emp_cursor%NOT_FOUND; --Devuelve true si no hay más filas y false  si hay más filas

    END LOOP;

    --Cerrar el cursor
    CLOSE c_emp_cursor;

END;
