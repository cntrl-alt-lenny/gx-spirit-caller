[//]: # (markdownlint-disable MD013 MD041)

# Brief 308 — ov011 clean-C wave 1 (fresh-overlay drain)

**Brief:** 308 (decomper). Pivot off the ov002 GLOBAL_ASM drain (asm_escape.py
is dead on this Windows box — objdump + hardcoded wine, confirmed brief 306).
Open a clean-C matching stream on a FRESH overlay, mirroring the scaffolder's
ov006 wave-1 playbook (brief 304). Per-pick gate = **EUR objdiff fuzzy 100%**;
the 3-region `ninja sha1` PASS is the brain's pre-merge gate.

## Overlay pick — ov011 (survey result)

Surveyed remaining accessible-clean-C per overlay via the `_dsd_gap@ovN`
units in `build/eur/report.json` (count of un-carved functions `< 0x100`,
the proven accessible sweet spot), restricted to ov007+ excluding ov006
(scaffolder) and ov002 (parked):

| overlay | remaining funcs | `< 0x100` | `< 0x40` | verdict |
|---|---:|---:|---:|---|
| **ov011** | 123 | **97** | **28** | **picked — 2× the next vein** |
| ov008 | 78 | 48 | 4 | runner-up |
| ov010 | 66 | 37 | 1 | |
| ov016 | 61 | 34 | 3 | |
| ov007 (default) | 18 | 16 | 2 | nearly drained — poor |

ov011 dominates: 97 accessible functions remaining, 28 of them trivial
(`< 0x40`) — more than any other overlay. ov007 (the brief's default) is
nearly empty (.text is only ~3 KB). One line: **picked ov011 — richest
accessible vein in ov007+, 2× the next-best by `<0x100` count.**

## Headline

**19 shipped (all `.c`), all EUR objdiff fuzzy 100%** (byte-identical vs the
delinked gap `.o`), all wired into `config/eur/.../ov011/delinks.txt` and
compiled in-tree; **EUR `ninja sha1` = OK** with all 19 carved. The cohort is
call-wrapper / accessor / single-field-bitfield dominated, exactly the ov006
profile. 19/22 attempts matched (86%); the 3 misses are one reg-alloc wall
family (below), halted-and-surfaced per discipline — not grinding.

`ov011_core.h` promoted (the per-overlay vocabulary: dominant
`data_ov011_021d4000` state struct + field map, sibling data tables, shared
sinks, and the wall note).

## The 19 picks

| # | func | size | family / shape |
|---|---|---|---|
| 1 | `021cc250` | 0x2c | guarded handle-free ×2 (`func_0207fd28`) |
| 2 | `021cc344` | 0x30 | guarded handle-free (predicated) |
| 3 | `021cc15c` | 0x38 | accessor compare `a == b-1` |
| 4 | `021cdbac` | 0x2c | 3-call forwarder `(id, 0)` |
| 5 | `021cd638` | 0x24 | guard `+0x2a0==1` + 2 calls |
| 6 | `021cf0a4` | 0x24 | predicate: `((f2ac>>18)&3) != 1` |
| 7 | `021cf2b8` | 0x24 | single-field RMW (`f2b0` field set) |
| 8 | `021cf1f8` | 0x30 | 2 calls, computed actor-ptr (stride 0x14) |
| 9 | `021cc374` | 0x60 | 5-entry scan, `||` short-circuit, return ptr |
| 10 | `021d0f8c` | 0x24 | parallel-array store (4670/4674) **[sib]** |
| 11 | `021d0fb0` | 0x24 | parallel-array store (4660/4664) **[sib]** |
| 12 | `021cfb24` | 0x4c | 2× single-field RMW + call |
| 13 | `021d1028` | 0x30 | per-mode 0x72-stride byte table lookup |
| 14 | `021cfaf8` | 0x2c | single-field nibble insert (`(v&0xf)<<9`) |
| 15 | `021cdc3c` | 0x2c | guarded bit-8 insert on actor `+0x8` |
| 16 | `021d2d6c` | 0x34 | 2 calls to a fixed object (`+0x480c`) |
| 17 | `021d1b48` | 0x28 | guard-return-1 + 3-call settle, return 0 |
| 18 | `021d1f9c` | 0x2c | 0xa-stride table lookup + forward |
| 19 | `021d2d44` | 0x28 | dual sign-extended short read (aliased reload) |

## Notable recipes / gotchas hit

- **Sibling clone (10/11):** `021d0f8c` / `021d0fb0` are identical parallel-
  array stores differing only in the base pair — clone by swapping the two
  `data_ov011_*` symbols.
- **Aliased reload (19):** `021d2d44` reloads `obj->+0x20` for the second
  short because the `*out_x` store may alias it. A cached `short *arr` local
  defeats this (mwcc keeps it in a reg → no reload). Fix: re-read the pointer
  inline per access **and** address by byte (`(char*)p + idx*4 + 2`) so mwcc
  emits `idx<<2` directly, not `idx*2` then `<<1`.
- **Shift-form inserts (14/15):** nibble/bit inserts via `((unsigned)v<<N)>>M`
  (not `(v&mask)<<k`) reproduce the orig `lsl;…lsr`-into-`orr` fusion.
- **Single vs multi-field RMW:** single-field RMW on the state struct matches
  cleanly (7/12/14); the wall is *multi*-field (below).

## Wall surfaced — multi-field RMW field-address pooling (HALT)

3 picks (`021ca600`, `021ca630`, `021ccf3c`) are pure multi-field RMW leaves
on `data_ov011_021d4000` that hold a mask constant or a second base across
≥2 field RMWs. mwcc materialises the **field address** (`base + 0x2a8`) into a
pooled register instead of using `[base, #0x2a8]`, reserving a register and
shifting the whole allocation off the orig. Confirmed deterministic across 3
source phrasings (`&=` explicit RMW, `int *p` + scaled index, and char-cast),
all stuck at the identical fuzzy% — no source lever. This is a P-14-class
reg-alloc/layout escape; **reverted all 3 and halted per the brief's
"don't grind" discipline.** Single-field RMW is unaffected. Candidate for a
permuter pass or `.s` escape at end-game, not this wave.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff fuzzy, per-pick | **19/19 = 100%** |
| in-tree build (`ninja`, 19 `.o`) | compiled + wired; dsd re-delinked ov011 clean |
| EUR `ninja sha1` | **OK** (byte-identical ROM with all 19 carved) |
| ov011 `delinks.txt` | 19 `complete .text` blocks appended (EUR only) |
| 3-region `ninja sha1` | **deferred to brain** (per brief; USA/JPN config untouched) |

EUR-only config changes (`config/eur/arm9/overlays/ov011/delinks.txt`); no
tool change, no USA/JPN config change, no symbol renames. `src/overlay011/`
gains 19 `.c` + `ov011_core.h`.

## Recommendation for the brain

1. **ov011 clean-C is live and rich.** 19 byte-identical `.c` in wave 1; ~78
   accessible (`<0x100`) functions remain. The cohort is call-wrapper /
   accessor dominated like ov006 — sustainable parallel stream.
2. **Run the 3-region SHA1 on merge.** Per-pick gate here is EUR objdiff only;
   confirm USA/JPN reproduce (region-neutral `.c`, no port) and wire their
   `delinks.txt` if the ov011 addresses differ per region.
3. **Wave 2 levers:** the parallel-array store siblings and the single-field
   bitfield family clone mechanically; the table-lookup forwarders recur.
   Skip the multi-field-RMW pooled-address wall (see `ov011_core.h` §WALL).

## Cross-references

- `docs/research/brief-304-ov006-wave1-drain.md` — the playbook this mirrors.
- `docs/research/recipe-gotchas.md` — the gotcha catalogue used.
- `src/overlay011/ov011_core.h` — the promoted ov011 vocabulary header.
