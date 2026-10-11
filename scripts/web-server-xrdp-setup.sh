#!/usr/bin/env bash
# WEB-SV-2174 — habilitar RDP sobre Ubuntu mediante XRDP + XFCE
set -e
sudo apt update
sudo apt install -y xrdp xfce4 xfce4-goodies dbus-x11
echo "startxfce4" > ~/.xsession
sudo systemctl enable --now xrdp
sudo systemctl restart xrdp
sudo ss -tlnp | grep 3389
