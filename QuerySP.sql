CREATE DATABASE BDBiblioteca;
USE BDBiblioteca;
GO
--Creacion de tablas
CREATE TABLE persona(
	idPersona BIGINT IDENTITY (1,1),
	cedula VARCHAR(10) UNIQUE,
	apellidos VARCHAR(50),
	nombres VARCHAR(50),
	correo VARCHAR(100),
	telefono VARCHAR(10) UNIQUE,
	CONSTRAINT persona_pk primary key (idPersona)
);

CREATE TABLE autor(
	idAutor BIGINT IDENTITY (1,1),
	apellidos VARCHAR(50),
	nombres VARCHAR(50),
	CONSTRAINT autor_pk primary key (idAutor)
);

CREATE TABLE tipoLibro(
	idTipoLibro BIGINT IDENTITY (1,1),
	tipo VARCHAR(50),
	CONSTRAINT tipoLibro_pk primary key (idTipoLibro)
);

CREATE TABLE proveedor(
	idProveedor BIGINT IDENTITY (1,1),
	nombre VARCHAR(50),
	direccion VARCHAR(50),
	sitioWeb VARCHAR(100),
	CONSTRAINT proveedor_pk primary key (idProveedor)
);

CREATE TABLE editorial(
	idEditorial BIGINT IDENTITY (1,1),
	nombre VARCHAR(50),
	direccion VARCHAR(50),
	CONSTRAINT editorial_pk primary key (idEditorial)
);

CREATE TABLE genero(
	idGenero BIGINT IDENTITY (1,1),
	genero VARCHAR(50),
	CONSTRAINT generoL_pk primary key (idGenero)
);

CREATE TABLE libro(
	idLibro BIGINT IDENTITY (1,1),
	codigo VARCHAR(10),
	titulo VARCHAR(50),
	anio INT,
	precio DECIMAL(5,2),
	idAutorLibro BIGINT,
	idGeneroL BIGINT,
	idEditorialLibro BIGINT,
	idProveedorLibro BIGINT,
	idTipoLL BIGINT,
	CONSTRAINT libro_pk primary key (idLibro),
	CONSTRAINT autorL_fk FOREIGN KEY (idAutorLibro) REFERENCES autor(idAutor),
	CONSTRAINT generoL_fk FOREIGN KEY (idGeneroL) REFERENCES genero(idGenero),
	CONSTRAINT editorialL_fk FOREIGN KEY (idEditorialLibro) REFERENCES editorial(idEditorial),
	CONSTRAINT proveedorL_fk FOREIGN KEY (idProveedorLibro) REFERENCES proveedor(idProveedor),
	CONSTRAINT tipoLL_fk FOREIGN KEY (idTipoLL) REFERENCES tipoLibro(idTipoLibro)
);

CREATE TABLE lecturaPrestamo(
	idLecturaPtm BIGINT IDENTITY(1,1),
	idLibroHL BIGINT,	
	idPersonaHL BIGINT,
	CONSTRAINT lecturaPtm_pk primary key (idLecturaPtm),
	CONSTRAINT libroHL_fk FOREIGN KEY (idLibroHL) REFERENCES libro(idLibro),
	CONSTRAINT personaHL_fk FOREIGN KEY (idPersonaHL) REFERENCES persona(idPersona)
);

CREATE TABLE historialLibro (
	fechaPrestamo DATE,
	fechaDevolucion DATE,
	estado VARCHAR(50),
	idLecturaPHL BIGINT,
	CONSTRAINT lecturaPHL_fk FOREIGN KEY (idLecturaPHL) REFERENCES lecturaPrestamo(idLecturaPtm)
);

GO

