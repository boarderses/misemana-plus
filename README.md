# MiSemana+

**MiSemana+** es una aplicación móvil desarrollada como Proyecto Final del Ciclo Formativo de Grado Superior en Desarrollo de Aplicaciones Multiplataforma (DAM).

Su objetivo es ayudar al usuario a organizar automáticamente su semana mediante un motor inteligente de planificación que distribuye actividades teniendo en cuenta horarios de trabajo, descanso, alimentación, estudio, deporte, ocio y tiempo personal.

## Características principales

* Planificación semanal automática.
* Gestión de horarios de trabajo variables.
* Compatibilidad con turnos partidos y turnos nocturnos.
* Configuración de objetivos semanales.
* Organización automática del tiempo libre.
* Planificación inteligente de estudio, deporte, ocio y tiempo personal.
* Distribución automática de desayuno, almuerzo y cena.
* Base de datos local SQLite.
* Arquitectura MVVM.
* Motor de planificación basado en reglas (Rule Engine).

## Tecnologías utilizadas

### Lenguaje

* Dart

### Framework

* Flutter

### Base de datos

* SQLite (sqflite)

### Arquitectura

* MVVM
* Repository Pattern
* Rule Engine

### Herramientas

* Android Studio
* Visual Studio Code
* Git
* GitHub

## Arquitectura del proyecto

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
└── Planner Engine
    ├── PlannerEngine
    ├── PlannerService
    ├── Rules
    ├── BlockAllocator
    ├── TimeWindowAllocator
    └── Utilities

## Estado del proyecto

Actualmente el proyecto dispone de un motor de planificación completamente funcional capaz de generar automáticamente una planificación semanal personalizada.

Las siguientes fases estarán centradas en mejorar la experiencia de usuario, la representación visual del planificador y nuevas funcionalidades inteligentes.

## Autor

Alejandro
Proyecto Final CFGS Desarrollo de Aplicaciones Multiplataforma.
