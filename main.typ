
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

Desarrollo de un sistema de software para la computadora a bordo (OBC por sus siglas en inglés) del Quetzal-2 capaz de tomar y enviar fotografías utilizando al menos 3 modos de operación en un ambiente controlado terrestre, con una tasa de éxito de transmisión mayor o igual a 95%.
  + Definición del ambiente controlado y sus parámetros, permitiendo la ejecución y prueba del sistema de software en La Tierra según los estándares del laboratorio aerosepacial UVG.
  + Integrar el módulo de la cámara al sistema de software de la computadora a bordo, logrando la toma y envío exitoso con una tasa de transmisión mayor o igual al 95% con una resolución dada por los parámetros del ambiente controlado.
  + Desarrollar e implementar el sistema base de gestión de modos de operación del software de la computadora a bordo, contemplando un mínimo de tres modos: Arranque, Toma de fotografía y Nominal preliminar con transiciones entre toma de fotografía y nominal preliminar sin fallos.

= Cronograma

Vamos a referenciar la siguiente xD @schuele_rafat_kossykh_1996

// Supposedly it also works as works.bib
// #bibliography("works.bib")
#bibliography(("ref.yml", "ref.bib"))
// #bibliography("ref.bib")
