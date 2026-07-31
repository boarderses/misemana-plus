# Arquitectura de MiSemana+

## Introducción

MiSemana+ utiliza una arquitectura basada en **MVVM (Model - View - ViewModel)** adaptada a Flutter.

El objetivo de esta arquitectura es separar claramente:

* La interfaz de usuario.
* La lógica de negocio.
* El acceso a datos.
* El motor inteligente de planificación.

Esta separación permite mantener un proyecto escalable, mantenible y preparado para futuras ampliaciones.

# Arquitectura general

La estructura principal del proyecto es:
lib/

├── presentation/
│
├── data/
│
└── core/

Cada capa tiene una responsabilidad concreta.

# Capa Presentation

Ubicación:
lib/presentation/

Contiene todos los elementos relacionados con la interfaz gráfica.

Responsabilidades:

* Mostrar información al usuario.
* Gestionar interacción con la aplicación.
* Representar la planificación generada.

Estructura:
presentation/

├── screens/
│
└── widgets/

## Screens

Contiene las pantallas principales de la aplicación.

Ejemplos:

### SplashScreen

Responsable de comprobar si existe un usuario almacenado y decidir el flujo inicial:
Usuario existente
|
▼
HomeScreen

Usuario nuevo
|
▼
OnboardingScreen

### OnboardingScreen

Permite configurar inicialmente:

* Nombre.
* Hora de dormir.
* Hora de despertar.

### PlannerWeekScreen

Pantalla principal del planificador.

Muestra:

* Los siete días de la semana.
* Bloques horarios generados.
* Resumen diario.
* Información temporal.

La navegación se realiza mediante:
TabBar
|
▼
TabBarView
|
▼
DayColumn
|
▼
TimeBlockCard

# Capa Data

Ubicación:
lib/data/

Responsable de la persistencia de información.

Incluye:
data/

├── models/
├── repositories/
└── datasource/

## Models

Representan los datos utilizados por la aplicación.

Ejemplos:

* UsuarioModel.
* TurnoModel.
* ObjetivoModel.

Los modelos permiten transformar información entre:
SQLite
|
▼
Modelo Dart
|
▼
Aplicación

## Repositories

Implementan el patrón Repository.

Su objetivo es ocultar la fuente de datos al resto de la aplicación.

Ejemplo:
PlannerService

  |
  ▼
UsuarioRepository

  |
  ▼
DatabaseHelper

  |
  ▼
SQLite

Repositorios principales:

* UsuarioRepository.
* TurnoRepository.
* ObjetivoRepository.

## Datasource

Contiene la configuración del acceso a SQLite.

Responsabilidades:

* Crear la base de datos.
* Gestionar versiones.
* Crear tablas.
* Ejecutar consultas.

# Capa Core

Ubicación:
lib/core/

Contiene la lógica principal del sistema.

La parte más importante es:
core/

└── planner/

Aquí reside el Smart Planner Engine.

# Smart Planner Engine

El motor inteligente es el núcleo diferencial de MiSemana+.

Su función es generar automáticamente una planificación semanal.

Flujo:
Usuario
|
▼
PlannerContext
|
▼
PlannerEngine
|
▼
PlannerRules
|
▼
TimeBlock
|
▼
PlannerWeek
|
▼
Interfaz

# Planner Engine

## PlannerService

Actúa como punto de entrada del motor.

Responsabilidades:

* Obtener información del usuario.
* Obtener turnos.
* Obtener objetivos.
* Crear PlannerContext.
* Ejecutar PlannerEngine.

## PlannerContext

Contiene toda la información necesaria para generar una semana:

* Usuario.
* Turnos.
* Objetivos.

Permite que el motor trabaje sin depender directamente de la base de datos.

## PlannerEngine

Es el encargado de ejecutar las reglas de planificación.

Las reglas se aplican en orden:

1. SleepRule.
2. WorkRule.
3. FreeTimeRule.
4. FoodRule.
5. StudyRule.
6. SportRule.
7. LeisureRule.
8. PersonalTimeRule.

Cada regla recibe los bloques existentes y devuelve una nueva planificación ampliada.

# Planner Rules

Cada regla representa una necesidad concreta.

Ejemplos:

## SleepRule

Genera bloques de descanso.

## WorkRule

Añade los turnos laborales.

## FoodRule

Reserva espacios para:

* Desayuno.
* Almuerzo.
* Cena.

Utiliza ventanas horarias.

## Objective Rules

Gestionan objetivos personales:

* Estudio.
* Deporte.
* Ocio.
* Tiempo personal.

# TimeBlock

Es la unidad básica del sistema.

Representa un bloque de tiempo:
TimeBlock

Día
Hora inicio
Hora fin
Tipo
Prioridad

Todas las capas trabajan utilizando esta entidad.

# Allocators

Los allocators permiten colocar actividades dentro de la semana.

## BlockAllocator

Se utiliza para distribuir actividades en tiempo libre.

Proceso:

1. Analiza disponibilidad.
2. Busca el mejor día.
3. Inserta el bloque.
4. Actualiza la disponibilidad.

## TimeWindowAllocator

Se utiliza cuando una actividad necesita una franja concreta.

Ejemplo:

Almuerzo:
13:00 - 16:00

Busca la posición más adecuada dentro de esa ventana.

# Principios de diseño aplicados

MiSemana+ sigue los siguientes principios:

## Separación de responsabilidades

Cada capa tiene una función concreta.

## Bajo acoplamiento

La interfaz no conoce cómo se genera la planificación.

## Escalabilidad

Permite añadir nuevas reglas sin modificar el motor principal.

## Reutilización

Los componentes del planner pueden evolucionar independientemente de la interfaz.

# Evolución futura

La arquitectura está preparada para incorporar:

* Nuevas reglas de planificación.
* Sincronización en la nube.
* Notificaciones.
* Estadísticas.
* Inteligencia artificial.
* Integraciones externas.