#!/bin/bash
# Regenerate ~/.config/starship.toml from the tokyo-night preset using the current Omarchy theme colors.
COLORS="$HOME/.local/state/omarchy/current/theme/colors.toml"
[[ -f $COLORS ]] || exit 0
command -v starship >/dev/null || exit 0

python3 -I - "$COLORS" <<'PY' > "$HOME/.config/starship.toml.new" || { rm -f "$HOME/.config/starship.toml.new"; exit 0; }
import re, subprocess, sys, tomllib

c = tomllib.load(open(sys.argv[1], "rb"))
rgb = lambda h: [int(h[i:i+2], 16) for i in (1, 3, 5)]
def mix(a, b, t):
    return "#%02x%02x%02x" % tuple(round(x + (y - x) * t) for x, y in zip(rgb(a), rgb(b)))

bg, sel = c["background"], c["selection"]
m = {
    "#a3aed2": c["bright_foreground"], "#a0a9cb": c["bright_foreground"],
    "#769ff0": c["accent"], "#394260": sel,
    "#212736": mix(bg, sel, 0.3), "#1d2230": mix(bg, sel, 0.12),
    "#e3e5e5": bg, "#090c0c": bg,
}
out = subprocess.run(["starship", "preset", "tokyo-night"], capture_output=True, text=True, check=True).stdout
out = re.sub(r"#[0-9a-fA-F]{6}", lambda x: m.get(x.group(0).lower(), x.group(0)), out)

# Prompt character: accent normally, theme's bright red on error
red = c["bright_red"]
out += f'\n[character]\nsuccess_symbol = "[➜](bold {c["accent"]})"\nerror_symbol = "[➜](bold {red})"\n'
print(out, end="")
PY

mv "$HOME/.config/starship.toml.new" "$HOME/.config/starship.toml"
