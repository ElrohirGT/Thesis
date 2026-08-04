// ==============================================================================
//  PLANTILLA PARA TRABAJOS DE GRADUACIÓN IE-MT — VERSIÓN TYPST
//  Traducción de la plantilla LaTeX original de Miguel Zea (UVG) a Typst,
//  para no depender de una instalación de TeX/LaTeX.
//
//  Todo el documento vive en este único archivo .typ. Las secciones de
//  contenido (prefacio, resumen, introducción, capítulos, etc.) se
//  encuentran más abajo, cada una claramente delimitada, imitando la
//  organización de los archivos .tex originales (0-datos_estudiante,
//  a-prefacio, b-resumen, ... z-main).
// ==============================================================================


// ==============================================================================
// 0. DATOS DEL ESTUDIANTE
// ==============================================================================
// El estudiante debe llenar sus datos en esta sección; la plantilla los
// usa automáticamente para generar la portada, la carátula y la hoja de
// firmas.

#let nombre-estudiante = "Flavio André Galán Donis"
#let uvg-carne         = "22386"
#let uvg-facultad      = "Ingeniería"
#let uvg-carrera       = "Ingeniería en Ciencias de la Computación y Tecnologías de la Información"

#let titulo-tesis = [Desarrollo del _inflight software_ para la OBC secundaria del Satélite Quetzal-2]
#let ano-entrega   = "2026"
#let nombre-asesor = "Ing. Kuk Ho Chung"

#let nombre-primer-examinador   = "MSc. Carlos Esquit"
#let nombre-segundo-examinador  = "Ing. Luis Pedro Montenegro"
#let ano-aprobacion = "2026"

// Ruta de la imagen de portada (debe existir en el proyecto con suficiente
// resolución para cubrir el área designada).
#let imagen-portada = "./images/portadacit.jpg"
#let logo-portada = "./images/logoUVGblanco.jpg"
#let fondo-logo-portada = "./images/fondologo.png"

// ==============================================================================
// 1. OPCIONES ADICIONALES / INTERRUPTORES DE CAPÍTULOS
// ==============================================================================
// Equivalente a los \ifdefined\CAPxxx de la plantilla original: poner en
// `false` cualquiera de estas variables omite esa sección del documento.

#let incluir-portada         = true
#let incluir-caratula        = true
#let incluir-firmas          = true
#let incluir-indice          = true
#let incluir-figuras         = true
#let incluir-cuadros         = true
#let incluir-resumen         = true
#let incluir-abstract        = true
#let incluir-prefacio        = true
#let incluir-introduccion    = true
#let incluir-antecedentes    = true
#let incluir-justificacion   = true
#let incluir-objetivos       = true
#let incluir-alcance         = true
#let incluir-marco-teorico   = true
#let incluir-conclusiones    = true
#let incluir-recomendaciones = true
#let incluir-bibliografia    = true
#let incluir-anexos          = true
#let incluir-glosario        = true

// Modo impresión (equivalente a \printver): oculta la portada a color y
// duplica la carátula para encuadernación a doble cara.
#let modo-impresion = false

// Formato UVG clásico para capítulos y secciones (numeración romana en
// capítulos, letras en secciones, etc.). Equivalente a \capsecuvg.
#let formato-uvg-capitulos = false

// ==============================================================================
// 2. PAQUETES Y COMANDOS DEL USUARIO
// ==============================================================================
// Aquí el usuario puede definir sus propias funciones auxiliares, tal como
// en 2-paquetes_y_comandos_usuario.tex. Se deja vacío por defecto.


// ==============================================================================
// DEFINICIONES GENERALES DE LA PLANTILLA
// ==============================================================================

#let color-uvg-verde = rgb(17, 71, 52)

// ---- Glosario --------------------------------------------------------------
// Equivalente al paquete `glossaries`: se define un diccionario de
// entradas y funciones #gls / #Gls para insertarlas en el texto.
#let glosario = (
  latex: (
    nombre: "latex",
    descripcion: "Es un lenguaje de marcado adecuado especialmente para la creación de documentos científicos",
  ),
  formula: (
    nombre: "fórmula",
    descripcion: "Una expresión matemática",
  ),
)

