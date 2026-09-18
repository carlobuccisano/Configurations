#!/usr/bin/env bash
set -euo pipefail

usage() {
    cat <<EOF
Usage: ${0##*/} on|off

Switches the font sizes / mod key of sway, kitty, fuzzel and GTK between the
external-monitor profile (on: size 16, GTK 16, \$mod = Mod5) and the laptop
profile (off: size 10, GTK 11, \$mod = Mod4).

The GTK size also drives waybar and swaync, which both scale off it.
EOF
}

if [[ $# -ne 1 ]]; then
    usage >&2
    exit 1
fi

case "$1" in
    on)
        size=16
        gtk_size=16
        swaync_width=800
        mod=Mod5
        ;;
    off)
        size=11
        gtk_size=11
        swaync_width=500
        mod=Mod4
        ;;
    *)
        usage >&2
        exit 1
        ;;
esac

sway_vars="$HOME/.config/sway/config.d/10-variables.conf"
sway_lavoro="$HOME/.config/sway/config.d/11-variables_lavoro.conf"
kitty_conf="$HOME/.config/kitty/kitty.conf"
fuzzel_conf="$HOME/.config/fuzzel/fuzzel.ini"
swaync_conf="$HOME/.config/swaync/config.json"

for f in "$sway_vars" "$sway_lavoro" "$kitty_conf" "$fuzzel_conf" "$swaync_conf"; do
    if [[ ! -f $f ]]; then
        echo "${0##*/}: missing config file: $f" >&2
        exit 1
    fi
done

sed -i -E "s/^(font pango:.*)..$/\1${size}/" "$sway_vars"
sed -i -E "\$s/.*/set \\\$mod ${mod}/" "$sway_lavoro"
sed -i -E "s/^font_size .*/font_size ${size}.0/" "$kitty_conf"
sed -i -E "s/^(font=.*)..$/\1${size}/" "$fuzzel_conf"

# swaync expresses every size in rem, which GTK resolves against this setting,
# so it rescales the notifications and the control center as a whole.
gtk_font=$(gsettings get org.gnome.desktop.interface font-name)
gtk_font=${gtk_font//\'/}
gsettings set org.gnome.desktop.interface font-name "${gtk_font%% [0-9]*} ${gtk_size}"

# The swaync panel widths are raw pixels, so unlike its fonts and icons they do
# not follow the GTK setting and have to be widened to fit the larger text.
jq --argjson width "$swaync_width" \
    '."control-center-width" = $width | ."notification-window-width" = $width' \
    "$swaync_conf" > "$swaync_conf.tmp"
mv "$swaync_conf.tmp" "$swaync_conf"
pgrep -x swaync >/dev/null && swaync-client --reload-config >/dev/null || true

echo "monitor config set to '$1' (font size ${size}, GTK ${gtk_size}, \$mod ${mod})"
