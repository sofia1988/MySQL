DROP DATABASE IF EXISTS personal;
CREATE DATABASE personal CHARACTER SET utf8mb4;
USE personal;

CREATE TABLE departamentos (
id_depto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  nombre_depto VARCHAR(20) NOT NULL,
  ciudad VARCHAR(15) NULL,
  nombre_jefe_depto CHAR(30) NULL
);


CREATE TABLE empleados (
  id_emp INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre CHAR(30) NOT NULL,
  sex_emp CHAR(1) NOT NULL,
  fec_nac DATE NOT NULL,
  fec_incorporacion DATE NOT NULL,
  sal_emp FLOAT NOT NULL,
  comision_emp FLOAT NOT NULL,
  cargo_emp VARCHAR(15) NOT NULL,
  id_depto INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_depto) REFERENCES departamentos(id_depto)
  );


-- Insertar datos en la tabla `departamentos`

INSERT INTO `departamentos` VALUES (1000,'GERENCIA','CIUDAD REAL','Bruno Cebrian');
INSERT INTO `departamentos` VALUES (1500,'PRODUCCIÓN','CIUDAD REAL','Jesica Duran');
INSERT INTO `departamentos` VALUES (2000,'VENTAS','CIUDAD REAL','Alicia Andres');
INSERT INTO `departamentos` VALUES (2100,'VENTAS','BARCELONA','Fabian Soto');
INSERT INTO `departamentos` VALUES (2200,'VENTAS','VALENCIA','Mari Plaza');
INSERT INTO `departamentos` VALUES (2300,'VENTAS','MADRID','Jonatan Acuña');
INSERT INTO `departamentos` VALUES (3000,'INVESTIGACIÓN','CIUDAD REAL','Valentina Sola');
INSERT INTO `departamentos` VALUES (3500,'MERCADEO','CIUDAD REAL','Abraham Diego');
INSERT INTO `departamentos` VALUES (4000,'MANTENIMIENTO','CIUDAD REAL','Raúl Carrero');
INSERT INTO `departamentos` VALUES (4100,'MANTENIMIENTO','BARCELONA','Catalina Valdes');
INSERT INTO `departamentos` VALUES (4200,'MANTENIMIENTO','VALENCIA','Adriana Rocha');
INSERT INTO `departamentos` VALUES (4300,'MANTENIMIENTO','MADRID','German Luna');
INSERT INTO `departamentos` VALUES (4301,'administracion','MADRID','jeremias zapata');

-- Insertar datos en la tabla `empleados`

