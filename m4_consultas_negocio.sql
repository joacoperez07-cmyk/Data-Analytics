/*==============================================================
MÓDULO 4 - CONSULTAS DE NEGOCIO
Base de datos: Ventas_Tech_DB

Autor: Joaquín I. Pérez
Fecha: Agosto 2026

Objetivo:
Obtener métricas de negocio mediante consultas SQL sobre la
tabla ventas.
==============================================================*/

/*==============================================================
CONSULTA 1
Resumen ejecutivo mensual
==============================================================*/

SELECT
    EXTRACT(MONTH FROM fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(id_venta) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY EXTRACT(MONTH FROM fecha_venta)
ORDER BY mes;

/*==============================================================
CONSULTA 2
Top 5 productos por facturación
==============================================================*/

SELECT
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC
LIMIT 5;

/*==============================================================
CONSULTA 3
Clientes con más de una compra
==============================================================*/

SELECT
    id_cliente,
    COUNT(id_venta) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(id_venta) > 1
ORDER BY total_gastado DESC;

/*==============================================================
CONSULTA 4
Comparación con el promedio mensual
==============================================================*/

WITH ventas_mensuales AS (

    SELECT
        EXTRACT(MONTH FROM fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY EXTRACT(MONTH FROM fecha_venta)

)

SELECT
    mes,
    total_facturado,

    CASE
        WHEN total_facturado >
             (SELECT AVG(total_facturado) FROM ventas_mensuales)
        THEN 'Por encima'

        ELSE 'Por debajo'
    END AS comparacion_promedio

FROM ventas_mensuales
ORDER BY mes;

/*==============================================================
HALLAZGOS
==============================================================

1. El producto con ID = 1 fue el de mayor facturación durante el
   período analizado.

2. Los clientes con múltiples compras concentraron la mayor parte
   del volumen de ventas.

3. Toda la información disponible corresponde al mes de marzo,
   por lo que no fue posible realizar una comparación entre meses.

==============================================================*/