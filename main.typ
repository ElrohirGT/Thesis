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

#let titleText = [Desarrollo de el _inflight-software_ para la OBC secundaria del Satélite Quetzal-2]

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
    Guatemala, 15 de abril de 2026
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
    El Quetzal-2 es un nanosatélite CubeSat 2U desarrollado como proyecto académico por estudiantes y _staff_ UVG el cual pone a prueba una _On-Board Computer_ (OBC) diseñada localmente que ejecuta una inteligencia artificial capaz de identificar nubes. Este nanosatélite cuenta con una computadora a bordo compuesta de por dos unidades de procesamiento, una _of-the-shelf_ de GomSpace y otra desarrollada localmente utilizando Portentas H7 de Arduino.
    Las OBC son sistemas vitales dentro de una misión espacial puesto que gestionan todos los subsistemas del satélite así como la comunicación entre estos. Este proyecto se centra en las bases de esta OBC local a nivel de _software_, sentando las bases para los distintos modos de operación que necesitará la misión, la toma de fotografías y la interoperabilidad entre las dos unidades de procesamiento que componen la OBC completa.
    El impacto de esta OBC desarrollada localmente representa un gran punto de inicio para próximas misiones espaciales, bajando aún más la barrera económica de entrada para desarrollar misiones espaciales con respecto a soluciones _of-the-shelf_, puesto que demuestra que no es necesario el uso de hardware altamente costoso con muchas más protecciones para llevar a cabo una misión exitosa.
  ]
]

= Introducción

El Quetzal-2 es un proyecto académico desarrollado por estudiantes y personal UVG la cual pone a prueba una computadora a bordo (OBC por sus siglas en inglés) diseñada en UVG capaz de ejecutar un modelo de inteligencia artificial para identificar nubes en imágenes satelitales @quetzal_2. Este proyecto es importante no solo porque representa un avance tecnológico en Guatemala, sino también por su impacto dentro de la juventud del país, inspirando a futuros científicos, ingenieros e innovadores @quetzal_1.

La misión espacial es un CubeSat 2U, 10x20x10cm y con un peso máximo de 4kg @johnstone_2022 y cuenta con 4 objetivos específicos que busca completar, llamadas cargas útiles (_Payloads_ en inglés). Para este proyecto nos interesa específicamente _Payload MILO_, el subsistema encargado del reconocimiento de nubosidad y la toma de fotografías en el espacio @quetzal_2.

Las OBC cumplen un papel clave dentro de los subsistemas del satélite puesto que son las encargadas de manejar todas las tareas, intercambio de información entre módulos y la colecta de información sobre los demás subsistemas (_housekeeping_) antes de la conexión con la estación en tierra @lwabanji_wilkinson_biermann_bellville_2013.

Algunos de los subsistemas que debe manejar una OBC son:
- Un sistema de poder (EPS por sus siglas en inglés).
- Un sistema que determina la altidud (ADCS por sus siglas en inglés).
- Un sistema de comunicación utilizando radiofrecuencias.
- Una o más cargas útiles, por ejemplo una cámara o transmisor de señales junto con su controlador.

La inicialización, intercomunicación y gestión de todos estos subsistemas recae sobre la OBC @akhtar_2012. Debido a las altas limitaciones energéticas en satélites de esta escala se debe tener especial cuidado con el presupuesto de energía que se le puede brindar a cada uno de los subsistemas. De esta necesidad nacen los modos de operación, los cuáles restringen las funcionalidades del satélite según la tarea para la que se quiere que se especialice en ese momento.

Este trabajo profesional busca desarrollar un sistema de _software_ para la OBC diseñada localmente (_in-house_) capaz de operar la carga útil MILO, gestionar modos de operación y ejecutar un mecanismo de handover con la computadora principal, validado en un entorno controlado terrestre. Para el desarrollo de este sistema se utilizará una metodología propia del laboratorio espacial UVG, basada en la metodología de ingeniería de sistemas de la NASA @nasa_systems_engineering.

#pagebreak()
= Antecedentes
+ Investigacion preliminar.

