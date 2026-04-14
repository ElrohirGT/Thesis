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
    #lorem(80)
  ]
]

= Introduction
#lorem(300)

- Contexto (Qué es y por qué?)
- ¿Cómo se va a hacer?
- Resultados Esperados

= Objetivos

Desarrollar e implementar un sistema de software para la computadora a bordo diseñada localmente del Quetzal-2, capaz de operar la carga útil MILO, gestionar modos de operación y ejecutar un mecanismo de handover con la computadora principal, validado en un entorno controlado terrestre.
+ Integrar el módulo de cámara al sistema de software de la computadora a bordo, logrando la captura y transmisión de al menos una secuencia de imágenes desde la carga útil MILO hacia la computadora a bordo desarrollada localmente, sin errores de comunicación en pruebas controladas. 
+ Desarrollar el sistema base de gestión de modos de operación del software, implementando al menos tres modos (Arranque, Toma de fotografía y Nominal preliminar), validando transiciones correctas entre los modos de Toma de fotografía y Nominal preliminar sin pérdida de funcionalidad. 
+ Desarrollar un MVP del sistema de handover entre la computadora principal y la computadora diseñada localmente, que permita transferir y recuperar el control de la carga útil MILO mediante comandos definidos y verificados en pruebas de integración.

= Cronograma


// Supposedly it also works as works.bib
// #bibliography("works.bib")
#bibliography(("ref.yml", "ref.bib"))
// #bibliography("ref.bib")
