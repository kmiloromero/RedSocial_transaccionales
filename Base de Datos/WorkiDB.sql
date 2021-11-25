CREATE SCHEMA `WorkiDB` ;
USE WorkiDB;
CREATE TABLE `cargo`(
 id_cargo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 nombre varchar(100) NOT NULL,
 creado datetime,
 actualizado datetime
);

CREATE TABLE `hobbie`(
 id_hobbie INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 nombre varchar(100) NOT NULL,
 creado datetime,
 actualizado datetime
);
CREATE TABLE `empresa`( 
 id_empresa INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 nombre varchar(100) NOT NULL,
 nit varchar(100),
 telefono varchar(100),
 direccion varchar(100),
 creado datetime,
 actualizado datetime
);
CREATE TABLE `usuario`(
 id_usuario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 nombreusuario varchar(100) NOT NULL,
 apellido varchar(100) NOT NULL,
 email varchar(100),
 password varchar(100),
 img varchar(1000),
 estado text,
 gustos_profesionales text,
 no_molestar boolean,
 rol ENUM('Administrador', 'Empleado') NOT NULL,
 status boolean NOT NULL,
 id_cargo INT UNSIGNED,
 id_empresa INT UNSIGNED NOT NULL,
 creado datetime,
 actualizado datetime,
 FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa),
 FOREIGN KEY (id_cargo) REFERENCES `cargo`(id_cargo)
);
CREATE TABLE `usuario_hobbie`(
 id_usuario_hobbie INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 id_usuario INT UNSIGNED NOT NULL,
 id_hobbie INT UNSIGNED NOT NULL,
 creado datetime,
 actualizado datetime,
 FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
 FOREIGN KEY (id_hobbie) REFERENCES hobbie(id_hobbie)
);
CREATE TABLE `categoria`(
 id_categoria INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 nombre varchar(100) NOT NULL,
 creado datetime,
 actualizado datetime
);
CREATE TABLE `post`(
 id_post INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 titulo varchar(100) NOT NULL,
 descripcion varchar(100) NOT NULL,
 estatus boolean NOT NULL,
 file varchar(1000),
 id_usuario INT UNSIGNED NOT NULL,
 id_categoria INT UNSIGNED NOT NULL,
 creado datetime,
 actualizado datetime,
 FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
 FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);
CREATE TABLE `comentario`(
 id_comentario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 descripcion varchar(100) NOT NULL,
 fecha datetime NOT NULL,
 estatus boolean NOT NULL,
 id_post INT UNSIGNED NOT NULL,
 id_usuario INT UNSIGNED NOT NULL,
 creado datetime,
 actualizado datetime,
 FOREIGN KEY (id_post) REFERENCES post(id_post),
 FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);
CREATE TABLE `interaccion`(
 id_interaccion INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 rol ENUM('like', 'favorito') NOT NULL,
 estatus boolean NOT NULL,
 id_post INT UNSIGNED NOT NULL,
 id_usuario INT UNSIGNED NOT NULL,
 creado datetime,
 actualizado datetime,
 FOREIGN KEY (id_post) REFERENCES post(id_post),
 FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);
CREATE TABLE `evento`(
 id_evento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 nombre varchar(100) NOT NULL,
 descripcion varchar(1000) NOT NULL,
 fecha datetime,
 duracion INT NOT NULL,
 lugar varchar(100) NOT NULL,
 invitado varchar(100) NOT NULL,
 estatus boolean NOT NULL,
 creador INT NOT NULL,
 creado datetime,
 actualizado datetime
);
CREATE TABLE `usuario_evento`(
 id_usuario_evento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 id_usuario INT UNSIGNED NOT NULL,
 id_evento INT UNSIGNED NOT NULL,
 creado datetime,
 actualizado datetime,
 FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
 FOREIGN KEY (id_evento) REFERENCES evento(id_evento)
);
CREATE TABLE `Reporte`(
 id_Reporte INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 estatus boolean NOT NULL,
 tipo ENUM('Comentario', 'post') NOT NULL,
 id_tipo INT,
 id_usuario INT UNSIGNED NOT NULL,
 creado datetime,
 actualizado datetime,
 FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE `grupo` (
id_grupo int unsigned auto_increment primary key,
nombre_grupo VARCHAR (100) NOT NULL,
imagen_grupo VARCHAR (1000) NOT NULL,
descripcion VARCHAR (1000),
Tipo ENUM ("publico", "privado"),
propietario_grupo INT UNSIGNED NOT NULL
);

CREATE TABLE `grupo_usuario` (
id_grupo int unsigned auto_increment primary key,
id_usuario  INT UNSIGNED NOT NULL,
FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo),
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

