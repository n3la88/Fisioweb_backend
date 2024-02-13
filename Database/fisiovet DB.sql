-- -----------------------------------------------------------------
-- -----------------DATABASE----------------------------------------
-- -----------------------------------------------------------------
--
-- Creation of DataBase `fisiowebdb`
--
CREATE DATABASE fisiowebdb;
--
-- Use DB `fisiowebdb`
--
USE fisiowebdb;
-- ---------------------------------------------------------------------------
-- -----------------CREATION OF TABLES----------------------------------------
-- ---------------------------------------------------------------------------
--
-- Table structure for table `bitacora`
--
CREATE TABLE `bitacora` (
  `id_error` int NOT NULL AUTO_INCREMENT ,
  `codigo_error` varchar(20) DEFAULT NULL,
  `error_descripcion` varchar(100) DEFAULT NULL,
  `fecha_error` datetime DEFAULT NULL,
  `origen_error` varchar(20) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (id_error) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------
--
-- Table structure for table `citas`
--
CREATE TABLE `citas` (
  `id_cita` int NOT NULL AUTO_INCREMENT,
  `descripcion_cita` varchar(100) NOT NULL,
  `fecha_cita` datetime NOT NULL,
  `id_mascota` int NOT NULL,
  `id_empleado` int NOT NULL,
  `id_servicio` int NOT NULL,
  `id_estado` int NOT NULL,
  PRIMARY KEY (id_cita) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- --------------------------------------------------------
--
-- Table structure for table `cliente`
--
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(50) DEFAULT NULL,
  `apellido1_cliente` varchar(50) DEFAULT NULL,
  `apellido2_cliente` varchar(50) DEFAULT NULL,
  `telefono_cliente` int NULL,
  `id_usuario` int NOT NULL,
  `cedula_cliente` varchar(20) NOT NULL,
  PRIMARY KEY (id_cliente) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- --------------------------------------------------------
--
-- Table structure for table `empleado`
--
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre_empleado` varchar(50) DEFAULT NULL,
  `apellido1_empleado` varchar(50) DEFAULT NULL,
  `apellido2_empleado` varchar(50) DEFAULT NULL,
  `puesto_empleado` varchar(20) DEFAULT NULL,
  `id_usuario` int NOT NULL,
  `telefono_empleado` int DEFAULT NULL,
  `cedula_empleado` varchar(20) NOT NULL,
  PRIMARY KEY (id_empleado) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- --------------------------------------------------------
--
-- Table structure for table `estado_cita`
--
CREATE TABLE `estado_cita` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `descripcion_estado` varchar(20) NOT NULL,
  PRIMARY KEY (id_estado) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- --------------------------------------------------------
--
-- Table structure for table `estado_usuario`
--
CREATE TABLE `estado_usuario` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `descripcion_estado` varchar(20) NOT NULL,
  PRIMARY KEY (id_estado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- --------------------------------------------------------
--
-- Table structure for table `faq`
--
CREATE TABLE `faq` (
  `id_ayuda` int NOT NULL AUTO_INCREMENT,
  `pregunta_titulo` varchar(50) DEFAULT NULL,
  `pregunta_respuesta` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (id_ayuda)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- --------------------------------------------------------
--
-- Table structure for table `horario`
--
CREATE TABLE `horario` (
  `id_horario` int NOT NULL AUTO_INCREMENT,
  `hora_horario` datetime DEFAULT NULL,
  `descripcion_horario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (id_horario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- --------------------------------------------------------
--
-- Table structure for table `horario_empleado`
--
CREATE TABLE `horario_empleado` (
  `id_empleado` int NOT NULL,
  `id_horario` int NOT NULL,
  `id_horario_empleado` int NOT NULL AUTO_INCREMENT,
   PRIMARY KEY (id_horario_empleado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- --------------------------------------------------------
--
-- Table structure for table `mascota`
--
CREATE TABLE `mascota` (
  `id_mascota` int NOT NULL AUTO_INCREMENT,
  `nombre_mascota` varchar(20) NOT NULL,
  `edad_mascota` int DEFAULT NULL,
  `detalles_mascota` varchar(1000) DEFAULT NULL,
  `id_raza` int NOT NULL,
  `id_cliente` int NOT NULL,
   PRIMARY KEY (id_mascota)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- --------------------------------------------------------
--
-- Table structure for table `raza`
--
CREATE TABLE `raza` (
  `id_raza` int NOT NULL AUTO_INCREMENT,
  `descripcion_raza` varchar(30) DEFAULT NULL,
  PRIMARY KEY (id_raza)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- --------------------------------------------------------
--
-- Table structure for table `roles`
--
CREATE TABLE `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `descripcion_rol` varchar(10) NOT NULL,
  PRIMARY KEY (id_rol)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Table structure for table `servicios`
--
CREATE TABLE `servicios` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `servicio_descripcion` varchar(50) DEFAULT NULL,
    PRIMARY KEY (id_servicio)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- --------------------------------------------------------
--
-- Table structure for table `usuario`
--
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `correo_usuario` varchar(50) DEFAULT NULL,
  `contrasena_usuario` varchar(50) NOT NULL,
  `id_rol` int NOT NULL,
  `id_estado` int NOT NULL,
   PRIMARY KEY (id_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- --------------------------------------------------------

-- --------------------------------------------------------------------
-- -----------------CONSTRAINTS----------------------------------------
-- --------------------------------------------------------------------
--
-- Constraints for table `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
--
-- Constraints for table `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `mascota` (`id_mascota`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`),
  ADD CONSTRAINT `citas_ibfk_4` FOREIGN KEY (`id_estado`) REFERENCES `estado_cita` (`id_estado`);
--
-- Constraints for table `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
--
-- Constraints for table `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
--
-- Constraints for table `horario_empleado`
--
ALTER TABLE `horario_empleado`
  ADD CONSTRAINT `horario_empleado_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  ADD CONSTRAINT `horario_empleado_ibfk_2` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id_horario`);
--
-- Constraints for table `mascota` ---------------------------------------------------------------
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`id_raza`) REFERENCES `raza` (`id_raza`),
  ADD CONSTRAINT `mascota_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);
--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estado_usuario` (`id_estado`);
-- --------------------------------------------------------------------------
-- -----------------STORED PROCEDURES----------------------------------------
-- --------------------------------------------------------------------------
-- --------------------------------------------------------------------------
CREATE PROCEDURE CambiarContrasena (IN id_usuario INT, IN contrasena_usuario CHAR(64))   
UPDATE usuario u
SET u.contrasena_usuario = contrasena_usuario
WHERE u.id_usuario = id_usuario;
-- --------------------------------------------------------------------------
CREATE PROCEDURE ConsultarUsuarioPorCorreo (IN correo VARCHAR(50))   
SELECT id_usuario, correo_usuario, contrasena_usuario,
id_rol, id_estado FROM USUARIO
WHERE correo_usuario = correo;
-- --------------------------------------------------------------------------
CREATE  PROCEDURE ConsultarUsuarios ()   SELECT * from usuario;
-- --------------------------------------------------------------------------
CREATE PROCEDURE IniciarSesion (IN correo_usuario VARCHAR(50), IN contrasena_usuario CHAR(64))   
SELECT id_usuario, correo_usuario, contrasena_usuario,
id_rol, id_estado FROM USUARIO u
WHERE u.correo_usuario =  correo_usuario
and u.contrasena_usuario = contrasena_usuario;
-- --------------------------------------------------------------------------
CREATE  PROCEDURE RegistrarUsuario (IN correo_usuario VARCHAR(50), IN contrasena_usuario CHAR(64), IN id_rol INT)   
INSERT INTO usuario (correo_usuario, contrasena_usuario, id_rol, id_estado)
VALUES (correo_usuario, contrasena_usuario, id_rol, 1);
-- --------------------------------------------------------------------------
   CREATE PROCEDURE ConsultarMascotas()
   SELECT * FROM MASCOTA;
-- --------------------------------------------------------------------------
CREATE PROCEDURE RegistrarMascota (IN nombre_mascota VARCHAR(20),edad_mascota INT, 
                                   detalles_mascota VARCHAR(1000),id_raza INT, id_cliente INT)
	   INSERT INTO MASCOTA(nombre_mascota,edad_mascota,detalles_mascota,id_raza,id_cliente)
                    VALUES(nombre_mascota,edad_mascota,detalles_mascota,id_raza,id_cliente);
-- --------------------------------------------------------------------------
CREATE PROCEDURE ActualizarMascota (IN id_mascota_p INT, IN nombre_mascota_p VARCHAR(20),edad_mascota_p INT, 
                                   detalles_mascota_p VARCHAR(1000),id_raza_p INT, id_cliente_p INT)
						           UPDATE MASCOTA SET nombre_mascota = nombre_mascota_p,
                                                      edad_mascota = edad_mascota_p,
                                                      detalles_mascota = detalles_mascota_p,
                                                      id_raza = id_raza_p,
                                                      id_cliente = id_cliente_p
											    WHERE id_mascota = id_mascota_p;
-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------
CREATE PROCEDURE BorrarMascota(IN id INT)
                    DELETE FROM MASCOTA WHERE id_mascota = id;
-- --------------------------------------------------------------------------------- 
CREATE  PROCEDURE ConsultarClientes ()  SELECT * from cliente;
-- ---------------------------------------------------------------------------------
CREATE  PROCEDURE ConsultarClientePorID (IN  id_usuario INT)   
SELECT * from cliente c
WHERE c.id_usuario = id_usuario;
-- ---------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE RegistrarCliente (IN nombre_cliente varchar(50),apellido1_cliente varchar(50), 
                                   apellido2_cliente varchar(50),telefono_cliente INT, cedula_cliente varchar(20))
       BEGIN       
       DECLARE id_usuario_v INT DEFAULT 0;
           SELECT MAX(id_usuario) INTO id_usuario_v FROM USUARIO;
	   INSERT INTO cliente(nombre_cliente,apellido1_cliente,apellido2_cliente,telefono_cliente,id_usuario,cedula_cliente) 
                    VALUES(nombre_cliente,apellido1_cliente,apellido2_cliente,telefono_cliente,id_usuario_v,cedula_cliente); 
	   END// 
DELIMITER ;
-- ---------------------------------------------------------------------------------
   CREATE PROCEDURE ConsultarRazas()
   SELECT * FROM raza ;   
-- ---------------------------------------------------------------------------------
   DELIMITER $$
CREATE PROCEDURE RecuperarContrasena (IN correo_usuario varchar(50), IN contrasena_usuario CHAR(64))   
UPDATE usuario us
SET us.contrasena_usuario = contrasena_usuario
WHERE us.correo_usuario = correo_usuario$$
DELIMITER ;
------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE `ActualizarCliente`(IN `id_usuario` INT, IN `nombre_cliente` VARCHAR(50), IN `apellido1_cliente` VARCHAR(50), IN `apellido2_cliente` VARCHAR(50), IN `telefono_cliente` INT, IN `cedula_cliente` VARCHAR(20))
UPDATE CLIENTE c SET 
c.nombre_cliente = nombre_cliente,
c.apellido1_cliente = apellido1_cliente,
c.apellido2_cliente = apellido2_cliente,
c.telefono_cliente = telefono_cliente,
c.cedula_cliente = cedula_cliente
WHERE c.id_usuario = id_usuario$$
DELIMITER ;
-- ---------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE `ConsultarMascotasPorCliente`(IN `id_cliente` INT)
SELECT * FROM MASCOTA M
where M.id_cliente = id_cliente
DELIMITER ;
-- ---------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE `ConsultarMascotaYRazaPorId`(IN `id_mascota_p` INT)
SELECT m.*,r.descripcion_raza
FROM mascota m
INNER JOIN raza r ON m.id_raza = r.id_raza
where m.id_mascota = id_mascota_p$$
DELIMITER ;
-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE `ConsultarMascota`(IN `id_mascota_p` INT)
SELECT m.*,r.descripcion_raza
FROM mascota m
INNER JOIN raza r ON m.id_raza = r.id_raza
where m.id_mascota = id_mascota_p$$
DELIMITER ;
-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------

CREATE PROCEDURE `VerMascotaYRaza`(IN `id_cliente` INT)
SELECT m.*,r.descripcion_raza
FROM mascota m
INNER JOIN raza r ON m.id_raza = r.id_raza
where m.id_cliente = id_cliente



-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE `RegistrarCita`(IN descripcion_cita VARCHAR(100), IN horaInicio_cita datetime, IN horaFin_cita datetime, IN id_mascota int, IN id_empleado int, IN id_servicio int,IN id_estado int)
BEGIN
SET id_estado = 3;
INSERT INTO citas (descripcion_cita, horaInicio_cita, horaFin_cita, id_mascota, id_empleado, id_servicio, id_estado)
VALUES (descripcion_cita, horaInicio_cita, horaFin_cita, id_mascota, id_empleado, id_servicio, id_estado);
END// 
DELIMITER ;
-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------

CREATE PROCEDURE `ConsultarServicios`()
SELECT * FROM servicios;


-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------

CREATE PROCEDURE DatosBitacora (IN codigo_error_p varchar(20), IN error_descripcion_p varchar(100), IN fecha_error_p datetime, IN origen_error_p varchar(20), IN id_usuario_p int )
insert into bitacora (codigo_error, error_descripcion, fecha_error, origen_error, id_usuario)
			  values (codigo_error_p,error_descripcion_p,fecha_error_p,origen_error_p,id_usuario_p);
              

-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------
CREATE PROCEDURE ConsultarCita(IN id_mascota int)
SELECT A.*
FROM CITAS A
WHERE A.id_mascota = id_mascota
  AND A.id_cita = (select max(A.id_cita)from CITAS A where A.id_mascota = id_mascota);
-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------
CREATE PROCEDURE ConsultarCitas()
Select *
From CITAS;
-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------03/13 * NEW table ESPECIE ****************
--
-- Table structure for table `especie`
--
CREATE TABLE `especie` (
  `id_especie` int NOT NULL AUTO_INCREMENT,
  `descripcion_especie` varchar(30) DEFAULT NULL,
  PRIMARY KEY (id_especie)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Alter Tables impacted to add the ID_ESPECIE
--
ALTER TABLE raza
ADD COLUMN id_especie int NOT NULL;
--
-- Remove every value from the tables to be able to add the foreign keys. Make sure to restart the auto_increment
--

ALTER TABLE raza AUTO_INCREMENT = 1;
--
-- Add the foreign keys
--
ALTER TABLE `raza` 
ADD CONSTRAINT `raza_ibfk_1` FOREIGN KEY (`id_especie`) REFERENCES `especie` (`id_especie`); 
-- --------------------------------------------------------03/13 **Inserting data on especie including especie
--
-- Dumping data for table `especie`
--
INSERT INTO `especie` (`descripcion_especie`) VALUES
      ('Canina'),
      ('Felina'); 
-- --------------------------------------------------------
-- --------------------------------------------------------03/13 **Inserting data on Raza including especie
--
-- Dumping data for table `raza`
--
INSERT INTO `raza`(`descripcion_raza`, `id_especie`)VALUES
										('Bull Terrier', 1),
                                        ('Fox Terrires', 1),
										('Angora', 2),
                                        ('Siamés', 2),
                                        ('Frenche Poodle mini toy', 1);
-- --------------------------------------------------------
-- --------------------------------------------------------
-- --------------------------------------------------------------------------------- 03/13 -** NEW ConsultarEspecies
CREATE PROCEDURE ConsultarEspecies()
SELECT * FROM especie ;   
-- --------------------------------------------------------
-- --------------------------------------------------------------------------------- 03/13 -** NEW RegistrarEmpleado
DELIMITER //
CREATE PROCEDURE RegistrarEmpleado(IN nombre_empleado varchar(50),apellido1_empleado varchar(50), 
                                   apellido2_empleado varchar(50),puesto_empleado varchar(20), telefono_empleado INT, cedula_empleado varchar(20))
       BEGIN
       
       DECLARE id_usuario_v INT DEFAULT 0;
           SELECT MAX(id_usuario) INTO id_usuario_v FROM USUARIO;
	   INSERT INTO empleado(nombre_empleado,apellido1_empleado,apellido2_empleado,puesto_empleado,id_usuario,telefono_empleado,cedula_empleado) 
                    VALUES(nombre_empleado,apellido1_empleado,apellido2_empleado,puesto_empleado,id_usuario_v,telefono_empleado,cedula_empleado); 
	   END// 
DELIMITER ;
-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------03/13 ** Modify ConsultarClientePorCorreo

CREATE PROCEDURE ConsultarClientePorCorreo (IN correo_usuario VARCHAR(50))   
SELECT nombre_cliente, apellido1_cliente
  from USUARIO U, CLIENTE C
  WHERE C.ID_USUARIO = U.ID_USUARIO
  AND U.CORREO_USUARIO = correo_usuario;

-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------03/13 **NEW ConsultarEmpleadoPorCorreo

CREATE PROCEDURE ConsultarEmpleadoPorCorreo (IN correo_usuario VARCHAR(50))   
SELECT nombre_empleado, apellido1_empleado
  from USUARIO U, EMPLEADO E
  WHERE E.ID_USUARIO = U.ID_USUARIO
  AND U.CORREO_USUARIO = correo_usuario;

-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------03/15 **NEW ConsultarClientes Modificado

DROP procedure IF EXISTS `fisiowebdb`.`ConsultarClientes`;
DELIMITER $$
USE `fisiowebdb`$$
CREATE PROCEDURE `ConsultarClientes`()
SELECT C.*, U.* from cliente C inner join usuario U on
C.id_usuario = U.id_usuario$$

DELIMITER ;

-- ---------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------03/16 **NEW ConsultarClientePorID Modificado

USE `fisiowebdb`;
DROP procedure IF EXISTS `ConsultarClientePorID`;

USE `fisiowebdb`;
DROP procedure IF EXISTS `fisiowebdb`.`ConsultarClientePorID`;


DELIMITER $$
USE `fisiowebdb`$$
CREATE PROCEDURE `ConsultarClientePorID`(IN  id_usuario INT)
SELECT C.*, U.* from cliente C inner join usuario U on
C.id_usuario = U.id_usuario
WHERE C.id_usuario = id_usuario$$

DELIMITER ;


CREATE PROCEDURE `ConsultarRaza`(IN id_especie int)
SELECT A.* FROM raza A
where A.id_especie = id_especie;

CREATE PROCEDURE `ActualizarFAQ`(IN id_ayuda_p INT, IN pregunta_titulo_p VARCHAR(50), IN pregunta_respuesta_p VARCHAR(1000))
UPDATE faq SET pregunta_titulo = pregunta_titulo_p,
                                                      pregunta_respuesta = pregunta_respuesta_p
											    WHERE id_ayuda = id_ayuda_p;
                                                
CREATE PROCEDURE `ActualizarServicio`(IN id_servicio_P INT, IN servicio_descripcion_p VARCHAR(50), IN servicio_detalle_p VARCHAR(1000))
UPDATE servicios SET servicio_descripcion = servicio_descripcion_p,
                                                      servicio_detalle = servicio_detalle_p
											    WHERE id_servicio = id_servicio_p;
                                                
                                                
CREATE PROCEDURE `BorrarFAQ`(IN id INT)
DELETE FROM faq WHERE id_ayuda = id;


CREATE PROCEDURE `BorrarServicio`(IN id INT)
DELETE FROM servicios WHERE id_servicio = id;


CREATE PROCEDURE `ConsultarFAQ`()
SELECT * FROM faq;


-- ---------------------------------------------------------------------
-- -----------------DUMPING DATA----------------------------------------
-- ---------------------------------------------------------------------
--
-- Dumping data for table `estado_usuario`
--
INSERT INTO `estado_usuario` (`descripcion_estado`) VALUES
('activo'),
('deshabilitado ');
-- --------------------------------------------------------
--
-- Dumping data for table `roles`
--
INSERT INTO `roles` (`descripcion_rol`) VALUES
('admin'),
('empleado'),
('cliente');
-- --------------------------------------------------------
--
-- Dumping data for table `usuario`
--
INSERT INTO `usuario` ( `correo_usuario`, `contrasena_usuario`, `id_rol`, `id_estado`) VALUES
('famc.cr@gmail.com', '1245', 1, 1),
('fmc.cr@hotmail.com', '123', 3, 1),
('prueba@prueba.com', '123', 3, 1),
('test@test.com', '123', 3, 1);
-- --------------------------------------------------------
--
-- Dumping data for table `cliente`
--
INSERT INTO CLIENTE(NOMBRE_CLIENTE,APELLIDO1_CLIENTE,APELLIDO2_CLIENTE,TELEFONO_CLIENTE,ID_USUARIO,CEDULA_CLIENTE)
             VALUES('Andrea','Salazar','Jimenez',83457765,1,'1234567'),
                   ('Jairo','Bermudes','Solano',73457765,2,'9876543'),
                   ('Maria','Chaves','Otarola',63457765,3,'5432167');
-- ---------------------------------------------------------
--
-- Dumping data for table `mascota`
--       
select * from raza;    
select * from cliente;             
select * from usuario;
select * from roles;
select * from empleado;
INSERT INTO MASCOTA(`nombre_mascota`, `edad_mascota`, `detalles_mascota`, `id_raza`,`id_cliente`)
			 VALUES('Kiara',10,'Perro Bull Terrier con dolor al caminar',1,1),
                   ('Koki',12,'Perro de raza French poodle',5,2),
                   ('Mino',9,'Gato de raza Siamés',4,3);
			
   COMMIT;  
-- --------------------------------------------------------
--
-- Alter table `citas`
--
ALTER TABLE citas
DROP COLUMN fecha_cita;

ALTER TABLE citas
ADD COLUMN horaInicio_cita datetime NOT NULL;

ALTER TABLE citas
ADD COLUMN horaFin_cita datetime NOT NULL;
-- -------------------------------------------------------- 
--
-- Alter table `estado_cita`
--
ALTER TABLE estado_cita MODIFY COLUMN descripcion_estado VARCHAR(50);
-- -------------------------------------------------------- 
--
-- Alter table `horario`
--
ALTER TABLE horario
DROP COLUMN hora_horario;

ALTER TABLE horario
ADD COLUMN horaInicio_horario time NOT NULL;

ALTER TABLE horario
ADD COLUMN horaFin_horario time NOT NULL;
-- --------------------------------------------------------
--
-- Alter table `usuario`
--
ALTER TABLE usuario MODIFY COLUMN contrasena_usuario CHAR(64) NOT NULL;
--
-- Dumping data for table `horario`
--
INSERT INTO `horario` ( `horaInicio_horario`, `horaFin_horario`, `descripcion_horario`) VALUES
('08:00:00', '12:00:00', 'Lunes'),
('12:00:00', '2:00:00', 'Martes'),
('01:00:00', '05:00:00', 'Miercoles');
-- --------------------------------------------------------
--
-- Dumping data for table `empleado`
--
INSERT INTO `empleado` ( `nombre_empleado`, `apellido1_empleado`, `apellido2_empleado`, `puesto_empleado`, `id_usuario`, `telefono_empleado`, `cedula_empleado`) VALUES
    ('Mónica','Cespedes','Solano','Doctora',2,73457765,'9876543');
-- -------------------------------------------------------- 
--
-- Dumping data for table `servicios`
--
INSERT INTO `servicios` ( `servicio_descripcion`) VALUES
      ('Consulta general'),
      ('Láser Terapéutico'),
    ('Cirugia Ortopédica'),
    ('Magnetoterapia y Electroestimulación'),
    ('Ultrasonido'),
    ('Acupuntura y Electroacupuntura veterinaria'),
    ('Hidroterapia');
-- -------------------------------------------------------- 
--
-- Dumping data for table `estado_cita`
--
INSERT INTO `estado_cita` ( `descripcion_estado`) VALUES
      ('Cita cancelada'),
      ('Asistencia confirmada'),
    ('Confirmación Pendiente');
-- -------------------------------------------------------- 
--
-- Dumping data for table `citas`
--
INSERT INTO `citas` (`descripcion_cita`,`id_mascota`,`id_empleado`,`id_servicio`,`id_estado`,`horaInicio_cita`,`horaFin_cita`) VALUES
      ('cita para consultar dolor', 1,1,1,9,'2022-02-27 08:00:00', '2022-02-27 09:00:00');

-- --------------------------------------------------------
-- --------------------------------------------------------
-- -------------------FIN----------------------------------
-- --------------------------------------------------------
-- --------------------------------------------------------
-- --------------------------------------------------------
    
    
    
    
    
delete from usuario where id_usuario = 4;
    ALTER TABLE empleado AUTO_INCREMENT = 3;
    
    
-- --------------------------------------------------------
-- --------------------------------------------------------
select * from cliente;
select * from usuario;
select * from roles;
select * from MASCOTA;
select * from raza;
select * from especie;
select * from estado_usuario;
select * from empleado;
select * from estado_cita;
select * from citas;
SELECT NOW();

DELETE FROM usuario
WHERE id_usuario = 4;

ALTER TABLE usuario AUTO_INCREMENT = 3;

ALTER TABLE citas AUTO_INCREMENT = 1;
UPDATE cliente SET nombre_cliente = "Pedro" WHERE id_cliente = 3;

commit;