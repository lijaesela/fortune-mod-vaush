#!/bin/sh

#
# makefile, but it's actually a shell script because fuck makefile
# customize "$dstdir" to fit your system
#

set -e
dstdir="/usr/share/fortune"

case "$1" in
   install)
      for file in *; do
         case "$file" in
            *.dat) cp -f "$file" "$dstdir/$file" || echo "error.";;
            *.*) echo "[34mskipping $file[m";;
            *) cp -f "$file" "$dstdir/$file" || echo "error.";;
         esac
      done
      ;;
   uninstall)
      for file in *; do
         case "$file" in
            *.dat) rm -f "$dstdir/$file" || echo "error.";;
            *.*) echo "[34mskipping $file[m";;
            *) rm -f "$dstdir/$file" || echo "error.";;
         esac
      done
      ;;
   "")
      for file in *; do
         case "$file" in
            *.*) echo "[34mskipping $file[m";;
            *) strfile "$file" || echo "error.";;
         esac
      done
      ;;
   run)
      buf=""
      for file in *; do
         case "$file" in
            *.*) ;;
            *) buf="${buf}${file} "
         esac
      done
      fortune $buf
      ;;
   *)
      echo "unknown argument."
      ;;
esac
