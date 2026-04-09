
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
  columns: 2,
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

= Objetivos

Desarrollar un sistema de software para la OBC _inhouse_ del Quetzal-2 capaz de la toma y envío de fotografias utilizando distintos modos de operación en un ambiente controlado terrestre y permita que el sistema de software OBC principal tome el control de la misión.
  + Integrar el módulo de la cámara al sistema de software de la computadora a bordo, logrando la toma y envío exitoso de fotografías del payload MILO al payload OBC.
  + Desarrollar el sistema base de gestión de modos de operación del software de la computadora a bordo, contemplando un mínimo de tres modos: Arranque, Toma de fotografía y Nominal preliminar con transiciones entre toma de fotografía y nominal preliminar sin fallos.
  + Desarrollar el MVP del sistema de handover entre la OBC principal y la OBC _inhouse_ de la misión que permita intercambiar control del subsistema MILO.

Objetivo secundario que posiblemente no sea parte de los 3 finales:
  + Definición del ambiente controlado y sus parámetros, permitiendo la ejecución y prueba del sistema de software en La Tierra según los estándares del laboratorio aerosepacial UVG.

= Cronograma

Vamos a referenciar la siguiente xD @schuele_rafat_kossykh_1996

// Supposedly it also works as works.bib
// #bibliography("works.bib")
#bibliography(("ref.yml", "ref.bib"))
// #bibliography("ref.bib")