#let gls(clave) = glosario.at(clave).nombre
#let Gls(clave) = {
  let n = glosario.at(clave).nombre
  upper(n.at(0)) + n.slice(1)
}

// ---- Bibliografía (estilo IEEE, numerada) ----------------------------------
// Equivalente a biblatex con backend=biber y style=ieee. Como no se usa un
// motor de bibliografía externo, las referencias se numeran manualmente en
// el orden en que se definen y se citan con #cite-ieee(n).
#let bibliografia-entradas = (
  (
    llave: "hoover2010bio",
    texto: [A. M. Hoover, S. Burden, X.-Y. Fu, S. S. Sastry, y R. S. Fearing, "Bio-inspired design and dynamic maneuverability of a minimally actuated six-legged robot," en _Biomedical Robotics and Biomechatronics (BioRob), 2010 3rd IEEE RAS and EMBS International Conference on_, IEEE, 2010, pp. 869–876.],
  ),
  (
    llave: "park2014design",
    texto: [Y.-L. Park, B. Chen, N. O. Pérez-Arancibia, D. Young, L. Stirling, R. J. Wood, E. C. Goldfield, y R. Nagpal, "Design and control of a bio-inspired soft wearable robotic device for ankle–foot rehabilitation," _Bioinspiration & Biomimetics_, vol. 9, no. 1, p. 016007, 2014.],
  ),
)

#let indice-bib(llave) = {
  bibliografia-entradas.position(e => e.llave == llave) + 1
}
#let cite-ieee(llave) = [[#indice-bib(llave)]]

// ---- Formato de párrafo por defecto ----------------------------------------
// Equivalente a \defaultparformat: separación entre párrafos en lugar de
// sangría, tal como en la plantilla original cuando \parpordefecto está
// definido.
#set par(justify: true, first-line-indent: 0em, leading: 0.65em)
#show par: set par(spacing: 1.4em)

// ==============================================================================
// MÁRGENES Y FORMATO GENERAL DEL DOCUMENTO
// ==============================================================================

#set text(lang: "es", size: 11pt, font: "New Computer Modern")

#set page(
  paper: "us-letter",
  margin: (top: 1in, left: 1.5in, right: 1in, bottom: 1in),
  numbering: "1",
)

// Numeración independiente por capítulo desactivada (equivalente a
// \counterwithout{figure}{chapter}, etc.): figuras, cuadros y ecuaciones se
// numeran de forma corrida en todo el documento.
#set figure(numbering: "1")
#set math.equation(numbering: "(1)")

// En español "de España" (spanish, no spanish-mexico) las tablas se
// llaman "Cuadro" en las leyendas, tal como indicaba el comentario del
// z-main.tex original.
#show figure.where(kind: table): set figure(supplement: "Cuadro")
#show figure.where(kind: image): set figure(supplement: "Figura")

// Estilo de encabezados / "capítulos" -----------------------------------------
// Los capítulos son encabezados de nivel 1; se estiliza para imitar el
// aspecto de fncychap (Sonny): número grande en verde UVG con una regla.
#set heading(numbering: "1.1")

#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  v(1.5em)
  if it.numbering != none and not it.body.text.starts-with("Capítulo") {
    let num = counter(heading).get().at(0)
    block[
      #text(size: 42pt, weight: "bold", fill: color-uvg-verde)[#numbering("I", num)]
      #v(-0.3em)
      #line(length: 100%, stroke: 1.2pt + color-uvg-verde)
      #v(0.4em)
      #text(size: 22pt, weight: "bold")[#it.body]
    ]
  } else {
    text(size: 22pt, weight: "bold")[#it.body]
  }
  v(1em)
}

#show heading.where(level: 2): it => {
  v(1em)
  text(size: 15pt, weight: "bold")[#it.body]
  v(0.5em)
}

#show heading.where(level: 3): it => {
  v(0.8em)
  text(size: 13pt, weight: "bold", style: "italic")[#it.body]
  v(0.4em)
}

#let blankpage() = {
  pagebreak()
  [#metadata("") ]
  pagebreak()
}