#pagebreak()
= Objetivos

Desarrollar localmente las bases de un _inflight software_ para la OBC diseñada localmente del Quetzal-2, capaz de operar la carga útil MILO, gestionar modos de operación y ejecutar un mecanismo de handover con la OBC principal, validado en un entorno controlado terrestre.
+ Integrar el módulo de cámara al sistema de _software_ de la computadora a bordo, logrando la captura y transmisión de al menos una secuencia de imágenes desde la carga útil MILO hacia la computadora a bordo desarrollada localmente, sin errores de comunicación en pruebas controladas. 
+ Desarrollar el sistema base de gestión de modos de operación del _software_, implementando al menos tres modos (Arranque, Toma de fotografía y Nominal preliminar), validando transiciones correctas entre los modos de Toma de fotografía y Nominal preliminar sin pérdida de funcionalidad. 
+ Desarrollar un Producto Mínimo Viable (MVP por sus siglas en inglés) del sistema de handover entre la OBC principal y la OBC diseñada localmente, que permita transferir y recuperar el control de la carga útil MILO mediante comandos definidos y verificados en pruebas de integración.

#pagebreak()
= Justificación

La misión espacial de Quetzal-2 tiene como misión principal probar una computadora a bordo (diseñada en UVG) que sea capaz de ejecutar un modelo de inteligencia artificial para identificar nubes en imágenes satelitales @quetzal_2. Al ser una misión académica y no un proyecto de gobierno o una multinacional como Tesla, los recursos económicos son relativamente limitados. Esto genera una necesidad de reducir costos en donde sea posible y por lo tanto, un _software_ diseñado _inhouse_ adaptado a las necesidad específicas de la misión pero con oportunidad de ser extendido a otras misiones futuras capaz de ejecutarse dentro de componentes más baratos suena muy atractivo, dando origen a este proyecto.

Otra limitante dentro de estos sistemas es el bajo presupuesto de energía con el que se cuenta. En general, esto afecta la potencia de los microcontroladores que se pueden utilizar, pues se tiene que balancear disponibilidad del sistema y potencia @lwabanji_wilkinson_biermann_bellville_2013. Por lo tanto, esta clase de sistemas espaciales generalmente utilizan sistemas operativos en tiempo real (RTOS por sus siglas en inglés) debido a que ofrecen un mayor control sobre el orquestamiento de tareas permitiendo así (de forma indirecta) un mayor control sobre el uso de energía.

Para este proyecto en específico se consideraron dos opciones de sistemas operativos a utilizar, ambos RTOS y _open source_: RODOS y FreeRTOS.

+ RODOS: Es un sistema operativo basado en el principio de cliente-servidor. Su principal fortaleza es un diseño sencillo y modular que permite su extensibilidad @rodos.
+ FreeRTOS: Es un sistema operativo cuyos fuertes principales son su facilidad de uso y el alto soporte que tiene tanto en comunidad como en arquitecturas de procesador, en especial, que ya soporta la Portenta H7 @freertos_2010.
Para este proyecto se utiliza FreeRTOS como sistema operativo base para el _inflight software_. Siendo el soporte para la PortentaH7 su principal ventaja respecto a RODOS.

#pagebreak()
= Metodología

Se seguirá una metodología kanban de trabajo, con columnas que representan los estados:

+ Listos
+ En progreso
+ Completado

Además para la documentación y organización de los módulos se utilizará una metodología propia del laboratorio pero que tiene sus bases en _Systems Engineering_, una metodología utilizada por la _National AeroSpace Agency_ (NASA) para sus proyectos @nasa_systems_engineering.

La modalidad será en su mayoría presencial debido a que para realizar pruebas se necesita hardware específico que se encuentra disponible solamente dentro del laboratorio aeroespacial UVG. Sin embargo, el desarrollo de _software_ tiene la gran ventaja que puede ser trabajado de forma remota también, por lo que ocasionalmente se tendrán sesiones asíncronas remotas de desarrollo.

#pagebreak()
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
      ("Establecer comunicación entre OBC principal y OBC secundario",  (12, 13)),
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
