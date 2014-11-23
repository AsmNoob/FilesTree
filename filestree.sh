#! bin/bash

parcours(){
	if [[ "$1" == "." ]]; then
			echo $PWD
	fi
	for element in $1/*
	do
		if [ -e $element ]; then
			if [ -d $element ]; then
				if [ $(ls -l $element | wc -l) -ge 3 ]; then
					echo "$2|-- ${element#$1/}"
					parcours "$element" "$2    "
				else
					echo "$2|-- ${element#$1/}"
					echo "$2    |-- *"	
				fi
			fi
			if [ -f $element ]; then
				echo "$2|-- ${element#$1/}"
			fi
		fi
	done
}

root="."
[ $# -ge 1 ] && root="$1"
parcours "$root"