#let calc-margin(margin, shape) = if margin == auto {
  2.5 / 21 * calc.min(..shape)
} else {
  margin
}

// ==============================================================================
// CUERPO DEL TRABAJO
// ==============================================================================

// ------------------------------------------------------------------------------
// PORTADA
// ------------------------------------------------------------------------------
// En modo impresión, la portada a color se omite (equivalente a
// \ifdefined\printver \let\CAPportada\undefined \fi).
#if incluir-portada and not modo-impresion [
  #page(
    margin: (left: 3cm, right: 3cm, top: 1in, bottom: 0in),
    fill: color-uvg-verde,
    numbering: none,
  )[
    #set text(fill: white)
    #line(length: 100%, stroke: 1pt + white)
    #v(0.1in)
    #text(size: 30pt, weight: "bold")[#titulo-tesis]
    #v(0.3em)
    #line(length: 100%, stroke: 1pt + white)
    #v(0.3em)
    #text(size: 20pt)[#nombre-estudiante]

    #v(1fr)

    // Imagen de portada + logos institucionales (reemplazar por los
    // archivos reales del proyecto, p. ej. con #image(imagen-portada)).
    #context move(
      dx: -3cm,
      block(
        height: 12cm,
        width: page.width,
        clip: true
      )[
        #image(width: 100%, height: 100%, imagen-portada)
        #image(width: 100%, height: 100%, logo-portada)
      ]
    )

    #context place(
      bottom+right,
      dy: -3cm,
      dx: 3cm,
      block(
        height: 2cm,
        width: 10cm,
        clip: true
      )[
        #image(width: 100%, height: 100%, fondo-logo-portada)
      ]
    )
    #context place(
      bottom+right,
      dy: -3cm,
      dx: 3cm,
      block(
        height: 2cm,
        width: 10cm,
        // width: page.width,
        clip: true
      )[
        #image(width: 100%, height: 100%, logo-portada)
      ]
    )
  ]
]

// ------------------------------------------------------------------------------
// PRIMERAS PÁGINAS (Carátula + hojas de guarda)
// ------------------------------------------------------------------------------
#if incluir-caratula [
  #let pagina-caratula() = {
    page(numbering: "i")[
      #set text(fill: black)
      #align(center)[
        #text(size: 18pt)[UNIVERSIDAD DEL VALLE DE GUATEMALA] \
        #text(size: 18pt)[Facultad de #uvg-facultad]
        #v(0.75cm)
      ]

      #v(0.5in)
      #align(center)[
        #image("./images/escudoUVGnegro.jpg")
        // #box(width: 5.5cm, height: 5.5cm, stroke: 0.5pt + black)[
        //   #align(center + horizon)[#text(size: 8pt)[Escudo UVG\ (./images/escudoUVGnegro.jpg)]]
        // ]
      ]
      #v(0.5in)

      #align(center)[
        #text(size: 15pt, weight: "bold")[#titulo-tesis]
        #v(1fr)
        #text(size: 14pt)[
          Trabajo de graduación presentado por #nombre-estudiante
          para optar al grado académico de Licenciado en #uvg-carrera
        ]
        #v(1fr)
        #text(size: 12pt)[Guatemala, octubre]
        #v(1em)
        #ano-entrega
      ]
    ]
  }

  #counter(page).update(1)
  #pagina-caratula()

  #if modo-impresion [
    #blankpage()
    #counter(page).update(1)
    #pagina-caratula()
  ]
]

// ------------------------------------------------------------------------------
// HOJA DE FIRMAS
// ------------------------------------------------------------------------------
#if incluir-firmas [
  #page(numbering: none)[
    #v(0.5in)
    #text(size: 12pt)[Vo.Bo.:]
    #v(1cm)
    #align(center)[
      (f) #box(width: 4in, stroke: (bottom: 0.5pt)) \
      #nombre-asesor
    ]
    #v(1in)

    Tribunal Examinador:
    #v(1cm)
    #align(center)[
      (f) #box(width: 4in, stroke: (bottom: 0.5pt)) \
      #nombre-asesor
      #v(1in)
      (f) #box(width: 4in, stroke: (bottom: 0.5pt)) \
      #nombre-primer-examinador
      #v(1in)
      (f) #box(width: 4in, stroke: (bottom: 0.5pt)) \
      #nombre-segundo-examinador
    ]
    #v(1in)

    Fecha de aprobación: Guatemala, #box(width: 0.5in, stroke: (bottom: 0.5pt)) de #box(width: 1in, stroke: (bottom: 0.5pt)) de #ano-aprobacion.
  ]
]

