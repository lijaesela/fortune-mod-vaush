#!/usr/bin/env bash

#
# USAGE: dat.sh [directory]
# generate ".dat" files for ranadom lookup
#

[ "$1" ] && cd $1

failiure=0
for file in *; do
	if [[ $file =~ \. ]]; then
		echo "..."
	else
		if strfile "$file" &> /dev/null; then
			echo "generated for $file"
		else
			echo -e "\e[31m${file}: failed.\e[m"
			failiure=1
		fi
	fi
done

[ $failiure = 1 ] && echo -e "\e[31mone or more files failed.\e[m"
