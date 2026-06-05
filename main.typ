#set text(
  lang:"es",
  region: "gt"
)
#set par(justify: true)
// #set heading(numbering: "1.")
#set page(
  paper: "us-letter",
  // header: align(right)[
  //   A Fluid Dynamic Model for
  //   Glacier Flow
  // ],
  numbering: "1",
  columns: 1,
)
#show title: set text(size: 17pt)
#show title: set align(center)
#show heading: set align(center)
#show heading: set text(
  size: 13pt,
  weight: "regular",
)
#show heading: smallcaps

#let titleText = [Desarrollo del _inflight software_ para la OBC secundaria del Satélite Quetzal-2]

#set page(
  paper: "a4",
  margin: (top: 3cm, bottom: 3cm, left: 3cm, right: 3cm),
)

#set text(font: "New Computer Modern", size: 12pt)

#align(center)[
  // Nombre de la institución u organización (opcional)
  #text(size: 14pt, weight: "bold")[
    Universidad del Valle de Guatemala
  ]

  #v(0.5cm)

  // Línea decorativa superior
  #line(length: 100%, stroke: 0.5pt)

  #v(2cm)

  // Título principal
  #text(size: 22pt, weight: "bold")[
    #titleText
  ]

  #v(0.5cm)

  // Subtítulo (opcional)
  #text(size: 14pt, style: "italic", fill: luma(80))[
    // TODO: Add subtitle
  ]

  #v(2cm)

  // Imagen central
  #box(
    width: 6cm,
    height: 6cm,
    stroke: 0.5pt + luma(180),
    radius: 4pt,
  )[
    #align(center + horizon)[
      // Reemplaza "imagen.png" con la ruta de tu imagen
      // #image("imagen.png", width: 100%)

      // Placeholder si no hay imagen
      #text(size: 10pt, fill: luma(150))[
        [ #image("uvg_logo.png", width: 100%) ]
      ]
    ]
  ]

  #v(2cm)

  // Línea decorativa inferior
  #line(length: 100%, stroke: 0.5pt)

  #v(1cm)

  // Información del autor
  #text(size: 12pt)[
    *Autor:* Flavio André Galán Donis
  ]

  // #v(0.4cm)

  // Curso o materia (opcional)
  #text(size: 12pt)[
    *Curso:* Diseño e Innovación
  ]

  #v(1cm)

  // Fecha
  #text(size: 12pt, fill: luma(60))[
    Guatemala, junio de 2026
  ]
]

#place(
  top + center,
  float: true,
  scope: "parent",
  clearance: 2em,
)[
  #title[
    #titleText
  ]
  #grid(
    columns: (1fr),
    align(center)[
      Flavio Galan \
      Universidad del Valle de Guatemala \
      #link("mailto:gal22386@uvg.edu.gt")
    ]
  )
  #par(justify: false)[
    *Resumen/Abstract* \
    El Quetzal-2 es un nanosatélite CubeSat 2U desarrollado como proyecto académico por estudiantes y _staff_ de la Universidad del Valle de Guatemala el cual pone a prueba una _On-Board Computer_ (OBC) diseñada localmente que ejecuta una inteligencia artificial capaz de identificar nubes. Este nanosatélite cuenta con una computadora a bordo compuesta de por dos unidades de procesamiento, una _of-the-shelf_ de GomSpace y otra desarrollada localmente utilizando Portentas H7 de Arduino.
    Las OBC son sistemas vitales dentro de una misión espacial puesto que gestionan todos los subsistemas del satélite así como la comunicación entre estos. Este proyecto se centra en las bases de esta OBC local a nivel de _software_, sentando las bases para los distintos modos de operación que necesita la misión, la toma de fotografías y la interoperabilidad entre las dos unidades de procesamiento que componen la OBC completa.
    El impacto de esta OBC desarrollada localmente representa un gran punto de inicio para próximas misiones espaciales, bajando aún más la barrera económica de entrada para desarrollar misiones espaciales con respecto a soluciones _of-the-shelf_, puesto que demuestra que no es necesario el uso de _hardware_ altamente costoso con muchas más protecciones para llevar a cabo una misión exitosa.
  ]
]

