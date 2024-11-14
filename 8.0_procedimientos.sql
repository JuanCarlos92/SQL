SET serveroutput ON
--Cree un procedimiento denominado ADD_JOB para insertar un nuevo trabajo en
--la tabla JOBS. Se deben proporcionar el identificador del trabajo (JOB_ID) y el
--título del trabajo (JOB_TITLE) por medio de parámetros.


CREATE OR REPLACE Procedure add_job(j_id IN jobs.jobs_id%type, j_tit IN jobs.jobs_id%type) IS

BEGIN
    INSERT INTO jobs (job_id, job_title) VALUES (j_id, j_tit);

    DBMS_OUTPUT.PUT_LINE('Se ha insertado el nuevoi trabajo cuyo id es ' || j_id || ' y su nombres es ' || j_tit);

END add_job;

--Pruebe el procedimiento implementado anteriormente mediante la sentencia EXECUTE 

EXECUTE add_job ('Prof','Profesor')

--y mediante un bloque anónimo

DECLARE
    job_id, job_title%type:= 'Alm';
    j_id, j_tit%Type:_ 'Alumno'

BEGIN
    add_job (j_id, j_tit);

END;


--Cree un procedimiento denominado UP_JOB para actualizar el título asignado a
--un trabajo (JOB_TITLE) a partir de si identificador de trabajo (JOB_ID), esta
--información debe ser enviada a través de parámetros. Una vez compilador el
--procedimiento UP_JOB, pruebe dicho procedimiento a través del paso de
--parámetro por nombre.

CREATE OR REPLACE PROCEDURE UP_JOB (j_id IN jobs.job_id%Type, j_tit IN job_title%Type) IS

BEGIN
    UPDATE jobs set job_title = j_tit where job_id = j_id;
    DBMS_OUTPUT.PUT_LINE('Se ha actualizado trabajo cuyo id es ' || j_id || ' y su nombres es ' || j_tit);



END UP_JOB;

--Prueba mediante la sentencia EXECUTE 

EXECUTE UP_JOB (j_tit =>'Alumnado', j_id => 'Alm');


--Cree un procedimiento denominado info_emp que obtenga el nombre y el salario
--de un empleado a través de su id. Cree tantos parámetros como crea necesario
--y establezca si son parámetros de tipo IN o de tipo OUT en función de sus
--necesidades

CREATE OR REPLACE PROCEDURE info_emp (
    e_id IN employees.employee_id%Type, 
    nombre OUT employees.first_name%Type
    salario OUT employees.salary%Type
    ) IS

BEGIN
   SELECT first_name, salario 
   INTO nombre, salario
   FROM employees
   WHERE employee_id= e_id;


END info_emp;

--Prueba mediante bloque anonimo

DECLARE
nom employees.first_name%Type;

sal employees.salary%Type;

BEGIN

info_emp(100, nom, sal);

DBMS_OUTPUT.PUT_LINE(nom || 'gana ' || sal);

END;