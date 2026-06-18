[//]: # (markdownlint-disable MD013 MD041)

# Brief 444 — ov002 reg-alloc to .s, UPPER half (Windows lane)

**Brief:** 444 (scaffolder). Continue the ov002 UPPER-half (addr ≥ 0x02234000)
`.s`-bound reg-alloc backlog (PR #979 = 28 ships), decomper on the lower half.
Enumerate uncarved upper-half, probe with `asm_escape`, sort delinks, gate on
3-region `ninja sha1`, lint the brief. Target ~28.

## Headline — 28 upper-half .s shipped, 93% yield, 3-region green

**28 byte-exact upper-half ov002 `.s` shipped.** Clean rate held at **93%** (56
clean from 60 probes — 3 new byte-pack, 1 new arg-pack, 0 verify-fail, 0
`kind:data`). Took 28 (held 28). Ships are in the **0x9c–0xb8** band (mostly 0xb4)
— the top of `0x81–0xc0`. The probe pool was extended to `≤0xd0` to start blending
in the smallest `>0xc0` funcs ahead of the tier transition; yield was unaffected.

## Skip lists — both active, yield steady ~93%

- `build/known_drops_ov002.txt` (permanent byte-pack/arg-pack/`kind:data`): **36**
  (+4 this wave).
- `build/known_verifyfail_ov002.txt` (soft `to_mwasm`-gap): **18** (+0 this wave).

The only drops are *newly-seen* byte-pack/arg-pack; the soft list stays
comprehensive (0 verify-fails again).

## dsd dis still panics — same workaround

`dsd dis` still aborts (`index out of bounds: the len is 640 but the index is
640` at `cli/src/cmd/dis.rs:267`) and emits **0 gap files**. Enumerate uncarved
upper-half = `symbols.txt` minus carved minus both skip lists; probe with
`asm_escape` (gap `.o` from `dsd delink`, 2066 present); post-filter. **Still
flagged for the brain.**

## ⚠️ New tooling gotcha — `src/overlay002/*.s` glob exceeds the arg limit

The `src/overlay002/` directory now holds **878+ `.s` files** (both lanes), so a
shell glob like `git add src/overlay002/*.s` or `git status src/overlay002/*.s`
fails with `Argument list too long`. Use the **directory** form instead —
`git add src/overlay002/` — and count new files with `git ls-files --others
--exclude-standard src/overlay002/ | grep -c '\.s$'` (no glob expansion).

## Drop breakdown (60 probed, both skip lists active)

| outcome | n | note |
|---|---:|---|
| **SHIP** | 56 | took 28; 28 held for the next wave |
| byte-pack | 3 | newly-seen (added to the permanent skip list) |
| arg-pack | 1 | newly-seen (added to the permanent skip list) |
| verify-fail | 0 | (soft list comprehensive) |
| `kind:data` | 0 | (all known ones pre-filtered) |

## Markdown lint — `build/mdcheck.py`

Brief linted clean with `build/mdcheck.py`. Pre-push re-checks `origin/main` for
a decomper wave landing mid-flight (see the gate section).

## Thinning watch — finishing 0x81-0xc0, >0xc0 next

Uncarved **upper-half** funcs by size band: `≤0x60` = 33 (drained), `0x61–0x80`
= 23 (drained), `0x81–0xc0` = 120, `>0xc0` = 671 → **847 total** (797 after the
skip lists). About **3 more waves** finish `0x81–0xc0`, then the deep `>0xc0`
tier (671 funcs) carries the lane for many more. **No overall thinning** — at
~93% yield, 60 probes clear 28 with a 28-deep held backlog.

## Gate — 3-region ninja sha1

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Files

`src/overlay002/` +28 `.s`; `arm9/overlays/ov002/delinks.txt` +28 (sort-normalised).
No main/USA/JPN change. Running total scaffolder reg-alloc `.s`: **424** (main 17,
ov002 407).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
