#! bin/bash

parcours(){
	if [[ "$1" == "." ]]; then
			echo $PWD
	fi
	for element in $1/*
	do
		if [ -d $element ]; then
			echo $element
			parcours $element
		else
			if [ -f $element ]; then
			echo $element
			fi
		fi
	done
}

parcours .
