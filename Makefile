# see https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html

version := $(shell cat VERSION)
readme_update := $(shell date "+%Y-%m-%d")
# see https://stackoverflow.com/a/2020006/6518111

# ---- Version generation -----------------------------------------------
.PHONY: version
version:
	@echo "Updating VERSION"
	echo "$(NEW_VERSION)" > VERSION
	git add VERSION

# ---- README generation -----------------------------------------------
.PHONY: readme
readme:
	echo "dt_update: $(readme_update)" > .docsible; \
	echo "version: $(version)" >> .docsible; \
	\
	docsible --role . \
	         --playbook molecule/default/converge.yml \
	         --no-backup \
	         --md-template docsible-template.md

# ---- Clean ----------------------------------------------------------
.PHONY: clean
clean:
	@echo "Removing environment and non-versioned config files"
	rm -rf .env VERSION .docsible .ansible ansible.cfg