= Introducción

El Quetzal-2 es un proyecto académico desarrollado por estudiantes y personal de la Universidad del Valle de Guatemala la cual pone a prueba una computadora a bordo (OBC por sus siglas en inglés) diseñada en UVG capaz de ejecutar un modelo de inteligencia artificial para identificar nubes en imágenes satelitales @quetzal_2. Este proyecto es importante no solo porque representa un avance tecnológico en Guatemala, sino también por su impacto dentro de la juventud del país, inspirando a futuros científicos, ingenieros e innovadores @quetzal_1.

La misión espacial es un CubeSat 2U, 10x20x10cm y con un peso máximo de 4kg @johnstone_2022 y cuenta con 4 objetivos específicos que busca completar, llamadas cargas útiles (_Payloads_ en inglés). Para este proyecto nos interesa específicamente el _inflight software_ de la OBC secundaria de Quetzal-2 y su interacción con _Payload MILO_, el subsistema encargado del reconocimiento de nubosidad y la toma de fotografías en el espacio @quetzal_2.

Las OBCs cumplen un papel clave dentro de los subsistemas del satélite puesto que son las encargadas de manejar todas las tareas, intercambio de información entre módulos y la colecta de información sobre los demás subsistemas (_housekeeping_) antes de la conexión con la estación en tierra @lwabanji_wilkinson_biermann_bellville_2013.

Algunos de los subsistemas que debe manejar una OBC son:
- Un sistema de poder (EPS por sus siglas en inglés).
- Un sistema que determina la altidud (ADCS por sus siglas en inglés).
- Un sistema de comunicación utilizando radiofrecuencias.
- Una o más cargas útiles, por ejemplo una cámara o transmisor de señales junto con su controlador.

La inicialización, intercomunicación y gestión de todos estos subsistemas recae sobre la OBC @akhtar_2012. Debido a las altas limitaciones energéticas en satélites de esta escala se debe tener especial cuidado con el presupuesto de energía que se le puede brindar a cada uno de los subsistemas. De esta necesidad nacen los modos de operación, los cuáles restringen las funcionalidades del satélite según la tarea para la que se quiere que se especialice en ese momento.

Este trabajo profesional busca desarrollar un sistema de _software_ para la OBC diseñada localmente (_in-house_) capaz de operar la carga útil MILO, gestionar modos de operación y ejecutar un mecanismo de _handover_ con la computadora principal, validado en un entorno controlado terrestre. Para el desarrollo de este sistema se utiliza una metodología propia del laboratorio espacial UVG, basada en la metodología de ingeniería de sistemas de la NASA @nasa_systems_engineering.

#pagebreak()
= Objetivos

Desarrollar localmente las bases de un _inflight software_ para la _On Board Computer_ (OBC) secundaria diseñada localmente del Quetzal-2, capaz de operar la carga útil MILO, gestionar modos de operación y ejecutar un mecanismo de _handover_ con la OBC principal, validado en un entorno controlado terrestre.
+ Integrar el módulo de cámara al sistema de _software_ de la computadora a bordo secundaria, logrando la captura y transmisión de imágenes desde la carga útil MILO hacia la computadora a bordo secundaria desarrollada localmente. 
+ Desarrollar el sistema base de gestión de modos de operación del _software_, implementando tres modos: Arranque, Toma de fotografía y Nominal preliminar.
+ Desarrollar un Producto Mínimo Viable (MVP) del sistema de _handover_ entre la OBC principal y la OBC secundaria diseñada localmente, que permita transferir y recuperar el control de la carga útil MILO.

#pagebreak()
= Justificación

