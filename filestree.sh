# Gérard Tio Nogueras - INFO2 - 000333083
# Info-f-201
# Projet n°1: Shell Scripting

#! bin/bash

parcours(){
	if [[ "$1" == "." ]]; then
			echo "$PWD"
	fi
	for element in "$1"/*; do #[ -r "$1" -a -x "$1" ] && 

		# checking if it isn't a symbolical link
		if [ ! -L "$element" ]; then #$(ls -l "$element" | grep ^l | wc -l) == 0

			# Is it a directory ?
			if [ -d "$element" ]; then

				# Is it not empty ?
				if [ "$(ls -l "$element" | grep -v ^total | wc -l)" -ge 1 ]; then #-r "$element" -a -x "$element" -a
					echo "$2|-- ${element#$1/}"
					parcours "$element" "$2    "
				
				# Then it's empty
				else
					echo "$2|-- ${element#$1/}"
					echo "$2    |-- *"	
				fi
			
			# Is it a file ?
			elif [ -f "$element" ]; then
				echo "$2|-- ${element#$1/}"
			fi
		fi
	done
}

root="."
#testing an argument has been given and that it exists
[ "$#" -ge 1 ] && [ -e "$1" ] && [ -d "$1" ] && root="$1"
#old_PWD="$PWD"
#echo "root: $root"
#echo "1  $1"

#Pour une raison inconnue on fait cd ds le script mais aucune influence en dehors du script donc pas besoin de cd old_pwd
cd "$root"
echo "$PWD"
parcours "$PWD"
#cd "$old_PWD"

