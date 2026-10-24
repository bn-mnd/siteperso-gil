#!/usr/bin/env bash

page=${1:?Fichier html non spécifié}

categorie=$(head -1 "${page}")
date=$(date "+%a %d %b %Y")

sed "s~##TITLE##~catégorie : ${categorie}~g" layout/before.html
tail -n+2 "${page}" | sed "s~##CAT##~${categorie}~g"

sed "s~##DATE##~${date}~g" layout/after.html
