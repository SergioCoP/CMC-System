-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-08-2021 a las 00:25:49
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemacmc`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deletecredit` (IN `idcreditoc` INT)  begin
delete from creditos where idcredito=idcreditoc;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteemploye` (IN `id_user` INT)  BEGIN 
DECLARE emp_id int;

select id_empleado from usuarios where idusuario = id_user into emp_id;

delete from usuarios where idusuario = id_user;
delete from empleados where idempleado = emp_id;

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteloan` (IN `ridprestamo` INT)  begin
delete from historial_credito where idprestamo = ridprestamo;
delete from prestamos where idprestamo = ridprestamo;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletemember` (IN `idsociom` INT)  begin
delete from socios where idsocio=idsociom;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletemembertemporal` (IN `idsociom` INT)  begin
update socios set estado=0 where idsocio = idsociom;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `findcredits` ()  BEGIN 
select * from creditos;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `finddataforschema` (IN `ridprestamo` INT)  begin

select p.nombresocio,p.monto, p.fecha_solicitud,p.plazo,p.tipo_credito,c.tasa_interes from prestamos p,creditos c where p.idprestamo = ridprestamo and c.nombre = p.tipo_credito; 
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `findloans` ()  begin
select *from prestamos;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `findmembers` ()  begin
select * from socios;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `findpayments` ()  begin
select *from historial_socio group by idsocio;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `findusers` ()  BEGIN 
select * from usuarios as U inner join empleados as e on U.id_empleado = e.idempleado;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modifycredit` (IN `idcreditoc` INT, IN `nombre_c` VARCHAR(45), IN `plazo_minimoc` INT, IN `plazo_maximoc` INT, IN `tasa_interesc` FLOAT, IN `monto_minimoc` FLOAT, IN `monto_maximoc` FLOAT, IN `requisitosc` LONGTEXT)  begin
update creditos set nombre=nombre_C, plazo_minimo=plazo_minimoc, plazo_maximo=plazo_maximoc, tasa_interes=tasa_interesc, monto_minimo=monto_minimoc, monto_maximo=monto_maximoc, requisitos=requisitosc where idcredito=idcreditoc;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modifyemploye` (IN `id_usuario` INT, IN `nombreE` VARCHAR(45), IN `apellidosE` VARCHAR(50), IN `rolE` VARCHAR(45), IN `correoU` VARCHAR(45), IN `contrasenaU` VARCHAR(10))  BEGIN 
DECLARE emp_id int;

select idempleado from empleados as e inner join usuarios as u on e.idempleado = u.id_empleado where u.idusuario = id_usuario into emp_id;

update usuarios set correo = correoU, contrasena = contrasenaU where idusuario = id_usuario;

update empleados set nombre = nombreE, apellidos = apellidosE, rol = rolE where idempleado = emp_id; 

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modifyloan` (IN `ridprestamo` INT, IN `rnombrempleado` VARCHAR(120), IN `rnombresocio` VARCHAR(120), IN `rtipocredito` VARCHAR(45), IN `rfechasolicitud` DATE, IN `rmonto` FLOAT, IN `rplazo` INT, IN `raval1` VARCHAR(120), IN `raval2` VARCHAR(120), IN `rcomprobanteingresos` INT, IN `rrazonsocial` VARCHAR(120), IN `rubicacion` VARCHAR(120), IN `rgiro` VARCHAR(120))  begin

update prestamos set nombreempleado = rnombrempleado,nombresocio = rnombresocio, tipo_credito = rtipocredito, monto = rmonto, plazo = rplazo, fecha_solicitud = rfechasolicitud, aval_1 = raval1, aval_2 = raval2, comprobante_ingresos = rcomprobanteingresos, razon_social = rrazonsocial, ubicacion = rubicacion, giro = rgiro where idprestamo = ridprestamo;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modifymember` (IN `idsociom` INT, IN `nombrem` VARCHAR(45), IN `apellidosm` VARCHAR(50), IN `fecha_nacimientom` DATE, IN `identificacion_oficialm` INT, IN `acta_nacimientom` INT, IN `curpm` INT, IN `comprobante_domiciliom` INT, IN `croquis_domiciliom` INT)  begin

