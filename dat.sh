#!/bin/sh

#
# generate ".dat" files for fortune
#

for file in *; do
   case "$file" in
      *.*) echo "[34mskipping $file[m";;
      *) strfile "$file";;
   esac
done
