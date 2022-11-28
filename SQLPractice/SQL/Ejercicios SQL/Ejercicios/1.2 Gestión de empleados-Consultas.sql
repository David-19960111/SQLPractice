-- Fuente: https://josejuansanchez.org/bd/ejercicios-consultas-sql/index.html#modelo-entidadrelaci%C3%B3n-2

-- 1.2 Gestión de empleados
-- Cargar la base de datos de 1.2 Gestión de empleados-base de datos.
USE empleados;

-- 1.2.3 Consultas sobre una tabla

SELECT * FROM empleado;

-- 1. Lista el primer apellido de todos los empleados.

SELECT apellido2 AS 'Primer Apellido'
FROM empleado;

-- 2. Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.

SELECT DISTINCT apellido2 AS 'Primer Apellido'
FROM empleado;

-- 3. Lista todas las columnas de la tabla empleado.

SELECT *
FROM empleado;

-- 4. Lista el nombre y los apellidos de todos los empleados.

SELECT nombre AS 'Nombre', apellido1 AS 'Primer Apellido', apellido2 AS 'Segundo Apellido'
FROM empleado;

-- 5. Lista el código de los departamentos de los empleados que aparecen en la tabla empleado.

SELECT codigo
FROM empleado;

-- 6. Lista el código de los departamentos de los empleados que aparecen en la tabla empleado, eliminando los códigos que aparecen repetidos.

SELECT DISTINCT codigo
FROM empleado;

-- 7. Lista el nombre y apellidos de los empleados en una única columna.

SELECT CONCAT(nombre,' ',apellido1,' ',apellido2,' ') AS 'Nombre Completo'
FROM empleado;

-- 8. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.

SELECT UPPER(CONCAT(nombre,' ',apellido1,' ',apellido2,' ')) AS 'Nombre Completo'
FROM empleado;


-- 9. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.

SELECT LOWER(CONCAT(nombre,' ',apellido1,' ',apellido2,' ')) AS 'Nombre Completo'
FROM empleado;


-- 10. Lista el código de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la otra la letra.

SELECT codigo, nif, REGEXP_SUBSTR(nif,"[0-9]+") as nif_num ,
CASE
    WHEN STRCMP(REGEXP_SUBSTR(nif,"[A-Z]+", 1), REGEXP_SUBSTR(nif,"[A-Z]+", CHARACTER_LENGTH(nif))) = 0 THEN REGEXP_SUBSTR(nif,"[A-Z]+", 1)
    ELSE CONCAT(REGEXP_SUBSTR(nif,"[A-Z]+", 1),REGEXP_SUBSTR(nif,"[A-Z]+", CHARACTER_LENGTH(nif)))
END as nif_letters
FROM empleado
ORDER BY codigo ASC;

SELECT codigo, nif,left(nif,8) AS 'NIF Number',right(nif,1) AS 'NIF Cod'
FROM empleado
ORDER BY codigo ASC;


-- 11. Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone.
--  Para calcular este dato tendrá que restar al valor del presupuesto inicial (columnapresupuesto) 
-- los gastos que se han generado (columnagastos). 
-- Tenga en cuenta que en algunos casos pueden existir valores negativos. 
-- Utilice un alias apropiado para la nueva columna columna que está calculando.

SELECT *
FROM departamento;

SELECT nombre AS 'Nombre de departamento', (presupuesto - gastos) AS 'Presupuesto Actual'
FROM departamento;


-- 12. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.

SELECT nombre AS 'Nombre de departamento', (presupuesto - gastos) AS 'Presupuesto Actual'
FROM departamento
ORDER BY 'Presupuesto Actual' ASC;

-- 13. Lista el nombre de todos los departamentos ordenados de forma ascendente.

SELECT nombre AS 'Nombre de departamento'
FROM departamento
ORDER BY nombre ASC;

-- 14. Lista el nombre de todos los departamentos ordenados de forma desscendente.

