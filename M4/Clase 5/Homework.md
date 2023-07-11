![HenryLogo](https://d31uz8lwfmyn8g.cloudfront.net/Assets/logo-henry-white-lg.png)

## Homework

1. En el Informe armado la clase anterior, crear un calendario utilizando la función [CALENDAR](https://docs.microsoft.com/en-us/dax/calendar-function-dax) a partir del campo fecha de la tabla ventas. Asociar esta nueva tabla al modelo.<br>
2. En la nueva tabla de la dimensión calendario, agregar al menos 3 columnas. Por ejmplo: Año, Trimestre, Número de Semana en el Año, etc.<br>
3. Crear una columna calculada que detalle la generación para cada edad en la dimensión Cliente. Para hacerlo investigue la función SWITCH.<br>
- AñoNacimiento >= 1928 && AñoNacimiento] <= 1948 : "Silent"
- AñoNacimiento >= 1949 && AñoNacimiento] <= 1968 : "Baby Boomer"
- AñoNacimiento >= 1969 && AñoNacimiento] <= 1980 : "Generación X"
- AñoNacimiento >= 1981 && AñoNacimiento] <= 1993 : "Millenials"
- AñoNacimiento >= 1994 && AñoNacimiento] <= 2010 : "Generación Z"
- AñoNacimiento >= 2011 : "Alfa"<br>
4. Realizar dos medidas que muestren las ventas del año y mes anterior.<br>
5. Calcular la variación absoluta y procentual de las ventas vs el año anterior.<br>
6. Calcular las ventas totales del último año sobre el que se tienen datos.<br>
7. Utilice un parámetro para establecer un objetivo de ventas dinámico e incorpórelo a una medida que exprese su cumplimiento con base a la medida del año anterior.<br>