--Inserciones
INSERT INTO persona(cedula, apellidos, nombres, correo, telefono)
VALUES ('1216457945','Posadas Gil', 'Inés', 'ines2078@gmail.com', '0966394456');
INSERT INTO persona(cedula, apellidos, nombres, correo, telefono)
VALUES ('1211157945','Sánchez Pons', 'José', 'joseSanc28@gmail.com', '0966394116');
INSERT INTO persona(cedula, apellidos, nombres, correo, telefono)
VALUES ('1216452245','Gómez Sáez', 'Miguel', 'gomesSanch78@gmail.com', '0967394456');
INSERT INTO persona(cedula, apellidos, nombres, correo, telefono)
VALUES ('1216450045','Santana Páez', 'Eva', 'speva213@gmail.com', '0966394776');
INSERT INTO persona(cedula, apellidos, nombres, correo, telefono)
VALUES ('1716457945','Betancor Díaz', 'Yolanda', 'ylndbd78@gmail.com', '0945374456');
SELECT * FROM persona;

INSERT INTO autor(apellidos, nombres)
VALUES ('de Cervantes', 'Miguel');
INSERT INTO autor(apellidos, nombres)
VALUES ('Faulkner', 'William');
INSERT INTO autor(apellidos, nombres)
VALUES ('SaintExupery', 'Antoine');
INSERT INTO autor(apellidos, nombres)
VALUES ('Kissinger', 'Henry');
INSERT INTO autor(apellidos, nombres)
VALUES ('Kitty', 'Kelley');
INSERT INTO autor(apellidos, nombres)
VALUES ('Pérez', 'Galdós');
SELECT * FROM autor;

INSERT INTO tipoLibro(tipo) VALUES ('Fisico');
INSERT INTO tipoLibro(tipo) VALUES ('Digital');
SELECT * FROM tipoLibro;

INSERT INTO editorial(nombre, direccion) VALUES ('Holgin S.A','calle 17 y ave 2');
INSERT INTO editorial(nombre, direccion) VALUES ('Ediciones S.A','calle 108 y ave 22');
INSERT INTO editorial(nombre, direccion) VALUES ('Acádemia S.A','calle 3 y ave 20');
INSERT INTO editorial(nombre, direccion) VALUES ('Primera S.A','calle 12 y ave 11');
SELECT * FROM editorial;

INSERT INTO genero(genero) VALUES ('Caballeresco');
INSERT INTO genero(genero) VALUES ('Novela'); 
INSERT INTO genero(genero) VALUES ('Aventura'); 
INSERT INTO genero(genero) VALUES ('Político'); 
INSERT INTO genero(genero) VALUES ('Biografías');
SELECT * FROM genero;

INSERT INTO proveedor(nombre,direccion,sitioWeb)
VALUES ('Juan Anibal', 'calle 17 y ave 2', 'www.jaholginsa.com');
INSERT INTO proveedor(nombre,direccion,sitioWeb)
VALUES ('Jose Joel', 'calle 108 y ave 22', 'www.edicionesjjsa.com');
INSERT INTO proveedor(nombre,direccion,sitioWeb)
VALUES ('Ariel Jordan', 'calle 3 y ave 20', 'www.academiasaaj.com');
INSERT INTO proveedor(nombre,direccion,sitioWeb)
VALUES ('Julian Alexander', 'calle 12 y ave 11', 'www.japrimera.com');
SELECT * FROM proveedor;

INSERT INTO libro(codigo, titulo, anio, precio, idAutorLibro, idGeneroL, idEditorialLibro, idProveedorLibro, idTipoLL)
VALUES ('42.112-S','Don Quijote de La Mancha I',1991, 27, 1, 1, 1, 1, 2);
INSERT INTO libro(codigo, titulo, anio, precio, idAutorLibro, idGeneroL, idEditorialLibro, idProveedorLibro, idTipoLL)
VALUES ('31.765-D','Don Quijote de La Mancha II',1991, 31, 1, 1, 2, 2, 1);
INSERT INTO libro(codigo, titulo, anio, precio, idAutorLibro, idGeneroL, idEditorialLibro, idProveedorLibro, idTipoLL)
VALUES ('11.542-G','Historias de Nueva Orleans',1985, 7, 2, 2, 2, 2, 1);
INSERT INTO libro(codigo, titulo, anio, precio, idAutorLibro, idGeneroL, idEditorialLibro, idProveedorLibro, idTipoLL)
VALUES ('78.542-L','El principito',1996, 9, 3, 3, 1, 1, 2);
INSERT INTO libro(codigo, titulo, anio, precio, idAutorLibro, idGeneroL, idEditorialLibro, idProveedorLibro, idTipoLL)
VALUES ('44.312-Z','El príncipe',1995, 12, 4, 4, 4, 3, 2);
INSERT INTO libro(codigo, titulo, anio, precio, idAutorLibro, idGeneroL, idEditorialLibro, idProveedorLibro, idTipoLL)
VALUES ('44.312-Z','Diplomacia',1997, 18, 5, 4, 3, 2, 1);
INSERT INTO libro(codigo, titulo, anio, precio, idAutorLibro, idGeneroL, idEditorialLibro, idProveedorLibro, idTipoLL)
VALUES ('44.312-Z','Los Windsor',1998, 12, 6, 5, 1, 3, 1);
SELECT * FROM libro;


