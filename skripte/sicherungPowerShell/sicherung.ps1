param(
[string]$Datei
)

function Sichern ($Pfad) {
  Write-Host "Mit Sicherung des Pfades " $Pfad " beginnen.."
  
  Write-Host "Quelle- und Ziel-Ordner aus dem Pfad ermitteln.."
  $Ordners = $Pfad.Split(";")
  $QuelleOrdner = $Ordners[0]
  $ZielOrdner = $Ordners[1]
  
  Write-Host "Quelle-Ordner: " $QuelleOrdner
  Write-Host "Ziel-Ordner: " $ZielOrdner
  
  if (-not (Test-Path $QuelleOrdner)) {
    Write-Host "Quelle-Ordner " $QuelleOrdner " existiert nicht. Abbruch!"
    return
  }
  
  if (-not (Test-Path $ZielOrdner)) {
    Write-Host "Ziel-Ordner " $ZielOrdner " existiert nicht. Abbruch!"
    return
  }
  
  $Zeitstempel = (Get-Date).tostring("yyyyMMddTHHmmss")
  Write-Host "Zeitstempel: " $Zeitstempel
  $Logdir = "C:\Users\arr\logs\"
  Write-Host "Logdir: " $Logdir
  $Logdatei = -join($Logdir, $Zeitstempel, "_sicherung.log")
  Write-Host "Logdatei: " $Logdatei
  
  Write-Host "robocopy startet.."
  robocopy $QuelleOrdner $ZielOrdner /MIR /LOG+:$Logdatei /TEE
}

Write-Host "==== Daten-Sicherung ===="
Write-Host "Parameterdatei " $Datei " einlesen.."

$data = Get-Content $Datei | foreach { Sichern -Pfad $_ }

Start-Sleep -s 60