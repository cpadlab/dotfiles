#! /bin/bash

if [ $# -eq 0 ]; then
    echo ""
    echo "   1 │ code"
    echo "   2 │ spotify"
    echo "   3 │ secrets"
    echo "   4 │ discord"
    echo "   5 │ browser"
    echo ""
    echo "   Libre-Office Commands"
    echo "       6 │ writer"
    echo "       7 │ calc"
    echo "       8 │ libreoffice7.5"
    echo ""
    echo "   Wi-Fi Commands"
    echo "         usage │ -w + num[1-4] + <option-string>"
    echo "       default │ nmcli device wifi list"
    echo "          none │ nmcli device wifi connect <SSID> password <password>"
    echo "             1 │ nmcli device wifi connect <SSID>"
    echo "             2 │ nmcli device wifi disconnect <interface>"
    echo "             3 │ nmcli device wifi show <connection-name>"
    echo "             4 │ nmcli device wifi delete <connection-name>"
    echo ""
else
    if [[ "$1" =~ ^[0-9]+$ ]]; then
        case $1 in
            1) code;;
            2) spotify;;
            3) secrets;;
            4) discord;;
            5) brave-browser;;
            6) echo "No aviliable";;
            7) echo "No aviliable";;
            8) libreoffice7.5;;
            *) echo "Invalid Option.";;
        esac
    elif [ "$1" = "-w" ]; then
        if [$# -gt 1 ] && [[ "$2" =~ ^[0-9]+$ ]]; then
            case $2 in
                1) nmcli device wifi connect $3;;
                2) nmcli device wifi disconnect $3;;
                3) nmcli device wifi show $3;;
                4) nmcli device wifi delete $3;;
                *) echo "Invalid Option.";;
            esac
        else
            nmcli device wifi list
        fi
    else
        echo "Invalid Option."
    fi
fi

