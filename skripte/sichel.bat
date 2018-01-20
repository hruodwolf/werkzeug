@echo off
echo starte die sicherung..

set quelle=g:\
set ziel=e:\

set quelleExistiert=false
set zielExistiert=false

if exist %quelle% (
  echo laufwerk %quelle% existiert
  set quelleExistiert=true
) else (
  echo laufwerk %quelle% existiert NICHT
)

if exist %ziel% (
  echo laufwerk %ziel% existiert
  set zielExistiert=true
) else (
  echo laufwerk %ziel% existiert nicht
)

if "%quelleExistiert%;%zielExistiert%"=="true;true" ( 
    echo Beide laufwerke existieren, beginne mit der sicherung
    robocopy %quelle%daten %ziel%sicherung /MIR /LOG+:"%quelle%werkzeugkasten\robocopy\logs\%date%_sicherung.log" /TEE
) else ( 
    echo mindestens eines von beiden - %quelle% %quelleExistiert% oder %ziel% %zielExistiert% - existiert nicht, sicherung wird abgebrochen
)

echo ende..