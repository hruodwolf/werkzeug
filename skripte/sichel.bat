@echo off
echo ===============================================================
echo starte sicherung A

set quelle=e:\
set ziel=f:\

set quelleExistiert=false
set zielExistiert=false

echo quelle - %quelle% %quelleExistiert%
echo ziel - %ziel% %zielExistiert%

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
  echo laufwerk %ziel% existiert NICHT
)

if "%quelleExistiert%;%zielExistiert%"=="true;true" ( 
    echo Beide laufwerke existieren, beginne mit der sicherung
    robocopy %quelle%daten %ziel%sicherung /MIR /LOG+:"%quelle%werkzeugkasten\robocopy\logs\%date%_sicherung.log" /TEE
) else ( 
    echo mindestens eines von beiden - %quelle% %quelleExistiert% oder %ziel% %zielExistiert% - existiert NICHT, sicherung wird abgebrochen
)

echo ===============================================================
echo starte sicherung B

set quelle=a:\
set ziel=b:\

set quelleExistiert=false
set zielExistiert=false

echo quelle - %quelle% %quelleExistiert%
echo ziel - %ziel% %zielExistiert%

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
  echo laufwerk %ziel% existiert NICHT
)

if "%quelleExistiert%;%zielExistiert%"=="true;true" ( 
    echo Beide laufwerke existieren, beginne mit der sicherung
    robocopy %quelle%daten %ziel%sicherung /MIR /LOG+:"%quelle%logs\%date%_sicherung.log" /TEE
) else ( 
    echo mindestens eines von beiden - %quelle% %quelleExistiert% oder %ziel% %zielExistiert% - existiert NICHT, sicherung wird abgebrochen
)

echo ende..