SELECT nombre AS 'Nombre de departamento'
FROM departamento
ORDER BY nombre DESC;



-- 15. Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer 
-- lugar sus apellidos y luego su nombre.

SELECT nombre as 'Nombre', apellido1 AS 'Primer Apellido', apellido2 AS 'Segundo Apellido'
FROM empleado
ORDER BY apellido1, nombre ASC;

-- 16. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.

SELECT nombre, presupuesto 
FROM departamento
ORDER BY presupuesto DESC
LIMIT 3;

-- 17. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.

SELECT nombre, presupuesto 
FROM departamento
ORDER BY presupuesto 
LIMIT 3;

-- 18. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.

SELECT nombre, gastos 
FROM departamento
ORDER BY gastos DESC
LIMIT 2;

-- 19. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.

SELECT nombre, gastos 
FROM departamento
ORDER BY gastos ASC
LIMIT 2;


-- 20. Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La tercera fila se debe incluir en la respuesta.
-- La respuesta debe incluir todas las columnas de la tabla empleado.

SELECT *
FROM empleado
LIMIT 5
OFFSET 2;

-- 21. Devuelve una lista con el nombre de los departamentos y el presupuesto, 
-- de aquellos que tienen un presupuesto mayor o igual a 150000 euros.

SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto >= 150000;


-- 22. Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000 euros de gastos.

SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto <= 5000;


-- 23. Devuelve una lista con el nombre de los departamentos y el presupesto, de aquellos que tienen 
-- un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.

SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto >= 100000 AND presupuesto <= 200000;


-- 24. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. 
-- Sin utilizar el operador BETWEEN.

SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto <= 100000 
OR presupuesto >= 200000;


-- 25. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros. 
-- Utilizando el operador BETWEEN.

SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto BETWEEN 100000 AND 200000;


-- 26. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. 
-- Utilizando el operador BETWEEN.

SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto NOT BETWEEN 100000 AND 200000;


-- 27. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, 
-- de quellos departamentos donde los gastos sean mayores que el presupuesto del que disponen.

SELECT nombre AS 'Departamentos', gastos AS 'Gastos', presupuesto AS 'Presupuesto'
FROM departamento
WHERE gastos > presupuesto;

-- 28. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto,
-- de aquellos departamentos donde los gastos sean menores que el presupuesto del que disponen.

SELECT nombre AS 'Departamentos', gastos AS 'Gastos', presupuesto AS 'Presupuesto'
FROM departamento
WHERE gastos < presupuesto;

-- 29. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, 
-- de aquellos departamentos donde los gastos sean iguales al presupuesto del que disponen.

SELECT nombre AS 'Departamentos', gastos AS 'Gastos', presupuesto AS 'Presupuesto'
FROM departamento
WHERE gastos = presupuesto;

-- 30. Lista todos los datos de los empleados cuyo segundo apellido sea NULL.

SELECT *
FROM empleado
WHERE apellido2 IS NULL;

-- 31. Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.

SELECT *
FROM empleado
WHERE apellido2 IS NOT NULL;

-- 32. Lista todos los datos de los empleados cuyo segundo apellido sea López.

SELECT *
FROM empleado
WHERE apellido2 = 'López';

-- 33. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.

SELECT *
FROM empleado
WHERE apellido2 = 'Díaz' OR apellido2 = 'Moreno';

-- 34. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.

SELECT *
FROM empleado
WHERE apellido2 IN ('Díaz','Moreno');

-- 35. Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.

SELECT nombre AS 'Nombre', apellido1 AS 'Apellido', nif as 'NIF'
FROM empleado
WHERE codigo_departamento = 3;

-- 36. Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.

SELECT nombre AS 'Nombre', apellido1 AS 'Apellido', nif as 'NIF'
FROM empleado
WHERE codigo_departamento IN (2,4,5);

-- 1.2.4 Consultas multitabla (Composición interna)
-- Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.

-- 1. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.

