PAGES_SRC := $(wildcard pages/*.html)
PAGES := $(subst pages/,public/,$(PAGES_SRC))

CATEGORIES_SRC := $(wildcard categories/*.html)
CATEGORIES := $(subst categories/,public/,$(CATEGORIES_SRC))

ASSETS_SRC := $(wildcard assets/*)
ASSETS := $(subst assets/,public/,$(ASSETS_SRC))

all: $(PAGES) $(ASSETS) $(CATEGORIES)

public:
	mkdir public

# toutes les pages dépendent de layout/before.html et de layout/after.html
$(PAGES) $(CATEGORIES): layout/before.html layout/after.html

$(PAGES): public/%.html: pages/%.html
	cat layout/before.html > "$@"
	./scripts/page.sh "$<" >> "$@"

$(ASSETS): public/%: assets/%
	cp "$<" "$@"

$(CATEGORIES): public/%.html: categories/%.html
	cat layout/before.html > "$@"
	./scripts/categories.sh "$<" >> "$@"

.PHONY: all clean

clean:
	rm -rf public/*
