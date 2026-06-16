[//]: # (markdownlint-disable MD013 MD041)

# Brief 413 — thin-overlay sweep 2: 290 `.s` ships across 12 overlays

**Brief:** 413 (decomper). Expand the `asm_escape --whole-function` pass to all
overlays not yet exhausted by brief 409. Seed: 3 optional extras from PR #943
(`ov008/021b2200`, `ov012/021cc01c`, `ov013/021cb700`). Then sweep ov001, ov003,
ov006 residue, ov007, ov009, ov011 residue, ov012, ov013, ov014, ov015, ov019.
Branch: `decomper/overlay-sweep-2`.

## Headline — 290 byte-identical `.s` files; no overlay produced zero ships

Every targeted overlay yielded at least one ship. The full pass produced
**290 new `.s` carves** across 12 overlays, all verified byte-identical
against the original delinked `.o` files. All-3-region sha1 PASS.

| Overlay | Ships | Notes |
|:-------:|------:|-------|
| ov006   |    99 | residue after scaffolder wave 6; batch includes 2 asm-fails |
| ov011   |    71 | full residue drained — all 71 uncarved text symbols CLEAN |
| ov015   |    26 | — |
| ov019   |    23 | 3 stubs already matched (not-found, skipped) |
| ov014   |    18 | — |
| ov009   |    16 | — |
| ov003   |    11 | 1 ldr-pool asm-fail (0x18bc fn skipped) |
| ov007   |    10 | — |
| ov012   |     7 | 5 bl-fffe asm-fails (DTCM/ITCM calls) |
| ov013   |     4 | 5 bl-fffe asm-fails |
| ov001   |     4 | — |
| ov008   |     1 | seed extra from PR #943 |
| **Total** | **290** | |

## Method

Standard thin-overlay sweep protocol from brief 409:

1. **Preflight**: `asm_escape --classify-data --version eur` on each uncarved
   `.text` symbol. A/B-class (aligned TU or dsd-exported gap global) → proceed.
   C-class (absorbed mid-bundle address) → park. OFFSET → park.
2. **Whole-function**: `asm_escape --whole-function --version eur` → assemble
   with `mwasmarm.exe -proc arm5TE` → `cmp` bytes against delinked `.o`.
   CLEAN (byte-identical) → ship.
3. **Delinks**: append `.text start:0x... end:0x...` block; run
   `sort_delinks.py`; verify 0 inversions.
4. **Gate**: EUR `ninja sha1` PASS, then USA + JPN.

All three regions run in this branch before the PR (saves a brain round-trip).

## Asm-fail triage

Two failure modes observed; both are skip-and-document:

### ldr-pool-out-of-range

Functions larger than ~4 KB generate a literal pool that `mwasmarm` cannot
reach with a single `ldr`/`ldrh` from the function body. The emitted `.s`
assembles with "Offset to address out of range" errors.

| Function | Size | Overlay |
|----------|-----:|:-------:|
| 021ca2bc | 0x18bc | ov003 |
| 021bf844 | 0x13d0 | ov006 |

### bl fffe… — unsymbolized DTCM/ITCM calls

The disassembler emits raw hex branch targets for DTCM/ITCM addresses that
have no symbol. `mwasmarm` cannot assemble an unknown `bl` target.

| Function | Overlay |
|----------|:-------:|
| 021cb49c | ov012 |
| 021c9da0 | ov012 |
| 021c9e1c | ov012 |
| 021ca450 | ov012 |
| 021ca964 | ov012 |
| 021ca2b8 | ov013 |
| 021ca42c | ov013 |
| 021ca70c | ov013 |
| 021ca7cc | ov013 |
| 021cb674 | ov013 |

### Assembly failure (unknown shape)

`ov006/021ba364` emitted a `.s` that did not assemble; root cause not diagnosed
(neither bl-fffe nor confirmed ldr-pool). Skipped.

## Stubs / already-matched (not-found)

A handful of 4-byte functions were already covered in multi-function TUs;
`asm_escape` reports "not found in build/eur/delinks". Skipped without action:

ov006: 021b5c28, 021b9ef4, 021c1558, 021c19a4  
ov019: 021b2ae4, 021b465c, 021b52ec

## Notable ov011 delinks bug

During batch-3 appending, a missing newline concatenated the `.bss` section
end address with the following `src/overlay011/func_ov011_021d0cac.s:` path
on a single line, causing dsd to fail with:

```
config/eur/arm9/overlays/ov011/delinks.txt:1130: failed to parse end
address '0x021d4820src/overlay011/func_ov011_021d0cac.s:': invalid digit
found in string
```

Fix: split the line; re-sort. The sort relocated 021d0cac (text) ahead of the
bss entry (021d4000) as expected.

## Verification

| Gate | Status |
|------|:------:|
| All 290 `.s` files byte-identical vs delinked `.o` | ✓ |
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| ov011/delinks.txt sort: 207 blocks, 0 inversions | ✓ |
| ov006/delinks.txt sort: 384 blocks, 0 inversions | ✓ |
| All other touched delinks: 0 inversions | ✓ |
