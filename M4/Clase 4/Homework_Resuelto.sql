use modelo_negocio;

CREATE OR REPLACE VIEW v_fact_venta AS
SELECT	IdVenta,
		Fecha,
        Fecha_Entrega,
        Distancia_Entrega,
        Demora_Entrega,
        IdCliente,
        IdProducto,
        IdCanal,
        IdEmpleado,
        Precio,
        Cantidad
FROM venta;

CREATE OR REPLACE VIEW v_dim_cliente AS
SELECT	IdCliente,
		Nombre_Y_Apellido,
        Domicilio,
        Telefono,
        Edad,
        Rango_Etario,
        Latitud,
        Longitud,
        IdLocalidad
FROM 	cliente
WHERE 	IdCliente IN (SELECT IdCliente FROM v_fact_venta);

CREATE OR REPLACE VIEW v_dim_localidad AS
SELECT	IdLocalidad,
		Localidad,
        IdProvincia
FROM 	localidad;

CREATE OR REPLACE VIEW v_dim_provincia AS
SELECT	IdProvincia,
		Provincia
FROM 	provincia;

CREATE OR REPLACE VIEW v_dim_canal_venta AS
SELECT	IdCanal,
		Canal
FROM 	canal_venta;

CREATE OR REPLACE VIEW v_dim_producto AS
SELECT	IdProducto,
		Producto,
        IdTipoProducto
FROM 	producto 
WHERE IdProducto IN (SELECT IdProducto FROM v_fact_venta);

CREATE OR REPLACE VIEW v_dim_tipo_producto AS
SELECT	IdTipoProducto,
		TipoProducto
FROM 	tipo_producto;

CREATE OR REPLACE VIEW v_dim_empleado AS
SELECT	IdEmpleado,
		CodigoEmpleado,
        CONCAT(Nombre, ', ', Apellido) AS Nombre_Y_Apellido,
        IdSucursal,
        IdSector,
        IdCargo
FROM 	empleado
WHERE	IdEmpleado IN (SELECT IdEmpleado FROM v_fact_venta);

CREATE OR REPLACE VIEW v_dim_cargo AS
SELECT	IdCargo,
		Cargo
FROM 	cargo;

CREATE OR REPLACE VIEW v_dim_sector AS
SELECT	IdSector,
		Sector
FROM 	sector;

CREATE OR REPLACE VIEW v_dim_sucursal AS
SELECT	s.IdSucursal,
		s.Sucursal,
        s.Domicilio,
        s.Latitud,
        s.Longitud,
        l.Localidad,
        p.Provincia
FROM 	sucursal s JOIN localidad l
			ON (s.IdLocalidad = l.IdLocalidad)
        JOIN provincia p
			ON (l.IdProvincia = p.IdProvincia);