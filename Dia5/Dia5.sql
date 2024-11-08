USE universidad_T2;

-- 1. Devuelve todos los datos del alumno más joven.

select * from alumno where alumno.fecha_nacimiento = (select max(fecha_nacimiento) from alumno);

-- 2. Devuelve un listado con los profesores que no están asociados a un departamento.

select * from profesor where id_departamento = NULL;

-- 3. Devuelve un listado con los departamentos que no tienen profesores asociados.

select depar.nombre from departamento depar where depar.id not in (select distinct profe.id_departamento from profesor profe);

-- 4.  Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.

select profesor.* from profesor
left join asignatura asig on asig.id_profesor = profesor.id where asig.id_profesor is NULL;

-- 5.  Devuelve un listado con las asignaturas que no tienen un profesor asignado.

select * from asignatura where id_profesor is NULL;

-- 6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.




-- 7. Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).

select distinct depar.* from departamento depar
inner join profesor profe on  profe.id = depar.id
inner join asignatura asig on asig.id = profe.id;

-- 8.  Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. 
-- El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre 
-- del departamento, apellidos y el nombre.

select depar.nombre as nombre_departamento, profe.apellido1, profe.apellido2, profe.nombre as nombre_profesor from profesor profe
inner join departamento depar on profe.id_departamento = depar.id order by nombre_departamento, profe.apellido1, profe.apellido2, profe.nombre ASC;


-- 9. Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar.
-- resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.

