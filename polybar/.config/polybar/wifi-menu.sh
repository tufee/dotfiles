#!/usr/bin/env bash
#
# Menu de Wi-Fi via rofi: lista redes disponiveis, conecta ao clicar,
# pede senha (mascarada) quando a rede exigir.

ssid=$(nmcli -f SSID -t device wifi list --rescan yes \
    | sed '/^--/d' \
    | awk '!seen[$0]++' \
    | rofi -dmenu -i -p "Wi-Fi")

# Cancelou o menu (Esc ou fechou sem escolher)
[ -z "$ssid" ] && exit 0

# Se ja existe um perfil salvo com esse nome, so reconecta
if nmcli -f NAME -t connection show | grep -Fxq "$ssid"; then
    nmcli connection up "$ssid"
    notify-send "Wi-Fi" "Conectando a $ssid..."
    exit 0
fi

# Rede nova: verifica se e aberta ou tem senha
security=$(nmcli -f SSID,SECURITY -t device wifi list | grep -F "$ssid:" | head -1 | cut -d: -f2)

if [ -z "$security" ] || [ "$security" = "--" ]; then
    nmcli device wifi connect "$ssid"
else
    pass=$(rofi -dmenu -password -p "Senha para $ssid")
    [ -z "$pass" ] && exit 0
    nmcli device wifi connect "$ssid" password "$pass"
fi

notify-send "Wi-Fi" "Conectando a $ssid..."
