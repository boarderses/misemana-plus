# Base de datos MiSemana+

## Introducción

MiSemana+ utiliza una base de datos local SQLite para almacenar la información necesaria para generar y mantener una planificación semanal personalizada.

La persistencia se realiza mediante el paquete:
sqflite

La base de datos permite conservar:

* Información del usuario.
* Semanas generadas.
* Horarios laborales.
* Objetivos personales.
* Actividades planificadas.

# Sistema de almacenamiento

La aplicación utiliza una única base de datos local:
misemana.db

La gestión de la base de datos se realiza mediante:
DatabaseHelper

Sus responsabilidades son:

* Crear la base de datos.
* Crear las tablas iniciales.
* Gestionar versiones.
* Ejecutar actualizaciones mediante migraciones.

# Modelo de datos

La estructura principal es:
usuarios
|
|
└── semanas
|
├── turnos
|
└── objetivos

usuarios
|
└── planificaciones

# Entidades principales

## Usuario

Tabla:
usuarios

Representa la información personal necesaria para generar una planificación.

Campos:

| Campo | Tipo | Descripción |
|---|---|---|
| id | INTEGER | Identificador único |
| nombre | TEXT | Nombre del usuario |
| horaDormir | TEXT | Hora habitual de descanso |
| horaDespertar | TEXT | Hora habitual de inicio del día |

Ejemplo:
Alejandro
23:30
07:30

# Semana

Tabla:
semanas 

Representa una planificación semanal concreta.

Campos:

| Campo | Tipo | Descripción |
|---|---|---|
| id | INTEGER | Identificador |
| usuarioId | INTEGER | Usuario asociado |
| numeroSemana | INTEGER | Número de semana |
| anio | INTEGER | Año |
| estado | TEXT | Estado de la semana |

Relación:
Usuario 1 ---- N Semana

Un usuario puede tener múltiples semanas.

# Turno

Tabla:
turnos

Almacena los horarios laborales del usuario.

Campos:

| Campo | Tipo | Descripción |
|---|---|---|
| id | INTEGER | Identificador |
| semanaId | INTEGER | Semana asociada |
| dia | INTEGER | Día de la semana |
| horaInicio | TEXT | Inicio del turno |
| horaFin | TEXT | Fin del turno |

Ejemplo:
Lunes
08:00 - 14:00

## Gestión de turnos nocturnos

El sistema permite turnos que atraviesan medianoche.

Ejemplo:

Entrada:
22:00 - 04:00

El sistema genera: 
Lunes
22:00 - 00:00 
Martes
00:00 - 04:00

Esto permite que el Planner Engine pueda trabajar siempre con días independientes.

# Objetivos

Tabla:
objetivos

Guarda las metas semanales del usuario.

Campos:

| Campo | Tipo | Descripción |
|---|---|---|
| id | INTEGER | Identificador |
| semanaId | INTEGER | Semana asociada |
| tipo | TEXT | Tipo de objetivo |
| cantidad | INTEGER | Cantidad solicitada |

Tipos disponibles:
ESTUDIO
DEPORTE
ALIMENTACION
OCIO
TIEMPO_PERSONAL

Ejemplo:
ESTUDIO
3 sesiones

# Actividades

Tabla:
actividades

Almacena actividades disponibles.

Campos:

| Campo | Tipo | Descripción |
|---|---|---|
| id | INTEGER | Identificador |
| nombre | TEXT | Nombre |
| categoria | TEXT | Categoría |
| duracion | INTEGER | Duración |
| prioridad | INTEGER | Prioridad |

Esta entidad está preparada para futuras ampliaciones del sistema.

# Planificaciones

Tabla:
planificaciones

Representa actividades asociadas a una planificación.

Campos:

| Campo | Tipo | Descripción |
|---|---|---|
| id | INTEGER | Identificador |
| usuarioId | INTEGER | Usuario |
| actividadId | INTEGER | Actividad |
| fechaInicio | TEXT | Inicio |
| fechaFin | TEXT | Fin |
| estado | TEXT | Estado |

Relaciones:
Usuario
|
└── Planificación

Actividad
|
└── Planificación

# Relación entre base de datos y Planner Engine

La base de datos proporciona la información inicial al motor.

Flujo:
SQLite
|
▼
Repositories
|
▼
PlannerService
|
▼
PlannerContext
|
▼
PlannerEngine

Los repositorios abstraen el acceso a datos:
UsuarioRepository
TurnoRepository
ObjetivoRepository

# Versionado de base de datos

La base de datos utiliza un sistema de versiones mediante:

```dart 
openDatabase(
    version: X,
)

Cuando cambia la estructura:
oldVersion
      |
      ▼
onUpgrade()
      |
      ▼
nueva estructura

Ejemplos de migraciones realizadas:

Creación de tabla semanas.
Creación de tabla turnos.
Actualización de objetivos.

