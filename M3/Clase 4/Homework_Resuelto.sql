USE henry;

-- 2. No se sabe con certeza el lanzamiento de las cohortes N° 1245 y N° 1246, se solicita que las elimine de la tabla.
select * from cohorte where idCohorte in (1245,1246);
delete from cohorte where idCohorte in (1245,1246);

-- 3. Se ha decidido retrasar el comienzo de la cohorte N°1243, por lo que la nueva fecha de inicio será el 16/05. 
-- Se le solicita modificar la fecha de inicio de esos alumnos.
select * from cohorte where idCohorte = 1243;
update cohorte set fechaInicio = '2022-05-16' where idCohorte = 1243;

-- 4. El alumno N° 165 solicito el cambio de su Apellido por “Ramirez”.
select * from alumno where idAlumno = 165;
update alumno set apellido = 'Ramirez' where idAlumno = 165;

-- 5. El área de Learning le solicita un listado de alumnos de la Cohorte N°1243 que incluya la fecha de ingreso.
select 	idAlumno as codigoAlumno,
		cedulaIdentidad,
        nombre,
        apellido,
        fechaNacimiento,
        fechaIngreso
from alumno where idCohorte = 1243;

-- 6. Como parte de un programa de actualización, el área de People le solicita un listado de los instructores 
-- que dictan la carrera de Full Stack Developer.
select * from carrera where nombre = 'Full Stack Developer';
select * from cohorte where idCarrera = 1;
select * from instructor where idInstructor in (select idInstructor from cohorte where idCarrera = 1);

select  distinct i.cedulaIdentidad,
		i.nombre,
        i.apellido,
        i.fechaNacimiento,
        i.fechaIncorporacion,
        # co.codigo as codigoCohorte,
        ca.nombre as nombreCarrera
from instructor i join cohorte co
		on (i.idInstructor = co.idInstructor)
    join carrera ca
		on (co.idCarrera = ca.idCarrera)
where ca.nombre = 'Full Stack Developer';

select 	distinct i.idInstructor,
		i.cedulaIdentidad,
		i.nombre,
        i.apellido,
        i.fechaNacimiento,
        i.fechaIncorporacion,
        # co.codigo as codigoCohorte,
        ca.nombre as nombreCarrera
from instructor i join cohorte co
		on (i.idInstructor = co.idInstructor)
    join carrera ca
		on (co.idCarrera = ca.idCarrera
			and ca.nombre = 'Full Stack Developer')
order by 1;

-- 7. Se desea saber que alumnos formaron parte de la cohorte N° 1235. Elabore un listado.
select 	idAlumno as codigoAlumno,
		cedulaIdentidad,
        nombre,
        apellido,
        fechaNacimiento,
        fechaIngreso,
        idCohorte
from alumno where idCohorte = 1235;

-- 8. Del listado anterior se desea saber quienes ingresaron en el año 2019.
select 	idAlumno as codigoAlumno,
		cedulaIdentidad,
        nombre,
        apellido,
        fechaNacimiento,
        fechaIngreso,
        idCohorte
from alumno 
where idCohcohorteorte = 1235
and year(fechaIngreso) = 2019;
#and fechaIngreso between '2019-01-01' and '2019-12-31';