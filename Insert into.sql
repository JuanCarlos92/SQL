insert into Paciente(COD_PACIENTE,NOMBRE, APELLIDOS, DIRECCION, POBLACION, TELEFONO) 
values (1,'Juan', 'fernandez', 'C/Paloma', 'Granada',635219623);
INSERT INTO Paciente VALUES (2, 'José', 'Perez', 'C/Mirlo', 'Granada', 698532114);
INSERT INTO Paciente VALUES (3, 'Francisco', 'Ruiz', 'C/Aguila', 'Granada', NULL);
INSERT INTO Paciente (nombre, cod_paciente, apellidos, direccion, poblacion )
VALUES ('María',4,'Cano','C/Perdiz',3);
INSERT INTO Paciente (nombre, cod_paciente, apellidos, direccion, poblacion,
telefono) VALUES ('Luisa', 5,'Martinez','C/Amapola','Sevilla',625489321);

INSERT INTO Medico (cod_medico, nombre, apellidos, especialidad) VALUES
(1,'Olivia','Lorca','Traumatología');
INSERT INTO Medico VALUES (2,'Adolfo','Salazar','Neurología');
INSERT INTO Medico (cod_medico, especialidad, nombre, apellidos) VALUES
(3,'Dermatología','Pedro','Aguilera');

INSERT INTO Ingreso (cod_ingreso, numero_habitacion, numero_cama, cod_medico,
cod_paciente) VALUES (1,21,1,1,1);
INSERT INTO Ingreso (cod_ingreso, numero_habitacion, numero_cama, cod_medico,
cod_paciente) VALUES (2,13,2,3,2);
INSERT INTO Ingreso (cod_ingreso, numero_habitacion, numero_cama, cod_medico,
cod_paciente) VALUES (3,35,2,2,3);
INSERT INTO Ingreso (cod_ingreso, numero_habitacion, numero_cama, cod_medico,
cod_paciente) VALUES (4,50,1,3,4); 

CREATE TABLE Paciente_Derma (
 cod_paciente NUMBER(4) CONSTRAINT pk_paciente_derma PRIMARY KEY,
 nombre VARCHAR2(50) CONSTRAINT nnull_nombre_paciente_derma NOT NULL,
 apellidos VARCHAR2(50) CONSTRAINT nnull_apellidos_paciente_derma NOT NULL
 );

INSERT INTO Paciente_Derma
(SELECT p.cod_paciente, p.nombre, p.apellidos
FROM paciente p JOIN Ingreso i ON (p.cod_paciente=i.cod_paciente)
JOIN medico m on (m.cod_medico=i.cod_medico)
WHERE m.especialidad ='Dermatología')

