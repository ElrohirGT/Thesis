#import "@preview/merman:0.2.0": mermaid-figure

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
#let formato-uvg-capitulos = true

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
  El Quetzal-2 es un nanosatélite CubeSat 2U desarrollado como proyecto académico por estudiantes y _staff_ de la Universidad del Valle de Guatemala el cual pone a prueba una _On-Board Computer_ (OBC) diseñada localmente que ejecuta una inteligencia artificial capaz de identificar nubes. Este nanosatélite cuenta con una computadora a bordo compuesta de por dos unidades de procesamiento, una OBC principal basada en hardware comercial de GomSpace y otra OBC secundaria desarrollada localmente utilizando Portentas H7 de Arduino.

  Las OBC son sistemas vitales dentro de una misión espacial puesto que gestionan todos los subsistemas del satélite así como la comunicación entre estos. Este proyecto se centra en las bases de esta OBC local a nivel de _software_, sentando las bases para los distintos modos de operación que necesita la misión, la toma de fotografías y la interoperabilidad entre las dos unidades de procesamiento que componen la OBC completa.

  El impacto de esta OBC desarrollada localmente representa un gran punto de inicio para próximas misiones espaciales, bajando aún más la barrera económica de entrada para desarrollar misiones espaciales con respecto a soluciones _of-the-shelf_, puesto que demuestra que no es necesario el uso de _hardware_ altamente costoso con muchas más protecciones para llevar a cabo una misión exitosa.
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
  El Quetzal-2 es un proyecto académico desarrollado por estudiantes y personal de la Universidad del Valle de Guatemala la cual pone a prueba una computadora a bordo (OBC por sus siglas en inglés) diseñada en UVG capaz de ejecutar un modelo de inteligencia artificial para identificar nubes en imágenes satelitales @quetzal_2. Este proyecto es importante no solo porque representa un avance tecnológico en Guatemala, sino también por su impacto dentro de la juventud del país, inspirando a futuros científicos, ingenieros e innovadores @quetzal_1.

  La misión espacial es un CubeSat 2U, 10x20x10cm y con un peso máximo de 4kg @cubesat_2022 y cuenta con 4 objetivos específicos que busca completar, llamadas cargas útiles (_Payloads_ en inglés). Para este proyecto nos interesa específicamente el _inflight software_ de la OBC secundaria de Quetzal-2 y su interacción con _Payload MILO_, el subsistema encargado del reconocimiento de nubosidad y la toma de fotografías en el espacio @quetzal_2. Es importante notar que estos 4 objetivos de misión son independientes de los 3 objetivos específicos de este trabajo profesional detallados en la sección de objetivos.

  Las OBCs cumplen un papel clave dentro de los subsistemas del satélite puesto que son las encargadas de manejar todas las tareas, intercambio de información entre módulos y la colecta de información sobre los demás subsistemas (_housekeeping_) antes de la conexión con la estación en tierra @lwabanji_wilkinson_biermann_bellville_2013.

  Algunos de los subsistemas que debe manejar una OBC son:
  - Un sistema de poder (EPS por sus siglas en inglés).
  - Un sistema que determina la altidud (ADCS por sus siglas en inglés).
  - Un sistema de comunicación utilizando radiofrecuencias.
  - Una o más cargas útiles, por ejemplo una cámara o transmisor de señales junto con su controlador.

  La inicialización, intercomunicación y gestión de todos estos subsistemas recae sobre la OBC @akhtar_2012. Debido a las altas limitaciones energéticas en satélites de esta escala se debe tener especial cuidado con el presupuesto de energía que se le puede brindar a cada uno de los subsistemas. De esta necesidad nacen los modos de operación, los cuáles restringen las funcionalidades del satélite según la tarea para la que se quiere que se especialice en ese momento.

  Este trabajo profesional busca desarrollar un sistema de _software_ para la OBC diseñada localmente (_in-house_) capaz de operar la carga útil MILO, gestionar modos de operación y ejecutar un mecanismo de _handover_ con la computadora principal, validado en un entorno controlado terrestre. Para el desarrollo de este sistema se utiliza una metodología propia del laboratorio espacial UVG, basada en la metodología de ingeniería de sistemas de la NASA @nasa_systems_engineering.
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
  La misión espacial Quetzal-2 al ser una misión académica y no un proyecto de gobierno o una multinacional como Tesla, cuenta con recursos económicos relativamente limitados. Esto genera una necesidad real de reducir costos en donde sea posible, por lo tanto, un _inflight software_ diseñado localmente, adaptado a las necesidades específicas de la misión pero reutilizable en misiones futuras y además es capaz de ejecutarse dentro de componentes más baratos resulta atractivo, dando origen a este proyecto.

  En cuanto a las tecnologías a utilizar, las OBCs dependen en gran medida del microcontrolador seleccionado para su misión @bheema_rajulu_sankar_dasiga_iyer_2014. En el Quetzal-2 se utiliza una pareja de PortentasH7 Lite para la OBC secundaria, éstas cuentan con dos procesadores ARM diseñados por el proveedor STM32 @arduino_2026. Por lo tanto, nuestras opciones se encuentran limitadas a lo que este proveedor pueda ofrecer.

  Según la literatura actual, el uso de _Real Time Operating Systems_ (RTOS por sus siglas en inglés) representa una práctica común para escribir sistemas complejos en el mundo del _embedded software_, incluyendo en misiones espaciales como el STUDSAT-2 @bheema_rajulu_sankar_dasiga_iyer_2014. Para este proyecto se utiliza FreeRTOS debido a su soporte para PortentaH7 y su comunidad de desarrolladores, la cual es grande y activa @freertos_2010.
  Debido a que FreeRTOS expone un API oficial en C para su desarrollo @freertos_2010 y a los bajos márgenes de presupuesto de energía con los que se cuenta en misiones de escalas similares a Quetzal-2 @lwabanji_wilkinson_biermann_bellville_2013, el lenguaje que se utiliza para el desarrollo del _inflight software_ es C.

]

