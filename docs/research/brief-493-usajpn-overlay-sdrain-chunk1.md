[//]: # (markdownlint-disable MD013 MD041)

# Brief 493 — USA/JPN overlay `.s` drain, chunk 1 (ov002, solo, stacked PR 1/N)

**Brief:** 493 (decomper). Next vein after USA/JPN main drained (4,344 ships,
USA/JPN byte-match → ~42%): the **overlays** (~11k uncarved, ov002 ≈3,772/region
the richest). Run SOLO at full speed (scaffolder on a low-I/O tooling task → no
dual-lane I/O contention, cf. brief 486). USA + JPN overlays only; ov004/006/011
stay drained. This is chunk 1, all ov002.

## Result

- **1,303 ov002 ships: USA 649 + JPN 654** (the ~1,000–1,500/chunk target).
  Both regions: SHIPPED ~649/654 / REFUSE 1 / verify-fail 0 / **gate-fail 0**,
  clean-rate **99%**.
- 3-region `ninja sha1`: **EUR / USA / JPN all `OK`** (per-batch region gates + final serial confirm).
- **99% clean** — ov002's small funcs carve even cleaner than main (95-98%).

## ov002 census + remaining

| region | uncarved at start | shipped | **remaining** |
|--------|------------------:|--------:|--------------:|
| USA ov002 | 2745 | 649 | **2096** |
| JPN ov002 | 2886 | 654 | **2232** |

ov002 base `0x021aa3c0` (both regions). Deep — ov002 alone is ~3–4 more chunks;
the brief caps at ~4 PRs, so this run stays in ov002.

## Solo lane — no brief-486 contention

Brief 486's earlier overlay attempt hit a **dual-lane I/O contention wall**
(~0.5 `.s`/min, Defender-on, exit-127 deaths) because the scaffolder was carving
concurrently. This run is **solo** (scaffolder on low-I/O tooling), so the carve
ran at full speed with **0 gate-fails and 0 verify-fails** — the contention was
the bottleneck, not the lane.

## Targeting (brief-486 wrong-dir guard — verified)

`batch_carve --version <r> --overlay ov002 --srcdir src/<r>/overlay002 --min-addr
0x021aa000`. A `--limit 5` validation carve first confirmed `.s` land in
`src/<r>/overlay002/` and the delink block in
`config/<r>/arm9/overlays/ov002/delinks.txt` (gate OK = correct link), nothing in
the wrong dir. Then scaled to `--limit 650`/region. `--skip-list`/`--verifyfail-list`
per ov002 scope; self-sorted delinks. Serial foreground gates (never two builds
at once).

## to_mwasm gaps

**No NEW `to_mwasm` gaps, 0 gate-fails** this chunk. ov002's residue (1 refuse so
far/region) is kind:data, as expected.
