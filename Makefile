.PHONY: readme
# see https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html

version := $(shell cat VERSION)
readme_update := $(shell date "+%Y-%m-%d")
# see https://stackoverflow.com/a/2020006/6518111
readme:
	echo "dt_update: $(readme_update)" > .docsible; \
	echo "version: $(version)" >> .docsible; \
	\
	docsible --role . \
	         --playbook molecule/default/converge.yml \
	         --no-backup \
	         --md-template docsible-template.md

