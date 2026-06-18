[//]: # (markdownlint-disable MD013 MD041)

# Brief 442 — ov002 reg-alloc to .s, UPPER half (Windows lane)

**Brief:** 442 (scaffolder). Continue the ov002 UPPER-half (addr ≥ 0x02234000)
`.s`-bound reg-alloc backlog (PR #977 = 28 ships), decomper on the lower half.
Enumerate uncarved upper-half, probe with `asm_escape`, sort delinks, gate on
3-region `ninja sha1`, lint the brief. Target ~28.

## Headline — 28 upper-half .s shipped, 93% yield, 3-region green

**28 byte-exact upper-half ov002 `.s` shipped.** With both skip lists mature the
clean rate hit **93%** (56 clean from 60 probes — 3 new byte-pack, 1 new
arg-pack, 0 verify-fail, 0 `kind:data`). Took 28 (held 28). Ships are in the
**0x9c–0xb4** band. Every pick asserted `≥ 0x02234000` (upper-half guard).

## Two-lane coordination — decomper's lower-half wave auto-merged clean

The decomper's lower-half wave 5 (#976, 38 ships) merged between my last PR and
this branch; the `sort_delinks.py` discipline kept `ov002/delinks.txt`
address-sorted, so the two lanes' carve blocks live in disjoint line regions and
git 3-way auto-merged with no conflict markers (confirmed by the brief). At
branch the file held both lanes' carves (780 `.s` entries); my +28 → 808. The
pre-push check re-confirms `origin/main` before pushing in case another lower-half
wave lands mid-flight.

## Skip lists — both active, yield 61 → 75 → 88 → 92 → 93%

- `build/known_drops_ov002.txt` (permanent byte-pack/arg-pack/`kind:data`): **32**
  (+4 this wave).
- `build/known_verifyfail_ov002.txt` (soft `to_mwasm`-gap): **18** (+0 this wave).

Both gitignored, excluded from enumeration alongside the carved set. The only
drops this wave were *newly-seen* byte-pack/arg-pack — the verify-fail list is now
comprehensive enough that **0 verify-fails** appeared.

## dsd dis still panics — same workaround

`dsd dis` still aborts (`index out of bounds: the len is 640 but the index is
640` at `cli/src/cmd/dis.rs:267`) and emits **0 gap files**. Enumerate uncarved
upper-half = `symbols.txt` minus carved minus both skip lists; probe with
`asm_escape` (gap `.o` from `dsd delink`, 2055 present); post-filter. **Still
flagged for the brain.**

## Drop breakdown (60 probed, both skip lists active)

| outcome | n | note |
|---|---:|---|
| **SHIP** | 56 | took 28; 28 held for the next wave |
| byte-pack | 3 | newly-seen (added to the permanent skip list) |
| arg-pack | 1 | newly-seen (added to the permanent skip list) |
| verify-fail | 0 | (soft list now comprehensive) |
| `kind:data` | 0 | (all known ones pre-filtered) |

## Markdown lint — `build/mdcheck.py`

Brief linted clean with `build/mdcheck.py`. Pre-push: re-checked `origin/main`
for movement — see the gate section.

## Thinning watch — overall NOT thinning

Uncarved **upper-half** funcs by size band: `≤0x60` = 33 (drained), `0x61–0x80`
= 23 (drained), `0x81–0xc0` = 148, `>0xc0` = 671 → **875 total** (829 after the
skip lists). The cadence is finishing `0x81–0xc0` (now 0x9c–0xb4) — ~2 more waves
there, then the deep `>0xc0` tier (671 funcs). **No overall thinning** — at ~93%
yield, 60 probes clear 28 with a 28-deep held backlog.

## Gate — 3-region ninja sha1

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Files

`src/overlay002/` +28 `.s`; `arm9/overlays/ov002/delinks.txt` +28 (sort-normalised).
No main/USA/JPN change. Running total scaffolder reg-alloc `.s`: **396** (main 17,
ov002 379).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
