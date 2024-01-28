-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.3.7-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

-- Volcando estructura de base de datos para tiendagenericaEntorno
CREATE DATABASE IF NOT EXISTS `biblioplus`;
USE `biblioplus`;

CREATE TABLE IF NOT EXISTS `usuario` (
  `usuarioID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(120) NOT NULL,
  `primer_nombre` varchar(120) NOT NULL,
  `apellido` varchar(120),
  `contrasena` varchar(50) NOT NULL,
  `es_admin` BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (`usuarioID`)
);


-- Insertar usuarios con la nueva columna
INSERT INTO `usuario` (`nombre_usuario`, `primer_nombre`, `apellido`, `contrasena`, `es_admin`)
VALUES
  ('usuario1', 'Juan', 'Pérez', 'contrasena1', FALSE),
  ('usuario2', 'María', 'Gómez', 'contrasena2', FALSE),
  ('usuario3', 'Carlos', 'López', 'contrasena3', FALSE),
  ('usuario4', 'Ana', 'Martínez', 'contrasena4', FALSE),
  ('usuario5', 'Pedro', 'Sánchez', 'contrasena5', FALSE),
  ('usuario6', 'Laura', 'Díaz', 'contrasena6', FALSE),
  ('usuario7', 'Miguel', 'González', 'contrasena7', FALSE),
  ('usuario8', 'Sofía', 'Rodríguez', 'contrasena8', FALSE),
  ('usuario9', 'Eduardo', 'Hernández', 'contrasena9', FALSE),
  ('usuario10', 'Isabel', 'Ramírez', 'contrasena10', FALSE),
  ('admin', 'Cristian', 'Villarreal', 'admin', TRUE);

CREATE TABLE IF NOT EXISTS `autor` (
    `autorID` int(11) PRIMARY KEY AUTO_INCREMENT,
    `nombre` VARCHAR(100) NOT NULL,
    `nacionalidad` VARCHAR(50),
    `fechaNacimiento` DATE
);

INSERT INTO `autor` (nombre, nacionalidad, fechaNacimiento) VALUES
('Gabriel García Márquez', 'Colombiana', '1927-03-06'),
('William Shakespeare', 'Inglesa', '1564-04-26'),
('Jane Austen', 'Inglesa', '1775-12-16'),
('Leo Tolstoy', 'Rusa', '1828-09-09'),
('J.K. Rowling', 'Inglesa', '1965-07-31'),
('George Orwell', 'Inglesa', '1903-06-25'),
('Ernest Hemingway', 'Estadounidense', '1899-07-21'),
('Agatha Christie', 'Inglesa', '1890-09-15'),
('Fyodor Dostoevsky', 'Rusa', '1821-11-11'),
('Mark Twain', 'Estadounidense', '1835-11-30');

CREATE TABLE `libro` (
    `libroID` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `titulo` VARCHAR(255) NOT NULL,
    `autorFK` INT,
    `genero` VARCHAR(50),
    `anioPublicacion` INT,
    `cantidadDisponible` INT,
	KEY `FK_AUTOR` (`autorFK`),
	CONSTRAINT `FK_AUTOR` FOREIGN KEY (`autorFK`) REFERENCES `autor` (`autorID`)
);

INSERT INTO `libro` (titulo, autorFK, genero, anioPublicacion, cantidadDisponible) VALUES
('Cien años de soledad', 1, 'Realismo mágico', 1967, 5),
('Hamlet', 2, 'Tragedia', 1609, 10),
('Orgullo y prejuicio', 3, 'Novela romántica', 1813, 8),
('Guerra y paz', 4, 'Novela histórica', 1869, 3),
('Harry Potter y la piedra filosofal', 5, 'Fantasía', 1997, 12),
('1984', 6, 'Distopía', 1949, 7),
('El viejo y el mar', 7, 'Novela breve', 1952, 4),
('Asesinato en el Orient Express', 8, 'Novela de misterio', 1934, 6),
('Crimen y castigo', 9, 'Novela psicológica', 1866, 5),
('Las aventuras de Tom Sawyer', 10, 'Novela de aventuras', 1876, 9);

CREATE TABLE `prestamo` (
    `prestamoID` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `usuarioFK` INT,
    `libroFK` int,
    `fechaPrestamo` DATE,
    `fechaDevolucion` DATE,
    KEY `FK_USUARIO` (`usuarioFK`),
	CONSTRAINT `FK_USUARIO` FOREIGN KEY (`usuarioFK`) REFERENCES `usuario` (`usuarioID`),
    KEY `FK_LIBRO` (`libroFK`),
	CONSTRAINT `FK_LIBRO` FOREIGN KEY (`libroFK`) REFERENCES `libro` (`libroID`)
);

INSERT INTO `prestamo` (usuarioFK, libroFK, fechaPrestamo, fechaDevolucion) VALUES
(15, 1, '2023-10-21', '2023-11-04'),
(16, 3, '2023-10-22', '2023-11-05'),
(17, 6, '2023-10-23', '2023-11-06'),
(18, 8, '2023-10-24', '2023-11-07'),
(19, 10, '2023-10-25', '2023-11-08'),
(20, 2, '2023-10-26', '2023-11-09'),
(21, 4, '2023-10-27', '2023-11-10'),
(22, 7, '2023-10-28', '2023-11-11'),
(23, 9, '2023-10-29', '2023-11-12'),
(24, 5, '2023-10-30', '2023-11-13');

select * from prestamo;
select * from usuario;
select * from libro;
select * from autor;
