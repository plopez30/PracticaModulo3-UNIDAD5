/*PRÁCTICA MÓDULO 3-UNIDAD 5*/

/*DDL*/

--BORRAR TABLA PARA NO GENERAR ERRORES
DROP TABLE IF EXISTS inventario;

--CREAR BASE DE DATOS Y PONERLA EN USO

CREATE DATABASE BodegaTech1;

USE BodegaTech1;

--CREAR TABLA

CREATE TABLE inventario (
			id_producto	INT IDENTITY(1,1) PRIMARY KEY,        --INT, porque se pone número entero
			nombre_producto	VARCHAR(100),                     --VARCHAR, frase de 100 caracteres, porque es lo que pide el ejercicio, yo le pondría menos caracteres porque los nombres de los productos suelen ser menos y así gastar menos bytes
			categoria VARCHAR(50),                            --VARCHAR, la categoría es solo con palabras. Hasta 50, porque es lo que pide el ejercicio
			precio_unitario	DECIMAL(10,2),					  --DECIMAL, porque es un precio y no hay que usar FLOAT. (10,2), porque son 10 caracteres y 2 números despues de la ","
			stock_actual INT,								  --INT, porque se pone número entero
			stock_minimo INT,								  --INT, porque se pone número entero
			fecha_ingreso DATE,                               --DATE, porque es el formato correcto para fechas
			activo TINYINT NOT NULL DEFAULT 1                 --TINYINT, porque usa menos bytes y quiero que ponga 1 cuando hay producto y 0 cuando no hay.
			);

--verif

SELECT * FROM dbo.inventario;

/*DML*/

--CARGAR DATOS
SET IDENTITY_INSERT inventario ON;
INSERT INTO inventario (
			id_producto,
			nombre_producto,
			categoria,
			precio_unitario,
			stock_actual,
			stock_minimo,
			fecha_ingreso,
			activo
			)
SELECT DISTINCT
			id,
			nombre_producto,
			categoria,
			precio,
			stock_actual,
			stock_minimo,
			fecha_ingreso,
			activo
		FROM BodegaTech;

--verif
SELECT * FROM dbo.inventario;


--UPDATE CON WHERE

UPDATE inventario
SET stock_actual = stock_actual - 3
WHERE id_producto = 1;

--verif
SELECT * FROM dbo.inventario;

UPDATE inventario
SET stock_actual = stock_actual - 12
WHERE id_producto = 2;

UPDATE inventario
SET stock_actual = stock_actual - 5
WHERE id_producto = 6;

--UPDATE ADICIONAL

UPDATE inventario
SET activo = 0
WHERE id_producto = 8;

/*VERFICACIÓN FINAL*/

SELECT * FROM dbo.inventario;