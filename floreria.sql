-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.17 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para floreria
CREATE DATABASE IF NOT EXISTS `floreria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `floreria`;

-- Volcando estructura para tabla floreria.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla floreria.clientes: ~11 rows (aproximadamente)
INSERT INTO `clientes` (`id_cliente`, `nombre`, `apellidos`, `correo`, `telefono`, `direccion`) VALUES
	(1, 'Juan', 'Pérez', 'juan.perez@example.com', '1234567890', 'Calle Falsa 123'),
	(2, 'Ana', 'Gómez', 'ana.gomez@example.com', '2345678901', 'Avenida Siempreviva 456'),
	(3, 'Luis', 'Martínez', 'luis.martinez@example.com', '3456789012', 'Calle 1'),
	(4, 'María', 'López', 'maria.lopez@example.com', '4567890123', 'Calle 2'),
	(5, 'Carlos', 'Hernández', 'carlos.hernandez@example.com', '5678901234', 'Calle 3'),
	(6, 'Laura', 'Ramírez', 'laura.ramirez@example.com', '6789012345', 'Calle 4'),
	(7, 'José', 'Fernández', 'jose.fernandez@example.com', '7890123456', 'Calle 5'),
	(8, 'Marta', 'Sánchez', 'marta.sanchez@example.com', '8901234567', 'Calle 6'),
	(9, 'Pedro', 'García', 'pedro.garcia@example.com', '9012345678', 'Calle 7'),
	(10, 'Elena', 'Rodríguez', 'elena.rodriguez@example.com', '0123456789', 'Calle 8'),
	(12, 'Asassssssss', 'asdaasdasd', 'asdasd@gmail.com', '9784561975', 'asdasd');

-- Volcando estructura para tabla floreria.detalle_paquete
CREATE TABLE IF NOT EXISTS `detalle_paquete` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_paquete` int(11) DEFAULT NULL,
  `id_flor` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_paquete` (`id_paquete`),
  KEY `id_flor` (`id_flor`),
  CONSTRAINT `detalle_paquete_ibfk_1` FOREIGN KEY (`id_paquete`) REFERENCES `paquetes` (`id_paquete`),
  CONSTRAINT `detalle_paquete_ibfk_2` FOREIGN KEY (`id_flor`) REFERENCES `flores` (`id_flor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla floreria.detalle_paquete: ~11 rows (aproximadamente)
INSERT INTO `detalle_paquete` (`id_detalle`, `id_paquete`, `id_flor`, `cantidad`) VALUES
	(1, 1, 1, 10),
	(2, 2, 2, 10),
	(3, 3, 3, 10),
	(4, 4, 4, 10),
	(5, 5, 5, 10),
	(6, 6, 6, 10),
	(7, 7, 7, 10),
	(8, 8, 8, 10),
	(9, 9, 9, 10),
	(10, 10, 10, 10),
	(11, 11, 1, 12);

