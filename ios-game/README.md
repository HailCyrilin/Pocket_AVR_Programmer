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
- **Blue gates** (`+N`, `×2`) grow the squad; bigger multipliers unlock later (`×3` from level 8,
  `×4` from 14, `×5` from 20), and shooting a multiplier gate long enough raises it a step; **red gates** (`−N`, `÷2`) shrink it.
  Bullets fly through gates and change their number on the way: a `−` gate counts down
  fast until it flips to `+`, a `+` gate counts up more slowly. Most pairs have a bad side;
  a double-red pair never opens a level and always has one side that is quick to flip.
- **Crates** open when shot. Each one is labelled with what it gives:
  - Weapons: **SMG** (fast, sprays), **SHOTGUN** (6-pellet blast, short range),
    **LASER** (pierces a line of zombies), **ROCKETS** (slow, splash damage),
    **MINIGUN** (very fast, light rounds), **FLAMER** (short range, sets zombies on fire),
    **RAILGUN** (slow, pierces everything in its path), **TESLA** (lightning chains to 3 more zombies).
  - **FIRE+**: +30% fire rate for the whole squad (stacks 4 times).
  - **+N**: extra soldiers.
  - **TANK**: a tank drives in front of the squad, shells the horde and takes the bites
    until its armour runs out. Up to 1 tank on levels 1–5, 2 on levels 6–10 and 3 from
    level 11; extra tank crates repair and upgrade the weakest one.
  - **HELI**: a helicopter flies cover and fires rockets until it is shot down. Same limits
    as tanks (1 / 2 / 3 by level), flying in formation; extra heli crates repair and
    upgrade the weakest one.
  - **SHIELD**: no bites for 6 seconds. **FREEZE**: all zombies nearly stop for 4 seconds.
  - **COINS**: coins for upgrades. **NUKE** (rare): kills every zombie in view and hurts the boss.
- **Spitters** (green, from level 5) lob acid at the helicopter, or at the squad if there
  is none. Kill them early to keep air support alive.
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
- **Every level looks different.** Five settings rotate: Desert Highway (concrete barriers,
  rocks), Frozen Pass (snowbanks, pine trees, snowfall), Forest Road (guard rails, trees),
  Neon City (night, buildings, street lamps, rain) and Ash Wastes (lava cracks, dead trees, embers).
- **Level twists** from level 2: each level rolls one of Runner rush, Brute convoy,
  Spitter nest, Supply run (extra crates), Gate gauntlet (more gates) or Mega horde
  (fewer, bigger waves). A banner names the setting and twist when the level starts.
- **Mission levels**: every third level (3, 6, 9, ...) replaces its twist with a mission,
  rotating between **Defend the chopper** (a transport flies over the squad; spitters and
  bites damage it; lose it and the mission fails), **Hold the line** (the road stops; survive
  60 seconds of growing hordes with airdrops and reinforcements, then the boss) and
  **Rescue survivors** (pick up at least 5 of 10 survivors before zombies reach them;
  each adds 3 soldiers). Completing a mission pays bonus coins.
- Each level ends with a boss that drops onto the road, calls in more zombies and
  charges the squad. Its health scales with your firepower, so it always reaches you.
- Levels get longer, hordes bigger, zombies tougher and brutes more common.

## Saving

Progress saves automatically when you clear a level and when you buy an upgrade: the level
to continue from, your best level, coins and upgrades. The title screen offers
**Continue · level N** and a **Start at level** picker for any level you have reached.
Quitting mid-level restarts that level.

The save is kept in the browser (`localStorage`). When the game runs as a claude.ai
artifact and you are signed in, it is also kept in your private slot of the artifact's
database, so it follows you between devices.

## Files

- `game.html`: the game source (page body, styles and script).
- `build.sh`: wraps `game.html` into the standalone `index.html` with iOS meta tags.
  Run it after editing `game.html`.
- `index.html`: generated, ready to host.

## Native App Store build

To ship it as a real iOS app, wrap `index.html` in a `WKWebView` (or use
Capacitor: `npx cap add ios`, copy `index.html` into `www/`) and build in Xcode on a Mac.
