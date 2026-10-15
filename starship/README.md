# Starship prompt (Omarchy, Solitude)

A powerline-style Starship prompt based on Starship's built-in `tokyo-night`
preset, recolored with the Omarchy **Solitude** theme palette.

Requires a [Nerd Font](https://www.nerdfonts.com/) for the powerline glyphs.

## Files

- `starship.toml` - the generated Solitude prompt. Copy to `~/.config/starship.toml`.
- `starship-theme.sh` - Omarchy `theme-set` hook. Regenerates `starship.toml`
  from the `tokyo-night` preset using the active theme's `colors.toml`, so the
  prompt follows theme changes. Install with:

  ```
  omarchy hook install theme-set starship/starship-theme.sh
  ```

The hook overwrites `~/.config/starship.toml` on every theme change.

The layout comes from the Starship `tokyo-night` preset (ISC licensed).
