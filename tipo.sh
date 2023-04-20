#!/bin/bash

#Variables
file=$1
path=$2
terminal="lxterminal -T "$file" -e"
wait="$file; echo; echo Presione cualquier tecla para finalizar.; read"
extension=${file##*.}

#Extensions
if [ $extension = "py" ]; then
	$terminal "python3 $wait"
elif [ $extension = "sh" ]; then
	$terminal "bash $file $wait"
elif [ $extension = "cpp" ]; then
	name=$(basename $file .cpp)
	g++ $file -o $name
	$terminal "$path/$name $wait"
elif [ $extension = "c" ]; then
	name=$(basename $file .c)
	gcc $file -o $name
	$terminal "$path/$name $wait"
else
	$terminal "$path/$file $wait"
fi