-- Volcando estructura para tabla floreria.detalle_pedido
CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `id_detalle_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) DEFAULT NULL,
  `id_paquete` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle_pedido`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_paquete` (`id_paquete`),
  CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_paquete`) REFERENCES `paquetes` (`id_paquete`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla floreria.detalle_pedido: ~5 rows (aproximadamente)
INSERT INTO `detalle_pedido` (`id_detalle_pedido`, `id_pedido`, `id_paquete`, `cantidad`, `Total`) VALUES
	(1, 1, 1, 2, 50.00),
	(2, 2, 2, 3, 75.00),
	(3, 3, 3, 4, 90.00),
	(4, 4, 4, 5, 105.00),
	(5, 5, 2, 1, 25.00);

-- Volcando estructura para tabla floreria.flores
CREATE TABLE IF NOT EXISTS `flores` (
  `id_flor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_flor`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla floreria.flores: ~11 rows (aproximadamente)
INSERT INTO `flores` (`id_flor`, `nombre`, `tipo`, `color`, `precio`) VALUES
	(1, 'Rosa', 'Flor de corte', 'Rojo', 2.50),
	(2, 'Tulipán', 'Flor de corte', 'Amarillo', 1.50),
	(3, 'Lirio', 'Flor de corte', 'Blanco', 3.00),
	(4, 'Margarita', 'Flor de corte', 'Blanco', 1.00),
	(5, 'Girasol', 'Flor de corte', 'Amarillo', 2.00),
	(6, 'Clavel', 'Flor de corte', 'Rosa', 1.75),
	(7, 'Orquídea', 'Flor de corte', 'Morado', 5.00),
	(8, 'Hortensia', 'Flor de corte', 'Azul', 4.00),
	(9, 'Peonía', 'Flor', 'Rosa', 3.50),
	(10, 'Jazmín', 'Flor de corte', 'Blanco', 2.00),
	(12, 'Guayba', 'Planta', 'Verde', 32.00);

-- Volcando estructura para tabla floreria.paquetes
CREATE TABLE IF NOT EXISTS `paquetes` (
  `id_paquete` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_paquete` varchar(50) NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_paquete`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla floreria.paquetes: ~11 rows (aproximadamente)
INSERT INTO `paquetes` (`id_paquete`, `nombre_paquete`, `descripcion`, `precio`) VALUES
	(1, 'Amor Eterno', 'Paquete de rosas rojas', 25.00),
	(2, 'Felicidad', 'Paquete de tulipanes amarillos', 15.00),
	(3, 'Pureza', 'Paquete de lirios blancos', 30.00),
	(4, 'Alegría', 'Paquete de margaritas', 10.00),
	(5, 'Sol Brillante', 'Paquete de girasoles', 20.00),
	(6, 'Ternura', 'Paquete de claveles rosas', 17.50),
	(7, 'Elegancia', 'Paquete de orquídeas moradas', 50.00),
	(8, 'Frescura', 'Paquete de hortensias azules', 40.00),
	(9, 'Romanticismo', 'Paquete de peonías rosas', 35.00),
	(10, 'Aroma', 'Paquete de jazmines blancos', 20.00),
	(11, 'Amor PAsion', 'No se xdd', 123.00);

-- Volcando estructura para tabla floreria.pedidos
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `id_vendedor` int(11) DEFAULT NULL,
  `id_ruta` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_vendedor` (`id_vendedor`),
  KEY `id_ruta` (`id_ruta`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id_vendedor`),
  CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id_ruta`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla floreria.pedidos: ~5 rows (aproximadamente)
INSERT INTO `pedidos` (`id_pedido`, `id_cliente`, `id_vendedor`, `id_ruta`, `fecha`) VALUES
	(1, 1, 1, 1, '2024-06-01'),
	(2, 2, 2, 2, '2024-06-02'),
	(3, 3, 3, 3, '2024-06-03'),
	(4, 4, 4, 4, '2024-06-04'),
	(5, 5, 5, 3, '2024-06-05');

-- Volcando estructura para tabla floreria.ruta
CREATE TABLE IF NOT EXISTS `ruta` (
  `id_ruta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ruta` varchar(50) NOT NULL,
  `descripcion` text,
  `costo_envio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_ruta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla floreria.ruta: ~5 rows (aproximadamente)
INSERT INTO `ruta` (`id_ruta`, `nombre_ruta`, `descripcion`, `costo_envio`) VALUES
	(1, 'Ruta 1', 'Descripción de la Ruta 1', 5.00),
	(2, 'Ruta 2', 'Descripción de la Ruta 2', 7.50),
	(3, 'Ruta 3', 'Descripción de la Ruta 3', 10.00),
	(4, 'Ruta 4', 'Descripción de la Ruta 4', 12.50),
	(5, 'Ruta 5', 'Descripción de la Ruta 5', 15.00);

-- Volcando estructura para tabla floreria.users
CREATE TABLE IF NOT EXISTS `users` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla floreria.users: ~3 rows (aproximadamente)
INSERT INTO `users` (`id_usuario`, `Nombre`, `password`) VALUES
	(1, 'admin', '123'),
	(2, 'vendedor1', 'vendedor123'),
	(3, 'vendedor2', 'vendedor123');

-- Volcando estructura para tabla floreria.vendedores
CREATE TABLE IF NOT EXISTS `vendedores` (
  `id_vendedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`id_vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla floreria.vendedores: ~5 rows (aproximadamente)
INSERT INTO `vendedores` (`id_vendedor`, `nombre`, `apellidos`, `correo`, `telefono`) VALUES
	(1, 'Carlos', 'Pérez', 'carlos.perez@example.com', '1234567890'),
	(2, 'Ana', 'López', 'ana.lopez@example.com', '2345678901'),
	(3, 'Luis', 'Martínez', 'luis.martinez@example.com', '3456789012'),
	(4, 'María', 'García', 'maria.garcia@example.com', '4567890123'),
	(5, 'José', 'Rodríguez', 'jose.rodriguez@example.com', '5678901234');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
