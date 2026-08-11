# Changelog

Todos los cambios importantes del proyecto se documentarán en este archivo.

El formato sigue una evolución por versiones funcionales del proyecto.

## [0.1.0] - Inicio del proyecto

### Creación inicial

* Creación del proyecto Flutter.
* Configuración inicial del entorno.
* Definición de la arquitectura base MVVM.
* Creación de la estructura inicial del proyecto.


## [0.2.0] - Persistencia y usuarios

### Base de datos inicial

* Implementación de SQLite mediante `sqflite`.
* Creación del sistema de acceso a datos.
* Implementación del patrón Repository.
* Creación del modelo de usuario.
* Gestión de datos personales:
  * Nombre.
  * Hora de dormir.
  * Hora de despertar.

## [0.3.0] - Gestión de planificación básica

### Organización semanal

* Implementación de la entidad Semana.
* Gestión de turnos laborales.
* Gestión de objetivos semanales.
* Creación de repositorios:
  * UsuarioRepository.
  * TurnoRepository.
  * ObjetivoRepository.

* Preparación de la estructura necesaria para la generación automática de semanas.

## [0.4.0] - Smart Planner Engine v1

### Motor inteligente de planificación

Implementación del núcleo de generación automática de semanas.

### Arquitectura del motor

* Creación de:
  * PlannerContext.
  * PlannerEngine.
  * PlannerService.
  * TimeBlock.
  * PlannerWeek.

### Sistema basado en reglas

Implementación de las reglas del planificador:

* SleepRule.
* WorkRule.
* FreeTimeRule.
* FoodRule.
* StudyRule.
* SportRule.
* LeisureRule.
* PersonalTimeRule.

### Sistema de asignación

Implementación de:

* ObjectiveRule.
* BlockAllocator.
* TimeWindowAllocator.
* FreeTimeAnalyzer.

### Funcionalidades añadidas

* Generación automática de bloques horarios.
* Distribución inteligente de objetivos.
* Gestión de comidas mediante ventanas horarias.
* Soporte para turnos nocturnos.
* División automática de jornadas que atraviesan medianoche.

## [0.5.0] - Inicio de Planner UI

### Primera interfaz del planificador

Creación de la primera representación visual de la planificación generada.

Añadido:

* PlannerWeekScreen.
* Vista semanal mediante pestañas.
* Navegación por días de la semana.
* Selección automática del día actual.

### Componentes visuales

Creación de:

* DayColumn.
* TimeBlockCard.
* BlockColorHelper.
* BlockNameHelper.
* BlockIconHelper.

### Mejoras visuales

* Colores diferenciados por tipo de actividad.
* Iconos asociados a bloques.
* Nombres amigables para el usuario.
* Ordenación cronológica de bloques.

## [0.6.0] - Mejoras de experiencia de usuario

### Resumen diario

Implementación de:

* DaySummaryCard.
* Contador de bloques diarios.
* Cálculo de tiempo dedicado a objetivos.

### Información temporal

Añadido:

* Visualización de fecha real del día.
* Información de semana actual.
* Actualización manual de planificación.

### Mejoras de navegación

* Integración completa entre generación del planner y vista semanal.
* Sustitución progresiva de pantallas de depuración.

## [0.7.0] - Gestión e historial de semanas

# Gestión de semanas

* Implementación de SemanaService.
* Consulta de semanas almacenadas mediante SemanaRepository.
* Consulta de una semana concreta mediante su identificador.
* Gestión del número de semana y año.
* Gestión del tipo de semana:
  * Semana normal.
  * Semana de vacaciones.

# Historial de planificaciones

* Creación de PlanningHistoryScreen.
* Creación de PlanningWeekCard.
* Visualización de las semanas disponibles.
* Visualización del año y rango de fechas de cada semana.
* Identificación visual de la semana actual.
* Acceso a la planificación de una semana concreta.

# Navegación entre semanas

* Carga de la planificación correspondiente a la semana seleccionada.
* Corrección de la información temporal mostrada en cada planificación.
* La semana actual comienza mostrando el día actual.
* Las semanas anteriores y futuras comienzan mostrando el lunes.

# Mejoras en la interfaz

* Indicador visual de la semana actual.
* Indicador del tipo de semana.
* Mejora de la pantalla principal.
* Acceso al historial de planificaciones desde la aplicación.

## Próximamente

### Gestión de semanas

* Copiar automáticamente la configuración de una semana anterior.
* Gestión avanzada de semanas futuras.
* Mejoras en la gestión de semanas de vacaciones.

### Planner UI

* Vista tipo timeline diaria.
* Animaciones entre días.
* Tema oscuro.
* Personalización visual.
* Mejoras de tarjetas de bloques.

### Smart Planner

* Edición manual de actividades.
* Bloqueo de bloques.
* Regeneración parcial de semanas.
* Configuración avanzada de prioridades.
* Drag & Drop.

### Aplicación

* Estadísticas personales.
* Notificaciones inteligentes.
* Exportación a calendario.
* Sincronización.
* Recomendaciones inteligentes mediante IA.