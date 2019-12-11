html:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::gitbook", clean = FALSE)'

build:
	make html
	Rscript -e 'browseURL("_book/index.html")'

pdf:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::pdf_book")'
	Rscript -e 'browseURL("_book/bookdown.pdf")'

pdf2:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::pdf_book")'
	Rscript -e 'browseURL("_book/bookdown.pdf")'
word:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::word_document2")'
	Rscript -e 'browseURL("_book/bookdown.pdf")'


# deploy:
#   source 'set-up.sh'
