![HenryLogo](https://d31uz8lwfmyn8g.cloudfront.net/Assets/logo-henry-white-lg.png)

Modelo Henry:<br>
![Modelo Henry](ModeloHenry.jpg)<br>

## Homework

1. Ejecutar el script "registros_henry.sql" con el objetivo de realizar la inserción de registros dentro de la base de datos creada en la clase anterior, corregir los errores que impidan la instrucción.<br>
2.	No se sabe con certeza el lanzamiento de las cohortes N° 1245 y N° 1246, se solicita que las elimine de la tabla.<br>
3.	Se ha decidido retrasar el comienzo de la cohorte N°1243, por lo que la nueva fecha de inicio será el 16/05. Se le solicita modificar la fecha de inicio de esos alumnos.<br>
4.	El alumno N° 165 solicito el cambio de su Apellido por “Ramirez”. <br>
5.	El área de Learning le solicita un listado de alumnos de la Cohorte N°1243 que incluya la fecha de ingreso.<br>
6.	Como parte de un programa de actualización, el área de People le solicita un listado de los instructores que dictan la carrera de Full Stack Developer.<br>
7. Se desea saber que alumnos formaron parte de la cohorte N° 1235. Elabore un listado.<br>
8. Del listado anterior se desea saber quienes ingresaron en el año 2019.<br>
9. La siguiente consulta permite acceder a datos de otras tablas y devolver un listado con la carrera a la cual pertenece cada alumno:

```SQL
SELECT alumnos.nombre, apellido, fechaNacimiento, carreras.nombre
FROM alumnos
INNER JOIN cohortes
ON cohorte=idCohorte
INNER JOIN carreras
ON carrera = idCarrera
```
Coneste la siguientes interrogantes:
  a. ¿Que campos permiten que se puedan acceder al nombre de la carrera?
  b. ¿Que tipo de ralación existe entre el nombre la tabla cohortes y alumnos?
  c. ¿Proponga dos opciones para filtrar el listado solo por los alumnos que pertenecen a 'Full Stack Developer', utilizando LIKE y NOT LIKE?, ¿Cual de las dos opciones es la manera correcta de hacerlo?, ¿Por que?
  d. ¿Proponga dos opciones para filtrar el listado solo por los alumnos que pertenecen a 'Full Stack Developer', utilizando " = " y " != "?  ¿Cual de las dos opciones es la manera correcta de hacerlo?, ¿Por que?
  e. ¿Como emplearía el filtrado utilizando el campo idCarrera?