INSERT INTO lecturaPrestamo(idLibroHL, idPersonaHL)
VALUES(1,1);
INSERT INTO lecturaPrestamo(idLibroHL, idPersonaHL)
VALUES(3,5);
INSERT INTO lecturaPrestamo(idLibroHL, idPersonaHL)
VALUES(7,2);
INSERT INTO lecturaPrestamo(idLibroHL, idPersonaHL)
VALUES(2,3);
INSERT INTO lecturaPrestamo(idLibroHL, idPersonaHL)
VALUES(4,4);
INSERT INTO lecturaPrestamo(idLibroHL, idPersonaHL)
VALUES(4,3);
INSERT INTO lecturaPrestamo(idLibroHL, idPersonaHL)
VALUES(3,2);
INSERT INTO lecturaPrestamo(idLibroHL, idPersonaHL)
VALUES(7,2);
INSERT INTO lecturaPrestamo(idLibroHL, idPersonaHL)
VALUES(5,3);
INSERT INTO lecturaPrestamo(idLibroHL, idPersonaHL)
VALUES(1,2);
INSERT INTO lecturaPrestamo(idLibroHL, idPersonaHL)
VALUES(6,5);
INSERT INTO lecturaPrestamo(idLibroHL, idPersonaHL)
VALUES(3,5);
INSERT INTO lecturaPrestamo(idLibroHL, idPersonaHL)
VALUES(4,1);
INSERT INTO lecturaPrestamo(idLibroHL, idPersonaHL)
VALUES(2,1);
INSERT INTO lecturaPrestamo(idLibroHL, idPersonaHL)
VALUES(5,3);
SELECT * FROM lecturaPrestamo;

INSERT INTO historialLibro(fechaPrestamo,fechaDevolucion,estado, idLecturaPHL)
VALUES('2020-1-8','2020-1-12','Bueno', 2);
INSERT INTO historialLibro(fechaPrestamo,fechaDevolucion,estado, idLecturaPHL)
VALUES('2020-1-10','2020-1-11','Regular', 3);
INSERT INTO historialLibro(fechaPrestamo,fechaDevolucion,estado, idLecturaPHL)
VALUES('2020-1-11','2020-1-13','Bueno', 4);
INSERT INTO historialLibro(fechaPrestamo,fechaDevolucion,estado, idLecturaPHL)
VALUES('2020-1-13','2020-1-14','Malo', 7);
INSERT INTO historialLibro(fechaPrestamo,fechaDevolucion,estado, idLecturaPHL)
VALUES('2020-1-13','2020-1-14','Bueno', 8);
INSERT INTO historialLibro(fechaPrestamo,fechaDevolucion,estado, idLecturaPHL)
VALUES('2020-1-15','2020-1-15','Bueno', 11);
INSERT INTO historialLibro(fechaPrestamo,fechaDevolucion,estado, idLecturaPHL)
VALUES('2020-1-15','2020-1-18','Regular', 12);
INSERT INTO historialLibro(fechaPrestamo,fechaDevolucion,estado, idLecturaPHL)
VALUES('2020-1-16','2020-1-17','Malo', 9);

