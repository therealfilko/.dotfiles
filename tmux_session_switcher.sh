#!/usr/bin/env bash

# Pfad zu fzf
fzf_path="/opt/homebrew/opt/fzf/bin/fzf"

# Überprüfen, ob fzf verfügbar ist
if ! command -v $fzf_path &> /dev/null; then
    echo "fzf konnte nicht gefunden werden."
    exit 1
fi

# Argument oder interaktive Auswahl eines Verzeichnisses
if [[ -z "$1" ]]; then
  selected=$(find ~/personal ~/personal/Github ~/personal/Bitbucket -mindepth 1 -maxdepth 1 -type d | $fzf_path)
else
  selected=$1
fi

# Frühes Beenden, falls keine Auswahl getroffen wurde
if [[ -z $selected ]]; then
    echo "Keine Auswahl getroffen."
    exit 0
fi

# Session-Name generieren
selected_name=$(basename "$selected" | tr . _)

# Startet eine neue tmux-Session oder tritt einer bestehenden bei
TMUX_PATH=$(which tmux)
if ! $TMUX_PATH has-session -t=$selected_name 2> /dev/null; then
    $TMUX_PATH new-session -s $selected_name -c $selected -d
fi

# Wir versuchen, uns an die Session anzuhängen.
$TMUX_PATH attach-session -t $selected_name