INSERT INTO `empleados` VALUES (222,'José Giraldo','M','1985-01-20','2000-11-01',1200000,400000,'Asesor',3500);
INSERT INTO `empleados` VALUES (333,'Pedro Blanco','M','1987-10-28','2000-10-01',800000,3000000,'Vendedor',2000);
INSERT INTO `empleados` VALUES (444,'Jesús Alfonso','M','1988-03-14','2000-10-01',800000,3500000,'Vendedor',2000);
INSERT INTO `empleados` VALUES (555,'Julián Mora','M','1989-07-03','2000-10-01',800000,3100000,'Vendedor',2200);
INSERT INTO `empleados` VALUES (666,'Manuel Millán','M','1990-12-08','2004-06-01',800000,3700000,'Vendedor',2300);
INSERT INTO `empleados` VALUES (777,'Marcos Cortez','M','1986-06-23','2000-04-16',2550000,500000,'Mecánico',4000);
INSERT INTO `empleados` VALUES (782,'Antonio Gil','M','1980-01-23','2010-04-16',850000,1500000,'Técnico',1500);
INSERT INTO `empleados` VALUES (219,'Melissa Roa','F','1960-06-19','2001-03-16',2250000,2500000,'Vendedor',2100);
INSERT INTO `empleados` VALUES (111,'Irene Díaz','F','1979-09-28','2004-06-01',1050000,200000,'Mecánico',4200);
INSERT INTO `empleados` VALUES (383,'Luis Pérez','M','1956-02-25','2000-01-01',5050000,0,'Director',1500);
INSERT INTO `empleados` VALUES (060,'Darío Casas','M','1960-04-05','1992-11-01',4500000,500000,'Investigador',3000);
INSERT INTO `empleados` VALUES (802,'William Daza','M','1982-10-09','1999-12-16',2250000,1000000,'Investigador',3000);
INSERT INTO `empleados` VALUES (221,'Carla López','F','1975-05-11','2005-07-16',4500000,500000,'Jefe Mercadeo',3500);
INSERT INTO `empleados` VALUES (331,'Carlos Rozo','M','1975-05-11','2001-09-16',750000,500000,'Vigilante',3500);
INSERT INTO `empleados` VALUES (099,'Diana Solarte','F','1957-11-19','1990-05-16',1250000,500000,'Secretaria',1000);
INSERT INTO `empleados` VALUES (144,'Rosa Angulo','F','1957-03-15','1998-08-16',3250000,3500000,'Jefe Ventas',2000);
INSERT INTO `empleados` VALUES (269,'María Rojas','F','1959-01-15','1990-05-16',6250000,1500000,'Gerente',1000);
INSERT INTO `empleados` VALUES (343,'Elisa Rojas','F','1979-09-28','2004-06-01',3000000,1000000,'Jefe Mecánicos',4000);
INSERT INTO `empleados` VALUES (334,'Marisol Pulido','F','1979-10-01','1990-05-16',3250000,1000000,'Investigador',3000);
INSERT INTO `empleados` VALUES (335,'Ana Moreno','F','1992-01-05','2004-06-01',1200000,400000,'Secretaria',3000);
INSERT INTO `empleados` VALUES (336,'Carolina Ríos','F','1992-02-15','2000-10-01',1250000,500000,'Secretaria',1500);
INSERT INTO `empleados` VALUES (337,'Edith Muñoz','F','1992-03-31','2000-10-01',800000,3600000,'Vendedor',2100);
INSERT INTO `empleados` VALUES (338,'Abel Gómez','M','1939-12-24','2000-10-01',1050000,200000,'Mecánico',4300);
INSERT INTO `empleados` VALUES (689,'Mario Llano','M','1945-08-30','1990-05-16',2250000,2500000,'Vendedor',2300);
INSERT INTO `empleados` VALUES (785,'Joaquín Rosas','M','1947-07-07','1990-05-16',2250000,2500000,'Vendedor',2200);
INSERT INTO `empleados` VALUES (898,'Iván Duarte','M','1955-08-12','1998-05-16',1050000,200000,'Mecánico',4100);

SELECT * FROM departamentos;
SELECT * FROM empleados;

