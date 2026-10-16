# omarchy

Personal Omarchy shell config. Copy into `~/.config/omarchy/`:

- `shell.json`, `shell.toml` - shell settings, active bar and layout
- `extensions/` - menu extensions
- `bar/scripts/` - bar helper scripts
- `plugins/ed.background` - custom background plugin

## Shibumi bar

The bar is the third-party HANCORE Shibumi suite (`hancore.shibumi.*`,
v0.1.1-beta.16.4). It is not tracked here; install it separately, then
restore `shell.json`.

## Screensaver

`ghostty-screensaver` hides the titlebar and tab bar in the fullscreen
screensaver. Omarchy updates may overwrite the system copy, so re-apply with:

    sudo cp omarchy/ghostty-screensaver /usr/share/omarchy/default/ghostty/screensaver