La misión espacial Quetzal-2 al ser una misión académica y no un proyecto de gobierno o una multinacional como Tesla, cuenta con recursos económicos relativamente limitados. Esto genera una necesidad real de reducir costos en donde sea posible, por lo tanto, un _inflight software_ diseñado localmente, adaptado a las necesidades específicas de la misión pero reutilizable en misiones futuras y además es capaz de ejecutarse dentro de componentes más baratos suena muy atractivo, dando origen a este proyecto.

En cuanto a las tecnologías a utilizar, las OBCs dependen en gran medida del microcontrolador seleccionado para su misión @bheema_rajulu_sankar_dasiga_iyer_2014. En el Quetzal-2 se utiliza una pareja de PortentasH7 Lite para la OBC secundaria, éstas cuentan con dos procesadores ARM diseñados por el proveedor STM32 @arduino_2026. Por lo tanto, nuestras opciones se encuentran limitadas a lo que este proveedor pueda ofrecer.

Según la literatura actual, el uso de _Real Time Operating Systems_ (RTOS por sus siglas en inglés) representa una práctica común para escribir sistemas complejos en el mundo del _embedded software_, incluyendo en misiones espaciales como el STUDSAT-2 @bheema_rajulu_sankar_dasiga_iyer_2014. Para este proyecto se utiliza FreeRTOS debido a su soporte para PortentaH7 y su comunidad de desarrolladores, la cual es grande y activa @freertos_2010.

Debido a que FreeRTOS expone un API oficial en C para su desarrollo @freertos_2010 y a los bajos márgenes de presupuesto de energía con los que se cuenta en misiones de escalas similares a Quetzal-2 @lwabanji_wilkinson_biermann_bellville_2013, el lenguaje que se utiliza para el desarrollo del _inflight software_ es C.

#pagebreak()
= Metodología

Para la documentación y organización de los módulos se utiliza una metodología propia del laboratorio pero que tiene sus bases en _Systems Engineering_, una metodología utilizada por la _National AeroSpace Agency_ (NASA por sus siglás en inglés) para sus proyectos @nasa_systems_engineering.

Debido al reducido tamaño del equipo de desarrollo del _inflight software_ y a las prioridades cambiantes que puede tener el proyecto (por ejemplo, el cambio de protocolos) se utiliza la metodología Kanban, a continuación se presentan los 3 posibles estados en los que se puede encontrar una tarea dentro de esta metodología:

+ Por hacer: Las tareas en esta columna no se han iniciado, pero ya se encuentran definidas y listas para ser iniciadas.
+ En progreso: El desarrollo de las tareas en esta columna ya se inició, pueden o no estar bloqueadas por alguna dependencia a otra tarea en progreso o por hacer.
+ Completado: Las tareas en esta columna ya han finalizado su desarrollo, esto incluye pruebas internas en el ambiente controlado terrestre.

La modalidad de trabajo es en su mayoría presencial debido a que para realizar pruebas se necesita hardware específico que se encuentra disponible solamente dentro del laboratorio aeroespacial UVG. Sin embargo, el desarrollo de _software_ tiene la gran ventaja que puede ser trabajado de forma remota también, por lo que ocasionalmente se tendrán sesiones asíncronas remotas de desarrollo.

A continuación se detallan las fases del proyecto y qué se busca completar en cada una de ellas:

+ Fase 1: Tiene como objetivo integrar la carga útil MILO con la OBC secundaria desarrollada localmente. Para lograr este objetivo se necesita establecer una comunicación básica entre ambos microcontroladores utilizando el protocolo definido por nuestro líder de módulo para luego tomar la fotografía y enviarla a las PortentasH7 Lite.
+ Fase 2: Esta fase busca implementar el sistema de gestión de modos de operación de la OBC secundaria desarrollada localmente. Por lo tanto, se necesita realizar un diseño de la arquitectura en general donde se considere definidión y cambio de modos de operación, además de un camino claro para realizar pruebas de esta implementación. Luego se procede con la implementación de los distintos modos de operación validando que la toma y envío de fotografía siga funcionando.
+ Fase 3: Esta fase tiene como objetivo principal implementar el MVP del _handover_ entre la OBC principal y la OBC secundaria. Para cumplir con este objetivo se necesita establecer una comunicación entre ambas OBCs utilizando el protocolo definido por nuestro líder de módulo e implementar los distintos comandos de toma y retiro de control de la OBC secundaria. Finalmente, se necesita evaluar el correcto funcionamiento de todo el sistema con pruebas de funcionamiento.

