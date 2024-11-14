--Crear tabla:
CREATE TABLE [Tabla] (
dni VARCHAR2(9),
tlf NUMBER(9),
nombre VARCHAR2(59))

--Agregar columna:
ALTER TABLE  Empleado ADD (estado_civil VARCHAR2(7))

--Modificar tabla:
ALTER TABLE Empleado MODIFY (nombre VARCHAR(39))

--Borrar columna:
ALTER TABLE Empleado DROP (estado_civil)

--Borrar tabla:
DROP TABLE empleado


Primary key:
--> Columna:
cod_empleado NUMBER(2) CONSTRAINT empleado_pk PRIMARY KEY

--> Tabla:
CONSTRAINT empleado_pk PRIMARY KEY (cod_empleado)

--> Compuesta:
CONSTRAINT prov_product_pk PRIMARY KEY (cod_proveedor, cod_producto)

Foreign key:

--> Columna:
cod_departamento NUMBER(2) REFERENCES departamento (cod_departamento),
CONSTRAINT empleado_pk FOREIGN KEY (cod_empleado)

--> Tabla:
CONSTRAINT empleado_fk FOREIGN KEY (cod_departamento)
REFERENCES departamento (cod_departamento)

--Nulo:
NOT NULL

--Unico:
UNIQUE

--Tabla:
UNIQUE (email)

Restricción:

--? Columna:
sueldo number(6,2) CONSTRAINT sueldo_minimo CHECK (sueldo >1000)

--? Tabla:
CONSTRAINT sueldo_minimo CHECK (sueldo >1000)

--Borrar restricción:
ALTER TABLE empleado DROP CONSTRAINT sueldo_minimo
