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
    *Abstract* \
    #lorem(80)
  ]
]

= Introduction
#lorem(30)

+ Ordered
+ List
- Unordered
- List
  + SubList
  - Item!

#figure(
  image("./rodos.jpg", width: 70%),
  caption: [
    Esta es una caption!
  ]
)<rodos>

Como se muestra en la @rodos, se puede ver que RODOS es un sistema operativo!

Para la bibliografia se puede ver que si referencia a este articulo @plaque

Se puede añadir matematicas tambien:

$ A = f(x) $

// Supposedly it also works as works.bib
// #bibliography("works.bib")
#bibliography("works.yml")