// ------------------------------------------------------------------------------
// OBJETIVOS
// ------------------------------------------------------------------------------
#if incluir-objetivos [
  = Objetivos

  // --- g-objetivos.tex ---
  == Objetivo general
  Desarrollar localmente las bases de un _inflight software_ para la _On Board Computer_ (OBC) secundaria diseñada localmente para el Quetzal-2, capaz de operar la carga útil MILO, gestionar modos de operación y ejecutar un mecanismo de _handover_ con la OBC principal, validado en un entorno controlado terrestre.

  == Objetivos específicos  
  + Integrar el módulo de cámara al sistema de _software_ de la OBC secundaria, logrando la captura de la imagen y transmisión de informaciones de la imagen desde la carga útil MILO hacia la OBC secundaria desarrollada localmente. 
  + Desarrollar el sistema base de gestión de modos de operación del _software_, implementando tres modos: Arranque, Toma de fotografía y Nominal preliminar.
  + Desarrollar un Producto Mínimo Viable (MVP) del sistema de _handover_ entre la OBC principal y la OBC secundaria diseñada localmente.

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
  = Marco Teórico

  // ```
  // Flow:
  // - Quetzal-2 y Quetzal-1
  // - CubeSat
  // - Subsistemas de un satélite
  // - OBC
  // - Comunicación RS485 e I2C
  // - Handover Architecture
  // - RTOS
  // - Arquitecturas de Software
  // - Testable Software
  // - Best Practices
  // - Ambiente de Desarrollo de Software
  //   - Editores de Código
  //   - Linux
  // ```

  == Quetzal 1 y 2
  El Quetzal-2 es el segundo proyecto aeroespacial de la Universidad del Valle de Guatemala, el cual es desarrollado por estudiantes y personal académico de la institución @quetzal_2.

  Su predecesor, el Quetzal-1, fue el primer satélite guatemalteco, cuya misión buscaba probar un sensor multiespectral para adquirir información remota para conservar recursos naturales de forma independiente @quetzal_1. El trabajo realizado para Quetzal-1 representa las bases para el nuevo y mejorado Quetzal-2, el cual busca poner a prueba una computadora a bordo (OBC por sus siglas en inglés) diseñada localmente, capaz de ejecutar un modelo de inteligencia artificial para identificar nubes en imágenes satelitales. Así como validará un subsistema para desorbitación responsable y permitirá transmitir datos satelitales en tiempo real a centros educativos del país @quetzal_2.

  Debido a la complejidad de la misión, Quetzal-2 es un CubeSat 2U, el doble de tamaño que su predecesor @quetzal_2. CubeSat es un estándar que inició en 1999, desarrollado por el profesor Jordi Puig-Sauri y Bob Twiggs. La intención de este estándar es reducir costos y tiempos de desarrollo, al mismo tiempo que incrementa la accesibilidad al espacio. Todos los satélites CubeSat adoptan un tamaño y peso medido en unidades ('U'), la medida que define el estándar. Un CubeSat de 1U (como el Quetzal-1 @quetzal_1) es un centímetro de 10cm de lado con una masa de hasta 2kg @cubesat_2022.

  == Computadora a Bordo (OBC)

  Esta clase de misiones espaciales se componen de varios subsistemas comunicándose entre sí para llevar a cabo el objetivo de la misión, de esta realidad surge la necesidad de una OBC, la cual se encarga de manejar y dirigir de forma autónoma estas comunicaciones, así como la interacción con la estación de control terrena (GCS por sus siglas en inglés) @lwabanji_wilkinson_biermann_bellville_2013.

  Según Gildeh @gildeh_2003, un CubSat típico se compone de varios subsistemas, como mínimo:
  - Sistema de poder (EPS por sus siglas en inglés), cargado por paneles solares.
  - Una carga útil (comúnmente llamada _payload_), el/los objetivo(s) de la misión, generalmente una cámara o similar.
  - Sistema de control y determinación de altura (ADCS por sus siglas en inglés).
  - Sistema de comunicación por radiofrecuencia.
  - Una OBC que permite la comunicación entre todos estos subsistemas.

  En el caso de Quetzal-2, la OBC realmente se divide en 2, una principal y una secundaria. La OBC principal, es la misma que se utilizó en Quetzal-1, la Gomspace Nanomind A3200 @ayerdi_2023, esta computadora fue especialmente diseñada para misiones espaciales, como sensores integrados para control de altitud y protecciones especiales contra radiación @gomspace_2026.

  La OBC secundaria, la cual es diseñada localmente, está compuesta por una pareja de Portentas H7 Lite, ambas cuentan con dos cores de procesamiento y 8MB de SDRAM @arduino_2026. La OBC secundaria, al igual que la primaria, necesita gestionar la comunicación entre los distintos subsistemas, por lo que se le considera el cerebro del satélite @lwabanji_wilkinson_biermann_bellville_2013 y según @stras2003design necesita cumplir con las siguientes tareas:
  - Grabar y guardar la telemetría del satélite, incluyendo la data de las _payloads_ y su transmisión hacia la GCS.
  - Cifrado y descifrado de los paquetes de datos enviados y recibidos de la GCS.
  - Monitoreo y gestión de subsistemas, incluso reiniciando los que sean necesarios.

  Generalmente, la OBC no se encarga de el manejo de energía, en su lugar un subsistema por aparte (el EPS) se encarga de apagar y reinciar sistemas dentro del satélite. Aunque sí hay casos en donde tal tarea se le atribuye a la OBC @hidayat_2010. La @obc_components muestra cómo se organizan los componentes de la OBC de Quetzal-2 así como la forma de comunicación con otros submódulos:

  #figure(
    image("./images/OBC_Diagram.png"),
    caption: [Diagrama de componentes de la OBC y sus protocolos de comunicación.]
  ) <obc_components>

  == Comunicación Serial: I2C y UART

  Existen varias interfaces seriales de comunicación que se pueden utilizar para la intercomunicación de microcontroladores, muchas aunque desarrolladas para una aplicación en específico se han vuelto universales, RS485 e I2C caen en esta categoría @hung2020flexible. Dentro del Quetzal-2 se utilizan estos dos protocolos para la comunicación interna entre sus subsistemas, RS485 es especialmente popular debido a que permite conectar múltiples puntos de control utilizando un bus serial, además de ser un protocolo de comunicación probado en producción por años lo que lo hace una opción segura cuanto menos @sastry2015building. Mientras que I2C facilita la comunicación entre microcontroladores utilizando un modelo de maestro esclavo, en donde solo el maestro puede iniciar la comunicación @carletti2007comunicacion.

  Dentro de Quetzal-2, los protocolos se utilizan para los siguientes propósitos:
  - RS485: Comunica la OBC primaria y secundaria con el resto de subsistemas del satélite, es decir: _Payload_ MILO, _ADCS_, _ADM_, etc.
  - I2C: Se reserva únicamente para la comunicación entre la OBC primaria y la OBC secundaria, siendo la OBC primaria la maestra y la OBC secundaria la esclava. Esta decisión es clave para el funcionamiento de la arquitectura de _handover_.

  == Protocolo de _Handover_

  El protocolo de _handover_ es un sistema interno de la OBC primaria, diseñado localmente, cuyo objetivo principal es trasladar el control del satélite de sí misma a la OBC secundaria de una forma segura y redundante a fallos. Quetzal-2 no es la única misión que ha integrado más de una OBC en su sistema de mando, SHEFEX III, una misión alemana del 2017 también usó dos OBCs para redundancia, sin embargo su estrategia nunca fue ceder control de una OBC a la otra sino tener un backup en caso alguna de la dos fallara @schwarz2014fault. Otro ejemplo es la arquitectura DHS propuesta en 2023 para misiones académicas como profesionales @soucaille2023high. Esta arquitectura en específico también se usó en el mismo año para otra misión espacial, la misión HERA, de la misma forma su principal objetivo era redundancia total, pero además buscaba autonomía operacional y alta capacidad de almacenamiento a bordo @Marcos_Valverde_Carretero_2023.

  Una descripción general del protocolo se puede ver en la @handover_sequence. En donde se tiene a los 3 actores principales: A3200 representando la computadora principal, Portenta H7, representando la portenta que está activa en ese momento y SAMD, representando a el módulo que se necesita para una tarea, por ejemplo MILO.

  #figure(
    image("./images/OBC_Routines.png"),
    caption: [Diagrama de secuencia del protocolo de _handover_ para un caso general.]
  ) <handover_sequence>

  En caso de fallos, el comando de `Handover abort` se enviará de forma automática por la OBC principal, además de que se tendrá un timer que permitirá la toma de control de parte de la OBC primaria en caso la secundaria deje de responder.

  La OBC diseñada localmente es desarrollada en un lenguaje a bajo nivel, particularmente C, debido a que es el lenguaje principal en el que el _driver_ a bajo nivel de STM32 es proveído, ofreciendo un mayor control sobre el uso de los recursos, casi tan granular como querramos @stmicroelectronics_2026. Debido a la complejidad del sistema interno que debe manejar la OBC para gestionar la comunicación entre todos los subsistemas del satélite, se necesita un sistema operativo @lwabanji_wilkinson_biermann_bellville_2013.

  == Sistemas Operativos

  Existen muchos tipos de sistemas operativos (OS por sus siglas en inglés), según su infraestructura interna podemos tener sistemas operativos monolíticos, por capas, microkernels, módulos o híbridos siendo alguna combinación entre ellos @operating_system_concepts_2018. Para propósitos del Quetzal-2, resulta de mayor importancia cómo el OS calendariza sus tareas que el cómo se compone internamente el sistema operativo como tal, ya que las misiones espaciales tienden a tener presupuestos muy ajustados tanto de memoria como procesamiento @lwabanji_wilkinson_biermann_bellville_2013. 

  Los sistemas operativos en tiempo real (RTOS por sus siglas en inglés) fueron creados justamente para los casos en donde se tienen requerimientos de tiempo rígidos @operating_system_concepts_2018 y por esta razón se evaluaron distintas alternativas de implementación de un RTOS. RODOS, un sistema operativo de código abierto desarrollado por Sergio Montenegro, con un énfasis en facilidad de uso, rendimiento y probado en aplicaciones espaciales reales @rodos; FreeRTOS, otro sistema operativo de código abierto, con una gran comunidad, excelente rendimiento y años de uso en producción @freertos_2010. Luego de unas pruebas de _porting_ de RODOS a STM32H7, la arquitectura de la Portenta H7 Lite, se decidió a utilizar FreeRTOS por su alta compatibilidad con este _hardware_.

  == Arquitectura de Software

  La arquitectura de software busca gestionar la comunicaciónn entre los componentes de software que conforman un sistema @pareja2019arquitectura. En este caso, sistema se referiría a la OBC diseñada localmente. Al ser una misión espacial, el acceso que tendremos al satélite es muy limitado, no podremos realizar parches de actualización de código por ejemplo. Por lo que tener la mayor garantía que podamos de que el sistema funciona y es resiliente a fallos es la prioridad más alta.

  La _National Aeronautics and Space Administration_ (NASA) es famosa por sus 10 reglas para desarrollar código crítico seguro:

  + *No usar recursión, saltos ni _goto statements_*. La justificación de la NASA es debido a que simplificar el flujo de ejecución de nuestro programa generalmente se traduce a mejor claridad del código, así como en una mejora considerable de análisis estático.
  + *Todos los ciclos deben tener un límite superior fijo*. Sin recursión, y con ciclos que siguen un límite fijo de iteraciones se previene en su totalidad rutinas que se ejecutan de forma indefinida. Esta regla no aplica para rutinas que deben ser forzosamente de terminación indeterminada, como la espera de nuevos comandos de la estación terrena (GCS por sus siglas en inglés).
  + *No alojar memoria dinámica luego de la inicialización*. La alojación de memoria dinámica impacta negativamente en el rendimiento del sistema, además de que tiene un comportamiento notablemente difícil de predecir con análisis estático. Esta regla fuerza al programador a usar memoria estática alojada al declarar variables en el stack, si se combina con las reglas anteriores el código termina siendo legible y sencillo, lo que es excelente para analizadores estáticos que buscan probar que un programa se comportará como esperamos.
  + *No más de 60 líneas de código por función*. Funciones extremadamente largas son una señal de código pobremente arquitecturizado.
  + *Cada función debe tener un promedio de dos _assertions_*. La NASA recomienda utilizar aserciones en el código para probar condiciones de ejecución tanto antes como después de correr una función. Una aserción siempre revisa una condición, y detiene el programa en caso de que la condición no se cumpla, son especialmente útiles si se combinan con pruebas unitarias.
  + *Declara todos los objetos de tipo data en el tamaño mínimo posible de _scope_*. Esta regla simplifica la depuración del código cuando ocurre una falla, puesto que es obvio que una variable que no se encuentra en el scope del código que falla no tiene ninguna relación con el error en sí. Por lo tanto queremos minimizar la cantidad de variables dentro del scope de cada rutina, limitando así, los lugares en donde se puede corromper estado y afectar en la ejecución de nuestro programa.
  + *Todos los parámetros de retorno deben ser revisados por la función que los llamó*. *Todas las funciones deben revisar la validez de los parámetros proveídos*. Las interfaces con las que interactuamos los programadores están plagadas de funciones que puede que funcionen como esperamos o no, generalmente tienen una forma de reportar un error. Si una función debe ejecutarse solamente cuando el valor de retorno de otra función es exitoso, entonces es indispensable que este valor de retorno se revise, ese es el corazón de esta regla.
  + *El uso del preprocesador de C debe estar limitado a inclusión de _header files_ y definiciones sencillas*. El preprocesador de C puede fácilmente ofuscar el código y confundir a analizadores estáticos, por lo que la NASA no recomienda su uso más allá de inclusiones sencillas.
  + *Solamente es permitido un nivel de referencia con punteros*. Según la NASA, los punteros son fácilmente usados de forma incorrecta, incluso por programadores experimentados, pueden hacer que seguir el flujo de control de un programa sea complicado y reestringen las capacidades que tienen los analizadores de código estático.
  + *Todo el código debe ser compilado desde el primer día de desarrollo con todas las alertas del compilador en la configuración más pedante. El código debe compilar sin advertencias*. Según la NASA, no hay ninguna excusa por la que una _warning_ debería ser ignorada, incluyendo los falsos positivos. El código debe ser reescrito para facilitar su análisis estático y no confundir a la herramienta @holzmann_2006.

  === Casos de estudio

  El espacio no es el único sector dentro del mundo del _software_ que necesita una resiliencia extraordinaria. Las bases de datos, son piezas de _software_ que deben funcionar incluso si el disco se corrompe, como es el caso de TigerBeetle @greef_2026. U otra base de datos venerada por su resiliencia a lo largo de los años, SQLite, con más de 1 billón de instancias en uso actualmente @software_should_work_2026.

  Aunque hechas para casos de uso muy distintos, ambas llegaron a la misma conclusión, la forma de garantizar resiliencia a fallos, incluso en ambientes hostiles, es utilizar el poder de la misma computadora para revisar tu código. No hablan de IA, sino de _fuzz testing_, _unit testing_ y otra gran variedad de _xxx testing_. No basta solo el análisis estático, hay que poder garantizar de forma automatizada que la solución funciona y es resiliente a fallos, no porque el _linter_ no encuentre errores, sino porque años de simulación que ocurren en horas o días en tiempo real lo respaldan @software_should_work_2026 @greef_2026.

  (me gustaría expandir mucho más en las reglas de la NASA y en estos dos casos de _software_ resiliente pero me quedé sin tiempo para seguir escribiendo perdón Gabriel :"v)

]

