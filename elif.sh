#!bin/bash

echo Thy name:
read NAME

if [ "$NAME" == Nameless ]
	then
		echo Owr brother
	elif [ "$NAME" == 'Blessed' ]
		then
			echo May Thy blessing shower on us
	else
		echo No words for thee
fi