SELECT * FROM historialLibro;
GO

--Primera consulta
SELECT tl.tipo, COUNT(lp.idPersonaHL) AS Prestamos FROM persona AS p 
INNER JOIN lecturaPrestamo AS lp ON p.idPersona = lp.idPersonaHL
INNER JOIN libro AS l ON lp.idLibroHL = l.idLibro
INNER JOIN tipoLibro AS tl ON tl.idTipoLibro = l.idTipoLL
GROUP BY tl.tipo ORDER BY tl.tipo ASC;

--Segunda consulta
SELECT p.apellidos, p.nombres, tl.tipo AS tipo_Visita, COUNT(lp.idPersonaHL) AS Visitas FROM persona AS p 
INNER JOIN lecturaPrestamo AS lp ON p.idPersona = lp.idPersonaHL
INNER JOIN libro AS l ON lp.idLibroHL = l.idLibro
INNER JOIN tipoLibro AS tl ON tl.idTipoLibro = l.idTipoLL
GROUP BY p.apellidos,p.nombres,tl.tipo ORDER BY tl.tipo ASC;

--Tercera consulta
SELECT pvd.nombre AS Proveedor, edt.nombre AS editorial, tl.tipo, COUNT(l.idProveedorLibro) AS Libros_Comprados FROM libro AS l
INNER JOIN tipoLibro AS tl ON tl.idTipoLibro = l.idTipoLL
INNER JOIN proveedor AS pvd ON pvd.idProveedor = l.idProveedorLibro
INNER JOIN editorial AS edt ON edt.idEditorial = l.idEditorialLibro
GROUP BY pvd.nombre,edt.nombre,tl.tipo ORDER BY tl.tipo ASC;

--Cuarta consulta
SELECT hl.estado AS Estado, COUNT(hl.estado) AS Numero_Libros FROM lecturaPrestamo AS lp
INNER JOIN libro AS l ON lp.idLibroHL = l.idLibro
INNER JOIN historialLibro AS hl ON hl.idLecturaPHL = lp.idLecturaPtm
GROUP BY hl.estado ORDER BY hl.estado ASC;



--Cursor con tabla temporal
CREATE TABLE #Inventario(
	numeroEjemplares NUMERIC,
	nombreAutor VARCHAR(200),
	valorTotal DECIMAL(5,2)
);

DECLARE @numeroEjemplares NUMERIC = 1,
		@nombreAutor VARCHAR(100),
		@valorTotal DECIMAL(5,2),
		@valorTotal2 DECIMAL(5,2),
		@nombreAtrC VARCHAR(100),
		@contador NUMERIC = 1,
		@acumulador NUMERIC = 0