= Metodología

== Ambiente de Desarrollo

Para el desarrollo de las bases del _software_ de vuelo de la computadora a bordo (OBC por sus siglas en inglés) secundaria del Quetzal-2 se utilizó el sistema operativo libre #link("https://www.linux.org/pages/download/")[Linux]. Además se necesita:

+ Un editor de código. 
+ El manejador de paquetes #link("https://nixos.org/")[Nix] (versión 2.34.8) con #link("https://nixos.wiki/wiki/flakes")[Nix Flakes] habilitados.
+ El #link("https://www.st.com/en/development-tools/stm32cubeide")[STM32CubeIDE] (versión 2.2.0), para generar la configuración del hardware.
+ #link("https://openmv.io/pages/download")[OpenMV IDE], para interactuar con payload MILO.

El archivo `flake.nix` del repositorio (se encuentra en la @source_code) lista todas las dependencias que el proyecto necesita a detalle, sin embargo, una lista con las principales es la siguiente:

- gcc v15.2.0
- make v4.4.1
- bear v4.0.3

Los pasos para compilar el proyecto desde 0 se pueden encontrar en detalle en el README del repositorio (@source_code).

== Configuración del Hardware

La OBC secundaria se encuentra compuesta por 2 _PortentasH7 Lite_. Ambas se configuraron utilizando el STM32H7CubeIDE para autogenerar el código de configuración. Específicamente, la OBC secundaria utiliza 2 tipos de comunicación serial: I2C y UART. Se configuraron de la siguiente manera:

