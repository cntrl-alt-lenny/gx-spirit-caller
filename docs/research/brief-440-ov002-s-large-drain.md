[//]: # (markdownlint-disable MD013 MD041)

# Brief 440 — ov002 reg-alloc to .s, UPPER half (Windows lane)

**Brief:** 440 (scaffolder). The decomper rejoins ov002 `.s` (region-port clean
lane drained), so back to the two-lane split: **scaffolder = UPPER half
(addr ≥ 0x02234000)**, decomper = lower. Enumerate uncarved upper-half, probe with
`asm_escape`, sort delinks, gate on 3-region `ninja sha1`, lint the brief.
Target ~28.

## Headline — 28 upper-half .s shipped, 92% yield, 3-region green

**28 byte-exact upper-half ov002 `.s` shipped.** With both skip lists mature, the
clean rate hit **92%** (55 clean from 60 probes — 3 new byte-pack, 2 new
verify-fail, 0 `kind:data`). Took 28 (held 27). Ships are in the **0x9c–0xac**
band. Added an explicit **upper-half guard** to the wiring step (every pick
asserted `≥ 0x02234000`) now the decomper owns the lower half.

## Two-lane coordination (decomper rejoining lower half)

The decomper is back on ov002 lower-half `.s`. The `sort_delinks.py` discipline
(brief 389) keeps `ov002/delinks.txt` address-sorted, so my upper-half carve
blocks (`≥0x02234000`) and the decomper's lower-half blocks land in **disjoint
line regions** → git 3-way auto-merges, no conflict markers. At branch time no
decomper lower-half wave had merged yet; the pre-push check re-confirms `main`
before pushing in case one lands mid-flight.

## Skip lists — both active, yield 61 → 75 → 88 → 92%

- `build/known_drops_ov002.txt` (permanent byte-pack/arg-pack/`kind:data`): **28**
  (+3 this wave).
- `build/known_verifyfail_ov002.txt` (soft `to_mwasm`-gap): **18** (+2 this wave).

Both gitignored, excluded from enumeration alongside the carved set. The only
drops left are *newly-seen*; the recurring drops never re-probe.

## dsd dis still panics — same workaround

`dsd dis` still aborts (`index out of bounds: the len is 640 but the index is
640` at `cli/src/cmd/dis.rs:267`) and emits **0 gap files**. Enumerate uncarved
upper-half = `symbols.txt` minus carved minus both skip lists; probe with
`asm_escape` (gap `.o` from `dsd delink`, 2052 present); post-filter. **Still
flagged for the brain** — blocks the decomper's gap-`.s` enumeration too.

## Drop breakdown (60 probed, both skip lists active)

| outcome | n | note |
|---|---:|---|
| **SHIP** | 55 | took 28; 27 held for the next wave |
| byte-pack | 3 | newly-seen (added to the permanent skip list) |
| verify-fail | 2 | newly-seen (added to the soft skip list) |
| `kind:data` | 0 | (all known ones pre-filtered) |

## Markdown lint — `build/mdcheck.py`

Brief linted clean with `build/mdcheck.py`. Pre-push: re-checked `origin/main`
for movement (decomper may land a lower-half wave) — see the gate section.

## Thinning watch — overall NOT thinning

Uncarved **upper-half** funcs by size band: `≤0x60` = 33 (drained), `0x61–0x80`
= 23 (drained), `0x81–0xc0` = 176, `>0xc0` = 671 → **903 total** (862 after the
skip lists). The cadence is climbing through `0x81–0xc0` (now 0x9c–0xac);
`>0xc0` (671 funcs) is the deep next tier. **No overall thinning** — at ~92%
yield, 60 probes clear 28 with a 27-deep held backlog.

## Gate — 3-region ninja sha1

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Files

`src/overlay002/` +28 `.s`; `arm9/overlays/ov002/delinks.txt` +28 (sort-normalised).
No main/USA/JPN change. Running total scaffolder reg-alloc `.s`: **368** (main 17,
ov002 351).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
