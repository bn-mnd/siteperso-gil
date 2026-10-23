#!/usr/bin/env bash

page=${1:?Fichier html non spécifié}

categorie=$(head -1 "${page}")
tail -n+2 "${page}" | sed -e "s~##CAT##~${categorie}~"