=== I2C

La OBC utiliza la comunicación I2C únicamente entre la computadora primaria y la secundaria diseñada localmente:

#figure(
  image("./images/InternalOBC.png", width: 60%),
  caption: [Comunicación I2C entre computadora primaria y secundaria.]
) <i2c_comms>

Para esta comunicación se utiliza el puerto I2C1 con la siguiente configuración:
```c
I2C_HandleTypeDef hi2c1;

void MX_I2C1_Init(void) {

  hi2c1.Instance = I2C1;
  hi2c1.Init.Timing = 0x10C0ECFF;
  hi2c1.Init.OwnAddress1 = (0x09 << 1); 
  hi2c1.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
  hi2c1.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
  hi2c1.Init.OwnAddress2 = 0;
  hi2c1.Init.OwnAddress2Masks = I2C_OA2_NOMASK;
  hi2c1.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
  hi2c1.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;
  if (HAL_I2C_Init(&hi2c1) != HAL_OK) {
    Error_Handler();
  }
  /** Configure Analogue filter
   */
  if (HAL_I2CEx_ConfigAnalogFilter(&hi2c1, I2C_ANALOGFILTER_ENABLE) != HAL_OK) {
    Error_Handler();
  }
  /** Configure Digital filter
   */
  if (HAL_I2CEx_ConfigDigitalFilter(&hi2c1, 0) != HAL_OK) {
    Error_Handler();
  }
}
```

