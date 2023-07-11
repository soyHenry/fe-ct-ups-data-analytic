![HenryLogo](https://d31uz8lwfmyn8g.cloudfront.net/Assets/logo-henry-white-lg.png)

## Homework

1. A partir de las tablas del modelo de negocio usado en las clases anteriores, construir las vistas necesarias para armar un modelo estrella del DataMart de Ventas, las mismas deben llamarse:

- v_fact_venta
- v_dim_canal_venta
- v_dim_cliente
- v_dim_producto
- v_dim_tipo_producto
- v_dim_empleado
- v_dim_cargo
- v_dim_sector
- v_dim_sucursal
- v_dim_localidad
- v_dim_provincia

Desde PowerBI consumir estas vistas, para generar un diagrama estrella y recrear el Dashboard generado la clase anterior.
¿Se encuentra algún problema a la hora de incorporar la localidad al modelo?

2. A lo largo de los años, las sucursales de cada provincia manejaron por separado el pago de las comisiones, por tal motivo esa información no esta en el DataWarehouse. La Gerencia solicitó esta información a cada provincia, para unificar la información.
A partir de los XLS y CSV provistos de Comisiones, incorporarlos en el modelo estrella del PowerBI armado en el punto anterior. Deberas hacer las transformaciones necesarias en los datos. Tener en cuenta, que casi todas las Sucursales informaron sus comisiones a nivel de detalle de cada registro de venta, excepto las sucursales de Rosario, que envió su información agrupada por Año-Mes.
Realizar una nueva pestaña que muestre el pago de comisiones, por Sucursal y Empleado.

3. Se esta buscando entender si los días de demora en la entrega, tienen correlación con la distancia entre la sucursal y la dirección del cliente. Armar un gráfico en PowerBI para verificarlo. ¿Están correlacionadas ambas variables?