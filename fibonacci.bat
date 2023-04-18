@echo off 
setlocal enabledelayedexpansion
chcp 65001
title fibonacci
color 0D
:: Fibonacci
set /p fib=Entrer un nombre:
set f0=0
set f1=1
set resultat=0

if %fib% == 1 (
    echo Fibonacci de 1 = 0
) 

if %fib% == 2 (
    echo Fibonacci de 2 = 1
) 

if %fib% gtr 2 (

    for /l %%v in (3,1,%fib%) do (
    set /a resultat=!f0!+f1!
    echo %%v f0 = !f0!  f1 = !f1!, fibo = !resultat!
    set /a f0=!f1!
    set /a f1=!resultat!

    )

    echo Fibonacci de %fib% = !resultat!
)





pause>nul