=== UART

La comunicación UART se utiliza para la comunicación entre la OBC y los demás módulos del satélite, por ejemplo con ADCS, MILO, etc.

#figure(
  image("./images/OBCUART.png", width: 60%),
  caption: [Comunicación UART entre OBC y módulos del satélite.]
) <uart_comms>

Para la comunicación utilizando RS485, se utiliza un puerto en específico de UART: El UART4. Se inicializa de la siguiente manera:
```c
void MX_UART4_Init(void) {
  huart4.Instance = UART4;
  huart4.Init.BaudRate = 115200;
  huart4.Init.WordLength = UART_WORDLENGTH_8B;
  huart4.Init.StopBits = UART_STOPBITS_1;
  huart4.Init.Parity = UART_PARITY_NONE;
  huart4.Init.Mode = UART_MODE_TX_RX;
  huart4.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart4.Init.OverSampling = UART_OVERSAMPLING_16;
  huart4.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart4.Init.ClockPrescaler = UART_PRESCALER_DIV1;
  huart4.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  if (HAL_UART_Init(&huart4) != HAL_OK) {
    Error_Handler();
  }
  if (HAL_UARTEx_SetTxFifoThreshold(&huart4, UART_TXFIFO_THRESHOLD_1_8) !=
      HAL_OK) {
    Error_Handler();
  }
  if (HAL_UARTEx_SetRxFifoThreshold(&huart4, UART_RXFIFO_THRESHOLD_1_8) !=
      HAL_OK) {
    Error_Handler();
  }
  if (HAL_UARTEx_DisableFifoMode(&huart4) != HAL_OK) {
    Error_Handler();
  }
}
```

