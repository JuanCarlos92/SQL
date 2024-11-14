--CONSULTAS SELECT:--

--Nombre y identificador de cada departamento--
SELECT department_name, manager_id FROM departments

--Calcular salario mensual de los empleados--
SELECT last_name, salary, salary/12 FROM employees

--Alias--
SELECT last_name AS “Apellido”, salary*12 AS “Sueldo Anual” FROM employees

--Concatenación--
SELECT last_name || job_id AS “Empleado y puesto trabajo” FROM employees

--Elimina filas duplicadas--
SELECT DISTINCT department_id FROM Employees

--Filtrado Restricción WHERE--

--? Trabajadores cuyo department_id=90
SELECT employee_id, last_name, job_id, department_id FROM employees 
WHERE department_id=90

--? Empleados cuyo salario sea inferior a 2800€
SELECT employee_id, last_name, job_id, department_id, salary FROM employees 
WHERE salary<2800

--? Empleados cuyo salario entre 2800 y 3100
SELECT employee_id, last_name, job_id, department_id, salary FROM employees 
WHERE salary BETWEEN 2800 AND 3100

--? Empleados que tengan un código de jefe (manager_id 100, 101, 201)
SELECT employee_id, last_name, job_id, manager_id FROM employees 
WHERE manager_id IN (100,101,201)

--? Empleados que ganen más de 10000 € y que trabajen en un puesto que contenga MAN
SELECT employee_id, last_name, job_id, salary FROM employees 
WHERE salary>=10000 AND job_id LIKE ‘%MAN%’

--Ordenación ORDER BY--

--? Orden de trabajos en función del salario mínimo ASCENDENTE (predeterminado)

SELECT job_id, job_title, min_salary FROM jobs ORDER BY min_salary 

--? Orden de trabajos en función del salario mínimo DESCENDENTE

SELECT job_id, job_title, min_salary FROM jobs ORDER BY min_salary DESC

--? Orden de trabajos en función del salario mínimo ASCENDENTE

SELECT job_id, job_title, min_salary FROM jobs ORDER BY min_salary ASC

--Devolver número de filas de la tabla COUNT--

--? Mostrar número total de empleados en el departamento cuyo identificador es 50

SELECT COUNT (*) FROM employees WHERE department_id=50

--Agrupar las filas duplicadas en grupos GROUP BY

--? Obtener salario medio de cada uno de los departamentos mostrando el department_id y salario medio

SELECT department_id AVG(salary) FROM employees GROUP BY department_id

--? Obtener salario medio de cada uno de los departamentos sin mostrar el department_id

SELECT AVG(salary) FROM employees GROUP BY department_id

--? Obtener el salario medio de cada uno de los tipos de puestos de trabajo, desglosando por departamento y tipo de puesto de trabajo

SELECT department_id, job_id, AVG(salary) FROM employees 
GROUP BY department_id, job_id ORDER BY job_id

--Filtrado Restricción HAVING (Filtrado para el GRUP BY)--

--? Obtener salario máximo de cada departamentos, teniendo en cuenta que sólo son de interés los departamentos que el salario máximo es superior a 10000

SELECT department_id, MAX(salary) FROM employees GROUP BY department_id 
HAVING MAX (salary) >10000

--? Obtener el id del trabajo y salario total por cada puesto de trabajo,  sin mostrar los job_id  que contengan ‘REP’  y que tengan un salario total >13000, y ordenados por salario total ASCENDENTE

SELECT job_id, SUM(salary) FROM employees WHERE job_id NOT LIKE ‘%REP%’ 
GROUP BY job_id HAVING SUM (salary) > 13000 ORDER BY SUM(salary)

--NATURAL JOIN Uniones de tablas igualitarias --
--(uniones de columna [distintas] en diferentes tablas)--

--? Consultar todos los datos de los departamentos, referenciados en su informe el department_id, department_name, location_id, city

SELECT department_id, department_name, location_id, city FROM departments
NATURAL JOIN locations

--? Consultar todos los datos de los departamentos con department_id (20, 30) , referenciados en su informe el department_id, department_name, location_id, city

SELECT department_id, department_name, location_id, city FROM departments
NATURAL JOIN locations WHERE department_id IN (20, 50)

--USING Uniones de tablas igualitarias--
--(uniones de diferentes tablas [1 columna mismo nombre])--

--? Union igualitaria para la columna department_id

SELECT employee_id, last_name, location_id, department_id FROM Employees 
JOIN Departments USING (department_id)

--USING Uniones de tablas igualitarias--
--(uniones de diferentes tablas [1 columna diferente nombre y valor])--

--? Union igualitaria con alias para la columna department_id de ambas tablas

SELECT e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id 
FROM Employees e JOIN Departments d ON (e.department_id = d.department_id)

--OUTER Uniones de tablas igualitarias--

--LEFT OUTER JOIN--

--? Todas las filas de las tablas  Departments y la tabla Employees, y además todas las filas que no cumplen la condición en la fila de la izquierda (Employees)

SELECT e.last_name, e.department_id, d.department_name
FROM Employees e LEFT OUTER JOIN Departments d 
ON (e.department id = d.department id)

--RIGHT OUTER JOIN--

--? Todas las filas de las tablas  Departments y la tabla Employees, y además todas las filas que no cumplen la condición en la fila de la derecha (Departments)

SELECT e.last_name, e.departrnent_id, d.departrnent_name 
FROM Ernployees e RIGHT OUTER JOIN Departrnents d 
ON (e.departrnent_id = d.departrnent_id)

--FULL OUTER JOIN--

--? Todas las filas de las tablas  Departments y la tabla Employees, y además todas las filas que no cumplen la condición en ambas tablas

SELECT e.last_name, e.departrnent_id, d.departrnent_name 
FROM Ernployees e FULL OUTER JOIN Departrnents d 
ON (e.departrnent_id = d.departrnent_id); 

--Uniones no igualitarias--

--? Unión que contiene algún operador diferente del operador de igualdad.  (AND)

SELECT e.last_narne, e.salary, j.job_title FROM Ernployees e 
JOIN Jobs j ON e.salary BETWEEN j.min_salary AND j.max_salary

--Uniones Cruzadas--

--? Union entre tablas que todas las filas de la primera tabla se unen a todas las filas de la segunda tabla

group by 