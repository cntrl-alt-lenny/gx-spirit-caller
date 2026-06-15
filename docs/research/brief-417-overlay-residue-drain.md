[//]: # (markdownlint-disable MD013 MD041)

# Brief 417 — overlay residue drain: 355 `.s` ships across 11 overlays

**Brief:** 417 (decomper). Exhaust `asm_escape --whole-function` on all remaining
non-ov002/main overlays that were not swept in brief 413. Overlays swept here for
the first time: ov000, ov005, ov010, ov016, ov017, ov018, ov020, ov021, ov022.
Re-check ov006 and ov008 to classify their residue. Produce a project-wide count
of Thumb-tooling-blocked functions (bucket c). Branch: `decomper/overlay-residue-drain`.

## Headline — 355 byte-identical `.s` files across 11 overlays

| Overlay | Ships | Notes |
|:-------:|------:|-------|
| ov006   |    66 | 0 in concurrent pass; 66 via serial pass (concurrency artifact) |
| ov000   |    56 | 63 found; 7 deduped against pre-existing `.c` TUs |
| ov008   |    54 | 0 in concurrent pass; 54 via serial pass (concurrency artifact) |
| ov010   |    46 | 1 deduped against pre-existing `.c` |
| ov016   |    33 | 2 deduped against pre-existing `.c` |
| ov005   |    31 | 1 REFUSE (021acfb0) |
| ov017   |    24 | — |
| ov020   |    19 | — |
| ov022   |    11 | — |
| ov021   |     8 | 14 found; 5 deduped `.c`; 1 dedup delinks |
| ov018   |     7 | — |
| **Total** | **355** | |

## Method

Standard thin-overlay protocol from brief 409/413:

1. **Gap enumeration**: scan `_dsd_gap@ovNNN_*.o` files via `arm-none-eabi-objdump -t`
   to obtain the authoritative list of uncarved functions per overlay.
2. **Whole-function**: `asm_escape --whole-function --version eur` (which internally
   calls `preflight_data_refs`; REFUSE exits early). Exit 0 + "byte-identical" → ship.
3. **Copy + delinks**: copy `.s` from `build/_asm_escape/` to `src/overlayNNN/`;
   append `.text start:… end:…` block to delinks; run `sort_delinks.py`.
4. **Conflict detection**: functions already matched by a `.c` TU appeared in gap
   objects because the objects were generated from a stale pre-sweep build.
   These produced `.c`/`.s` dual entries. Detected by checking for same-named `.c`
   in `src/`: 16 duplicates found across ov000×7, ov006×1, ov010×1, ov016×2,
   ov021×5. `.s` files and their delinks entries were removed.
5. **Gate**: EUR `ninja sha1` PASS, then USA + JPN.

All three regions run in this branch before the PR.

## Concurrency artifact — ov006 and ov008

The initial pass ran 11 overlays in parallel (11 background Python processes each
calling wine/mwasmarm). Under this load, asm_escape calls for ov006 and ov008
returned spurious not-byte-identical results (likely mwasmarm temp-file conflicts
under high concurrency). Both reported 0 ships in the concurrent first pass.

A serial second pass (triggered by the monitor framework re-queuing the sweeps)
found 66 ships for ov006 and 54 ships for ov008 — all byte-identical and shipping
cleanly.

**Lesson**: limit concurrent `sweep_overlay.py` jobs to ≤4 if they invoke wine
simultaneously. The sweep tool should serialize at the asm_escape level.

## Residue classification

### Bucket (a) — reg-alloc / scheduling walls

ov006 residue: 25 functions remain in gap objects after 66 ships (87+4=91 total
found; 66 clean → 25 remain). Of the 25: ~21 no-match (reg-alloc permuter targets)
+ 4 asm-fail (ldr-pool-out-of-range: 021ba364 size 0x15f0, 021bf844 size 0x13d0;
bl-fffe unsymbolized targets ×2).

ov004 ARM: 50 functions remain (reg-alloc walls of varying size, not swept in this
brief per kickoff constraint).

### Bucket (b) — kind:data C-absorbed REFUSE

ov004 ARM: 9 already-classified REFUSE (from brief 415).
ov005: 1 REFUSE — `func_ov005_021acfb0`, 24-instruction indirect-dispatch (permuter
target). The `--whole-function` REFUSE came from a pool-constant literal that
`preflight_data_refs` flagged. Actually a bucket (a) wall at the assembler boundary;
classified bucket (b) conservatively here.

### Bucket (c) — Thumb-tooling-blocked (KEY DELIVERABLE)

Only ov004 has Thumb functions in gap objects. All other non-ov002 overlays are
100% ARM with 0 Thumb remaining.

The 15 Thumb functions in ov004 (confirmed via `symbols.txt kind:function(thumb,…)`):

| Address   | Size  |
|-----------|------:|
| 021dbc8c  | 0x7c  |
| 021dc0ac  | 0x3c  |
| 021dc474  | 0x8c  |
| 021dc570  | 0xf4  |
| 021dc830  | 0x124 |
| 021dc998  | 0xce  |
| 021dca68  | 0x162 |
| 021dcbcc  | 0x22  |
| 021dcbf0  | 0xd8  |
| 021dce74  | 0xc2  |
| 021dd648  | 0xaec |
| 021de134  | 0x108 |
| 021de288  | 0x1e4 |
| 021de46c  | 0x190 |
| 021de5fc  | 0x3c  |

**Bucket (c) = 15 Thumb functions in ov004.** This sizes the pending scaffolder
Thumb-emitter brief at ≤15 functions; the `#pragma thumb on` + mwcc 1.2/sp2p3
pipeline from brief 393 applies.

### Total project-wide residue (non-ov002, non-main, post-brief-417)

| Bucket | Count | Overlay(s) | Action |
|:------:|------:|------------|--------|
| (a) reg-alloc/sched walls | ~75 | ov004(50 ARM) + ov006(25) | permuter / `.s` |
| (b) kind:data REFUSE / pool-const | 10 | ov004(9) + ov005(1) | park |
| (c) Thumb-tooling-blocked | 15 | ov004 | Thumb-emitter brief |

ov002 and main are tracked separately (scaffolder lane; ~2478 ov002 + main stragglers).

## Verification

| Gate | Status |
|------|:------:|
| 355 `.s` files byte-identical vs delinked `.o` | ✓ |
| 16 `.c`/`.s` dual-entry conflicts detected and resolved | ✓ |
| Delinks duplicates from concurrent run detected and removed | ✓ |
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| All touched delinks: 0 inversions | ✓ |