La OBC secundaria también utiliza un puerto UART para enviar _logs_ con información adicional que aumentan la observabilidad detrás de qué está pasando internamente dentro del sistema, los cuales se pueden leer leyendo el puerto UART6, configurado de la siguiente manera:
```c
void MX_USART6_UART_Init(void) {
  huart6.Instance = USART6;
  huart6.Init.BaudRate = 115200;
  huart6.Init.WordLength = UART_WORDLENGTH_8B;
  huart6.Init.StopBits = UART_STOPBITS_1;
  huart6.Init.Parity = UART_PARITY_NONE;
  huart6.Init.Mode = UART_MODE_TX_RX;
  huart6.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart6.Init.OverSampling = UART_OVERSAMPLING_16;
  huart6.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart6.Init.ClockPrescaler = UART_PRESCALER_DIV1;
  huart6.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  if (HAL_UART_Init(&huart6) != HAL_OK) {
    Error_Handler();
  }
  if (HAL_UARTEx_SetTxFifoThreshold(&huart6, UART_TXFIFO_THRESHOLD_1_8) !=
      HAL_OK) {
    Error_Handler();
  }
  if (HAL_UARTEx_SetRxFifoThreshold(&huart6, UART_RXFIFO_THRESHOLD_1_8) !=
      HAL_OK) {
    Error_Handler();
  }
  if (HAL_UARTEx_DisableFifoMode(&huart6) != HAL_OK) {
    Error_Handler();
  }
}
```

== OBC Secundaria Quetzal-2

La OBC secundaria se diseñó a nivel de _software_ para cumplir los siguientes objetivos, en orden de prioridad:

+ Fiabilidad
+ Seguridad
+ Rendimiento

La OBC secundaria se implementó como una máquina de estados finitos determinista, de esta forma podemos predecir no solo el rendimiento de memoria de la computadora secundaria, sino también su comportamiento. Algunos de los estados de la máquina finita se pueden apreciar en la @finite_state_machine.

