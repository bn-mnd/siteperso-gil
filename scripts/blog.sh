#!/usr/bin/env bash

# bon, j'abandonne, ce sera fait manuellement

# vais extraire les trois premières lignes d'un article dans /articles/*.html (par exemple, articles/meow.html) avec sed & les utiliser pour
# faire une sorte de preview (description brève de l'article) dans blog.html. donc blog.html doit dépendre des articles pr que ça marche

# https://stackoverflow.com/a/21058584 Get content between a pair of HTML tags using Bash
# https://stackoverflow.com/questions/44995218/extract-text-between-html-tags-with-sed-or-grep

# extraire la 1ere ligne d'une page articles/*.html avec head (OK)
# puis la transférer vers pages/blog.html et categories/*.html (en fonction de la catégorie)...
# ^ prendre la premiere ligne de la page de l'article (= le titre de l'article) après avoir trouvé la catégorie***

# page=${1:?Fichier html non spécifié}

# category_name=$(sed -n '/<a href="*.html" class="categorie-article">/,/<\/a>/p' pages/blog.html)

#for article_page in articles/*.html; do
#	article_title=$(head -1 "${article_page}")
#
#	if [[ "${category_name}" == "reverse engineering" ]]; then
#		category_file="categories/re.html"
#		sed "s~##ARTICLE-1##~${article_title}~" "${category_file}"
#	elif [[ "${category_name}" == "tutoriels" ]]; then
#		category_file="categories/tutoriels.html"
#		sed "s~##ARTICLE-1##~${article_title}~" "${category_file}"
#	elif [[ "${category_name}" == "hardware" ]]; then
#    category_file="categories/hardware.html"
#    sed "s~##ARTICLE-1##~${article_title}~" "${category_file}"
#	elif [[ "${category_name}" == "référence" ]]; then
#    category_file="categories/ref.html"
#    sed "s~##ARTICLE-1##~${article_title}~" "${category_file}"
#  elif [[ "${category_name}" == "programmation" ]]; then
#    category_file="categories/programmation.html"
#    sed "s~##ARTICLE-1##~${article_title}~" "${category_file}"
#	else
#		echo "Aucune catégorie correspondante"
#		continue
#	fi
#
#done

# https://stackoverflow.com/questions/68622119/how-to-use-if-elif-else-in-bash
# https://stackoverflow.com/questions/638975/how-do-i-tell-if-a-file-does-not-exist-in-bash

# à faire: remplacer le href="#" par le lien de l'article
