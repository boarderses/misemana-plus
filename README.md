# MiSemana+

**MiSemana+** es una aplicación móvil desarrollada como Proyecto Final del Ciclo Formativo de Grado Superior en Desarrollo de Aplicaciones Multiplataforma (DAM).

Su objetivo es crear automáticamente una planificación semanal equilibrada y personalizada mediante un motor inteligente de planificación.

A diferencia de una agenda tradicional, donde el usuario introduce manualmente sus tareas, **MiSemana+ genera una propuesta semanal automática** teniendo en cuenta sus hábitos, obligaciones y objetivos personales.

El sistema combina horarios de trabajo, descanso, alimentación, estudio, deporte, ocio y tiempo personal para construir una semana organizada y sostenible.

# Características principales

## Planificación inteligente

* Generación automática de una planificación semanal.
* Motor basado en reglas (**Rule Engine**).
* Distribución automática de actividades según disponibilidad.
* Gestión del tiempo libre restante.

## Gestión de horarios

* Configuración de horarios personales.
* Compatibilidad con turnos variables.
* Soporte para jornadas partidas.
* Gestión de turnos nocturnos mediante división automática entre días.

## Objetivos personales

* Definición de objetivos semanales.
* Planificación automática de:
  * Estudio.
  * Deporte.
  * Alimentación.
  * Ocio.
  * Tiempo personal.

## Alimentación 

* Planificación automática de:
  * Desayuno.
  * Almuerzo.
  * Cena.

* Uso de ventanas horarias configurables mediante `TimeWindowAllocator`.

## Visualización semanal

* Vista semanal mediante pestañas por día.
* Selección automática del día actual.
* Representación visual mediante tarjetas de bloques.
* Colores e iconos según tipo de actividad.
* Resumen diario de tiempo dedicado a objetivos.

# Tecnologías utilizadas

## Lenguaje

* Dart

## Framework

* Flutter

## Base de datos

* SQLite (sqflite)

## Arquitectura

* MVVM
* Repository Pattern
* Rule Engine
* Separación por capas

## Herramientas

* Android Studio
* Visual Studio Code
* Git
* GitHub

## Arquitectura del proyecto

MiSemana+ sigue una arquitectura basada en MVVM con separación de responsabilidades.

Presentation
│
├── Screens
├── Widgets
│
Data
│
├── Models
├── Repositories
├── Datasource
│
Core
│
└──  planner/

    ├── PlannerEngine
    ├── PlannerService
    ├── PlannerContext
    ├── PlannerWeek
    ├── TimeBlock
    │
    ├── Rules
    │   ├── SleepRule
    │   ├── WorkRule
    │   ├── FoodRule
    │   ├── StudyRule
    │   ├── SportRule
    │   ├── LeisureRule
    │   └── PersonalTimeRule
    │
    ├── Allocators
    │   ├── BlockAllocator
    │   └── TimeWindowAllocator
    │
    └── Utilities

# Funcionamiento del Smart Planner

El flujo principal de generación es:

Usuario
│
▼
PlannerContext
│
▼
PlannerService
│
▼
PlannerEngine
│
▼
PlannerRules
│
▼
List<TimeBlock>
│
▼
PlannerWeek
│
▼
Interfaz semanal

El motor aplica las reglas en el siguiente orden:

1. SleepRule
2. WorkRule
3. FreeTimeRule
4. FoodRule
5. StudyRule
6. SportRule
7. LeisureRule
8. PersonalTimeRule

Cada regla genera bloques de planificación independientes que posteriormente son mostrados al usuario.

# Base de datos

La aplicación utiliza una base de datos local SQLite.

Principales entidades:

* Usuarios.
* Semanas.
* Turnos.
* Objetivos.
* Actividades.
* Planificaciones.

La base de datos permite mantener la información del usuario y generar semanas personalizadas.

# Estado actual del proyecto

## Completado

✅ Arquitectura MVVM.

✅ Persistencia local mediante SQLite.

✅ Sistema de repositorios.

✅ Gestión de usuarios.

✅ Gestión de turnos laborales.

✅ Soporte para turnos nocturnos.

✅ Motor inteligente de planificación (**Smart Planner Engine v1**).

✅ Sistema basado en reglas.

✅ Distribución automática de objetivos.

✅ Gestión de comidas mediante ventanas horarias.

✅ Vista semanal del planificador.

✅ Tarjetas visuales de bloques.

✅ Resumen diario de planificación.

# Próximas mejoras

## Interfaz

* Vista tipo timeline diaria.
* Mejoras visuales del calendario.
* Animaciones.
* Tema oscuro.
* Personalización de colores.

## Planificador

* Edición manual de bloques.
* Bloqueo de actividades.
* Regeneración parcial.
* Prioridades configurables.
* Drag & Drop.

## Funcionalidades futuras

* Estadísticas personales.
* Notificaciones inteligentes.
* Exportación a calendario.
* Recomendaciones mediante IA.
* Sincronización en la nube.

# Documentación

Documentación adicional disponible en:

docs/

├── ARCHITECTURE.md
├── DATABASE.md
├── SMART_PLANNER.md
├── ROADMAP.md
└── CHANGELOG.md

# Autor

**Alejandro**

Proyecto Final  
CFGS Desarrollo de Aplicaciones Multiplataforma (DAM)