#mermaid-figure("
flowchart LR
    GOM[fa:fa-microchip OBC Principal]-->|Inicia el Handover|Arr

    subgraph fa:fa-microchip OBC Secundaria
    Arr(fa:fa-diagram-project Arranque de Handover)-->|Inicialización de módulos|Nom(fa:fa-diagram-project Nominal)
    Nom-->|Comando: Toma de fotografía|MILO(fa:fa-diagram-project Payload MILO)
    MILO-->|Resultado de la fotografía|Nom

    Nom-->|Comando: Comunicación LORA|LORA(fa:fa-diagram-project Payload LORA)
    LORA-->|Fin del timeout|Nom

    Nom-->|Comando: ...|OTH(fa:fa-diagram-project Otros subsistemas...)
    OTH-->|Fin tarea|Nom

    end
    Nom-->|Fin Handover|GOM

    %% Legend
  subgraph legend
    direction LR
    Y --- |Microchip| Z
    Z --- |Estado| null
  end
  linkStyle 9,10 stroke:#0000,stroke-width:0px;

  classDef hide fill:#0000,stroke:#0000,stroke-width:0px,color:#0000;
  class legend,null hide;
  classDef hide-font color:#0000;
  class Y,Z hide-font;

  class Arr,Nom,MILO,LORA,OTH,Z state
  class GOM,Y microchip

  classDef microchip fill:lime
  classDef state fill:yellow
",
caption: [Máquina de Estados Finitos (incompleta) de la OBC secundaria del Quetzal-2. Elaboración propia.],
alt: "Máquina de Estados Finitos (incompleta) de la OBC secundaria del Quetzal-2. Elaboración propia.",
) <finite_state_machine>

Para mejorar el determinismo de esta máquina de estados, todas las taeas que necesitan comunicación con un sistema externo al _core_ de la OBC secundaria, por ejemplo interactuar con subsistemas, se realizaron por medio de interfaces. De esta forma se tiene una arquitectura como la descrita en la @hexagonal_arch.

#mermaid-figure("
flowchart LR
  core(Core OBC)-->rs485(Interfaz RS485)-->milo(Subsistema MILO)
  rs485-->adcs(Subsistema ADCS)
  rs485-->adm(Subsistema ADCS)

  core-->i2c(Interfaz I2C)-->gom(OBC Principal)

  core-->uart(Interfaz UART)-->debug(Debug logs)

    %% Legend
  subgraph legend
    direction LR
    Y --- |Interfaz Intermediaria| Z
    Z --- |Subsistema Interno| null
  end
  linkStyle 8,9 stroke:#0000,stroke-width:0px;

  classDef hide fill:#0000,stroke:#0000,stroke-width:0px,color:#0000;
  class legend,null hide;
  classDef hide-font color:#0000;
  class Y,Z hide-font;

  class milo,adcs,adm,gom,debug,Z subsystem
  class rs485,i2c,uart,Y interface

  classDef interface fill:lime
  classDef subsystem fill:yellow
",
caption: [Arquitectura de la OBC secundaria. Elaboración propia.],
alt: "Arquitectura de la OBC secundaria. Elaboración propia.",
) <hexagonal_arch>

Esta arquitectura de la @hexagonal_arch nos permitió varias bondades:
- Nos permitió intercambiar todos los subsistemas (en amarillo) por implementaciones que funcionen o fallen de formas predecibles.
- Se logró simular entradas y salidas de los distintos subsistemas a voluntad sin necesidad de conectar físicamente todo el sistema o que siquiera se encuentre desarrollado.
- Se automatizaron las pruebas de comportamiento de la OBC ante una gran variedad de entradas de los distintos submódulos.

= Resultados

#figure(
  image("./images/HandoverTest.jpeg"),
  caption: [Prueba del protocolo de handover corriendo localmente dentro de una misma computadora.]
) <laptop_test>

#figure(
  image("./images/HandoverLowQuality.jpeg", width: 60%),
  caption: [Prueba del protocolo de handover corriendo con hardware real entre la computadora primaria y secundaria. _Logs_ desde la perspectiva de la OBC secundaria.]
) <handover_test>

#figure(
  image("./images/RFReception.jpeg", width: 60%),
  caption: [_Logs_ de la prueba de handover desde la perspectiva de la A3200 (la imagen es placeholder no logré conseguir la correcta Gabriel jaja)]
) <command_reception>

#figure(
  image("./images/milo.jpeg", width: 60%),
  caption: [Fotografía tomada con la _Payload MILO_ durante la prueba de handover.]
) <milo_picture>

= Discusión de Resultados

Como se puede apreciar en la @laptop_test, se realiza el camino sin errores de una rutina de handover completa, desde que la OBC primaria solicita el traslado de poder, pasando por el inicio de la tarea de MILO en donde se toma la fotografía y finalizando con el comando de abortar de la OBC primaria.

Toda esa rutina se ejecutó dentro de un ambiente simulado en la computadora, y cada una de las respuestas y acciones que decidía tomar la OBC secundaria fue analizada por la prueba, solamente retornando éxito si todos los comandos recibidos y enviados seguían la especificación del protocolo interno. Es decir, la prueba revisó que luego de recibir el comando `BEGIN_HANDOVER` desde la computadora principal, la OBC secundaria respondiera con `BEGIN_HANDOVER_ACK`.

