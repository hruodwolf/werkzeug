#!/bin/bash
echo starte sicherung..
rsync -a --delete --progress --exclude=*.psd /cygdrive/e/daten/art/meine_dokumente/Bilder/Foto_Archiv/ /cygdrive/m/Sicherung/Bilder/Foto_Archiv
rsync -a --delete --progress --exclude=*.psd /cygdrive/e/daten/art/meine_dokumente/Bilder/Fotobuecher/ /cygdrive/m/Sicherung/Bilder/Fotobuecher
echo sicherung beendet..