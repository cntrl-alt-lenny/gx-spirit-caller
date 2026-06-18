[//]: # (markdownlint-disable MD013 MD041)

# Brief 446 — ov002 reg-alloc to .s, UPPER half (Windows lane)

**Brief:** 446 (scaffolder). Continue the ov002 UPPER-half (addr ≥ 0x02234000)
`.s`-bound reg-alloc backlog (PR #980 = 28 ships), decomper on the lower half.
Enumerate uncarved upper-half, probe with `asm_escape`, sort delinks, gate on
3-region `ninja sha1`, lint the brief. Target ~28.

## Headline — 28 upper-half .s shipped, 95% yield, 3-region green

**28 byte-exact upper-half ov002 `.s` shipped.** Clean rate hit **95%** (57 clean
from 60 probes — 2 new byte-pack, 1 new verify-fail, 0 arg-pack, 0 `kind:data`).
Took 28 (held 29). Ships are in the **0xa4–0xc0** band — finishing the
`0x81–0xc0` tier (the picks are mostly 0xbc/0xc0, the top of that band).

## ⚠️ Transient `mwasmarm.exe` failure on the baseline build (retry resolved)

The baseline `ninja sha1` first **failed** compiling `build/eur/src/main/func_0204c120.o`
(exit -1 / `4294967295`) — one of the **2600 main `.s`** from the decomper's main
endgame (#951, brief 419). It is **not** a broken main: re-running the single
target built the `.o` cleanly and the full `ninja sha1` then passed
(`gx-spirit-caller_eur.nds: OK`). It's a **flaky `mwasmarm.exe` crash under heavy
parallelism** (2600+ assembler invocations). **Lesson: a one-off main-`.s`
compile failure on the baseline is transient — re-run before treating it as
broken main.**

## Skip lists — both active, yield 61 → … → 95%

- `build/known_drops_ov002.txt` (permanent byte-pack/arg-pack/`kind:data`): **38**
  (+2 this wave).
- `build/known_verifyfail_ov002.txt` (soft `to_mwasm`-gap): **19** (+1 this wave).

The only drops are *newly-seen*; the recurring drops never re-probe.

## dsd dis still panics — same workaround

`dsd dis` still aborts (`index out of bounds: the len is 640 but the index is
640` at `cli/src/cmd/dis.rs:267`) and emits **0 gap files**. Enumerate uncarved
upper-half = `symbols.txt` minus carved minus both skip lists; probe with
`asm_escape` (gap `.o` from `dsd delink`, 2066 present); post-filter. **Still
flagged for the brain.**

## Drop breakdown (60 probed, both skip lists active)

| outcome | n | note |
|---|---:|---|
| **SHIP** | 57 | took 28; 29 held for the next wave |
| byte-pack | 2 | newly-seen (added to the permanent skip list) |
| verify-fail | 1 | newly-seen (added to the soft skip list) |
| `kind:data` | 0 | (all known ones pre-filtered) |

## Markdown lint — `build/mdcheck.py`

Brief linted clean with `build/mdcheck.py`. Pre-push re-checks `origin/main` for a
decomper wave landing mid-flight (see the gate section).

## Thinning watch — `0x81–0xc0` nearly done, `>0xc0` next

Uncarved **upper-half** funcs by size band: `≤0x60` = 33 (drained), `0x61–0x80`
= 23 (drained), `0x81–0xc0` = 92, `>0xc0` = 671 → **819 total** (765 after the
skip lists). After this wave the `0x81–0xc0` band is **~64** — about 2 more waves,
then the deep `>0xc0` tier (671 funcs) carries the lane for many more. **No
overall thinning** — at ~95% yield, 60 probes clear 28 with a 29-deep held
backlog.

## Gate — 3-region ninja sha1

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Files

`src/overlay002/` +28 `.s`; `arm9/overlays/ov002/delinks.txt` +28 (sort-normalised).
No main/USA/JPN change. Running total scaffolder reg-alloc `.s`: **452** (main 17,
ov002 435).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
