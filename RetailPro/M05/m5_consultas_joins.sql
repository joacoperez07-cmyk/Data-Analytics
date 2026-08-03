/*==============================================================
 MÓDULO 5 - CONSULTAS CON JOINS
 Proyecto: RetailPro
 Base de datos: Ventas_Tech_DB

 Autor: Joaquín I. Pérez

 Objetivo:
 Enriquecer el modelo de datos para responder consultas de negocio
 mediante JOINs y preparar la información para Power BI.
==============================================================*/

/*==============================================================
 ADECUACIÓN DEL MODELO DE DATOS - Tabla Clientes (Segmento)
==============================================================*/

ALTER TABLE clientes
ADD COLUMN segmento VARCHAR(30);

UPDATE clientes
SET segmento='Premium'
WHERE id_cliente IN (1,3);

UPDATE clientes
SET segmento='Corporativo'
WHERE id_cliente IN (2);

UPDATE clientes
SET segmento='Minorista'
WHERE id_cliente IN (4,5);

/*==============================================================
ADECUACIÓN DEL MODELO DE DATOS - Tabla Ventas (Canal)
==============================================================*/

ALTER TABLE ventas
ADD COLUMN canal VARCHAR(20);

UPDATE ventas
SET canal='Online'
WHERE id_venta IN (1,3,5,7,9);

UPDATE ventas
SET canal='Presencial'
WHERE id_venta IN (2,4,6,8,10);

/*==============================================================
ADECUACIÓN DEL MODELO DE DATOS - Tabla Territorios (crear y cargar)
==============================================================*/

CREATE TABLE territorios(

    id_territorio INT PRIMARY KEY,

    ciudad VARCHAR(50),

    region VARCHAR(50)

);

INSERT INTO territorios VALUES
(1,'Buenos Aires','Centro'),
(2,'Córdoba','Centro'),
(3,'Rosario','Litoral'),
(4,'Mendoza','Cuyo'),
(5,'Tucumán','Norte');

/*==============================================================
ADECUACIÓN DEL MODELO DE DATOS - Relacionar Clientes con Territorios
==============================================================*/

ALTER TABLE clientes

ADD COLUMN id_territorio INT;

ALTER TABLE clientes

ADD CONSTRAINT fk_clientes_territorios

FOREIGN KEY (id_territorio)

REFERENCES territorios(id_territorio);

/*==============================================================
ADECUACIÓN DEL MODELO DE DATOS - Actualizar Tabla Clientes
==============================================================*/

UPDATE clientes SET id_territorio=1 WHERE id_cliente=1;

UPDATE clientes SET id_territorio=2 WHERE id_cliente=2;

UPDATE clientes SET id_territorio=3 WHERE id_cliente=3;

UPDATE clientes SET id_territorio=4 WHERE id_cliente=4;

UPDATE clientes SET id_territorio=5 WHERE id_cliente=5;


/*==============================================================
 CONSULTA 1
 Vista base del proyecto (INNER JOIN)
==============================================================*/

SELECT

    v.fecha_venta,

    c.nombre AS cliente,

    c.segmento,

    t.region,

    p.nombre_producto,

    cat.nombre_categoria,

    v.cantidad,

    v.precio_unitario,

    v.cantidad * v.precio_unitario AS total_venta,

    v.canal

FROM ventas v

INNER JOIN clientes c
ON v.id_cliente=c.id_cliente

INNER JOIN territorios t
ON c.id_territorio=t.id_territorio

INNER JOIN productos p
ON v.id_producto=p.id_producto

INNER JOIN categorias cat
ON p.id_categoria=cat.id_categoria

ORDER BY v.fecha_venta;

/*==============================================================
 CONSULTA 2
 Clientes registrados sin compras
==============================================================*/

SELECT

    c.nombre,

    c.email,

    c.fecha_registro

FROM clientes c

LEFT JOIN ventas v

ON c.id_cliente=v.id_cliente

WHERE v.id_cliente IS NULL;

/*==============================================================
 CONSULTA 3
 Productos sin ventas
==============================================================*/

SELECT

    p.nombre_producto,

    cat.nombre_categoria,

    p.precio

FROM productos p

INNER JOIN categorias cat

ON p.id_categoria=cat.id_categoria

LEFT JOIN ventas v

ON p.id_producto=v.id_producto

WHERE v.id_producto IS NULL;

/*==============================================================
 CONSULTA 4
 Consolidado de ventas por canal
==============================================================*/

SELECT

    canal,

    SUM(cantidad*precio_unitario) AS total_facturado

FROM(

    SELECT
        canal,
        cantidad,
        precio_unitario
    FROM ventas
    WHERE canal='Online'

    UNION ALL

    SELECT
        canal,
        cantidad,
        precio_unitario
    FROM ventas
    WHERE canal='Presencial'

) AS ventas_consolidadas

GROUP BY canal;

/*==============================================================
 HALLAZGOS
==============================================================

1. La vista integrada reúne información de clientes, productos,
   categorías y territorios en una única consulta, facilitando
   su utilización en Power BI.

2. Las consultas LEFT JOIN permiten identificar registros sin
   actividad comercial, como clientes o productos sin ventas.

3. La consolidación mediante UNION ALL permite analizar la
   facturación por canal de venta, generando una métrica útil
   para la toma de decisiones comerciales.

==============================================================*/