update socios set nombre=nombrem, apellidos=apellidosm, fecha_nacimiento=fecha_nacimientom, identificacion_oficial=identificacion_oficialm, acta_nacimiento=acta_nacimientom, curp=curpm, comprobante_domicilio=comprobante_domiciliom, croquis_domicilio=croquis_domiciliom where idsocio = idsociom;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registercredit` (IN `nombrec` VARCHAR(45), IN `plazo_minimoc` INT, IN `plazo_maximoc` INT, IN `tasa_interesc` FLOAT, IN `monto_minimoc` FLOAT, IN `monto_maximoc` FLOAT, IN `requisitosc` VARCHAR(255))  BEGIN
insert into creditos(nombre,plazo_minimo,plazo_maximo,tasa_interes,monto_minimo,monto_maximo,requisitos) values(nombrec,plazo_minimoc,plazo_maximoc,tasa_interesc,monto_minimoc,monto_maximoc,requisitosc);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registeremploye` (IN `nombre` VARCHAR(45), IN `apellidos` VARCHAR(50), IN `rol` VARCHAR(45), IN `correo` VARCHAR(45), IN `contrasena` VARCHAR(10))  BEGIN 
DECLARE emp_id int;

insert into empleados(apellidos,nombre,rol) VALUES(apellidos,nombre,rol);

SELECT LAST_INSERT_ID() INTO emp_id;

insert into usuarios(id_empleado,correo,contrasena)values(emp_id,correo,contrasena);

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registerloan` (IN `ridsocio` INT, IN `rnombresocio` VARCHAR(120), IN `ridempleado` INT, IN `rnombrempleado` VARCHAR(120), IN `rtipocredito` VARCHAR(45), IN `rmonto` FLOAT, IN `rplazo` INT, IN `rfechasolicitud` DATE, IN `raval1` VARCHAR(120), IN `raval2` VARCHAR(120), IN `rcomprobanteingresos` INT, IN `rrazonsocial` VARCHAR(120), IN `rubicacion` VARCHAR(120), IN `rgiro` VARCHAR(120))  begin

insert into prestamos(idsocio,nombresocio,idempleado,nombreempleado,tipo_credito,monto,plazo,fecha_solicitud,aval_1,aval_2,comprobante_ingresos, razon_social, ubicacion,giro) values(ridsocio,rnombresocio,ridempleado,rnombrempleado,rtipocredito,rmonto,rplazo,rfechasolicitud,raval1,raval2,rcomprobanteingresos,rrazonsocial,rubicacion,rgiro);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registerpayment` (IN `ridsocio` INT, IN `ridempleado` INT, IN `ridprestamo` INT, IN `rnombresocio` VARCHAR(120), IN `rfechaabono` DATE, IN `rmontoabonado` FLOAT)  begin

insert into abonos(idsocio,idempleado,idprestamo,nombresocio,fecha_abono,monto_abonado) values(ridsocio,ridempleado,ridprestamo,rnombresocio,rfechaabono,rmontoabonado);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `regitermembers` (IN `nombrem` VARCHAR(45), IN `apellidosm` VARCHAR(50), IN `fecha_nacimientom` DATE, IN `fecha_registrom` DATE, IN `sexom` VARCHAR(45), IN `identificacion_oficialm` INT, IN `acta_nacimientom` INT, IN `curpm` INT, IN `comprobante_domiciliom` INT, IN `croquis_domiciliom` INT)  begin
insert into socios(nombre,apellidos,fecha_nacimiento,fecha_registro,sexo,estado,identificacion_oficial,acta_nacimiento,curp,comprobante_domicilio,croquis_domicilio) values(nombrem,apellidosm,fecha_nacimientom,fecha_registrom,sexom,1,identificacion_oficialm,acta_nacimientom,curpm,comprobante_domiciliom,croquis_domiciliom);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validateduser` (IN `u_correo` VARCHAR(45), IN `u_contrasena` VARCHAR(45))  BEGIN 
select * from usuarios where correo = u_correo AND contrasena = u_contresana;
 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonos`
--