SELECT e.codigo AS 'Codigo Empleado',
CONCAT(e.nombre,' ',e.apellido1,' ',e.apellido2,' ') AS 'Nombre y apellidos',
d.codigo AS 'Codigo Departamento',
d.nombre AS 'Nombre Departamento'
FROM empleado e
JOIN departamento d
ON e.codigo = d.codigo
ORDER BY e.codigo;



-- 2. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. 
-- Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) 
-- y en segundo lugar por los apellidos y el nombre de los empleados.

SELECT e.codigo AS 'Codigo Empleado',
CONCAT(e.nombre,' ',e.apellido1,' ',e.apellido2,' ') AS 'Nombre_apellidos',
d.codigo AS 'Codigo Departamento',
d.nombre AS 'Nombre Departamento'
FROM empleado e
JOIN departamento d
ON e.codigo = d.codigo
ORDER BY d.nombre, Nombre_apellidos;


-- 3. Devuelve un listado con el código y el nombre del departamento, 
-- solamente de aquellos departamentos que tienen empleados.

SELECT DISTINCT d.codigo, d.nombre as Departamento
FROM empleado e join  departamento d on d.codigo = e.codigo_departamento;


-- 4. Devuelve un listado con el código, el nombre del departamento y el valor del presupuesto actual del que dispone, 
-- solamente de aquellos departamentos que tienen empleados. 
-- El valor del presupuesto actual lo puede calcular restando al valor del presupuesto inicial (columna presupuesto) , 
-- el valor de los gastos que ha generado (columna gastos).

SELECT DISTINCT d.codigo, d.nombre AS Departamento, (d.presupuesto - d.gastos) AS Presupuesto_actual
FROM empleado e
JOIN departamento d
ON d.codigo = e.codigo_departamento;

-- 5. Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.

SELECT d.nombre AS Nombre_departamento
FROM empleado e
JOIN departamento d
ON d.codigo = e.codigo_departamento
WHERE e.nif = '38382980M';

-- 6. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.

SELECT d.nombre AS Nombre_departamento
FROM empleado e
JOIN departamento d
ON d.codigo = e.codigo_departamento
WHERE e.nombre LIKE '%Pepe%';

SELECT  d.nombre as Departamento
FROM empleado e join  departamento d on d.codigo = e.codigo_departamento
WHERE CONCAT(e.nombre,' ', e.apellido1, ' ' ,e.apellido2) = 'Pepe Ruiz Santana';

-- 7. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D.
-- Ordena el resultado alfabéticamente.

SELECT e.nombre AS Nombre_empleado
FROM empleado e
JOIN departamento d
ON d.codigo = e.codigo_departamento
WHERE d.nombre = 'I+D'
ORDER BY e.nombre;

SELECT  e.codigo as Codigo_Empleado, 
		nif,
		CONCAT(e.nombre,' ', e.apellido1, ' ' ,e.apellido2) as Nombre_Empleado
FROM empleado e join  departamento d on d.codigo = e.codigo_departamento
WHERE d.nombre = 'I+D';

--  8.Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas,Contabilidado I+D. 
--  Ordena el resultado alfabéticamente.
SELECT  e.codigo as Codigo_Empleado, 
		nif,
		CONCAT(e.nombre,' ', e.apellido1, ' ' ,e.apellido2) as Nombre_Empleado
FROM empleado e join  departamento d on d.codigo = e.codigo_departamento
WHERE d.nombre IN ('Sistemas', 'Contabilidad', 'I+D');

-- 9. Devuelve una lista con el nombre de los empleados que tienen los departamentos 
-- que no tienen un presupuesto entre 100000 y 200000 euros.

SELECT  e.codigo as Codigo_Empleado, 
		nif,
		CONCAT(e.nombre,' ', e.apellido1, ' ' ,e.apellido2) as Nombre_Empleado
FROM empleado e join  departamento d on d.codigo = e.codigo_departamento
WHERE d.presupuesto NOT BETWEEN 100000 AND 200000;


