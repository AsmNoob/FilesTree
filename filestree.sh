#! bin/bash

parcours(){
	if [[ "$1" == "." ]]; then
			echo $PWD
	fi
	for element in $1/*
	do
		# checking if the element exists and isn't a symbolical link
		if [ -e $element -a $(ls -l $element | grep ^l | wc -l) == 0 ]; then
			#directory
			if [ -d $element ]; then
				#not empty
				if [ $(ls -l $element | grep -v ^total | wc -l) -ge 1 ]; then
					echo "$2|-- ${element#$1/}"
					parcours "$element" "$2    "
				#empty
				else
					echo "$2|-- ${element#$1/}"
					echo "$2    |-- *"	
				fi
			fi
			#file
			if [ -f $element ]; then
				echo "$2|-- ${element#$1/}"
			fi
		fi
	done
}

root="."
#testing an argument has been given
[ $# -ge 1 ] && root="$1"
parcours "$root"