// ==============================================================================
// CONTENIDO DEL TRABAJO
// ==============================================================================

// ------------------------------------------------------------------------------
// PREFACIO
// ------------------------------------------------------------------------------
#if incluir-prefacio [
  #heading(level: 1, numbering: none)[Prefacio]

  // --- a-prefacio.tex ---
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vitae eleifend ipsum, ut mattis nunc. Pellentesque ac hendrerit lacus. Cras sollicitudin eget sem nec luctus. Vivamus aliquet lorem id elit venenatis pellentesque. Nam id orci iaculis, rutrum ipsum vel, porttitor magna. Etiam molestie vel elit sed suscipit. Proin dui risus, scelerisque porttitor cursus ac, tempor eget turpis. Aliquam ultricies congue ligula ac ornare. Duis id purus eu ex pharetra feugiat. Vivamus ac orci arcu. Nulla id diam quis erat rhoncus hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed vulputate, metus vel efficitur fringilla, orci ex ultricies augue, sit amet rhoncus ex purus ut massa. Nam pharetra ipsum consequat est blandit, sed commodo nunc scelerisque. Maecenas ut suscipit libero. Sed vel euismod tellus.

  Proin elit tellus, finibus et metus et, vestibulum ullamcorper est. Nulla viverra nisl id libero sodales, a porttitor est congue. Maecenas semper, felis ut rhoncus cursus, leo magna convallis ligula, at vehicula neque quam at ipsum. Integer commodo mattis eros sit amet tristique. Cras eu maximus arcu. Morbi condimentum dignissim enim non hendrerit. Sed molestie erat sit amet porttitor sagittis. Maecenas porttitor tincidunt erat, ac lacinia lacus sodales faucibus. Integer nec laoreet massa. Proin a arcu lorem. Donec at tincidunt arcu, et sodales neque. Morbi rhoncus, ligula porta lobortis faucibus, magna diam aliquet felis, nec ultrices metus turpis et libero. Integer efficitur erat dolor, quis iaculis metus dignissim eu.
]

// ------------------------------------------------------------------------------
// ÍNDICE GENERAL
// ------------------------------------------------------------------------------
#if incluir-indice [
  #pagebreak()
  #heading(level: 1, numbering: none, outlined: false)[Índice]
  #outline(title: none, indent: auto)
]

// ------------------------------------------------------------------------------
// LISTADO DE FIGURAS
// ------------------------------------------------------------------------------
#if incluir-figuras [
  #pagebreak()
  #heading(level: 1, numbering: none, outlined: false)[Lista de figuras]
  #outline(title: none, target: figure.where(kind: image))
]

// ------------------------------------------------------------------------------
// LISTADO DE CUADROS
// ------------------------------------------------------------------------------
#if incluir-cuadros [
  #pagebreak()
  #heading(level: 1, numbering: none, outlined: false)[Lista de cuadros]
  #outline(title: none, target: figure.where(kind: table))
]