/*Listar el nombre de los departamentos.*/
SELECT nombre_depto FROM departamentos;
/*Obtener el nombre y salario de todos los empleados.*/
SELECT nombre, sal_emp FROM empleados;
/*Listar todas las comisiones.*/
SELECT comision_emp FROM empleados;
/*Obtener los datos de los empleados cuyo cargo sea ‘Secretaria’.*/
SELECT * FROM empleados WHERE cargo_emp = 'Secretaria';
/*Obtener los datos de los empleados vendedores, ordenados por nombre alfabéticamente.*/
SELECT * FROM empleados WHERE cargo_emp ='Vendedor'  ORDER BY nombre ASC;
/*Obtener el nombre y cargo de todos los empleados, ordenados por salario de menor a mayor.*/
SELECT nombre ,cargo_emp , sal_emp FROM empleados ORDER BY sal_emp ASC;
/*Obtener el nombre de o de los jefes que tengan su departamento situado en la ciudad de “Ciudad Real”*/
SELECT nombre_jefe_depto FROM departamentos WHERE ciudad = 'Ciudad Real';
/*Elabore un listado donde para cada fila, figure el alias ‘Nombre’ y ‘Cargo’ para las respectivas tablas de empleados.*/
SELECT nombre AS Nombre , cargo_emp AS Cargo  FROM empleados;
/*Listar los salarios y comisiones de los empleados del departamento 2000, ordenado por comisión de menor a mayor.*/
SELECT sal_emp ,comision_emp FROM empleados  WHERE id_depto = 2000  ORDER BY comision_emp ASC;
/*Obtener el valor total a pagar a cada empleado del departamento 3000, que resulta de: sumar el salario y la comisión, más una bonificación de 500. Mostrar el nombre del empleado y el total a pagar, en orden alfabético.*/
SELECT nombre,(sal_emp +comision_emp +500) FROM empleados WHERE id_depto = 3000  ORDER BY nombre ASC;
/*Muestra los empleados cuyo nombre empiece con la letra J.*/
SELECT nombre FROM empleados WHERE nombre LIKE 'J%';
/*Listar el salario, la comisión, el salario total (salario + comisión) y nombre, de aquellos empleados que tienen comisión superior a 1000.*/
SELECT sal_emp,comision_emp,nombre ,(sal_emp +comision_emp) AS salarioTotal FROM empleados WHERE comision_emp > 100000;
/*Obtener un listado similar al anterior, pero de aquellos empleados que NO tienen comisión.*/
SELECT sal_emp,comision_emp,nombre ,(sal_emp +comision_emp) AS salarioTotal FROM empleados WHERE comision_emp = 0;
/*Obtener la lista de los empleados que ganan una comisión superior a su sueldo.*/
SELECT sal_emp,comision_emp,nombre ,(sal_emp +comision_emp) AS salarioTotal  FROM empleados WHERE comision_emp > sal_emp;
/*Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.*/
SELECT nombre,comision_emp FROM empleados WHERE comision_emp <= sal_emp *0.30;
/*Hallar los empleados cuyo nombre no contiene la cadena “MA”*/
SELECT nombre FROM empleados WHERE nombre NOT LIKE '%ma%';
/*Obtener los nombres de los departamentos que sean “Ventas”, “Investigación” o ‘Mantenimiento.*/
SELECT nombre_depto FROM departamentos WHERE id_depto IN (SELECT id_depto FROM departamentos WHERE nombre_depto IN ('Ventas', 'Investigación' ,'Mantenimiento'));
/*Ahora obtener el contrario, los nombres de los departamentos que no sean “Ventas” ni “Investigación” ni ‘Mantenimiento.*/
SELECT nombre_depto FROM departamentos WHERE id_depto IN (SELECT id_depto FROM departamentos WHERE nombre_depto NOT IN ('Ventas', 'Investigación' ,'Mantenimiento'));
/*Mostrar el salario más alto de la empresa.*/
SELECT MAX(sal_emp) AS salario_maximo FROM empleados;
/*Mostrar el nombre del último empleado de la lista por orden alfabético.*/
SELECT nombre FROM empleados ORDER BY nombre DESC LIMIT 1;
/*Hallar el salario más alto, el más bajo y la diferencia entre ellos.*/
SELECT MAX(sal_emp) AS salario_maximo, MIN(sal_emp) AS salario_minimo, MAX(sal_emp) - MIN(sal_emp) AS diferencia_salarios FROM empleados;
/*Hallar el salario promedio por departamento.*/
SELECT id_depto,ROUND (AVG(sal_emp)) AS salario_promedio FROM empleados GROUP BY id_depto;
/*GROUP BY id_depto. Esto significa que queremos agrupar los datos por el campo id_depto. Esto nos permite obtener el salario promedio para cada departamento en lugar de un promedio global de todos los empleados.*/
/*Hallar los departamentos que tienen más de tres empleados. Mostrar el número de empleados de esos departamentos.*/
SELECT id_depto, COUNT(*) AS cantidad_empleados FROM empleados GROUP BY id_depto HAVING COUNT(*) > 3;
/*La cláusula HAVING se utiliza en SQL para filtrar los resultados después de aplicar una operación de agregación, como GROUP BY. Mientras que la cláusula WHERE se utiliza para filtrar filas antes de que se realice la operación de agregación, la cláusula HAVING se aplica después de la operación de agregación y se utiliza para filtrar grupos de filas.*/
/*La cláusula HAVING funciona de manera similar a la cláusula WHERE, pero se aplica a grupos en lugar de filas individuales*/

/*Hallar los departamentos que no tienen empleados*/
SELECT * FROM departamentos d WHERE NOT EXISTS (SELECT e.id_depto FROM empleados e WHERE e.id_depto = d.id_depto);
/*Mostrar la lista de los empleados cuyo salario es mayor o igual que el promedio de la empresa. Ordenarlo por departamento.*/
SELECT nombre,sal_emp, id_depto FROM empleados WHERE sal_emp >= (SELECT AVG(sal_emp) FROM empleados) ORDER BY id_depto;