-- 10. Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo apellido sea NULL. 
-- Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.

SELECT d.nombre AS Nombre_departamento
FROM departamento d
JOIN empleado e
ON e.codigo_departamento = d.codigo
WHERE e.apellido2 IS NULL;

-- 1.2.5 Consultas multitabla (Composición externa)
-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

-- 1. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan.
-- Este listado también debe incluir los empleados que no tienen ningún departamento asociado.

SELECT e.codigo_departamento,
CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2, ' ') AS Nombre_completo,
d.nombre AS Nombre_departamento
FROM empleado e
LEFT JOIN departamento d
ON d.codigo = e.codigo_departamento;

-- 2. Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.

SELECT e.codigo_departamento,
CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2, ' ') AS Nombre_completo,
d.nombre AS Nombre_departamento
FROM empleado e
LEFT JOIN departamento d
ON e.codigo_departamento = d.codigo
WHERE d.nombre IS NULL;

-- 3. Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.

SELECT e.codigo_departamento,
CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2, ' ') AS Nombre_completo,
d.nombre AS Nombre_departamento
FROM empleado e
RIGHT JOIN departamento d
ON d.codigo = e.codigo_departamento
WHERE CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2, ' ') IS NULL;

-- 4. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan. 
-- El listado debe incluir los empleados que no tienen ningún departamento asociado y los departamentos que no 
-- tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.

SELECT e.codigo_departamento,
CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2, ' ') AS Nombre_completo,
d.nombre AS Nombre_departamento
FROM empleado e
LEFT JOIN departamento d
ON e.codigo_departamento = d.codigo
UNION
SELECT e.codigo ,
 CONCAT(e.nombre,' ', e.apellido1, ' ' ,e.apellido2) as Nombre_Empleado,
 d.nombre as Nombre_departamento
FROM empleado e
 RIGHT JOIN  
 departamento d on d.codigo = e.codigo_departamento
ORDER BY Nombre_departamento;


-- 5. Devuelve un listado con los empleados que no tienen ningún departamento asociado y los departamentos
-- que no nen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.

SELECT e.codigo , CONCAT(e.nombre,' ', e.apellido1, ' ' ,e.apellido2) as Nombre_Empleado, d.nombre as Departamento
FROM empleado e LEFT JOIN  departamento d on d.codigo = e.codigo_departamento
WHERE d.nombre is NULL
UNION
SELECT e.codigo , CONCAT(e.nombre,' ', e.apellido1, ' ' ,e.apellido2) as Nombre_Empleado, d.nombre as Departamento
FROM empleado e RIGHT JOIN  departamento d on d.codigo = e.codigo_departamento
WHERE CONCAT(e.nombre,' ', e.apellido1, ' ' ,e.apellido2) is NULL;

-- 1.2.6 Consultas resumen

-- 1. Calcula la suma del presupuesto de todos los departamentos.

SELECT SUM(presupuesto) AS Presupuesto_total
FROM departamento;

-- 2. Calcula la media del presupuesto de todos los departamentos.

SELECT AVG(presupuesto) AS Promedio
FROM departamento;

-- 3. Calcula el valor mínimo del presupuesto de todos los departamentos.

SELECT MIN(presupuesto) AS Presupuesto_total
FROM departamento;

-- 4. Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con menor presupuesto.

SELECT nombre, MIN(presupuesto)
FROM departamento;

SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto = (SELECT MIN(presupuesto)
FROM departamento);


-- 5. Calcula el valor máximo del presupuesto de todos los departamentos.

SELECT nombre, MAX(presupuesto)
FROM departamento;

-- 6. Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con mayor presupuesto.

SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto = (SELECT MAX(presupuesto) AS Maximo_presupuesto FROM departamento);

-- 7. Calcula el número total de empleados que hay en la tabla empleado.

SELECT COUNT(nombre) AS Total_empleados
FROM empleado;

-- 8. Calcula el número de empleados que no tienen NULL en su segundo apellido.

