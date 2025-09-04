#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}🚀 Deploying Delta Dotfiles...${NC}"

# Get the script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create directories if they don't exist
mkdir -p ~/.config/i3 ~/.config/polybar ~/.config/rofi ~/.config/kitty ~/.config/dunst ~/.config/picom

# Deploy i3 config
echo -e "${YELLOW}📁 Installing i3 config...${NC}"
cp -r "$SCRIPT_DIR/i3/"* ~/.config/i3/
chmod +x ~/.config/i3/scripts/* 2>/dev/null || true

# Deploy polybar config (if exists)
if [ -d "$SCRIPT_DIR/polybar" ]; then
    echo -e "${YELLOW}📁 Installing polybar config...${NC}"
    cp -r "$SCRIPT_DIR/polybar/"* ~/.config/polybar/
fi

# Deploy rofi config (if exists)
if [ -d "$SCRIPT_DIR/rofi" ]; then
    echo -e "${YELLOW}📁 Installing rofi config...${NC}"
    cp -r "$SCRIPT_DIR/rofi/"* ~/.config/rofi/
fi

# Deploy system configs
echo -e "${YELLOW}📁 Installing system configs...${NC}"
[ -f "$SCRIPT_DIR/system/.Xresources" ] && cp "$SCRIPT_DIR/system/.Xresources" ~/
[ -f "$SCRIPT_DIR/system/.xinitrc" ] && cp "$SCRIPT_DIR/system/.xinitrc" ~/
[ -f "$SCRIPT_DIR/system/.bashrc" ] && cp "$SCRIPT_DIR/system/.bashrc" ~/
[ -f "$SCRIPT_DIR/system/.zshrc" ] && cp "$SCRIPT_DIR/system/.zshrc" ~/

echo -e "${YELLOW}📁 Installing kitty config...${NC}"
cp -r "$SCRIPT_DIR/kitty/"* ~/.config/kitty/ 2>/dev/null || true

echo -e "${YELLOW}📁 Installing dunst config...${NC}"
cp -r "$SCRIPT_DIR/dunst/"* ~/.config/dunst/ 2>/dev/null || true

echo -e "${YELLOW}📁 Installing picom config...${NC}"
cp -r "$SCRIPT_DIR/picom/"* ~/.config/picom/ 2>/dev/null || true

# Apply Xresources
if [ -f ~/.Xresources ]; then
    echo -e "${YELLOW}🎨 Applying Xresources...${NC}"
    xrdb ~/.Xresources
fi

echo -e "${GREEN}✅ Delta Dotfiles deployed successfully!${NC}"
echo -e "${YELLOW}🔄 Restart i3: Win+Shift+C or reboot and enjoy!${NC}"
