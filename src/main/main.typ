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
    Guatemala, agosto de 2026
  ]
]

#pagebreak()

= Marco Teórico

Flow:
- Quetzal-2
- CubeSat
- Inflight Software
- OBC
- RTOS
- Subsistemas de un satélite
- Comunicación RS485 e I2C
- Metodología de Trabajo

#pagebreak()
#bibliography(("ref.yml", "ref.bib"))