// #pagebreak()
= Plan de Trabajo

#let phases = (
  (
    label: "Fase 1 · Integración con la carga útil MILO",
    color: rgb("#358600"),
    text-color: rgb("#fff"),
    bar-color: rgb("#9EE37D"),
    tasks: (
      ("Pruebas de comunicación entre subsistemas",   (1, 2)),
      ("Definición de comandos sobre MILO",           (2, 2)),
      ("Desarrollo de comando de toma de fotografía", (3, 4)),
      ("Desarrollo de envío de fotografía",           (4, 5)),
    ),
  ),
  (
    label: "Fase 2 · Sistema de gestión de modos de operación",
    color: rgb("#402E2A"),
    text-color: rgb("#fff"),
    bar-color: rgb("#CEA0AE"),
    tasks: (
      ("Diseño de arquitectura de la OBC",                  (5, 6)),
      ([Implementación del _runtime environment_ de la OBC],(6, 9)),
      ("Implementación del modo de arranque",               (9, 9)),
      ("Implementación del modo de toma de fotografía",     (10, 11)),
      ("Implementación del modo nominal preliminar",        (11, 12)),
    ),
  ),
  (
    label: [Fase 3 · MVP Sistema de _Handover_],
    color: rgb("#266DD3"),
    text-color: rgb("#fff"),
    bar-color: rgb("#6DD6DA"),
    tasks: (
      ("Establecer comunicación entre OBC principal y OBC secundaria",  (12, 13)),
      ("Definición de comandos de comunicación",                        (13, 13)),
      ("Implementación del comando de toma de control",                 (14, 14)),
      ("Implementación del comando de retiro de control",               (14, 15)),
      ("Implementación del retiro de control de forma automática",      (15, 16)),
      ("Pruebas de funcionamiento y correcciones",                      (16, 18)),
    ),
  ),
)

#let total-weeks = 18
#let cell-width = 1.6em

#let gantt-row(task-name, span, bar-color) = {
  let (start, end) = span
  (
    table.cell(align: left + horizon)[#text(size: 8pt)[#task-name]],
    ..range(1, total-weeks + 1).map(w => {
      if w >= start and w <= end {
        table.cell(fill: bar-color)[]
      } else {
        table.cell()[]
      }
    })
  )
}

#table(
  columns: (10em, ..range(total-weeks).map(_ => cell-width)),
  rows: auto,
  stroke: (x, y) => (
    left: if x == 0 { 0.5pt + gray } else { none },
    right: if x == total-weeks { 0.5pt + gray } else { none },
    top: 0.4pt + luma(220),
    bottom: 0.4pt + luma(220),
  ),
  inset: (x: 3pt, y: 4pt),

  // Header row
  table.cell(align: left + horizon)[#text(weight: "bold", size: 8pt)[Tarea]],
  ..range(1, total-weeks + 1).map(w =>
    table.cell(align: center + horizon)[#text(size: 7pt, weight: "bold")[#w]]
  ),

  // Phases and tasks
  ..phases.map(phase => (
    table.cell(
      colspan: total-weeks + 1,
      fill: phase.color,
      align: left + horizon,
    )[#text(weight: "bold", size: 8pt, fill: phase.text-color)[#phase.label]],
    ..phase.tasks.map(task => {
      let (name, span) = task
      gantt-row(name, span, phase.bar-color)
    }).join()
  )).join()
)


// Supposedly it also works as works.bib
// #bibliography("works.bib")
#pagebreak()
#bibliography(("ref.yml", "ref.bib"))
// #bibliography("ref.bib")
