-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema fisiowebdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fisiowebdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fisiowebdb` DEFAULT CHARACTER SET utf8mb3 ;
USE `fisiowebdb` ;

-- -----------------------------------------------------
-- Table `fisiowebdb`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fisiowebdb`.`roles` (
  `id_rol` INT NOT NULL AUTO_INCREMENT,
  `descripcion_rol` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_rol`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fisiowebdb`.`estado_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fisiowebdb`.`estado_usuario` (
  `id_estado` INT NOT NULL AUTO_INCREMENT,
  `descripcion_estado` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fisiowebdb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fisiowebdb`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `correo_usuario` VARCHAR(50) NULL DEFAULT NULL,
  `contrasena_usuario` CHAR(64) NOT NULL,
  `id_rol` INT NOT NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `usuario_ibfk_1` (`id_rol` ASC) VISIBLE,
  INDEX `usuario_ibfk_2` (`id_estado` ASC) VISIBLE,
  CONSTRAINT `usuario_ibfk_1`
    FOREIGN KEY (`id_rol`)
    REFERENCES `fisiowebdb`.`roles` (`id_rol`),
  CONSTRAINT `usuario_ibfk_2`
    FOREIGN KEY (`id_estado`)
    REFERENCES `fisiowebdb`.`estado_usuario` (`id_estado`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fisiowebdb`.`bitacora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fisiowebdb`.`bitacora` (
  `id_error` INT NOT NULL AUTO_INCREMENT,
  `codigo_error` VARCHAR(20) NULL DEFAULT NULL,
  `error_descripcion` VARCHAR(100) NULL DEFAULT NULL,
  `fecha_error` DATETIME NULL DEFAULT NULL,
  `origen_error` VARCHAR(20) NULL DEFAULT NULL,
  `id_usuario` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_error`),
  INDEX `bitacora_ibfk_1` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `bitacora_ibfk_1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `fisiowebdb`.`usuario` (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fisiowebdb`.`especie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fisiowebdb`.`especie` (
  `id_especie` INT NOT NULL AUTO_INCREMENT,
  `descripcion_especie` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id_especie`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fisiowebdb`.`raza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fisiowebdb`.`raza` (
  `id_raza` INT NOT NULL AUTO_INCREMENT,
  `descripcion_raza` VARCHAR(30) NULL DEFAULT NULL,
  `id_especie` INT NOT NULL,
  PRIMARY KEY (`id_raza`),
  INDEX `raza_ibfk_1` (`id_especie` ASC) VISIBLE,
  CONSTRAINT `raza_ibfk_1`
    FOREIGN KEY (`id_especie`)
    REFERENCES `fisiowebdb`.`especie` (`id_especie`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fisiowebdb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fisiowebdb`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre_cliente` VARCHAR(50) NULL DEFAULT NULL,
  `apellido1_cliente` VARCHAR(50) NULL DEFAULT NULL,
  `apellido2_cliente` VARCHAR(50) NULL DEFAULT NULL,
  `telefono_cliente` INT NULL DEFAULT NULL,
  `id_usuario` INT NOT NULL,
  `cedula_cliente` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `cliente_ibfk_1` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `cliente_ibfk_1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `fisiowebdb`.`usuario` (`id_usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fisiowebdb`.`mascota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fisiowebdb`.`mascota` (
  `id_mascota` INT NOT NULL AUTO_INCREMENT,
  `nombre_mascota` VARCHAR(20) NOT NULL,
  `edad_mascota` INT NULL DEFAULT NULL,
  `detalles_mascota` VARCHAR(1000) NULL DEFAULT NULL,
  `id_raza` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_mascota`),
  INDEX `mascota_ibfk_1` (`id_raza` ASC) VISIBLE,
  INDEX `mascota_ibfk_2` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `mascota_ibfk_1`
    FOREIGN KEY (`id_raza`)
    REFERENCES `fisiowebdb`.`raza` (`id_raza`),
  CONSTRAINT `mascota_ibfk_2`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `fisiowebdb`.`cliente` (`id_cliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fisiowebdb`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fisiowebdb`.`empleado` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `nombre_empleado` VARCHAR(50) NULL DEFAULT NULL,
  `apellido1_empleado` VARCHAR(50) NULL DEFAULT NULL,
  `apellido2_empleado` VARCHAR(50) NULL DEFAULT NULL,
  `puesto_empleado` VARCHAR(20) NULL DEFAULT NULL,
  `id_usuario` INT NOT NULL,
  `telefono_empleado` INT NULL DEFAULT NULL,
  `cedula_empleado` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_empleado`),
  INDEX `empleado_ibfk_1` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `empleado_ibfk_1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `fisiowebdb`.`usuario` (`id_usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fisiowebdb`.`servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fisiowebdb`.`servicios` (
  `id_servicio` INT NOT NULL AUTO_INCREMENT,
  `servicio_descripcion` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id_servicio`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fisiowebdb`.`estado_cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fisiowebdb`.`estado_cita` (
  `id_estado` INT NOT NULL AUTO_INCREMENT,
  `descripcion_estado` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fisiowebdb`.`citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fisiowebdb`.`citas` (
  `id_cita` INT NOT NULL AUTO_INCREMENT,
  `descripcion_cita` VARCHAR(100) NOT NULL,
  `id_mascota` INT NOT NULL,
  `id_empleado` INT NOT NULL,
  `id_servicio` INT NOT NULL,
  `id_estado` INT NOT NULL,
  `horaInicio_cita` DATETIME NOT NULL,
  `horaFin_cita` DATETIME NOT NULL,
  PRIMARY KEY (`id_cita`),
  INDEX `citas_ibfk_1` (`id_mascota` ASC) VISIBLE,
  INDEX `citas_ibfk_2` (`id_empleado` ASC) VISIBLE,
  INDEX `citas_ibfk_3` (`id_servicio` ASC) VISIBLE,
  INDEX `citas_ibfk_4` (`id_estado` ASC) VISIBLE,
  CONSTRAINT `citas_ibfk_1`
    FOREIGN KEY (`id_mascota`)
    REFERENCES `fisiowebdb`.`mascota` (`id_mascota`),
  CONSTRAINT `citas_ibfk_2`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `fisiowebdb`.`empleado` (`id_empleado`),
  CONSTRAINT `citas_ibfk_3`
    FOREIGN KEY (`id_servicio`)
    REFERENCES `fisiowebdb`.`servicios` (`id_servicio`),
  CONSTRAINT `citas_ibfk_4`
    FOREIGN KEY (`id_estado`)
    REFERENCES `fisiowebdb`.`estado_cita` (`id_estado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fisiowebdb`.`faq`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fisiowebdb`.`faq` (
  `id_ayuda` INT NOT NULL AUTO_INCREMENT,
  `pregunta_titulo` VARCHAR(50) NULL DEFAULT NULL,
  `pregunta_respuesta` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (`id_ayuda`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fisiowebdb`.`horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fisiowebdb`.`horario` (
  `id_horario` INT NOT NULL AUTO_INCREMENT,
  `descripcion_horario` VARCHAR(20) NULL DEFAULT NULL,
  `horaInicio_horario` TIME NOT NULL,
  `horaFin_horario` TIME NOT NULL,
  PRIMARY KEY (`id_horario`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fisiowebdb`.`horario_empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fisiowebdb`.`horario_empleado` (
  `id_empleado` INT NOT NULL,
  `id_horario` INT NOT NULL,
  `id_horario_empleado` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_horario_empleado`),
  INDEX `horario_empleado_ibfk_1` (`id_empleado` ASC) VISIBLE,
  INDEX `horario_empleado_ibfk_2` (`id_horario` ASC) VISIBLE,
  CONSTRAINT `horario_empleado_ibfk_1`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `fisiowebdb`.`empleado` (`id_empleado`),
  CONSTRAINT `horario_empleado_ibfk_2`
    FOREIGN KEY (`id_horario`)
    REFERENCES `fisiowebdb`.`horario` (`id_horario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `fisiowebdb` ;

-- -----------------------------------------------------
-- procedure ActualizarCliente
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `ActualizarCliente`(IN `id_usuario` INT, IN `nombre_cliente` VARCHAR(50), IN `apellido1_cliente` VARCHAR(50), IN `apellido2_cliente` VARCHAR(50), IN `telefono_cliente` INT, IN `cedula_cliente` VARCHAR(20),
IN `id_estado` INT, IN `correo_usuario` VARCHAR(50))
begin
UPDATE CLIENTE c SET 
c.nombre_cliente = nombre_cliente,
c.apellido1_cliente = apellido1_cliente,
c.apellido2_cliente = apellido2_cliente,
c.telefono_cliente = telefono_cliente,
c.cedula_cliente = cedula_cliente
WHERE c.id_usuario = id_usuario;

UPDATE Usuario u SET 
u.correo_usuario = correo_usuario,
u.id_estado = id_estado
WHERE u.id_usuario = id_usuario;

end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ActualizarMascota
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `ActualizarMascota`(IN id_mascota_p INT, IN nombre_mascota_p VARCHAR(20),edad_mascota_p INT, 
                                   detalles_mascota_p VARCHAR(1000),id_raza_p INT, id_cliente_p INT)
UPDATE MASCOTA SET nombre_mascota = nombre_mascota_p,
                                                      edad_mascota = edad_mascota_p,
                                                      detalles_mascota = detalles_mascota_p,
                                                      id_raza = id_raza_p,
                                                      id_cliente = id_cliente_p
											    WHERE id_mascota = id_mascota_p$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure BorrarMascota
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `BorrarMascota`(IN id INT)
DELETE FROM MASCOTA WHERE id_mascota = id$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure CambiarContrasena
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `CambiarContrasena`(IN id_usuario INT, IN contrasena_usuario CHAR(64))
UPDATE usuario u
SET u.contrasena_usuario = contrasena_usuario
WHERE u.id_usuario = id_usuario$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ConsultarCita
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `ConsultarCita`(IN id_mascota int)
SELECT A.*
FROM CITAS A
WHERE A.id_mascota = id_mascota
  AND A.id_cita = (select max(A.id_cita)from CITAS A where A.id_mascota = id_mascota)$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ConsultarCitas
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `ConsultarCitas`()
Select *
From CITAS$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ConsultarClientePorCorreo
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `ConsultarClientePorCorreo`(IN correo_usuario VARCHAR(50))
SELECT nombre_cliente
  from USUARIO U, CLIENTE C
  WHERE C.ID_USUARIO = U.ID_USUARIO
  AND U.CORREO_USUARIO = correo_usuario$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ConsultarClientePorID
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `ConsultarClientePorID`(IN  id_usuario INT)
SELECT C.*, U.* from cliente C inner join usuario U on
C.id_usuario = U.id_usuario
WHERE C.id_usuario = id_usuario$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ConsultarClientes
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `ConsultarClientes`()
SELECT C.*, U.* from cliente C inner join usuario U on
C.id_usuario = U.id_usuario$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ConsultarEmpleadoPorCorreo
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `ConsultarEmpleadoPorCorreo`(IN correo_usuario VARCHAR(50))
SELECT nombre_empleado, apellido1_empleado
  from USUARIO U, EMPLEADO E
  WHERE E.ID_USUARIO = U.ID_USUARIO
  AND U.CORREO_USUARIO = correo_usuario$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ConsultarEspecies
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `ConsultarEspecies`()
SELECT * FROM especie$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ConsultarMascota
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `ConsultarMascota`(IN `id_mascota_p` INT)
SELECT m.*,r.descripcion_raza
FROM mascota m
INNER JOIN raza r ON m.id_raza = r.id_raza
where m.id_mascota = id_mascota_p$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ConsultarMascotaYRazaPorId
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `ConsultarMascotaYRazaPorId`(IN `id_mascota_p` INT)
SELECT m.*,r.descripcion_raza
FROM mascota m
INNER JOIN raza r ON m.id_raza = r.id_raza
where m.id_mascota = id_mascota_p$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ConsultarMascotas
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `ConsultarMascotas`()
SELECT id_mascota, nombre_mascota, edad_mascota, detalles_mascota, id_raza, id_cliente   FROM mascota$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ConsultarMascotasPorCliente
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `ConsultarMascotasPorCliente`(IN `id_cliente` INT)
SELECT * FROM MASCOTA M
where M.id_cliente = id_cliente$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ConsultarRazas
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `ConsultarRazas`()
SELECT * FROM raza$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ConsultarServicios
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `ConsultarServicios`()
SELECT * FROM servicios$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ConsultarUsuarioPorCorreo
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `ConsultarUsuarioPorCorreo`(IN correo VARCHAR(50))
SELECT id_usuario, correo_usuario, contrasena_usuario,
id_rol, id_estado FROM USUARIO
WHERE correo_usuario = correo$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ConsultarUsuarios
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `ConsultarUsuarios`()
SELECT * from usuario$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure IniciarSesion
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `IniciarSesion`(IN correo_usuario VARCHAR(50), IN contrasena_usuario CHAR(64))
SELECT id_usuario, correo_usuario, contrasena_usuario,
id_rol, id_estado FROM USUARIO u
WHERE u.correo_usuario =  correo_usuario
and u.contrasena_usuario = contrasena_usuario$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure RecuperarContrasena
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `RecuperarContrasena`(IN correo_usuario varchar(50), IN contrasena_usuario CHAR(64))
UPDATE usuario us
SET us.contrasena_usuario = contrasena_usuario
WHERE us.correo_usuario = correo_usuario$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure RegistrarCita
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `RegistrarCita`(IN descripcion_cita VARCHAR(100), IN horaInicio_cita datetime, IN horaFin_cita datetime, IN id_mascota int, IN id_empleado int, IN id_servicio int,IN id_estado int)
BEGIN
SET id_estado = 3;
INSERT INTO citas (descripcion_cita, horaInicio_cita, horaFin_cita, id_mascota, id_empleado, id_servicio, id_estado)
VALUES (descripcion_cita, horaInicio_cita, horaFin_cita, id_mascota, id_empleado, id_servicio, id_estado);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure RegistrarCliente
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `RegistrarCliente`(IN nombre_cliente varchar(50),apellido1_cliente varchar(50), 
                                   apellido2_cliente varchar(50),telefono_cliente INT, cedula_cliente varchar(20))
BEGIN
       
       DECLARE id_usuario_v INT DEFAULT 0;
           SELECT MAX(id_usuario) INTO id_usuario_v FROM USUARIO;
	   INSERT INTO cliente(nombre_cliente,apellido1_cliente,apellido2_cliente,telefono_cliente,id_usuario,cedula_cliente) 
                    VALUES(nombre_cliente,apellido1_cliente,apellido2_cliente,telefono_cliente,id_usuario_v,cedula_cliente); 
	   END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure RegistrarEmpleado
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `RegistrarEmpleado`(IN nombre_empleado varchar(50),apellido1_empleado varchar(50), 
                                   apellido2_empleado varchar(50),puesto_empleado varchar(20), telefono_empleado INT, cedula_empleado varchar(20))
BEGIN
       
       DECLARE id_usuario_v INT DEFAULT 0;
           SELECT MAX(id_usuario) INTO id_usuario_v FROM USUARIO;
	   INSERT INTO empleado(nombre_empleado,apellido1_empleado,apellido2_empleado,puesto_empleado,id_usuario,telefono_empleado,cedula_empleado) 
                    VALUES(nombre_empleado,apellido1_empleado,apellido2_empleado,puesto_empleado,id_usuario_v,telefono_empleado,cedula_empleado); 
	   END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure RegistrarMascota
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `RegistrarMascota`(IN nombre_mascota VARCHAR(20),edad_mascota INT, 
                                   detalles_mascota VARCHAR(1000),id_raza INT, id_cliente INT)
INSERT INTO MASCOTA(nombre_mascota,edad_mascota,detalles_mascota,id_raza,id_cliente)
                    VALUES(nombre_mascota,edad_mascota,detalles_mascota,id_raza,id_cliente)$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure RegistrarUsuario
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `RegistrarUsuario`(IN correo_usuario VARCHAR(50), IN contrasena_usuario CHAR(64), IN id_rol INT)
INSERT INTO usuario (correo_usuario, contrasena_usuario, id_rol, id_estado)
VALUES (correo_usuario, contrasena_usuario, id_rol, 1)$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure VerMascotaYRaza
-- -----------------------------------------------------

DELIMITER $$
USE `fisiowebdb`$$
CREATE DEFINER=`adminfisio`@`%` PROCEDURE `VerMascotaYRaza`(IN `id_cliente` INT)
SELECT m.*,r.descripcion_raza
FROM mascota m
INNER JOIN raza r ON m.id_raza = r.id_raza
where m.id_cliente = id_cliente$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
