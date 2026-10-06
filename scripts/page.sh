#!/bin/bash

page=${1:?Fichier html non spécifié}
filename=${page#html/}

date=$(date "+%a %d %b %Y")

sed -i -e 's~##DATE##~$date~' $page
