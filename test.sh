#!/bin/sh

#
# run fortune on all files without installing
#

buf=""
for file in *; do
   case "$file" in
      *.*) ;;
      *) buf="${buf}${file} "
   esac
done

fortune $buf
