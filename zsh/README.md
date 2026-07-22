# zsh

Leistungsstarke, aber bewusst minimal gehaltene zsh-Konfiguration.

## Abhängigkeiten

### Arch Linux

```sh
paru -S zsh neovim eza bat fd fzf zoxide starship ripgrep
```

### Ubuntu

```sh
sudo apt install zsh neovim eza bat fd-find fzf ripgrep
```

`zoxide` und `starship` müssen unter Ubuntu separat installiert werden:

```sh
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
curl -sS https://starship.rs/install.sh | sh
```

Ubuntu installiert `bat` und `fd` unter anderen Namen. Deshalb werden symbolische Verknüpfungen erstellt, damit die Konfiguration funktioniert:

```sh
ln -s $(which batcat) ~/.local/bin/bat
ln -s $(which fdfind) ~/.local/bin/fd
```

### macOS

```sh
brew install zsh neovim eza bat fd fzf zoxide starship ripgrep
```

## Einrichtung

### 1. Repository klonen

```sh
git clone https://github.com/radleylewis/zsh ~/.config/zsh
```

Dadurch wird die zsh-Konfiguration im Verzeichnis `~/.config/zsh` gespeichert.

### 2. zsh auf das Konfigurationsverzeichnis verweisen lassen

Folgenden Inhalt in die Datei `/etc/zsh/zshenv` einfügen:

```sh
if [[ -z "$XDG_CONFIG_HOME" ]]
then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi
```

Damit wird Folgendes festgelegt:

* Falls `XDG_CONFIG_HOME` noch nicht gesetzt ist, wird `~/.config` verwendet.
* Falls das Verzeichnis `~/.config/zsh` existiert, verwendet zsh dieses Verzeichnis für seine Konfigurationsdateien.
* Dateien wie `.zshrc` und `.zshenv` werden anschließend aus `~/.config/zsh` geladen.

### 3. zsh als Standardshell festlegen

```sh
chsh -s $(which zsh)
```

### 4. Benötigte Verzeichnisse erstellen

```sh
mkdir -p ~/.local/state/zsh   # Verlauf
mkdir -p ~/.cache/zsh         # Cache für Autovervollständigung
```

Das erste Verzeichnis wird für den Befehlsverlauf verwendet. Das zweite speichert den Cache der zsh-Autovervollständigung.

### 5. Eine neue Shell starten

Nach dem Neustart des Terminals werden die Plugins beim ersten Start automatisch über den eingebauten Plugin-Manager installiert.

## Plugins

Die Plugins werden ohne zusätzlichen Plugin-Manager verwaltet.

Beim ersten Start werden sie automatisch in folgendes Verzeichnis geklont:

```sh
$ZDOTDIR/plugins/
```

| Plugin                                                                                    | Funktion                                                                  |
| ----------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting) | Hebt Befehle und Syntax farblich hervor                                   |
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)                   | Zeigt während der Eingabe Vorschläge aus dem bisherigen Verlauf an        |
| [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search) | Durchsucht den Verlauf mit den Pfeiltasten anhand des eingegebenen Textes |
| [zsh-vi-mode](https://github.com/jeffreytse/zsh-vi-mode)                                  | Aktiviert Vi- beziehungsweise Vim-Tastenkombinationen                     |

Alle Plugins können mit folgendem Befehl aktualisiert werden:

```sh
zplugin-update
```

## Tastenkombinationen

| Taste     | Funktion                                                          |
| --------- | ----------------------------------------------------------------- |
| `Ctrl+R`  | Unscharfe Suche im Befehlsverlauf mit `fzf`                       |
| `Ctrl+T`  | Dateisuche mit `fzf` und `fd`, einschließlich versteckter Dateien |
| `Ctrl+F`  | Dateisuche mit `fzf` und `fd`, ohne versteckte Dateien            |
| `Ctrl+→`  | Ein Wort nach vorne springen                                      |
| `Ctrl+←`  | Ein Wort zurückspringen                                           |
| `↑` / `↓` | Verlauf anhand des bereits eingegebenen Präfixes durchsuchen      |
| `Ctrl+\`  | Automatische Vorschläge ein- oder ausschalten                     |

## Starship-Konfiguration

Die Konfiguration für Starship befindet sich im Repository in der Datei:

```text
starship.toml
```

Sie wird automatisch über die Variable `STARSHIP_CONFIG` in der Datei `.zshenv` geladen.

Damit alle Symbole korrekt dargestellt werden, muss im Terminal eine [Nerd Font](https://www.nerdfonts.com) eingestellt sein.

