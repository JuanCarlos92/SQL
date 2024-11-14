ALTER SESION SET “_oracle_script” = true

--Crear usuario:
CREATE USER usuario_prueba IDENTIFIED BY oracle

--Borrar usuario:
DROP USER usuario_prueba

--Cambiar contraseña de HR:
ALTER USER HR IDENTIFIED BY oracle

--CREAR/DEFINIR ROLES:
CREATE ROLE Administrar

GRANT SELECT, INSERT, DELETE ON Employees TO Administrar;
GRANT Administrar TO GBA

--QUITAR Y BORRAR ROLES:
REVOKE Administrar FROM GBA

DROP ROLE Administrar

--DAR PRIVILEGIOS DE UN USUARIO:
GRANT UPDATE, INSERT, SELECT ON Employees TO GBA

GRANT UPDATE (first_name, last_name, salary) ON Employees TO GBA

--ELIMINAR PRIVILEGIO DE UN USUARIO:
REVOKE UPDATE, INSERT, SELECT ON Employees TO GBA

REVOKE ALL PRIVILEGES ON Employees FROM GBA
