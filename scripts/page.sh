#!/usr/bin/env bash

page=${1:?Fichier html non spécifié}

date=$(date "+%a %d %b %Y")

tail -n+2 "$page"
sed -i "s~##DATE##~$date~" 