Nótese el cambio de estados dentro de la OBC secundaria que se puede apreciar en los _logs_, iniciando en `IDLE` para transicionar a `HANDOVER_IDLE` y finalmente a `IDLE` de nuevo. Estos son los estados principales de la OBC secundaria, mientras que el estado interno de la tarea es `MILO_UNSTARTED`. La combinación de estos dos estados (`IDLE`, `MILO_UNSTARTED`) representan el modo de operación de arranque dentro del Producto Mínimo Viable (MVP por sus siglas en inglés) de la OBC secundaria. Para luego transicionar al estado nominal (`HANDOVER_IDLE`, `MILO_UNSTARTED`), para finalmente llegar al estado de toma de fotografía (`HANDOVER_IDLE`, `MILO_BEGIN`). La @obc_states muestra en forma de diagrama estas transiciones:

#figure(
  image("./images/OBC_States.png", width: 80%),
  caption: [Estados de la OBC secundaria de estados finitos.]
) <obc_states>

Esta es la prueba principal que se implementó, pero gracias a la arquitectura hexagonal se tiene la posibilidad de implementar muchas más que prueben casos más extraños, o simplemente probar casos de error que permitan asegurar que la OBC fallará de una manera predecible cuando se cumplan ciertas condiciones.

El que la prueba mostrada en la @laptop_test tenga un resultado satisfactorio no significa que la OBC secundaria funcione, puesto que es un ambiente simulado dentro de la misma computadora. Por esto se realizaron pruebas con implementaciones reales de las interfaces, las cuales se pueden ver en la @handover_test y la @command_reception. En esta prueba se intentó solamente la comunicación entre los dos módulos de la OBC, primaria y secundaria. Como se puede ver en los _logs_, la comunicación fue satisfactoria y se logró llegar al último comando de aborto del protocolo de handover.

Finalmente, en la @milo_picture se puede apreciar la fotografía de una prueba final con todos los subsistemas conectados utilizando las implementaciones reales de las interfaces de comunicación. La imagen se encuentra borrosa debido a la configuración de la cámara, ya que se tenía en baja calidad para limitar la cantidad de espacio que cada fotografía consumía al ser almacenada y transmitida dentro del sistema. Para ese punto de las pruebas lo importante no era la calidad de las fotografías sino que el sistema pudiera tomarla de forma autónoma.

// ------------------------------------------------------------------------------
// CAPÍTULOS
// ------------------------------------------------------------------------------
// --- j-capitulos.tex ---

// = Derivación de la dinámica del mecanismo
//
// == Dinámica de cuerpos rígidos
//
// == Restricciones
// === Mecanismos de lazo cerrado
// ==== Mecanismo de cuatro barras
//
// = Control del sistema mecánico
//
// == La ecuación del manipulador
//
// #figure(
//   table(
//     columns: 5,
//     stroke: 0.5pt,
//     [12], [$3.2$], [$3.43$], [23], [13],
//     [aasdasdd], [asd], [ssdssa], [ssdas], [asdasda],
//     [], [], [], [], [],
//     [], [], [], [], [],
//   ),
//   caption: [Tabla de prueba. Esta es una breve descripción de la tabla anterior. Continuamos con la descripción de esta forma y se menciona que fue de elaboración propia.],
// ) <cuadro-tablaprueba>
//
// Aquí seguimos escribiendo texto normalmente.

// ------------------------------------------------------------------------------
// CONCLUSIONES
// ------------------------------------------------------------------------------
#if incluir-conclusiones [
  = Conclusiones

  + Se integró el módulo de cámara el sistema de _software_ de la computadora a bordo (OBC por sus siglas en inglés) secundaria, tomando una fotografía que se puede apreciar en la @milo_picture.
  + Se desarrolló un sistema de gestión de modos de operación que permite: Arranque, Nominal preliminar y Toma de fotografía (@laptop_test).
  + Se desarrolló un producto mínimo viable del sistema de _handover_ entre las dos OBCs del satélite (@command_reception).
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
  // #heading(level: 1, numbering: none)[Bibliografía]
  #bibliography(("./ref.bib", "./ref.yml"))

  // --- m-bibliografia.bib, estilo IEEE ---
  // #for (i, entrada) in bibliografia-entradas.enumerate() [
  //   #block(spacing: 0.8em)[
  //     \[#(i + 1)\] #entrada.texto
  //   ]
  // ]
]

// ------------------------------------------------------------------------------
// ANEXOS
// ------------------------------------------------------------------------------
#if incluir-anexos [
  = Anexos

  == Repositorio de Código <source_code>

  #link("https://github.com/QTZ-2-OBC/FreeRTOS-PortentaH7")[El repositorio es público y se encuentra hosteado en github, da click aquí.]
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