// ------------------------------------------------------------------------------
// RESUMEN
// ------------------------------------------------------------------------------
#if incluir-resumen [
  #heading(level: 1, numbering: none)[Resumen]

  // --- b-resumen.tex ---
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vitae eleifend ipsum, ut mattis nunc. Pellentesque ac hendrerit lacus. Cras sollicitudin eget sem nec luctus. Vivamus aliquet lorem id elit venenatis pellentesque. Nam id orci iaculis, rutrum ipsum vel, porttitor magna. Etiam molestie vel elit sed suscipit. Proin dui risus, scelerisque porttitor cursus ac, tempor eget turpis. Aliquam ultricies congue ligula ac ornare. Duis id purus eu ex pharetra feugiat. Vivamus ac orci arcu. Nulla id diam quis erat rhoncus hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed vulputate, metus vel efficitur fringilla, orci ex ultricies augue, sit amet rhoncus ex purus ut massa. Nam pharetra ipsum consequat est blandit, sed commodo nunc scelerisque. Maecenas ut suscipit libero. Sed vel euismod tellus.

  Proin elit tellus, finibus et metus et, vestibulum ullamcorper est. Nulla viverra nisl id libero sodales, a porttitor est congue. Maecenas semper, felis ut rhoncus cursus, leo magna convallis ligula, at vehicula neque quam at ipsum. Integer commodo mattis eros sit amet tristique. Cras eu maximus arcu. Morbi condimentum dignissim enim non hendrerit. Sed molestie erat sit amet porttitor sagittis. Maecenas porttitor tincidunt erat, ac lacinia lacus sodales faucibus. Integer nec laoreet massa. Proin a arcu lorem. Donec at tincidunt arcu, et sodales neque. Morbi rhoncus, ligula porta lobortis faucibus, magna diam aliquet felis, nec ultrices metus turpis et libero. Integer efficitur erat dolor, quis iaculis metus dignissim eu.
]

// ------------------------------------------------------------------------------
// ABSTRACT
// ------------------------------------------------------------------------------
#if incluir-abstract [
  #heading(level: 1, numbering: none)[Abstract]

  // --- c-abstract.tex ---
  #set text(lang: "en")
  This is an abstract of the study developed under the
  #set text(lang: "es")
]

// ------------------------------------------------------------------------------
// INTRODUCCIÓN
// ------------------------------------------------------------------------------
#if incluir-introduccion [
  #pagebreak()
  #counter(page).update(1)
  #set page(numbering: "1")
  #counter(heading).update(0)

  = Introducción

  // --- d-introduccion.tex ---
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eget consequat risus. Praesent a quam lacinia, consequat eros id, auctor tellus. Phasellus a dapibus arcu, vitae luctus leo. Aliquam erat volutpat. Suspendisse ac velit quam. Nullam risus nibh, lobortis vehicula elit non, pellentesque volutpat odio. Donec feugiat porta sapien gravida interdum. Cras odio nunc, lobortis sed pellentesque imperdiet, facilisis eu quam. Praesent pharetra, orci at tincidunt lacinia, neque nulla ornare lacus, ut malesuada elit risus non mi. Fusce pellentesque vitae sapien sed mollis. Curabitur viverra at nulla vitae porta. In et mauris lorem.

  Vestibulum faucibus fringilla justo, eget facilisis elit convallis sit amet. Morbi nisi metus, hendrerit quis pellentesque non, faucibus at leo. Proin consectetur, est vel facilisis facilisis, arcu felis vestibulum quam, et fringilla metus neque at enim. Nunc justo mauris, egestas quis maximus eget, viverra vehicula nunc. Fusce eu nulla elementum, condimentum diam at, aliquam leo. Nullam sed sodales enim, eu imperdiet risus. Aliquam ornare augue leo, fringilla mattis nunc facilisis eget. Nam faucibus, libero a aliquet fermentum, magna arcu ultrices lacus, a placerat tortor turpis ut purus.

  Integer eget ligula non metus egestas rutrum sit amet ut tellus. Aliquam vel convallis est, eu sodales leo. Proin consequat nisi at nunc malesuada gravida. Aliquam erat volutpat. Aliquam finibus interdum dignissim. Etiam feugiat hendrerit nisl, hendrerit feugiat ex malesuada in. Cras tempus eget arcu vitae congue. Ut non tristique mauris. Vivamus in mattis ipsum. Cras bibendum, enim bibendum commodo accumsan, ligula nulla porttitor ex, et pharetra eros nisl eget ex. Morbi at semper arcu. Curabitur massa sem, maximus id metus ut, molestie tempus quam. Vivamus dictum nunc vitae elit malesuada convallis. Donec ac semper turpis, non scelerisque justo. In congue risus id vulputate gravida. Nam ut mattis sapien.
]

