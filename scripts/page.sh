#!/usr/bin/env bash

page=${1:?Fichier html non spécifié}

title=$(head -1 "${page}")
annee=$(date "+%Y")
date=$(date "+%a %d %b %Y")

tail -n+2 "${page}" | sed \
    -e "s~##TITLE##~${title}~g" \
    -e "s~##ANNEE##~${annee}~g"

sed "s~##DATE##~${date}~g" layout/after.html

