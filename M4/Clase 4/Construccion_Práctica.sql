use modelo_negocio;

select 	e.IdEmpleado,
		e.CodigoEmpleado,
		v.Fecha,
		v.Fecha_Entrega,
        v.Demora_Entrega,
        v.Distancia_Entrega,
        s.Sucursal,
        l.Localidad As Localidad_Sucursal,
        p.Provincia As Provincia_Sucursal,
        l2.Localidad As Localidad_Cliente,
        p2.Provincia As Provincia_Cliente,
        pr.Producto,
        tp.TipoProducto,
        v.Precio * v.Cantidad as Venta,
        Round(v.Precio * v.Cantidad * 0.05, 2) as Comision
from venta v join empleado e
		on (v.IdEmpleado = e.IdEmpleado)
    join sucursal s
		on (v.IdSucursal = s.IdSucursal)
	join localidad l
		on (s.IdLocalidad = l.IdLocalidad)
	join provincia p
		on (p.IdProvincia = l.IdProvincia)
	join cliente c
		on (c.IdCliente = v.IdCliente)
	join localidad l2
		on (c.IdLocalidad = l2.IdLocalidad)
	join provincia p2
		on (l2.IdProvincia = p2.IdProvincia)
	join producto pr
		on (v.IdProducto = pr.IdProducto)
	join tipo_producto tp
		on (pr.IdTipoProducto = tp.IdTipoProducto);        

select 	Year(v.Fecha)	as Año,
		Month(v.Fecha)	as Mes,
		e.IdEmpleado,
		e.CodigoEmpleado,
        s.Sucursal,
        SUM(v.Precio * v.Cantidad) as Venta,
        SUM(Round(v.Precio * v.Cantidad * 0.05, 2)) as Comision
from venta v join empleado e
		on (v.IdEmpleado = e.IdEmpleado)
    join sucursal s
		on (v.IdSucursal = s.IdSucursal)
WHERE v.IdSucursal in (23,24)
Group By Year(v.Fecha),
		Month(v.Fecha),
        e.IdEmpleado,
		e.CodigoEmpleado,
        s.Sucursal;    

select * from sucursal;

Select	IdVenta,
		Fecha,
		Distancia_Entrega,
		Round(Distancia_Entrega / 1000)
from venta order by 4 desc;

select Round(Distancia_Entrega / 1000) as dias, Demora_entrega, count(*) 
from venta group by Round(Distancia_Entrega / 1000), Demora_Entrega
order by 1, 2;

select Round(Distancia_Entrega / 100) as dias, count(*) 
from venta 
group by Round(Distancia_Entrega / 100)
order by 1;

select min(Distancia_Entrega), max(Distancia_Entrega) from venta;

-- >= 10 = random entre 7 y 10
SELECT ROUND(RAND() * 3,0) + 7;
-- >= 8 = random entre 5 y 8
SELECT ROUND(RAND() * 3,0) + 5;
-- >= 4 = random entre 3 y 6
SELECT ROUND(RAND() * 3, 0) + 3;
-- >= 0 = random entre 0 y 3
SELECT ROUND(RAND() * 3,0);

select Fecha, DATE_ADD(Fecha, INTERVAL ROUND(RAND() * 3,0) DAY) AS Entrega
from venta;

update venta set Fecha_Entrega = DATE_ADD(Fecha, INTERVAL ROUND(RAND() * 3,0) DAY);
update venta set Fecha_Entrega = DATE_ADD(Fecha, INTERVAL ROUND(RAND() * 3,0) + 3 DAY) 
where Round(Distancia_Entrega / 100) >= 4;
update venta set Fecha_Entrega = DATE_ADD(Fecha, INTERVAL ROUND(RAND() * 3,0) + 5 DAY)
where Round(Distancia_Entrega / 100) >= 8;
update venta set Fecha_Entrega = DATE_ADD(Fecha, INTERVAL ROUND(RAND() * 3,0) + 7 DAY)
where Round(Distancia_Entrega / 100) >= 10;

UPDATE venta SET Demora_Entrega = DATEDIFF(Fecha_Entrega, Fecha);