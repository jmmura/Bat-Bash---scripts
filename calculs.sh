#!/bin/sh

#script qui calcule une opération arithmétique en fonction de 3 arguments:
#$1 et $3 les opérandes et $2 l'opérateur


calcul(){

#Case sur l'opérateur
case "$2" in
  +)
    echo $(($1+$3))
    ;;

  -)
    echo $(($1+$3))
    ;;

  x )
    echo $(($1*$3))
    ;;

  / )
    echo $(($1/$3))
    ;;

esac

}


echo -n "Solution : "
calcul $1 $2 $3

#echo -n pour avoir "Solution : ..." sur une seule ligne
