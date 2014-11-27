# Gérard Tio Nogueras - INFO2 - 000333083
# Info-f-201
# Projet n°1: Shell Scripting

#! bin/bash

parcours(){
	if [[ "$1" == "." ]]; then
			echo $PWD
	fi
	for element in "$1"/*

	do
		#echo "element: $element"
		# checking if it isn't a symbolical link
		if [ ! -L "$element" ]; then #$(ls -l "$element" | grep ^l | wc -l) == 0
			# Is it a directory ?
			if [ -d "$element" ]; then
				#echo "dossier"
				# Is it not empty ?
				if [ $(ls -l "$element" | grep -v ^total | wc -l) -ge 1 ]; then #-x "$element" -a
					echo "$2|-- ${element#$1/}"
					parcours "$element" "$2    "
				# Then it's empty
				else
					echo "$2|-- ${element#$1/}"
					echo "$2    |-- *"	
				fi
			# Is it a file ?
			elif [ -f "$element" ]; then
				#echo "fichier"
				echo "$2|-- ${element#$1/}"
			fi
		#echo "Where : $1"
		fi
	done
}

root="."
#testing an argument has been given and that it exists
[ $# -ge 1 ] && [ -e "$1" ] && root="$1"
parcours "$root"


