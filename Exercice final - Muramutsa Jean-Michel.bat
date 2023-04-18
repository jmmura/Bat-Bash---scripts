@Echo off
chcp 65001>nul

title Recherche dichotomique
mode con cols=80 lines=40

::Création du fichier csv
echo date;niveau;essais;temps(s) > scores.csv

::Choix du niveau: la limite supérieure = niveau*100
:niveau
set /p niveau=Choisir un niveau (chiffre entre 1 et 8):
if %niveau% GTR 8 goto niveau
if %niveau% LSS 1 goto niveau
@set /a "limite=%niveau%*100"


::juste prix choisi aléatoirement
:nombre_alea
 set justeprix=%RANDOM%
 if %justeprix% GTR %limite% goto nombre_alea
 if %justeprix% LSS 1 goto nombre_alea


@rem le compteur de temptatives
set compteur=1

@rem les intervalles proposés au joueur
set lim_inf=1
set lim_sup=%limite%

::Lancement chrono
set debut=%TIME%
@set /a "secondes_debut=%debut:~3,2%*60+%debut:~6,2%"

:debut
 set /p montant=Choisis un montant entre %lim_inf% et %lim_sup% (tentative %compteur%): 
 
@rem le joueur doit choisir un nombre dans l'intervalle proposé
 if %montant% LSS %lim_inf% goto debut
 if %montant% GTR %lim_sup% goto debut
 
 if %montant% LSS %justeprix% goto superieur
 if %montant% GTR %justeprix% goto inferieur
 goto fin

@rem ajustements des intervalles et du nombre de tentatives
:superieur
 echo Le juste prix est superieur.
 @set /a "lim_inf=%montant%"
 @set /a "compteur=%compteur%+1"
 goto debut
:inferieur
 echo Le juste prix est inférieur.
 @set /a "lim_sup=%montant%"
 @set /a "compteur=%compteur%+1"
 goto debut

::Fin de partie
:fin
 echo.
 echo Bravo tu as trouvé le juste prix!

::Fin chronométrage
set fin=%TIME%
@set /a "secondes_fin=(%fin:~3,2%*60)+(%fin:~6,2%)"
@set /a "duree=%secondes_fin%-%secondes_debut%"
echo %date%;%niveau%;%compteur%;%duree% >> scores.csv

::Nouvelle partie/fin
:nv_partie
set /p recommencer=Nouvelle partie? (o/n)
if "%recommencer%" == "o" (
    echo Nouvelle partie!
    goto niveau
) else if "%recommencer%" == "n" (
    exit
) else (
    goto nv_partie
)


Pause> nul
