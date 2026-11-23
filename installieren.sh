#!/bin/bash
# Installiert oder repariert Jarvis mit einer Zeile im Terminal, ohne Sicherheitswarnung von macOS:
#   curl -fsSL https://raw.githubusercontent.com/Agentur-Akkus/jarvis-updates/main/installieren.sh | bash
# Testfassung:  ... | bash -s -- --test
# Lädt das Paket direkt (ohne Browser, daher ohne Download-Markierung), ersetzt eine vorhandene Jarvis und räumt Doppelte weg.
set -e
QUELLE="https://raw.githubusercontent.com/Agentur-Akkus/jarvis-updates/main"
DATEI="Jarvis-Erstinstallation.zip"
[ "$1" = "--test" ] && DATEI="Jarvis-Erstinstallation-Testfassung.zip"
T=$(mktemp -d)
trap 'rm -rf "$T"' EXIT
echo "Lade $DATEI ..."
curl -fsSL -o "$T/paket.zip" "$QUELLE/$DATEI"
ditto -x -k "$T/paket.zip" "$T"
cd "$T/Jarvis-Erstinstallation"
JARVIS_OHNE_WARTEN=1 bash ./Installieren.command
