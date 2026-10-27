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
  Most pairs have a bad side, and some have two.
- **Crates** open when shot. Each one is labelled with what it gives:
  - Weapons: **SMG** (fast, sprays), **SHOTGUN** (6-pellet blast, short range),
    **LASER** (pierces a line of zombies), **ROCKETS** (slow, splash damage),
    **MINIGUN** (very fast, light rounds), **FLAMER** (short range, sets zombies on fire),
    **RAILGUN** (slow, pierces everything in its path), **TESLA** (lightning chains to 3 more zombies).
  - **FIRE+**: +30% fire rate for the whole squad (stacks 4 times).
  - **+N**: extra soldiers.
  - **TANK**: a tank drives in front of the squad, shells the horde and takes the bites
    until its armour runs out. A second tank crate repairs and upgrades it.
  - **HELI**: a helicopter flies cover for 18 seconds, firing rockets.
  - **SHIELD**: no bites for 6 seconds. **FREEZE**: all zombies nearly stop for 4 seconds.
  - **COINS**: coins for upgrades. **NUKE** (rare): kills every zombie in view and hurts the boss.
- Rounds fly all the way to the horizon, so far crates and hordes can be shot early.
- **Red barrels** sit inside the hordes; shoot one to blow up everything around it.
  **Troop crates** (`+N`) add soldiers.
- **Supply drops** pause the road twice per level: pick one of three perk cards
  (common, rare, epic), such as Multishot, Ricochet, Volatile (zombies explode),
  Frost rounds, Headshots, Body armour, Recruiter, or calling in a tank or helicopter.
  Perks last until the level ends.
- **Coins** come from kills and cleared levels. Spend them on the win or lose screen on
  permanent upgrades: Bigger squad, Firepower and Salvage (weaker crate armour).
  Progress is saved in the browser.
- Each level ends with a boss that drops onto the road, calls in more zombies and
  charges the squad. Its health scales with your firepower, so it always reaches you.
- Levels get longer, hordes bigger, zombies tougher and brutes more common.

## Files

- `game.html`: the game source (page body, styles and script).
- `build.sh`: wraps `game.html` into the standalone `index.html` with iOS meta tags.
  Run it after editing `game.html`.
- `index.html`: generated, ready to host.

## Native App Store build

To ship it as a real iOS app, wrap `index.html` in a `WKWebView` (or use
Capacitor: `npx cap add ios`, copy `index.html` into `www/`) and build in Xcode on a Mac.
