#!/bin/sh
# install.sh
# Run from the root of mangowm-dots (where README.md, nezrin/, voidlet/, walls/ live).
# Prompts for a theme, installs its configs, and sets the matching wallpaper.

set -eu

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

# theme name -> wallpaper file, under walls/
wall_for_theme() {
  case "$1" in
  voidlet) echo "1.png" ;;
  nezrin) echo "2.png" ;;
  *) echo "" ;;
  esac
}

# ---- pick theme ----------------------------------------------------------
echo "Which theme do you want to install?"
echo "  1) nezrin"
echo "  2) voidlet"
printf "Enter 1 or 2: "
read -r choice

case "$choice" in
1) THEME="nezrin" ;;
2) THEME="voidlet" ;;
*)
  echo "invalid choice"
  exit 1
  ;;
esac

SRC="$REPO_DIR/$THEME"
if [ ! -d "$SRC" ]; then
  echo "error: $SRC not found"
  exit 1
fi

echo "Installing theme: $THEME"

# ---- backup + copy helper ------------------------------------------------
install_dir() {
  # install_dir <src_under_theme> <dest_dir>
  src="$SRC/$1"
  dst="$2"
  if [ ! -e "$src" ]; then
    echo "skip (not in $THEME): $1"
    return
  fi
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    backup="$dst.bak.$(date +%Y%m%d%H%M%S)"
    echo "backing up existing $dst -> $backup"
    mv "$dst" "$backup"
  fi
  mkdir -p "$(dirname "$dst")"
  cp -a "$src" "$dst"
  echo "installed: $dst"
}

install_file() {
  # install_file <src_under_theme_file> <dest_file>
  src="$SRC/$1"
  dst="$2"
  if [ ! -e "$src" ]; then
    echo "skip (not in $THEME): $1"
    return
  fi
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    backup="$dst.bak.$(date +%Y%m%d%H%M%S)"
    echo "backing up existing $dst -> $backup"
    mv "$dst" "$backup"
  fi
  mkdir -p "$(dirname "$dst")"
  cp -a "$src" "$dst"
  echo "installed: $dst"
}

# ---- configs --------------------------------------------------------------
install_dir "alacritty" "$HOME/.config/alacritty"
install_dir "mango" "$HOME/.config/mango"
install_dir "nvim" "$HOME/.config/nvim"
install_dir "rofi" "$HOME/.config/rofi"

# bash: copy any dotfiles inside straight into $HOME
if [ -d "$SRC/bash" ]; then
  find "$SRC/bash" -mindepth 1 -maxdepth 1 | while IFS= read -r f; do
    base="$(basename "$f")"
    install_file "bash/$base" "$HOME/$base"
  done
fi

# discord: drop whatever css file is in there into vesktop's quickCss location
if [ -d "$SRC/discord" ]; then
  css="$(find "$SRC/discord" -maxdepth 1 -iname '*.css' | head -n1)"
  if [ -n "$css" ]; then
    install_file "discord/$(basename "$css")" "$HOME/.config/vesktop/settings/quickCss.css"
  else
    echo "skip: no .css found in $THEME/discord"
  fi
fi

chmod +x "$HOME/.screenshot.sh" 2>/dev/null || true
chmod +x "$HOME/.autostart.sh" 2>/dev/null || true

# ---- wallpaper --------------------------------------------------------------
WALL_NAME="$(wall_for_theme "$THEME")"
WALL_PATH="$REPO_DIR/walls/$WALL_NAME"

if [ -n "$WALL_NAME" ] && [ -f "$WALL_PATH" ]; then
  if command -v swaybg >/dev/null 2>&1; then
    pkill swaybg 2>/dev/null || true
    swaybg -i "$WALL_PATH" >/dev/null 2>&1 &
    disown
    echo "wallpaper set: $WALL_PATH"
  else
    echo "swaybg not found — install it to have wallpaper set automatically"
    echo "  (Gentoo: doas emerge -av gui-apps/swaybg)"
  fi
else
  echo "no wallpaper found for $THEME at $WALL_PATH"
fi

echo
echo "Done. Restart mango (or reload its config) to pick up the new theme."
