[//]: # (markdownlint-disable MD013 MD041)

# Brief 448 — ov002 reg-alloc to .s, UPPER half (Windows lane)

**Brief:** 448 (scaffolder). Continue the ov002 UPPER-half (addr ≥ 0x02234000)
`.s`-bound reg-alloc backlog (PR #982 = 28 ships), decomper on the lower half.
Enumerate uncarved upper-half, probe with `asm_escape`, sort delinks, gate on
3-region `ninja sha1`, lint the brief. Target ~28.

## Headline — 28 upper-half .s shipped, 92% yield, entering the >0xc0 tier

**28 byte-exact upper-half ov002 `.s` shipped.** Clean rate **92%** (55 clean from
60 probes — 5 new byte-pack, 0 verify-fail, 0 arg-pack, 0 `kind:data`). Took 28
(held 27). With the `0x81–0xc0` band nearly drained (64 left at branch), the probe
pool was extended to `≤0xf0`, so the picks crossed into the **`>0xc0` tier** —
band **0xa8–0xcc**, mostly 0xc4. The larger funcs drove a few more byte-pack drops
but no verify-fails.

## ⚠️ Transient `dsd`/`mwasmarm` crashes generalize — RETRY the baseline

The baseline `ninja sha1` first failed at **`dsd delink`** (`build/eur/delinks/delink.yaml`,
exit -1 / `4294967295`) — a *different* step than brief 446's `mwasmarm` flake but
the **same crash signature**. It is **not** broken main (0 conflict markers; the
warnings are the usual cross-overlay-reloc `[WARN]`s): re-running built `delink.yaml`
+ all gap `.o` and the full `ninja sha1` passed (`gx-spirit-caller_eur.nds: OK`).

**Generalized lesson: with the post-#951 large tree (2600 main `.s`, 1000+ ov002
`.s`), ANY baseline build step — `mwasmarm` compile OR `dsd delink` — can crash
once (exit -1) under heavy parallelism. Re-run before treating it as broken main.**

## Skip lists — both active, yield 92%

- `build/known_drops_ov002.txt` (permanent byte-pack/arg-pack/`kind:data`): **43**
  (+5 this wave — the larger funcs surface more byte-pack).
- `build/known_verifyfail_ov002.txt` (soft `to_mwasm`-gap): **19** (+0).

## dsd dis still panics — same workaround

`dsd dis` still aborts (`index out of bounds: the len is 640 but the index is
640` at `cli/src/cmd/dis.rs:267`) and emits **0 gap files**. Enumerate uncarved
upper-half = `symbols.txt` minus carved minus both skip lists; probe with
`asm_escape` (gap `.o` from `dsd delink`, 2066 present); post-filter. **Still
flagged.**

## Drop breakdown (60 probed, both skip lists active)

| outcome | n | note |
|---|---:|---|
| **SHIP** | 55 | took 28; 27 held for the next wave |
| byte-pack | 5 | newly-seen (added to the permanent skip list) |
| verify-fail | 0 | (soft list comprehensive) |
| `kind:data` | 0 | (all known ones pre-filtered) |

## Markdown lint — `build/mdcheck.py`

Brief linted clean with `build/mdcheck.py`. Pre-push re-checks `origin/main`.

## Thinning watch — into the deep >0xc0 tier (671 funcs)

Uncarved **upper-half** funcs by size band: `≤0x60` = 33 (drained), `0x61–0x80`
= 23 (drained), `0x81–0xc0` = 64 (~1 wave left), `>0xc0` = 671 → **791 total**
(734 after the skip lists). This wave begins the **`>0xc0` tier** — **671 funcs**,
the lane's runway for dozens more waves. **No thinning** — at ~92% yield, 60
probes clear 28 with a 27-deep held backlog.

## Gate — 3-region ninja sha1

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Files

`src/overlay002/` +28 `.s`; `arm9/overlays/ov002/delinks.txt` +28 (sort-normalised).
No main/USA/JPN change. Running total scaffolder reg-alloc `.s`: **480** (main 17,
ov002 463).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
