#!/usr/bin/env bash

page=${1:?Fichier html non spécifié}
title=$(head -1 "$page")
cat ../categories/*.html | sed "s~##CAT##~$title~"

