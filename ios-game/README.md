# Horde Highway

A lane shooter in the style of the "Z Route" ads: steer a squad down a highway,
drive through gates that multiply it, and gun down hordes of zombies and a boss.

It is a single HTML5 canvas page with no dependencies, made for iPhone (touch
controls, safe-area insets, home-screen mode). It also works on desktop
(arrow keys or A/D).

## Play on iPhone

1. Host `index.html` anywhere over HTTPS (GitHub Pages works: Settings → Pages,
   then open `https://<user>.github.io/<repo>/ios-game/`).
2. Open it in Safari, tap **Share → Add to Home Screen**.
3. Launch it from the home screen; it runs full screen like an app.

## How it plays

- **Drag** anywhere to steer. The squad fires on its own and aims at the closest zombies.
- **Blue gates** (`+N`, `×2`) grow the squad; **red gates** (`−N`, `÷2`) shrink it.
  Shooting a `+` gate raises it; shooting a `−` gate lowers it until it flips to `+`.
- **Crates** marked FIRE raise the fire rate when destroyed.
- Each level ends with a boss. Levels get longer, hordes get bigger and tougher.

## Files

- `game.html`: the game source (page body, styles and script).
- `build.sh`: wraps `game.html` into the standalone `index.html` with iOS meta tags.
  Run it after editing `game.html`.
- `index.html`: generated, ready to host.

## Native App Store build

To ship it as a real iOS app, wrap `index.html` in a `WKWebView` (or use
Capacitor: `npx cap add ios`, copy `index.html` into `www/`) and build in Xcode on a Mac.
