SOURCES=$(shell find . -name *.Rmd)
SOURCES := $(wildcard *.Rmd)
TARGETS=$(SOURCES:%.Rmd=%.html)

%.html: %.Rmd
	@echo "$< -> $@"
	@Rscript -e "rmarkdown::render('$<')"

default: $(TARGETS)

clean:
	rm -rfv $(TARGETS)
	rm -rf *_cache/
	rm -rf *_files/

deploy:
	rsync -zrvce 'ssh -p 18765' *.Rmd *.csv *.html robjhynd@m80.siteground.biz:public_html/nyc2018
