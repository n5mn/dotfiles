#!/bin/sh

# Set GTK Themes, Icons, Cursor and Fonts
gnome_schema="org.gnome.desktop.interface"
SCHEMA="gsettings set $gnome_schema"
THEME="Space-Transparent"
ICONS="Tela-grey"
FONT="Inter"
CURSOR="Bibata-Original-Classic"

gtk_settings() {
    ${SCHEMA} gtk-theme "$THEME"
    ${SCHEMA} icon-theme "$ICONS"
    ${SCHEMA} cursor-theme "$CURSOR"
    ${SCHEMA} font-name "$FONT"
    ${SCHEMA} color-scheme prefer-dark
}

gtk_settings
