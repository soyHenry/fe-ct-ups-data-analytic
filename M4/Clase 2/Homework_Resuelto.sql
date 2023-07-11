use modelo_negocio;

/* 
KPI 1
Descripcion: Aumento de Ventas por Sucursal
Objetivo Estratégico: Aumentar las ventas mensuales 10% respecto del mismo perído del año anterior
Métrica: Sumatoria de Ventas Mensual por Sucursal (2020-12) / Sumatoria de Ventas Mensual por Sucursal  (2019-12) * 1.1
Meta: Sobre un 10 porciento del mismo período del año anterior
Dirección: Aumentar
Grado de Dificultad: Medio
*/

/*
KPI 2
Descripcion: Tiempos de Entrega por Sucursal
Objetivo Estratégico: Mejorar mensualmente la logística de entrega en el canal de venta OnLine
Métrica: Promedio de dias de entrega mes actual (Dic 2020)
Meta: Entre 4 y 5
Dirección: Disminuir
Grado de Dificultad: Alto
*/

CREATE OR REPLACE VIEW v_venta_mes_sucursal AS
SELECT 	c.anio,
        c.mes,
        s.IdSucursal,
        s.Sucursal,
        SUM(v.Precio * v.Cantidad)	AS venta,
        SUM(v.Cantidad)				AS venta_cantidad,
        COUNT(v.IdVenta)			AS venta_volumen,
        SUM(DATEDIFF(v.Fecha_Entrega, v.Fecha))	AS dias_demora,
        AVG(DATEDIFF(v.Fecha_Entrega, v.Fecha))	AS dias_demora_promedio
FROM venta v JOIN sucursal s
		ON (v.IdSucursal = s.IdSucursal)
    JOIN calendario c
    	ON (v.Fecha = c.fecha)
GROUP BY c.anio,
        c.mes,
        s.IdSucursal,
        s.Sucursal;
        
SELECT * FROM v_venta_mes_sucursal;

/*
KPI 3
Descripcion: Canal de venta OnLine
Objetivo Estratégico: Generar un crecimiento mensual de venta OnLine mejorando la satisfacción del cliente
Métrica: (Venta Online año actual / Venta total año actual) / (Venta Online año anterior / Venta total año anterior)
Meta: Sobre un 10 porciento respecto del año anterior
Dirección: Aumentar
Grado de Dificultad: Alto
*/

CREATE OR REPLACE VIEW v_venta_mes_canal AS
SELECT 	c.anio,
        c.mes,
        cv.IdCanal,
        cv.Canal,
        SUM(v.Precio * v.Cantidad)	AS venta,
        SUM(v.Cantidad)				AS venta_cantidad,
        COUNT(v.IdVenta)			AS venta_volumen
FROM venta v JOIN canal_venta cv
		ON (v.IdCanal = cv.IdCanal)
    JOIN calendario c
    	ON (v.Fecha = c.fecha)
GROUP BY c.anio,
        c.mes,
        cv.IdCanal,
        cv.Canal;

SELECT * FROM v_venta_mes_canal;

