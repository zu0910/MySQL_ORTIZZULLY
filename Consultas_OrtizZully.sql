USE universidad_T2;

-- Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos.
-- El listado debera estar ordenado alfabeticamente de menor a mayor por el primer apellido, segundo apellido y nombre.

select apellido1 as Apellido_1, apellido2 as Apellido_2, nombre as Nombre from alumno order by 1,2,3 ASC;

-- Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su numero de telefono en la base de datos.
select nombre, apellido1, apellido2 from alumno where telefono is NULL;

-- Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.

select * from asignatura where cuatrimestre = 1 and curso = 3 and id_grado=7;

-- Devuelve un listado con todas las asignaturas ofertadas en el grafo en Ingeniería Informatica(Plan 2015).
-- select * from grado where nombre = 'Grado en Ingenería Informática (Plan 2015)';
select * from asignatura
inner join grado on asignatura.id_grado = grado.id 
where grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2017/2018.alter
select * from alumno al 
inner join alumno_se_matricula_asignatura asm on al.id = asm.id_alumno 
inner join asignatura a on asm.id_asignatura = a.id
inner join curso_escolar ce on ce.id = asm.id_curso_escolar
where ce.anyo_inicio = '2017' and ce.anyo_fin = '2018';

-- 1. Devuelve el número total de alumnas que hay.
-- select id, nombre, apellido1, apellido2 from alumno where sexo = 'M';
select COUNT(sexo) as alumnas from alumno where sexo = 'M';

-- 2. Calcula cuántos alumnos nacieron en 1999.
-- select * from  alumno; 
select count(fecha_nacimiento) as nacieron_1999 from alumno where year (fecha_nacimiento) = 1999;

-- 3. Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre 
-- del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los
--  departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.

select departamento.nombre as nombre_apartamento, COUNT(profesor.id_departamento) as numero_profesor from profesor 
inner join departamento on profesor.id_departamento = departamento.id
group by departamento.nombre order by numero_profesor DESC;


-- 4. Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir 
-- departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.
select depa.nombre, COUNT(profe.id_departamento) as cantidad_profe
from departamento depa left join profesor profe on profe.id_departamento = depa.id group by depa.nombre;

-- 5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en
-- cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar
--  ordenado de mayor a menor por el número de asignaturas.

select grade.nombre, COUNT(asig.id) as cant_asignatura from grado grade 
left join asignatura asig on grade.id = asig.id_grado
group by grade.nombre order by cant_asignatura DESC;

-- 6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.

select grade.nombre, count(asig.id) as asignaturas from grado grade 
inner join asignatura asig on grade.id = asig.id_grado 
group by grade.nombre having count(asig.id) > 40;


-- 7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado,
--  tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos.




-- 8. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna 
-- con el año de inicio del curso escolar y otra con el número de alumnos matriculados.


-- 9. Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará 
-- cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
