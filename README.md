# 📊 RetailPro – Proyecto Integral de Data Analytics

## Descripción

**RetailPro** es un proyecto integral de Data Analytics desarrollado a lo largo del curso, cuyo objetivo es construir un sistema completo de análisis de datos para una empresa distribuidora de tecnología.

El proyecto abarca todas las etapas del proceso analítico, desde la definición del problema de negocio y el diseño de la base de datos hasta la implementación de un modelo analítico en Power BI con métricas DAX y dashboards ejecutivos.

---

## Objetivo del proyecto

Desarrollar una solución de Business Intelligence que permita analizar el desempeño comercial de RetailPro y responder la siguiente pregunta de negocio:

> **¿Por qué las ventas de la región Norte cayeron un 15 % en el último trimestre y qué categoría de producto explica esa disminución?**

---

## Tecnologías utilizadas

- PostgreSQL
- SQL (DDL, DML y consultas analíticas)
- Power Query
- Power BI Desktop
- DAX
- GitHub
- Microsoft Excel

---

## Estructura del repositorio

```
RetailPro/
│
├── M01_Brief_Negocio
├── M02_Modelo_Relacional
├── M03_Base_de_Datos_SQL
├── M04_Consultas_SQL
├── M05_JOINs_SQL
├── M06_Pipeline_ETL_PowerBI
├── M07_Boceto_Dashboard
├── M08_Checkpoint2_DAX
└── README.md
```

Cada carpeta contiene la documentación y los archivos correspondientes al módulo desarrollado durante el curso.

---

## Contenido de cada módulo

### M01 – Definición del problema de negocio

- Identificación del problema.
- Definición de KPIs.
- Preguntas de análisis.
- Boceto inicial del dashboard.

### M02 – Modelo relacional

- Diagrama Entidad-Relación.
- Normalización hasta Tercera Forma Normal (3NF).
- Justificación del modelo.

### M03 – Base de datos

- Creación de la base de datos **Ventas_Tech_DB**.
- Definición de tablas.
- Restricciones.
- Claves primarias y foráneas.
- Inserción de datos.

### M04 – Consultas SQL

Obtención de métricas de negocio mediante consultas SQL:

- Facturación mensual.
- Ranking de productos.
- Clientes recurrentes.
- Comparación contra el promedio mensual.

### M05 – Consultas con JOIN

Integración de información entre tablas mediante:

- INNER JOIN
- LEFT JOIN
- UNION ALL

para construir la vista base utilizada posteriormente en Power BI.

### M06 – Pipeline ETL

Proceso de limpieza y transformación de datos mediante Power Query:

- eliminación de duplicados;
- tratamiento de valores nulos;
- corrección de tipos de datos;
- enriquecimiento mediante Merge;
- documentación en lenguaje M.

### M07 – Diseño del Dashboard

Planificación del dashboard ejecutivo mediante un wireframe, definiendo la ubicación de:

- KPIs;
- gráficos;
- filtros;
- tabla de detalle.

### M08 – Modelo Analítico

Construcción del modelo en Power BI:

- relaciones entre tablas;
- tabla calendario;
- medidas DAX;
- validación del modelo.

---

## Cómo ejecutar el proyecto

### Base de datos

1. Abrir PostgreSQL.
2. Crear la base de datos **Ventas_Tech_DB**.
3. Ejecutar el script correspondiente al M03 para crear las tablas y cargar los datos.
4. Ejecutar los scripts SQL de los módulos M04 y M05.

### Power BI

1. Abrir el archivo `.pbix` correspondiente.
2. Actualizar el origen de datos si fuera necesario.
3. Verificar que las relaciones del modelo se encuentren activas.
4. Explorar las visualizaciones y medidas DAX desarrolladas.

---

## Herramientas de Inteligencia Artificial

Durante el desarrollo del proyecto se utilizaron herramientas de Inteligencia Artificial como apoyo para:

- revisar consultas SQL;
- optimizar documentación técnica;
- generar borradores de archivos README;
- asistir en la organización del repositorio;
- revisar la estructura del modelo de datos.

Todas las sugerencias fueron evaluadas y adaptadas según el criterio técnico del autor antes de incorporarse al proyecto.

---

## Autor

**Ing. Joaquín I. Pérez**

Proyecto desarrollado como parte del curso de **Data Analytics**, integrando SQL, PostgreSQL y Power BI para la construcción de una solución completa de análisis de datos.
