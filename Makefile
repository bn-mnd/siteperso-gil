PAGES_SRC := $(wildcard pages/*.html)
PAGES := $(subst pages/,public/,$(PAGES_SRC))

CATEGORIES_SRC := $(wildcard categories/*.html)
CATEGORIES := $(subst categories/,public/,$(CATEGORIES_SRC))

ASSETS_SRC := $(wildcard assets/*)
ASSETS := $(subst assets/,public/,$(ASSETS_SRC))

ARTICLES_SRC := $(wildcard articles/*)
ARTICLES := $(subst articles/,public/,$(ARTICLES_SRC))

all: $(PAGES) $(ASSETS) $(CATEGORIES) $(ARTICLES)

public:
	mkdir public

# toutes les pages dépendent de layout/before.html et de layout/after.html
$(PAGES) $(CATEGORIES): layout/before.html layout/after.html

# blog.html doit dépendre des articles, pas l'inverse.... oups
# idem pour les pages des catégories. le titre des articles va s'actualiser en fonction des pages. donc j'ajoute cette target
# et le script bash actualisera les pages...
# pages/blog.html $(CATEGORIES): $(ARTICLES_SRC) <- trop compliqué à implémenter, donc c'est fait manuellement.

$(PAGES): public/%.html: pages/%.html
	./scripts/page.sh "$<" > "$@"

$(ASSETS): public/%: assets/%
	cp "$<" "$@"

$(CATEGORIES): public/%.html: categories/%.html
	./scripts/categories.sh "$<" > "$@"

$(ARTICLES): public/%.html: articles/%.html
	./scripts/page.sh "$<" > "$@"

.PHONY: all clean

clean:
	rm -rf public/*
