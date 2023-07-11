use modelo_negocio;

-- 1) Tablas de hechos: venta, gasto, compra

-- 2) 
SELECT 	c.Canal,
		YEAR(v.Fecha),
        MONTH(v.Fecha),
        SUM(v.Precio * v.Cantidad)	AS Venta
FROM venta v JOIN canal_venta c
	ON (c.IdCanal = c.IdCanal)
GROUP BY c.Canal,
		YEAR(v.Fecha),
        MONTH(v.Fecha)
ORDER BY c.Canal,
		YEAR(v.Fecha),
        MONTH(v.Fecha);
        
-- 3) 
SELECT	COUNT(DISTINCT c.IdCliente) / (SELECT COUNT(*) FROM cliente) AS Porcentaje_Compras
FROM cliente c RIGHT JOIN venta v
	ON (c.IdCliente = v.IdCliente);
    
-- 4)
SELECT	p.IdProducto,
		p.Producto,
		SUM(v.Precio * v.Cantidad) AS Venta,
        Compras.Compra,
        SUM(v.Precio * v.Cantidad) - Compras.Compra AS Rentabilidad
FROM 	venta v JOIN producto p
					ON (v.IdProducto = p.IdProducto)
        JOIN (SELECT	p.IdProducto,
						p.Producto,
						SUM(c.Precio * c.Cantidad) AS Compra
				FROM 	compra c JOIN producto p
						ON (c.IdProducto = p.IdProducto)
				GROUP BY 	p.IdProducto,
							p.Producto) Compras
					ON (p.IdProducto = Compras.IdProducto)
GROUP BY p.IdProducto,
		p.Producto
-- ORDER BY Venta Desc;
ORDER BY Rentabilidad Desc;

-- 5)
SELECT	c.Rango_Etario,
		tp.TipoProducto,
        SUM(v.Precio * v.Cantidad) AS Venta
FROM 	venta v JOIN cliente c
			ON (v.IdCliente = c.IdCliente)
		JOIN producto p
			ON (v.IdProducto = p.IdProducto)
		JOIN tipo_producto tp
			ON (p.IdTipoProducto = tp.IdTipoProducto)
GROUP BY c.Rango_Etario,
		tp.TipoProducto
ORDER BY c.Rango_Etario,
		Venta Desc;
        
-- 6)
SELECT	p.Provincia as Provincia_Clientes,
        SUM(v.Precio * v.Cantidad) AS Venta
FROM 	venta v JOIN cliente c
			ON (v.IdCliente = c.IdCliente)
		JOIN localidad l
			ON (c.IdLocalidad = l.IdLocalidad)
		JOIN provincia p
			ON (l.IdProvincia = p.IdProvincia)
GROUP BY Provincia_Clientes;

SELECT	p.Provincia as Provincia_Sucursales,
        SUM(v.Precio * v.Cantidad) AS Venta
FROM 	venta v JOIN sucursal s
			ON (v.IdSucursal = s.IdSucursal)
		JOIN localidad l
			ON (s.IdLocalidad = l.IdLocalidad)
		JOIN provincia p
			ON (l.IdProvincia = p.IdProvincia)
GROUP BY Provincia_Sucursales;

-- 7)
ALTER TABLE `venta` ADD `Demora_Entrega` INTEGER NOT NULL DEFAULT '0' AFTER `Fecha_Entrega`;

UPDATE venta SET Demora_Entrega = DATEDIFF(Fecha_Entrega, Fecha);

SELECT	s.Sucursal,
		AVG(v.Demora_Entrega) AS Promedio_Demora,
        STDDEV(v.Demora_Entrega) AS StdDev_Demora
FROM 	venta v JOIN sucursal s
		ON (v.IdSucursal = s.IdSucursal)
GROUP BY s.Sucursal
ORDER BY Promedio_Demora DESC;

-- 8)
ALTER TABLE `venta` ADD `Distancia_Entrega` DECIMAL(10,3) NOT NULL DEFAULT '0' AFTER `Demora_Entrega`;

UPDATE venta v JOIN cliente c
		ON (v.IdCliente = c.IdCliente)
    JOIN sucursal s
    	ON (v.IdSucursal = s.IdSucursal)
SET v.Distancia_Entrega = SQRT( (c.Latitud - s.Latitud) * (c.Latitud - s.Latitud) + (c.Longitud - s.Longitud) * (c.Longitud - s.Longitud) ) * 111.1;

SELECT	s.Sucursal,
		AVG(v.Demora_Entrega) AS Promedio_Demora,
        STDDEV(v.Demora_Entrega) AS StdDev_Demora,
		AVG(v.Distancia_Entrega) AS Promedio_Distancia,
        STDDEV(v.Distancia_Entrega) AS StdDev_Distancia
FROM 	venta v JOIN sucursal s
		ON (v.IdSucursal = s.IdSucursal)
GROUP BY s.Sucursal
ORDER BY Promedio_Distancia DESC;