// ------------------------------------------------------------------------------
// ANTECEDENTES
// ------------------------------------------------------------------------------
#if incluir-antecedentes [
  = Antecedentes

  // --- e-antecedentes.tex ---
  Puede encontrarse un trabajo similar en #cite-ieee("hoover2010bio") o bien #cite-ieee("park2014design").
]

// ------------------------------------------------------------------------------
// JUSTIFICACIÓN
// ------------------------------------------------------------------------------
#if incluir-justificacion [
  = Justificación

  // --- f-justificacion.tex ---
  hgjhjjhvjvhgvjhgvjhg

  #figure(
    table(
      columns: 5,
      stroke: 0.5pt,
      [12], [$3.2$], [$3.43$], [23], [13],
      [aasdasdd], [asd], [ssdssa], [ssdas], [asdasda],
      [], [], [], [], [],
      [], [], [], [], [],
    ),
    caption: [Pruebas preliminares. Este cuadro corresponde a las pruebas realizadas durante blabla],
  ) <cuadro-pritabla>
]

// ------------------------------------------------------------------------------
// OBJETIVOS
// ------------------------------------------------------------------------------
#if incluir-objetivos [
  = Objetivos

  // --- g-objetivos.tex ---
  == Objetivo general
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent eu lectus tincidunt, malesuada lorem nec, accumsan ligula.

  == Objetivos específicos
  - Nulla ut ex ut mauris pretium elementum.
  - Suspendisse malesuada lectus nec nisi iaculis, in luctus turpis laoreet.
  - In efficitur nisl vitae justo interdum, vitae condimentum lectus maximus.
  - Morbi quis libero sit amet velit commodo tristique eu sed nisl.
]

// ------------------------------------------------------------------------------
// ALCANCE
// ------------------------------------------------------------------------------
#if incluir-alcance [
  = Alcance

  // --- h-alcance.tex ---
  Podemos usar #Gls("latex") para escribir de forma ordenada una #gls("formula") matemática.
]