SELECT COUNT(nombre) AS Total_empleados
FROM empleado
WHERE apellido2 IS NOT NULL;

SELECT apellido2
FROM empleado;

-- 9. Calcula el número de empleados que hay en cada departamento. Tienes que devolver dos columnas, 
-- una con el nombre del departamento y otra con el número de empleados que tiene asignados.

SELECT d.nombre,COUNT(e.nombre) AS Total_empleados
FROM departamento d
JOIN empleado e
ON e.codigo_departamento = d.codigo
GROUP BY e.codigo_departamento;

-- 10. Calcula el nombre de los departamentos que tienen más de 2 empleados. 
-- El resultado debe tener dos columnas, una con el nombre del departamento
-- y otra con el número de empleados que tiene asignados.

SELECT d.nombre,COUNT(e.nombre) AS Total_empleados
FROM departamento d
JOIN empleado e
ON e.codigo_departamento = d.codigo
GROUP BY e.codigo_departamento
HAVING Total_empleados > 2;


-- 11. Calcula el número de empleados que trabajan en cada uno de los departamentos.
-- El resultado de esta consulta también tiene que incluir aquellos departamentos que no tienen ningún empleado asociado.

SELECT d.nombre, COUNT(e.nombre) AS Total_empleados
FROM departamento d
RIGHT JOIN empleado e
ON e.codigo_departamento = d.codigo
GROUP BY e.codigo_departamento;


-- 12. Calcula el número de empleados que trabajan en cada unos de los departamentos que tienen un presupuesto mayor a 200000 euros.

SELECT d.nombre, COUNT(e.nombre) AS Total_empleados
FROM departamento d
JOIN empleado e
ON e.codigo_departamento = d.codigo
WHERE d.presupuesto > 200000
GROUP BY e.codigo_departamento;


-- 1.2.7 Subconsultas
-- 1.2.7.1 Con operadores básicos de comparación

-- 1. Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN).

SELECT *
FROM empleado
WHERE codigo_departamento = (SELECT codigo FROM departamento WHERE nombre = 'Sistemas');

-- 2. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.

SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto = (SELECT MAX(presupuesto) AS Mayor_presupuesto FROM departamento);

-- 3. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.

SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto = (SELECT MIN(presupuesto) AS Mayor_presupuesto FROM departamento);

-- 1.2.7.2 Subconsultas con ALL y ANY

-- 4. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada. 
-- Sin hacer uso de MAX, ORDER BY ni LIMIT.

SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto >= ALL(SELECT presupuesto FROM departamento);

-- 5. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.
--  Sin hacer uso de MIN, ORDER BY ni LIMIT.

SELECT nombre, presupuesto
FROM departamento
WHERE presupuesto <= ALL(SELECT presupuesto FROM departamento);


-- 6. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando ALL o ANY).

SELECT nombre
FROM departamento
WHERE codigo = ANY(SELECT DISTINCT codigo_departamento FROM empleado);


-- 7. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando ALL o ANY).

SELECT nombre
FROM departamento
WHERE codigo != ALL(SELECT codigo_departamento FROM empleado);


-- 1.2.7.3 Subconsultas con IN y NOT IN

-- 8. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando IN o NOT IN).

SELECT nombre
FROM departamento
WHERE codigo IN (SELECT DISTINCT (codigo_departamento) FROM empleado);

-- 9. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN).

SELECT nombre
FROM departamento
WHERE codigo NOT IN (SELECT codigo_departamento FROM empleado);

-- 1.2.7.4 Subconsultas con EXISTS y NOT EXISTS

-- 10. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT nombre as Departamento FROM departamento d
WHERE EXISTS (SELECT codigo_departamento FROM empleado e 
			  where d.codigo = e.codigo_departamento);



-- 11. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT nombre as Departamento FROM departamento d
WHERE NOT EXISTS (SELECT codigo_departamento FROM empleado e 
				  where d.codigo = e.codigo_departamento);

