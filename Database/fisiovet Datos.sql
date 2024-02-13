-- --------------------------------------------------------

ALTER TABLE especie AUTO_INCREMENT = 1;
ALTER TABLE raza AUTO_INCREMENT = 1;
ALTER TABLE estado_usuario AUTO_INCREMENT = 1;
ALTER TABLE cliente AUTO_INCREMENT = 1;
ALTER TABLE empleado AUTO_INCREMENT = 1;
ALTER TABLE estado_cita AUTO_INCREMENT = 1;
ALTER TABLE citas AUTO_INCREMENT = 1;
ALTER TABLE faq AUTO_INCREMENT = 1;
ALTER TABLE horario AUTO_INCREMENT = 1;
ALTER TABLE horario_empleado AUTO_INCREMENT = 1;
ALTER TABLE mascota AUTO_INCREMENT = 1;
ALTER TABLE roles AUTO_INCREMENT = 1;
ALTER TABLE servicios AUTO_INCREMENT = 1;
ALTER TABLE usuario AUTO_INCREMENT = 1;


INSERT INTO `especie` (`descripcion_especie`) VALUES
      ('Canina'),
      ('Felina'); 
-- --------------------------------------------------------
INSERT INTO `raza`(`descripcion_raza`, `id_especie`)VALUES
										('Bull Terrier', 1),
                                        ('Fox Terrires', 1),
										('Angora', 2),
                                        ('Siamés', 2),
                                        ('Frenche Poodle mini toy', 1);
-- --------------------------------------------------------
INSERT INTO `estado_usuario` (`descripcion_estado`) VALUES
('activo'),
('deshabilitado ');
-- --------------------------------------------------------
INSERT INTO `roles` (`descripcion_rol`) VALUES
('admin'),
('empleado'),
('cliente');
-- --------------------------------------------------------
INSERT INTO `usuario` ( `correo_usuario`, `contrasena_usuario`, `id_rol`, `id_estado`) VALUES
('famc.cr@gmail.com', '1245', 1, 1),
('fmc.cr@hotmail.com', '123', 3, 1),
('prueba@prueba.com', '123', 3, 1),
('test@test.com', '123', 3, 1);
-- --------------------------------------------------------
INSERT INTO CLIENTE(NOMBRE_CLIENTE,APELLIDO1_CLIENTE,APELLIDO2_CLIENTE,TELEFONO_CLIENTE,ID_USUARIO,CEDULA_CLIENTE)
             VALUES('Andrea','Salazar','Jimenez',83457765,1,'1234567'),
                   ('Jairo','Bermudes','Solano',73457765,2,'9876543'),
                   ('Maria','Chaves','Otarola',63457765,3,'5432167');
-- --------------------------------------------------------
select * from raza;    
select * from cliente;             
select * from usuario;
select * from roles;
select * from empleado;
INSERT INTO MASCOTA(`nombre_mascota`, `edad_mascota`, `detalles_mascota`, `id_raza`,`id_cliente`)
			 VALUES('Kiara',10,'Perro Bull Terrier con dolor al caminar',1,1),
                   ('Koki',12,'Perro de raza French poodle',5,2),
                   ('Mino',9,'Gato de raza Siamés',4,3);

-- --------------------------------------------------------
INSERT INTO `horario` ( `horaInicio_horario`, `horaFin_horario`, `descripcion_horario`) VALUES
('08:00:00', '12:00:00', 'Lunes'),
('12:00:00', '2:00:00', 'Martes'),
('01:00:00', '05:00:00', 'Miercoles');
-- -------------------------------------------------------- 
INSERT INTO `empleado` ( `nombre_empleado`, `apellido1_empleado`, `apellido2_empleado`, `puesto_empleado`, `id_usuario`, `telefono_empleado`, `cedula_empleado`) VALUES
    ('Mónica','Cespedes','Solano','Doctora',2,73457765,'9876543');
-- -------------------------------------------------------- 
INSERT INTO `servicios` ( `servicio_descripcion`) VALUES
      ('Consulta general'),
      ('Láser Terapéutico'),
    ('Cirugia Ortopédica'),
    ('Magnetoterapia y Electroestimulación'),
    ('Ultrasonido'),
    ('Acupuntura y Electroacupuntura veterinaria'),
    ('Hidroterapia');
-- -------------------------------------------------------- 

INSERT INTO `estado_cita` ( `descripcion_estado`) VALUES
      ('Cita cancelada'),
      ('Asistencia confirmada'),
    ('Confirmación Pendiente');
-- -------------------------------------------------------- 

select * from cliente