// ------------------------------------------------------------------------------
// MARCO TEÓRICO
// ------------------------------------------------------------------------------
#if incluir-marco-teorico [
  = Marco teórico

  // --- i-marco_teorico.tex ---
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vestibulum, nisl in semper semper, urna ex vehicula enim, eu luctus est velit a est. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris et dui ipsum. Praesent tempus vestibulum augue eget venenatis. Curabitur sollicitudin erat vel leo finibus tincidunt. Nullam ullamcorper, risus eu varius venenatis, nibh ligula egestas ante, vel commodo ipsum ante ac enim. Sed iaculis pharetra magna. Duis sit amet augue vitae mi lobortis tristique. Suspendisse non euismod quam. Donec a tincidunt lacus. Aliquam metus quam, rutrum non libero vel, interdum molestie turpis.

  Maecenas enim ligula, placerat quis purus eu, pretium tempor justo. Pellentesque accumsan sem eget mattis scelerisque. Ut consectetur lorem dui, a efficitur lectus tincidunt id. Aliquam quis fermentum elit. Pellentesque facilisis semper sem, vitae ornare purus. Morbi ultricies, orci sit amet porta facilisis, ex justo varius elit, viverra euismod sapien enim vel justo. Sed felis mi, feugiat quis molestie ac, gravida sed nunc. Proin elementum, augue quis ultrices dictum, nisl magna pharetra magna, ut ullamcorper diam dolor in elit. In hac habitasse platea dictumst. Suspendisse hendrerit leo non ex ornare mattis. Fusce hendrerit imperdiet nisl in viverra. Proin non turpis ut sapien pulvinar aliquam eu aliquet turpis. Etiam commodo tellus nec ipsum sodales feugiat. Morbi vel pulvinar nibh, nec varius turpis.

  Donec a libero vel lacus tincidunt dapibus. Nullam et leo volutpat dui feugiat volutpat vel lacinia ante. Donec finibus risus at facilisis gravida. Cras efficitur felis elementum purus finibus ultricies. Nunc sit amet diam egestas, blandit mauris nec, gravida nisi. In a arcu eu nunc mattis dictum sed placerat arcu. Morbi sit amet venenatis lectus, vitae lobortis nisl. Pellentesque id mattis magna, et convallis leo. Maecenas ultricies hendrerit quam vel ornare. Pellentesque fermentum aliquet velit quis malesuada. Proin commodo, est ultrices rhoncus scelerisque, massa nulla congue tellus, ut porta ante ante vitae nisl. In pharetra quam et urna dictum scelerisque. Aliquam in metus velit. Phasellus aliquet velit molestie, tincidunt purus vestibulum, aliquet odio. Sed augue odio, scelerisque non mi et, pulvinar bibendum justo. Vestibulum sed hendrerit urna.

  Donec a lacus quis mi volutpat mollis ac ut lorem. Nulla porta venenatis faucibus. Fusce metus lectus, ullamcorper vel risus laoreet, consequat faucibus sapien. Donec vitae ultrices mauris, dignissim sodales eros. Integer hendrerit elementum ipsum a vestibulum. Vivamus in pretium orci. Fusce condimentum, nibh tempor sagittis laoreet, dui erat luctus neque, a ultrices arcu mauris eget massa. Duis quis ante metus. Interdum et malesuada fames ac ante ipsum primis in faucibus.

  Vestibulum laoreet tortor enim, nec tristique turpis dapibus id. Nam quis erat ac nibh imperdiet placerat et a sapien. Aliquam sollicitudin, leo a aliquam vestibulum, lectus eros maximus justo, eu tincidunt justo ipsum non risus. Curabitur ultrices mi vitae elit venenatis, vel semper orci consequat. Nulla ac mauris vitae orci tincidunt mattis. Mauris risus justo, luctus non diam in, dapibus scelerisque eros. Donec fringilla risus sit amet sapien tempus viverra. Quisque quis justo ut enim gravida mollis in vulputate libero. Maecenas auctor accumsan turpis, id dapibus odio aliquet sit amet. Sed feugiat libero eget facilisis finibus. Sed vitae nulla nec felis porta convallis a in purus. Integer finibus efficitur lorem at aliquet. Etiam venenatis velit non tempus porttitor.

  Suspendisse tincidunt a orci sed vehicula. Aenean ac mauris enim. Duis vitae fringilla augue. Mauris fringilla neque ac nunc aliquet porta. Praesent quis elit convallis, vehicula leo a, tincidunt leo. Curabitur vitae ligula non leo faucibus cursus sit amet nec ex. Proin mollis lectus in odio aliquet, eu tristique lacus aliquet. Aliquam auctor eget lorem quis porttitor. Duis sagittis eros ac diam ornare, id auctor elit cursus. Morbi vel dolor et odio laoreet ornare. Cras sit amet pretium neque. Mauris vestibulum ante sit amet eros rutrum eleifend ac a sapien. Nullam vitae convallis eros. Proin blandit a nulla nec hendrerit. Fusce ultrices, nibh in mattis consequat, nisi libero rutrum lacus, vitae vulputate lorem tellus vitae enim.

  Quisque feugiat felis diam. Maecenas elementum, neque ut ornare tristique, nulla sem semper diam, vel imperdiet purus arcu sit amet magna. Nullam tempus eleifend ultrices. Maecenas pharetra ac leo eget mattis. Donec suscipit arcu justo, ac finibus diam scelerisque sit amet. Nulla et porta urna. Donec vel ultrices lectus. Quisque id molestie tellus. Vivamus vitae elit sit amet ipsum tincidunt sodales eget eget tortor. Quisque vitae placerat ipsum. Donec malesuada ipsum a consectetur venenatis.

  Morbi pretium velit eu egestas vulputate. Curabitur vitae nulla porttitor, feugiat nisl eu, congue erat. Morbi id dapibus risus. Curabitur mattis massa ut faucibus fringilla. Sed non mauris felis. Curabitur mattis congue blandit. Pellentesque consectetur vehicula laoreet. Maecenas malesuada libero at dui viverra feugiat. Nullam luctus erat eu massa molestie molestie. Etiam mattis leo ut eleifend vehicula. Vivamus finibus convallis nulla eget finibus. Integer leo quam, rutrum in ultricies sed, accumsan eget enim. Sed sit amet turpis at mi aliquet tempor id sed felis.

  Ut egestas dui eget luctus convallis. Duis ut mauris sed mi consequat iaculis vitae porta neque. Sed ipsum dolor, malesuada ut posuere vel, varius vehicula elit. Duis arcu mi, maximus a purus ut, ultricies egestas urna. Nam mollis tempor risus, quis rutrum felis viverra at. Donec eros quam, malesuada vel tortor eu, dapibus faucibus risus. Phasellus vestibulum diam sit amet sem mattis, et commodo ante volutpat. Quisque aliquet tellus in ultrices ornare. Aenean ut sem sed enim elementum cursus.

  Fusce ultricies odio non lorem cursus, in porttitor diam egestas. Mauris vel dui suscipit, pretium ligula vestibulum, tempus ipsum. Proin hendrerit ligula at massa porta rutrum non a ante. Aliquam quis nisl a ex feugiat interdum ultricies ac eros. Nullam eget rhoncus est. Ut sed velit sed nunc consectetur rhoncus condimentum condimentum mi. Donec ut imperdiet erat. Suspendisse tempor vel lorem non placerat. Nulla quis molestie lorem, et laoreet velit. Phasellus pretium quam non turpis rutrum, vitae mollis ex blandit. Nulla a erat nulla. Aenean vitae blandit diam. Morbi magna lectus, facilisis ac consectetur eget, cursus ut ipsum. Nulla maximus purus velit, vel posuere tortor consectetur a. Vestibulum cursus malesuada urna ac laoreet.
]

