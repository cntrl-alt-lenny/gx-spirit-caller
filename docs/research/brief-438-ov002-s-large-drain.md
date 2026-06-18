[//]: # (markdownlint-disable MD013 MD041)

# Brief 438 — ov002 reg-alloc to .s, large drain wave (Windows lane)

**Brief:** 438 (scaffolder). Continue the ov002 upper-half `.s`-bound reg-alloc
backlog at the scaled cadence (PR #972 = 28 ships). Keep the `dsd dis`-panic
workaround, append carve blocks + run `tools/sort_delinks.py`, lint the brief,
gate on 3-region `ninja sha1`. Target ~28.

## Headline — 28 shipped; both skip lists active lifted yield to 88%

**28 byte-exact upper-half ov002 `.s` shipped.** This wave excluded **both** the
permanent known-drops list *and* the verify-fail soft-skip list (introduced in
brief 436) from enumeration. Result: **53 clean from 60 probes (88%)** — the
highest yield yet (61% none → 75% permanent-only → 88% both). Took 28 (held 25).
Ships are in the **0x9c–0xa4** band.

## Skip lists — both now in play

- `build/known_drops_ov002.txt` (permanent: byte-pack / arg-pack / `kind:data` —
  never ship as `.s`): **25** (+4 this wave).
- `build/known_verifyfail_ov002.txt` (soft: `to_mwasm` gaps — could flip if
  `to_mwasm` improves): **16** (+3 this wave).

Both are gitignored, persist across waves, and are excluded from enumeration
alongside the carved set. With them active the only drops left are *newly-seen*
byte-pack (4) and *newly-seen* verify-fail (3) — the recurring drops are gone.

## dsd dis still panics — same workaround

`dsd dis` still aborts (`index out of bounds: the len is 640 but the index is
640` at `cli/src/cmd/dis.rs:267`) and emits **0 gap files**. Enumerate uncarved
as `symbols.txt` minus the carved set minus both skip lists; probe with
`asm_escape` (gap `.o` from `dsd delink`, 2048 present); post-filter the emitted
`.s`. **Still flagged for the brain.**

## Drop breakdown (60 probed, both skip lists active)

| outcome | n | note |
|---|---:|---|
| **SHIP** | 53 | took 28; 25 held for the next wave |
| byte-pack | 4 | newly-seen (added to the permanent skip list) |
| verify-fail | 3 | newly-seen (added to the soft skip list) |
| `kind:data` | 0 | (all known ones pre-filtered) |

## Markdown lint — `build/mdcheck.py`

Brief linted clean with `build/mdcheck.py`. Pre-push: `origin/main` had not moved
since branch, so no tools-index drift.

## Thinning watch — overall NOT thinning

Uncarved **upper-half** funcs by size band: `≤0x60` = 33 (drained), `0x61–0x80`
= 21 (drained), `0x81–0xc0` = 234, `>0xc0` = 671 → **931 total** (897 after the
skip lists). The cadence is climbing through `0x81–0xc0` (now into the 0x9c–0xa4
sub-band); `>0xc0` (671 funcs) is the next tier. **No overall thinning** — and
with the skip lists, the effective yield is now ~88%, so 60 probes comfortably
clear the 28 target with a 25-deep held backlog.

## Gate — 3-region ninja sha1

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Files

`src/overlay002/` +28 `.s`; `arm9/overlays/ov002/delinks.txt` +28 (sort-normalised).
No main/USA/JPN change. Running total scaffolder reg-alloc `.s`: **340** (main 17,
ov002 323).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
