library(rmarkdown)
rmarkdown::render(
    input = './makeManuscriptFigures.Rmd',
    output_dir = getwd(),
    output_format = rmarkdown::html_document(
      code_folding = 'hide', 
      depth = 2,
      toc = TRUE,
      toc_float = TRUE,
      theme = 'lumen',
      number_sections = TRUE
    ))