CREATE TABLE `abonos` (
  `idabono` int(11) NOT NULL,
  `idsocio` int(11) DEFAULT NULL,
  `idempleado` int(11) DEFAULT NULL,
  `idprestamo` int(11) DEFAULT NULL,
  `nombresocio` varchar(45) NOT NULL,
  `fecha_abono` date DEFAULT NULL,
  `monto_abonado` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `abonos`
--

INSERT INTO `abonos` (`idabono`, `idsocio`, `idempleado`, `idprestamo`, `nombresocio`, `fecha_abono`, `monto_abonado`) VALUES
(25, 15, 28, 8, 'Brenda Joseline Alonso Uribe', '2021-08-08', 355),
(26, 15, 28, 8, 'Brenda Joseline Alonso Uribe', '2021-08-16', 355),
(27, 15, 28, 8, 'Brenda Joseline Alonso Uribe', '2021-08-17', 355),
(28, 15, 28, 8, 'Brenda Joseline Alonso Uribe', '2021-08-16', 355),
(29, 14, 28, 9, 'Sergio Cortes Popoca', '2021-08-16', 400),
(30, 14, 28, 9, 'Sergio Cortes Popoca', '2021-08-17', 400),
(31, 14, 28, 9, 'Sergio Cortes Popoca', '2021-08-23', 400),
(32, 15, 28, 8, 'Brenda Joseline Alonso Uribe', '2021-08-18', 355),
(33, 14, 28, 9, 'Sergio Cortes Popoca', '2021-08-18', 355);

--
-- Disparadores `abonos`
--
DELIMITER $$
CREATE TRIGGER `generar_restantepago` BEFORE INSERT ON `abonos` FOR EACH ROW begin

update historial_credito set monto_restante = (monto_restante - NEW.monto_abonado) where id_sociohistorial = new.idsocio;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `creditos`
--

CREATE TABLE `creditos` (
  `idcredito` int(11) NOT NULL,
  `nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `plazo_minimo` int(11) NOT NULL,
  `plazo_maximo` int(11) NOT NULL,
  `tasa_interes` float NOT NULL,
  `monto_minimo` float NOT NULL,
  `monto_maximo` float NOT NULL,
  `requisitos` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `creditos`
--

INSERT INTO `creditos` (`idcredito`, `nombre`, `plazo_minimo`, `plazo_maximo`, `tasa_interes`, `monto_minimo`, `monto_maximo`, `requisitos`) VALUES
(1, 'Mi Vivienda', 1, 96, 18, 30000, 800000, '2 Socios Avales.\r\nComprobante de Ingresos.\r\nSer socio por 2 años(mínimo).'),
(7, 'De Temporada', 6, 36, 24, 1000, 20000, '1 Socio Aval.\r\nComprobante de Ingresos.'),
(8, 'Productivo', 12, 96, 12, 15000, 500000, '2 Socios Aval.\r\nComprobante de Ingresos.\r\nSer socio por un año(mínimo).\r\nDatos de negocio: \r\n *Razón social.\r\n *Ubicación.\r\n *Giro.');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `datosamortizacion`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `datosamortizacion` (
`idprestamo` int(11)
,`nombresocio` varchar(120)
,`monto` float
,`fecha_solicitud` date
,`plazo` int(11)
,`tipo_credito` varchar(45)
,`tasa_interes` float
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idempleado` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `rol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idempleado`, `nombre`, `apellidos`, `rol`) VALUES
(17, 'Brenda Joseline', 'Alonso', 'Coordinador'),
(24, 'Marlen', 'Quiroz', 'Coordinador'),
(26, 'Alejandra', 'Roxana Nieves', 'Coordinador'),
(27, 'Sergio', 'Cortes Popoca', 'Asesor'),
(28, 'Jazmin', 'Cortes Popoca', 'Cajero'),
(30, 'Elizabeth', 'Popoca', 'Asesor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_credito`
--

CREATE TABLE `historial_credito` (
  `id_sociohistorial` int(11) NOT NULL,
  `idprestamo` int(11) DEFAULT NULL,
  `tipo_credito` varchar(45) DEFAULT NULL,
  `plazo` varchar(45) DEFAULT NULL,
  `monto_total` varchar(45) DEFAULT NULL,
  `monto_restante` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `historial_credito`
--

INSERT INTO `historial_credito` (`id_sociohistorial`, `idprestamo`, `tipo_credito`, `plazo`, `monto_total`, `monto_restante`, `estatus`) VALUES
(14, 9, 'De Temporada', '76', '30000', '28445', '1'),
(15, 8, 'De Temporada', '36', '45000', '42825', '1');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `historial_socio`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `historial_socio` (
`idabono` int(11)
,`idsocio` int(11)
,`nombresocio` varchar(45)
,`tipo_credito` varchar(45)
,`plazo` varchar(45)
,`monto_total` varchar(45)
,`monto_restante` varchar(45)
,`estatus` varchar(45)
,`monto_abonado` float
,`fecha_abono` date
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `idprestamo` int(11) NOT NULL,
  `idsocio` int(11) DEFAULT NULL,
  `idempleado` int(11) DEFAULT NULL,
  `nombresocio` varchar(120) NOT NULL,
  `nombreempleado` varchar(120) NOT NULL,
  `tipo_credito` varchar(45) NOT NULL,
  `monto` float NOT NULL,
  `plazo` int(11) NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `aval_1` varchar(120) NOT NULL,
  `aval_2` varchar(120) DEFAULT NULL,
  `comprobante_ingresos` int(11) NOT NULL,
  `razon_social` varchar(120) DEFAULT NULL,
  `ubicacion` varchar(120) DEFAULT NULL,
  `giro` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`idprestamo`, `idsocio`, `idempleado`, `nombresocio`, `nombreempleado`, `tipo_credito`, `monto`, `plazo`, `fecha_solicitud`, `aval_1`, `aval_2`, `comprobante_ingresos`, `razon_social`, `ubicacion`, `giro`) VALUES
(8, 15, 27, 'Brenda Joseline Alonso Uribe', 'Sergio Cortes Popoca', 'Mi Vivienda', 45000, 76, '2021-08-16', 'Sergio Cortes Popoca', '', 1, '', '', ''),
(9, 14, 27, 'Sergio Cortes Popoca', 'Sergio Cortes Popoca', 'Mi Vivienda', 30000, 96, '2021-08-16', 'Brenda Joseline Alonso Uribe', '', 1, '', '', '');

--
-- Disparadores `prestamos`
--
DELIMITER $$
CREATE TRIGGER `llenartabla_historialcredito` AFTER INSERT ON `prestamos` FOR EACH ROW begin
insert into historial_credito(id_sociohistorial,idprestamo,tipo_credito,plazo,monto_total,monto_restante,estatus) values(NEW.idsocio,NEW.idprestamo,NEW.tipo_credito,NEW.plazo,NEW.monto,NEW.monto,1);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

CREATE TABLE `socios` (
  `idsocio` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `identificacion_oficial` int(11) NOT NULL,
  `acta_nacimiento` int(11) NOT NULL,
  `curp` int(11) NOT NULL,
  `comprobante_domicilio` int(11) NOT NULL,
  `croquis_domicilio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `socios`
--

INSERT INTO `socios` (`idsocio`, `nombre`, `apellidos`, `fecha_nacimiento`, `fecha_registro`, `sexo`, `estado`, `identificacion_oficial`, `acta_nacimiento`, `curp`, `comprobante_domicilio`, `croquis_domicilio`) VALUES
(14, 'Sergio', 'Cortes Popoca', '2000-12-09', '2020-07-19', 'Masculino', 1, 1, 1, 2, 1, 2),
(15, 'Brenda Joseline', 'Alonso Uribe', '2000-05-10', '2021-07-15', 'Femenino', 0, 1, 1, 1, 2, 3),
(16, 'Jorge', 'Gutierrez', '2000-12-09', '2021-05-08', 'Femenino', 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `contrasena` varchar(10) NOT NULL,
  `id_empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `correo`, `contrasena`, `id_empleado`) VALUES
(17, 'brenda_21@gmail.com', '123', 17),
(24, 'fati21_@hotmail.com', '1234', 24),
(26, 'ale_34outlook.es', '524yt', 26),
(27, 'sergiocortes518@gmail.com', '1234', 27),
(28, 'jaz_jye21@gmail.com', '1234', 28),
(30, 'eli_212gmail.com', '5874', 30);

-- --------------------------------------------------------

--
-- Estructura para la vista `datosamortizacion`
--
DROP TABLE IF EXISTS `datosamortizacion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `datosamortizacion`  AS SELECT `p`.`idprestamo` AS `idprestamo`, `p`.`nombresocio` AS `nombresocio`, `p`.`monto` AS `monto`, `p`.`fecha_solicitud` AS `fecha_solicitud`, `p`.`plazo` AS `plazo`, `p`.`tipo_credito` AS `tipo_credito`, `c`.`tasa_interes` AS `tasa_interes` FROM (`prestamos` `p` join `creditos` `c` on(`p`.`tipo_credito` = `c`.`nombre`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `historial_socio`
--
DROP TABLE IF EXISTS `historial_socio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `historial_socio`  AS SELECT `a`.`idabono` AS `idabono`, `a`.`idsocio` AS `idsocio`, `a`.`nombresocio` AS `nombresocio`, `h`.`tipo_credito` AS `tipo_credito`, `h`.`plazo` AS `plazo`, `h`.`monto_total` AS `monto_total`, `h`.`monto_restante` AS `monto_restante`, `h`.`estatus` AS `estatus`, `a`.`monto_abonado` AS `monto_abonado`, `a`.`fecha_abono` AS `fecha_abono` FROM (`abonos` `a` join `historial_credito` `h` on(`a`.`idprestamo` = `h`.`idprestamo`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abonos`
--
ALTER TABLE `abonos`
  ADD PRIMARY KEY (`idabono`),
  ADD KEY `fk_abono_socio` (`idsocio`),
  ADD KEY `fk_abono_empleado` (`idempleado`),
  ADD KEY `fk_abono_prestamo` (`idprestamo`),
  ADD KEY `ik_idabono_fecha_socio` (`idabono`,`nombresocio`,`fecha_abono`);

--
-- Indices de la tabla `creditos`
--
ALTER TABLE `creditos`
  ADD PRIMARY KEY (`idcredito`),
  ADD KEY `ik_idcredito_nombre` (`idcredito`,`nombre`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idempleado`),
  ADD KEY `ik_idempleado_nombre_apellido` (`idempleado`,`nombre`,`apellidos`);

--
-- Indices de la tabla `historial_credito`
--
ALTER TABLE `historial_credito`
  ADD PRIMARY KEY (`id_sociohistorial`),
  ADD KEY `fk_historial_prestamo` (`idprestamo`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`idprestamo`),
  ADD KEY `fk_prestamo_empleado` (`idempleado`),
  ADD KEY `fk_prestamo_socio` (`idsocio`),
  ADD KEY `ik_idprestamo_socio_fecha` (`idprestamo`,`nombresocio`,`fecha_solicitud`);

--
-- Indices de la tabla `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`idsocio`),
  ADD KEY `ik_idsocio_nombre` (`idsocio`,`nombre`,`apellidos`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `fk_usuario_empleado` (`id_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abonos`
--
ALTER TABLE `abonos`
  MODIFY `idabono` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `creditos`
--
ALTER TABLE `creditos`
  MODIFY `idcredito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idempleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `idprestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `socios`
--
ALTER TABLE `socios`
  MODIFY `idsocio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `abonos`
--
ALTER TABLE `abonos`
  ADD CONSTRAINT `fk_abono_socio` FOREIGN KEY (`idsocio`) REFERENCES `socios` (`idsocio`);

--
-- Filtros para la tabla `historial_credito`
--
ALTER TABLE `historial_credito`
  ADD CONSTRAINT `fk_historial_prestamo` FOREIGN KEY (`idprestamo`) REFERENCES `prestamos` (`idprestamo`),
  ADD CONSTRAINT `fk_historial_socio` FOREIGN KEY (`id_sociohistorial`) REFERENCES `socios` (`idsocio`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `fk_prestamo_socio` FOREIGN KEY (`idsocio`) REFERENCES `socios` (`idsocio`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuario_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`idempleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
