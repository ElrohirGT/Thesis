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


#place(
  top + center,
  float: true,
  scope: "parent",
  clearance: 2em,
)[
  #title[
    Dummy Title
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
    // TODO: Añadir Abstract
    #lorem(80)
  ]
]

= Introducción
// #lorem(300)
//
// TODO: Describir que Quetzal-2 es un CubeSat.

El Quetzal-2 es un proyecto académico desarrollado por estudiantes y staff UVG la cual pondrá a prueba una computadora a bordo diseñada en UVG capaz de ejecutar un modelo de inteligencia artificial para identificar nubes en imágenes satelitales @quetzal_2. Este proyecto es importante no solo porque representa un avance tecnológico en Guatemala, sino también por su impacto dentro de la juventud del país, inspirando a futuros científicos, ingenieros e innovadores.

La misión espacial Quetzal-2 cuenta con 4 objetivos específicos que busca completar, llamadas cargas útiles (_Payloads_ en inglés). Para este trabajo de graduación nos interesa específicamente _Payload MILO_, el subsistema encargado del reconocimiento de nubosidad y la toma de fotografías en el espacio @quetzal_2.

Las computadoras a bordo (OBC, por sus siglas en inglés) cumplen un papel clave dentro de los subsistemas del satélite puesto que son las encargadas de manejar todas las tareas, intercambio de información entre módulos y la colecta de información sobre los demás subsistemas (_housekeeping_) antes de la conexión con la estación en tierra @lwabanji_wilkinson_biermann_bellville_2013.

Algunos de los subsistemas que debe manejar una OBC son:
- Un sistema de poder (EPS por sus siglas en inglés).
- Un sistema que determina la altidud (ADCS por sus siglas en inglés).
- Un sistema de comunicación utilizando radiofrecuencias.
- Una o más cargas útiles, por ejemplo una cámara o transmisor de señales junto con su controlador.

La inicialización, intercomunicación y gestión de todos estos subsistemas recae sobre la OBC @akhtar_2012. Debido a las altas limitaciones energéticas en satélites de esta escala se debe tener especial cuidado con el presupuesto de energía que se le puede brindar a cada uno de los subsistemas. De esta necesidad nacen los modos de operación, los cuáles restringen las funcionalidades del satélite según la tarea para la que se quiere que se especialice en ese momento.

Este trabajo profesional busca desarrollar un sistema de software para la computadora a bordo diseñada localmente (_in-house_) capaz de operar la carga útil MILO, gestionar modos de operación y ejecutar un mecanismo de handover con la computadora principal, validado en un entorno controlado terrestre. Para el desarrollo de este sistema se utilizará una metodología propia del laboratorio espacial UVG, basada en la metodología de ingeniería de sistemas de la NASA @hirshorn_2007.

= Objetivos

Desarrollar un sistema de software para la computadora a bordo diseñada localmente del Quetzal-2, capaz de operar la carga útil MILO, gestionar modos de operación y ejecutar un mecanismo de handover con la computadora principal, validado en un entorno controlado terrestre.
+ Integrar el módulo de cámara al sistema de software de la computadora a bordo, logrando la captura y transmisión de al menos una secuencia de imágenes desde la carga útil MILO hacia la computadora a bordo desarrollada localmente, sin errores de comunicación en pruebas controladas. 
+ Desarrollar el sistema base de gestión de modos de operación del software, implementando al menos tres modos (Arranque, Toma de fotografía y Nominal preliminar), validando transiciones correctas entre los modos de Toma de fotografía y Nominal preliminar sin pérdida de funcionalidad. 
+ Desarrollar un MVP del sistema de handover entre la computadora principal y la computadora diseñada localmente, que permita transferir y recuperar el control de la carga útil MILO mediante comandos definidos y verificados en pruebas de integración.

= Cronograma


// Supposedly it also works as works.bib
// #bibliography("works.bib")
#bibliography(("ref.yml", "ref.bib"))
// #bibliography("ref.bib")
