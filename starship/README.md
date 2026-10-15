# Starship prompt

My terminal prompt. It's Starship's `tokyo-night` preset, recolored to match
the Omarchy Solitude theme. You need a Nerd Font for the icons.

- `starship.toml` - the prompt. Copy it to `~/.config/starship.toml`.
- `starship-theme.sh` - rebuilds the prompt in the new colors whenever I
  change my Omarchy theme.

To use the hook:

```
omarchy hook install theme-set starship/starship-theme.sh
```

Careful: the hook overwrites `~/.config/starship.toml` on every theme change.
