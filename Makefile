IMG_TYPE = png
PUML_JARPATH = lib/plantuml.1.2020.26.jar
PUML_SRC = umls
PUML_DEST = output
PUML_ARGS = -t$(IMG_TYPE) -charset UTF-8 -config "config.uml"
JAVA_OPTIONS = -Dapple.awt.UIElement=true

.PHONY: clean generate

default: generate

generate:
	@src="$(realpath $(PUML_SRC))/**/*.uml"; \
	dist=$(realpath $(PUML_DEST)); \
	java $(JAVA_OPTIONS) -jar "$(PUML_JARPATH)" $(PUML_ARGS) "$$src" -o "$$dist"

clean:
	@rm -rf $(PUML_DEST)/*.$(IMG_TYPE)