// ------------------------------------------------------------------------------
// CAPÍTULOS
// ------------------------------------------------------------------------------
// --- j-capitulos.tex ---

= Derivación de la dinámica del mecanismo

== Dinámica de cuerpos rígidos

== Restricciones
=== Mecanismos de lazo cerrado
==== Mecanismo de cuatro barras

= Control del sistema mecánico

== La ecuación del manipulador

#figure(
  table(
    columns: 5,
    stroke: 0.5pt,
    [12], [$3.2$], [$3.43$], [23], [13],
    [aasdasdd], [asd], [ssdssa], [ssdas], [asdasda],
    [], [], [], [], [],
    [], [], [], [], [],
  ),
  caption: [Tabla de prueba. Esta es una breve descripción de la tabla anterior. Continuamos con la descripción de esta forma y se menciona que fue de elaboración propia.],
) <cuadro-tablaprueba>

Aquí seguimos escribiendo texto normalmente.

// ------------------------------------------------------------------------------
// CONCLUSIONES
// ------------------------------------------------------------------------------
#if incluir-conclusiones [
  = Conclusiones

  // --- k-conclusiones.tex (vacío en el original) ---
]

// ------------------------------------------------------------------------------
// RECOMENDACIONES
// ------------------------------------------------------------------------------
#if incluir-recomendaciones [
  = Recomendaciones

  // --- l-recomendaciones.tex (vacío en el original) ---
]

// ------------------------------------------------------------------------------
// BIBLIOGRAFÍA
// ------------------------------------------------------------------------------
#if incluir-bibliografia [
  #heading(level: 1, numbering: none)[Bibliografía]

  // --- m-bibliografia.bib, estilo IEEE ---
  #for (i, entrada) in bibliografia-entradas.enumerate() [
    #block(spacing: 0.8em)[
      \[#(i + 1)\] #entrada.texto
    ]
  ]
]

// ------------------------------------------------------------------------------
// ANEXOS
// ------------------------------------------------------------------------------
#if incluir-anexos [
  = Anexos

  // --- n-anexos.tex ---
  == Planos de construcción
]

// ------------------------------------------------------------------------------
// GLOSARIO
// ------------------------------------------------------------------------------
#if incluir-glosario [
  #heading(level: 1, numbering: none)[Glosario]

  // --- o-glosario.tex ---
  #for (clave, entrada) in glosario [
    #block(spacing: 0.8em)[
      *#(upper(entrada.nombre.at(0)) + entrada.nombre.slice(1))* \
      #entrada.descripcion
    ]
  ]
]
