PAGES_SRC := $(wildcard pages/*.html)
PAGES := $(subst pages/,public/,$(PAGES_SRC))

ASSETS_SRC := $(wildcard assets/*)
ASSETS := $(subst assets/,public/,$(ASSETS_SRC))

all: $(PAGES) $(ASSETS)

public:
	mkdir public

# toutes les pages dépendent de layout/before.html et de layout/after.html
$(PAGES): layout/before.html layout/after.html

$(PAGES): public/%.html: pages/%.html
	cp $< $@

$(ASSETS): public/%: assets/%
	cp $< $@

.PHONY: all clean

clean:
	rm -rf public/*
