#!/bin/bash

# Subscribe to Sway's input events and read them line by line
swaymsg -t subscribe -m '["input"]' | \
jq --unbuffered -r 'select(.change == "xkb_layout") | .input.xkb_active_layout_name' | \
while read -r layout; do
	# Map the layout string to a flag emoji using partial matches
    case "$layout" in
        *"US"* | *"English (US, euro on 5)"*) flag="🇺🇸" ;;
        *"UK"* | *"English (UK)"*) flag="🇬🇧" ;;
        *"French"* | *"France"*)   flag="🇫🇷" ;;
        *"Italian"* | *"Italy"*)   flag="🇮🇹" ;;
        *"German"* | *"Germany"*)  flag="🇩🇪" ;;
        *"Spanish"* | *"Spain"*)   flag="🇪🇸" ;;
        *"Russian"*)               flag="🇷🇺" ;;
        *"Polish"*)                flag="🇵🇱" ;;
        *"Portuguese"*)            flag="🇵🇹" ;;
        *"Japanese"*)              flag="🇯🇵" ;;
        *"Swiss"*)                 flag="🇨🇭" ;;
        *"Canadian"*)              flag="🇨🇦" ;;
        *)                         flag="⌨️"  ;; # Fallback emoji if no match is found
    esac
    # Send the notification to swaync
    # The 'synchronous' hint ensures it replaces the old notification instantly 
    # rather than stacking multiple layout notifications on top of each other.
    notify-send -u low -a "Keyboard Layout" -i input-keyboard \
        -h string:x-canonical-private-synchronous:layout \
        "$flag Layout Changed" "<span font_family='sans-serif' fallback='false'>$layout</span>"

done
