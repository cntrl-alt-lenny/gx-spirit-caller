<p align="center">
  <img src="assets/github-banner.png" alt="GX Spirit Caller decomp banner" width="100%">
</p>

<h1 align="center">GX Spirit Caller Decomp</h1>

<p align="center">
  <img src="https://img.shields.io/badge/ninja%20sha1-PASS%20%C3%97%203-brightgreen" alt="ninja sha1 passes for EUR/USA/JPN">
  <img src="https://img.shields.io/badge/modules-27%2F27%20%C3%97%203-brightgreen" alt="27/27 modules across 3 regions">
  <img src="https://img.shields.io/badge/license-MIT-blue" alt="MIT License">
</p>

<p align="center">
  A matching decompilation of <em>Yu-Gi-Oh! GX Spirit Caller</em> for the Nintendo DS — a
  byte-identical ROM rebuilt from C source across all three regions
  (EUR <code>AYXP</code> · USA <code>AYXE</code> · JPN <code>AYXJ</code>).
  Built with <a href="https://github.com/AetiasHax/ds-decomp"><code>dsd</code></a>, an
  <code>mwccarm</code>/<code>mwldarm</code> toolchain, and an
  <a href="https://github.com/encounter/objdiff"><code>objdiff</code></a> feedback loop.
</p>

## Progress

<p align="center">
  <img src="https://raw.githubusercontent.com/cntrl-alt-lenny/gx-spirit-caller/progress-visuals/assets/progress-combined.svg" alt="Decompilation progress by region" width="660">
</p>

Two metrics, because they differ a lot:

- **Byte-matched** — code that rebuilds byte-identical from our source tree, *including `.s` assembly ships*. The round-trip goal: all three ROMs already pass `ninja sha1`.
- **Decompiled to C** — code recovered as readable C. The reverse-engineering goal, and the harder road. The gap between the two bars is the `.s`→C work still ahead.

<details>
<summary>Per-region structural heatmaps (one cell per translation unit — sized by bytes, coloured by match)</summary>
<br>
<p align="center"><strong>EUR</strong><br><img src="https://raw.githubusercontent.com/cntrl-alt-lenny/gx-spirit-caller/progress-visuals/assets/progress-heatmap-eur.svg" alt="EUR heatmap" width="100%"></p>
<p align="center"><strong>USA</strong><br><img src="https://raw.githubusercontent.com/cntrl-alt-lenny/gx-spirit-caller/progress-visuals/assets/progress-heatmap-usa.svg" alt="USA heatmap" width="100%"></p>
<p align="center"><strong>JPN</strong><br><img src="https://raw.githubusercontent.com/cntrl-alt-lenny/gx-spirit-caller/progress-visuals/assets/progress-heatmap-jpn.svg" alt="JPN heatmap" width="100%"></p>
</details>

Visuals regenerate from committed `delinks.txt` on every merge — no baserom needed.

## Build

```bash
python tools/configure.py eur     # eur | usa | jpn  (verifies the baserom SHA-1)
ninja sha1                        # round-trip build + verify byte-identical
```

You supply your own clean dump; this repo never ships ROMs. Full per-OS setup,
project layout, and the toolchain table are in **[BUILD.md](BUILD.md)**;
collaborator conventions are in **[CLAUDE.md](CLAUDE.md)**.

## How matching works

1. Pick an unmatched function from `config/<ver>/**/symbols.txt`.
2. Write C in `src/…`; `ninja` rebuilds and `ninja objdiff` diffs it; iterate to 100%.
3. Rename the symbol to its real name once it matches.

`ninja sha1` is the only project-level test that matters: if the rebuilt ROM
hashes equal to the baserom, every byte is accounted for.

## Contributing

Small, careful PRs are very welcome — a single unmatched function, a better
symbol name (`func_020b3a7c` → `Duel_ShuffleDeck`), or a tooling fix. Open an
issue first for structural changes. Good starting points are in
[BUILD.md](BUILD.md) and [CLAUDE.md](CLAUDE.md).

## Credits

- [ds-decomp](https://github.com/AetiasHax/ds-decomp) — the dsd toolchain · [dqix](https://github.com/StanHash/dqix) — repo template · [objdiff](https://github.com/encounter/objdiff) — per-function diffing · [wibo](https://github.com/decompals/wibo) — Linux PE loader
- Konami for the game. For educational and research purposes; we don't ship ROMs. Licensed under [MIT](LICENSE).
