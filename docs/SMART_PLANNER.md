# Smart Planner Engine

## Introducción

El Smart Planner Engine es el núcleo inteligente de MiSemana+.

Su objetivo es generar automáticamente una planificación semanal personalizada a partir de la información del usuario:

* Horarios de trabajo.
* Horas de descanso.
* Objetivos semanales.
* Preferencias personales.
* Tiempo disponible.

El motor utiliza un sistema basado en reglas (**Rule Engine**) que permite añadir nuevas funcionalidades sin modificar la estructura principal.

# Arquitectura del motor

El flujo principal de generación es:
Usuario
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
|
▼
Rules
|
▼
TimeBlocks
|
▼
PlannerWeek

# Componentes principales

## PlannerService

Es el punto de entrada del motor desde la aplicación.

Responsabilidades:

* Obtener datos del usuario.
* Obtener turnos laborales.
* Obtener objetivos semanales.
* Crear el contexto de planificación.
* Ejecutar el Planner Engine.

Flujo:
PlannerService
  |
  |
  ▼
UsuarioRepository
TurnoRepository
ObjetivoRepository
  |
  ▼
PlannerContext
  |
  ▼
PlannerEngine

# PlannerContext

El contexto contiene toda la información necesaria para generar la semana.

Actualmente incluye:
Usuario
Turnos
Objetivos

Su función es evitar que las reglas tengan que acceder directamente a la base de datos.

Cada regla recibe únicamente la información necesaria.

# PlannerEngine

Es el encargado de coordinar todas las reglas.

Su funcionamiento:
PlannerContext
  |
  ▼
Lista de Rules
  |
  ▼
Aplicación secuencial
  |
  ▼
Lista final de TimeBlocks

Las reglas se ejecutan siguiendo un orden determinado para evitar conflictos.

# Sistema de reglas

Cada regla representa una parte de la planificación.

La estructura permite añadir nuevas reglas sin modificar el motor principal.

Actualmente existen:
SleepRule
WorkRule
FoodRule
FreeTimeRule
StudyRule
SportRule
LeisureRule
PersonalTimeRule

# SleepRule

Gestiona los bloques de descanso del usuario.

Utiliza:
horaDormir
horaDespertar

Genera bloques:
SLEEP

Ejemplo:
23:30 - 07:30

# WorkRule

Gestiona los turnos laborales.

Tiene en cuenta:

* Jornada completa.
* Jornada partida.
* Turnos variables.
* Turnos nocturnos.

Ejemplo:

Entrada:
22:00 - 04:00

Resultado:
Día 1
22:00 - 00:00
Día 2
00:00 - 04:00

Esto permite trabajar siempre con bloques independientes por día.

# FoodRule

Distribuye automáticamente las comidas.

Genera:
FOOD

Bloques para:

* Desayuno.
* Almuerzo.
* Cena.

La regla intenta evitar conflictos con trabajo y descanso.

# FreeTimeRule

Gestiona el tiempo libre disponible.

Su función es analizar huecos existentes entre bloques ocupados.

Ejemplo:
Trabajo
08:00 - 14:00
Libre
14:00 - 18:00
Trabajo
18:00 - 22:00

El sistema genera ventanas disponibles.

# StudyRule

Gestiona objetivos relacionados con estudio.

Ejemplo:

Objetivo:
STUDIO
180 minutos

El motor busca espacios disponibles y crea:
STUDY

# SportRule

Gestiona objetivos deportivos.

Ejemplo:
DEPORTE
120 minutos

Genera:
SPORT

respetando:

* Trabajo.
* Descanso.
* Otros objetivos.

# LeisureRule

Gestiona actividades de ocio.

Ejemplo:
OCIO
90 minutos

Genera bloques:
LEISURE

# PersonalTimeRule

Reserva tiempo personal.

Ejemplo:
TIEMPO_PERSONAL
60 minutos

Genera:
PERSONAL

# TimeBlock

Es la unidad básica del planificador.

Representa un bloque de tiempo.

Modelo:

TimeBlock

Campos:

| Campo | Descripción |
|-|-|
| day | Día de la semana |
| start | Inicio en minutos |
| end | Fin en minutos |
| type | Tipo de actividad |
| priority | Prioridad |

Ejemplo:
Día: Lunes
08:00 - 14:00
WORK

# BlockAllocator

Se encarga de asignar bloques dentro de espacios disponibles.

Responsabilidades:

* Buscar huecos libres.
* Comprobar duración.
* Evitar solapamientos.
* Respetar prioridades.

# TimeWindowAllocator

Gestiona ventanas temporales disponibles.

Permite colocar actividades dentro de intervalos libres.

Ejemplo:
Ventana:
16:00 - 20:00

Objetivo:
60 minutos deporte

Resultado:
17:00 - 18:00
SPORT

# Gestión de prioridades

Cada bloque tiene una prioridad.

Orden aproximado:
1 - Obligatorio
Trabajo
Sueño

2 - Necesario
Comidas

3 - Objetivos
Estudio
Deporte

4 - Preferencias
Ocio
Tiempo personal

Las prioridades permiten resolver conflictos.

# FreeTimeAnalyzer

Analiza la distribución generada.

Permite conocer:

* Tiempo libre restante.
* Tiempo ocupado.
* Objetivos planificados.

Ejemplo:
Trabajo: 8h
Sueño: 8h
Objetivos: 3h
Libre: 5h

# Generación de una semana

Ejemplo de ejecución:
Usuario

Dormir:
23:30 - 07:30

Trabajo:
08:00 - 14:00

Objetivos:
Estudio 3h
Deporte 2h

Resultado:
Lunes

SLEEP
WORK
FOOD
STUDY
SPORT
FREE

Martes

SLEEP
WORK
FOOD
FREE

# Ventajas del diseño

El sistema permite:

* Añadir nuevas reglas fácilmente.
* Separar lógica de negocio.
* Mantener código escalable.
* Evitar dependencias con la interfaz.
* Mejorar el algoritmo progresivamente.

# Futuras mejoras

Posibles evoluciones:

* Aprendizaje de hábitos del usuario.
* Replanificación automática.
* Ajuste según cumplimiento real.
* Priorización personalizada.
* Recomendaciones inteligentes.
* Integración con inteligencia artificial.