DECLARE insDatosInvtr CURSOR SCROLL FOR
	SELECT a.apellidos, l.precio FROM autor AS a
	INNER JOIN libro AS l ON a.idAutor = l.idAutorLibro
	ORDER BY apellidos

	OPEN insDatosInvtr  
	FETCH NEXT FROM insDatosInvtr INTO @nombreAutor, @valorTotal
	WHILE(@@FETCH_STATUS= 0)
	BEGIN
		
		IF @nombreAtrC = @nombreAutor
		BEGIN
			SET @acumulador = @valorTotal + @valorTotal2
			SET @contador = @contador + (SELECT numeroEjemplares FROM #Inventario WHERE nombreAutor=@nombreAutor)
			UPDATE #Inventario SET numeroEjemplares =  @contador, valorTotal = @acumulador WHERE nombreAutor = @nombreAutor
		END
		ELSE
		BEGIN
			INSERT INTO #Inventario (numeroEjemplares, nombreAutor, valorTotal)
			VALUES (@numeroEjemplares, @nombreAutor, @valorTotal)
		END
		SET @nombreAtrC = @nombreAutor
		SET @valorTotal2 = @valorTotal
		FETCH NEXT FROM insDatosInvtr INTO @nombreAutor, @valorTotal
	END
CLOSE insDatosInvtr
DEALLOCATE insDatosInvtr

SELECT * FROM #Inventario;
DROP TABLE #Inventario;

GO

--TRIGGER
CREATE TRIGGER trgrEstdPrtm
ON lecturaPrestamo
INSTEAD OF INSERT AS
BEGIN
	DECLARE @nombre VARCHAR(100),
	@estado VARCHAR(50),
	@contador NUMERIC = 0,
	@idPersonaT INT
	SET @idPersonaT = (SELECT idPersonaHL FROM inserted)

	DECLARE vfcrEtdLbrs CURSOR SCROLL FOR
		SELECT p.nombres, hl.estado FROM historialLibro AS hl
		INNER JOIN lecturaPrestamo AS lp ON hl.idLecturaPHL = lp.idLecturaPtm
		INNER JOIN persona AS p ON lp.idPersonaHL = p.idPersona WHERE lp.idPersonaHL = @idPersonaT

		OPEN vfcrEtdLbrs  
		FETCH NEXT FROM vfcrEtdLbrs INTO @nombre, @estado
		WHILE(@@FETCH_STATUS= 0)
		BEGIN		
			IF @estado = 'Regular' or @estado='Malo'
			BEGIN
				SET @contador = @contador + 1
			END

			IF @contador>=2
			BEGIN
				ROLLBACK TRANSACTION
				RAISERROR ('No se permite realizar el prestamo del libro a esta persona',-1,-1)
			END

			FETCH NEXT FROM vfcrEtdLbrs INTO @nombre, @estado
		END
		CLOSE vfcrEtdLbrs
		DEALLOCATE vfcrEtdLbrs
END

--Prueba trigger trgrEstdPrtm
SELECT * FROM lecturaPrestamo;

INSERT INTO lecturaPrestamo(idLibroHL, idPersonaHL)
VALUES(5,2);

GO

CREATE PROCEDURE infmPrestamos (@apellidos VARCHAR(100), @nombres VARCHAR(100))
AS
	CREATE TABLE #InformacionPrestamos(
		nombresCompletos VARCHAR(200),
		prestamosDigitales NUMERIC,
		prestamosFisicos NUMERIC
	);

	DECLARE @idPersonaB INT,
		@apellidosP VARCHAR(100),
		@nombresP VARCHAR(100),
		@tipoL VARCHAR (100),
		@contadorD NUMERIC = 0,
		@contadorF NUMERIC = 0

		SET @idPersonaB = (SELECT idPersona FROM persona WHERE apellidos =  @apellidos and nombres = @nombres)

	DECLARE datosInfmc CURSOR SCROLL FOR
		SELECT p.apellidos, p.nombres, tl.tipo FROM lecturaPrestamo AS lp
		INNER JOIN persona AS p ON lp.idPersonaHL = p.idPersona
		INNER JOIN libro AS l ON lp.idLibroHL = l.idAutorLibro
		INNER JOIN tipoLibro AS tl ON l.idTipoLL = tl.idTipoLibro
		WHERE idPersona = 2 ORDER BY tipo 

		OPEN datosInfmc  
		FETCH NEXT FROM datosInfmc INTO @apellidosP ,@nombresP, @tipoL
		WHILE(@@FETCH_STATUS= 0)
		BEGIN
			
			IF @tipoL = 'Digital' 
			BEGIN
				SET @contadorD = @contadorD + 1
			END
			ELSE IF @tipoL = 'Fisico' 
			BEGIN
				SET @contadorF = @contadorF + 1
			END
			FETCH NEXT FROM datosInfmc INTO @apellidosP ,@nombresP, @tipoL
		END
		INSERT INTO #InformacionPrestamos (nombresCompletos, prestamosDigitales, prestamosFisicos)
		VALUES (@nombresP +' '+@apellidosP, @contadorD, @contadorF)
	CLOSE datosInfmc
	DEALLOCATE datosInfmc

	SELECT * FROM #InformacionPrestamos;
	DROP TABLE #InformacionPrestamos;
GO
--Prueba procedimiento almacenado infmPrestamos
EXEC infmPrestamos 'Sánchez Pons', 'José';
