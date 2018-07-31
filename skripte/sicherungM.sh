#!/bin/bash
echo starte sicherung..
rsync -a --delete --progress "/cygdrive/d/quelle/" "/cygdrive/m/temp"