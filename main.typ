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
    Desarrollo de un Sistema de Software para la Computadora a Bordo del Satélite Quetzal-2
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
    Desarrollo de un Sistema de Software para la Computadora a Bordo del Satélite Quetzal-2
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
    El Quetzal-2 es un CubeSat 2U desarrollado como proyecto académico por estudiantes y staff UVG el cual pondrá a prueba una OBC diseñada localmente que ejecutará una inteligencia artificial capaz de identificar nubes. Este nanosatélite cuenta con una computadora a bordo compuesta de por dos unidades de procesamiento, una _of the shelf_ de GOMSPACE y otra desarrollada localmente utilizando las Portentas H7 de Arduino.
    Las OBC son sistemas vitales dentro de una misión espacial puesto que gestionan todos los subsistemas del satélite así como la comunicación entre estos. Este proyecto se centra en las bases de esta OBC local a nivel de software, sentando las bases para los distintos modos de operación que necesitará la misión, la toma de fotografías y la interoperabilidad entre las dos unidades de procesamiento que componen la OBC completa.
    El impacto de esta OBC desarrollada localmente representaría un gran punto de inicio para próximas misiones espaciales, bajando aún más la barrera económica de entrada para desarrollar misiones espaciales, puesto que demostraría que no es necesario el uso de hardware altamente costoso con muchas más protecciones para llevar a cabo una misión exitosa.
  ]
]

= Introducción

El Quetzal-2 es un proyecto académico desarrollado por estudiantes y staff UVG la cual pondrá a prueba una computadora a bordo diseñada en UVG capaz de ejecutar un modelo de inteligencia artificial para identificar nubes en imágenes satelitales @quetzal_2. Este proyecto es importante no solo porque representa un avance tecnológico en Guatemala, sino también por su impacto dentro de la juventud del país, inspirando a futuros científicos, ingenieros e innovadores.

La misión espacial es un CubeSat 2U, 10x20x10cm y con un peso máximo de 4kg @johnstone_2022 y cuenta con 4 objetivos específicos que busca completar, llamadas cargas útiles (_Payloads_ en inglés). Para este trabajo de graduación nos interesa específicamente _Payload MILO_, el subsistema encargado del reconocimiento de nubosidad y la toma de fotografías en el espacio @quetzal_2.

Las computadoras a bordo (OBC, por sus siglas en inglés) cumplen un papel clave dentro de los subsistemas del satélite puesto que son las encargadas de manejar todas las tareas, intercambio de información entre módulos y la colecta de información sobre los demás subsistemas (_housekeeping_) antes de la conexión con la estación en tierra @lwabanji_wilkinson_biermann_bellville_2013.

Algunos de los subsistemas que debe manejar una OBC son:
- Un sistema de poder (EPS por sus siglas en inglés).
- Un sistema que determina la altidud (ADCS por sus siglas en inglés).
- Un sistema de comunicación utilizando radiofrecuencias.
- Una o más cargas útiles, por ejemplo una cámara o transmisor de señales junto con su controlador.

La inicialización, intercomunicación y gestión de todos estos subsistemas recae sobre la OBC @akhtar_2012. Debido a las altas limitaciones energéticas en satélites de esta escala se debe tener especial cuidado con el presupuesto de energía que se le puede brindar a cada uno de los subsistemas. De esta necesidad nacen los modos de operación, los cuáles restringen las funcionalidades del satélite según la tarea para la que se quiere que se especialice en ese momento.

Este trabajo profesional busca desarrollar un sistema de software para la computadora a bordo diseñada localmente (_in-house_) capaz de operar la carga útil MILO, gestionar modos de operación y ejecutar un mecanismo de handover con la computadora principal, validado en un entorno controlado terrestre. Para el desarrollo de este sistema se utilizará una metodología propia del laboratorio espacial UVG, basada en la metodología de ingeniería de sistemas de la NASA @hirshorn_2007.

#pagebreak()
= Antecedentes
+ Investigacion preliminar.

#pagebreak()
= Objetivos

Desarrollar las bases de un _inflight software_ para la computadora a bordo diseñada localmente del Quetzal-2, capaz de operar la carga útil MILO, gestionar modos de operación y ejecutar un mecanismo de handover con la computadora principal, validado en un entorno controlado terrestre.
+ Integrar el módulo de cámara al sistema de software de la computadora a bordo, logrando la captura y transmisión de al menos una secuencia de imágenes desde la carga útil MILO hacia la computadora a bordo desarrollada localmente, sin errores de comunicación en pruebas controladas. 
+ Desarrollar el sistema base de gestión de modos de operación del software, implementando al menos tres modos (Arranque, Toma de fotografía y Nominal preliminar), validando transiciones correctas entre los modos de Toma de fotografía y Nominal preliminar sin pérdida de funcionalidad. 
+ Desarrollar un MVP del sistema de handover entre la computadora principal y la computadora diseñada localmente, que permita transferir y recuperar el control de la carga útil MILO mediante comandos definidos y verificados en pruebas de integración.

#pagebreak()
= Justificación

La misión espacial de Quetzal-2 tiene como misión principal probar una computadora a bordo (diseñada en UVG) que sea capaz de ejecutar un modelo de inteligencia artificial para identificar nubes en imágenes satelitales @quetzal_2.

+ Por qué hacer un inflight software en lugar de utilizar uno comprado.
+ Por qué se utilizan las tecnologias que utilizaste.
+ También se cita.

#pagebreak()
= Metodología

#pagebreak()
= Plan de Trabajo
+ Cronograma


// Supposedly it also works as works.bib
// #bibliography("works.bib")
#pagebreak()
#bibliography(("ref.yml", "ref.bib"))
// #bibliography("ref.bib")
