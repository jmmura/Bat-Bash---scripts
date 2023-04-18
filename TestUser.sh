#!/bin/sh

testUser(){
q=0
#On affiche le menu en boucle jusqu à ce que  l utilisateur entre 3
while [ $q -ne 3 ]
  do
	echo "menu:"
	echo "1. Vérifier si l'utilisateur existe"
	echo "2. Connaître les informations utilisateur et de groupe"
	echo "3. Quitter"

	read q

	if [ $q -eq 1 ]
	  then
            echo "Entrer le nom de l'utilisateur" 
            read usr

	    existe

	elif [ $q -eq 2 ]
	  then
	    echo "Entrer le nom de l'utilisateur" 
            read usr

            existe
	    echo "Informarions de $usr: "
            id $usr

	fi

done
}


existe(){

#Recherche de l'utilisateur dans le dossier/etc/passwd

if grep "$usr" /etc/passwd > /dev/null
  then
    echo "il existe"
  else
    echo "Il n'existe pas"
fi
}

testUser
