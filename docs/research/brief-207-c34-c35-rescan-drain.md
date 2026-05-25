# Brief 207 — C-34 / C-35 re-scan drain

**Brief:** 207 (decomper). Phase 1: drain `func_02023478` (deferred
by brief 205 due to a patcher-trim edge case brief 204 was expected
to fix). Phase 2: full EUR re-scan via the new C-35-aware classifier,
harvest any picks brief 205 missed.

## Headline

**32 of 33 attempted picks shipped byte-match.** Far above brief
207's 1-5 realistic expectation. Phase 1 surfaced a NEW failure
mode (brief 204's trim-protect doesn't cover literal-tail with
zero high bits). Phase 2 yielded 5 small main + 27 overlay picks
the brief 205 sweep missed (because brief 205 scoped to main +
size 0x40-0x100; brief 207 extended to all main sizes + all
overlays).

| Phase | Module | Picks shipped | Picks skipped |
|---|---|---:|---:|
| 1 | main | 0 | 1 (func_02023478) |
| 2 | main | 5 | 0 |
| 2 | overlay | 27 | 0 |
| **Total** | | **32** | **1** |

`complete_units += 32`. 3-region SHA1 PASS preserved (EUR / USA / JPN).

## Phase 1 — func_02023478 (NEW failure mode)

Brief 207 expected brief 204's patcher trim-protect to make this
pick ship cleanly. **It doesn't.**

### The remaining trim trap

Brief 204's patcher fix protects sections where a RELOCATION
targets the last 4 bytes — preventing trim of relocation-tails.
But `func_02023478`'s pool layout has:

```asm
.L_020234ec:    .word data_0219a8dc       ; offset 0x74 — relocation
.L_020234f0:    .word data_0219a8dc       ; offset 0x78 — relocation
.L_020234f4:    .word 0x7fff              ; offset 0x7c — LITERAL
```

The last 4 bytes (0x7c-0x7f) contain `0x7fff` encoded LE =
`ff 7f 00 00`. The last 2 bytes are `0x00 0x00`. mwasm writes
these as actual data (no relocation). The patcher's trim-protect
check `any(0x7c <= reloc_offset < 0x80)` returns FALSE — trim
fires, section shrinks to 0x7e, downstream functions cascade-shift.

### Workarounds that don't work

The brief 205 "literal-promotion" workaround (replace symbol-ref
last entry with `0x020c3e84`-style literal whose LE last byte is
0x02) doesn't apply here — `0x7fff` is genuinely the value the
function needs, and its high bits are inherently zero.

A "trim-protector word" approach (append a `.word data_X` at
offset 0x80 to force a relocation in the new last-4-bytes
region) FAILS because:
1. The patcher trim-protect fires (good)
2. BUT mwasm's section size becomes 0x84, not 0x80
3. The linker copies 0x84 bytes, overflowing `func_020234f8`'s
   first 4 bytes by 4 → cascade-shift

The clean fix is to expand brief 204's trim-protect to also
recognize "any literal value whose section-size matches the
slot's intended size from delinks.txt" — but that needs
scaffolder work and a delinks.txt cross-reference at patch
time.

Stub preserved at `src/main/func_02023478.s.deferred`. Awaiting
a brief 208+ patcher enhancement.

## Phase 2 — full re-scan results

Classifier output (`tools/predict_walls.py --version eur`):
- 62 total C-34 candidates across all modules
- 0 C-35 candidates (brief 204's composite classifier added the
  detector, but the EUR codebase has no functions matching the
  C-35 pattern beyond brief 204's worked example `func_02021b38`)

### Picks shipped (main, outside brief 205's 0x40-0x100 window)

| Pick | Size | Notes |
|---|---:|---|
| `func_0202111c` | 0x3c | below brief 205's lower bound |
| `func_02021158` | 0x38 | below |
| `func_02023fec` | 0x38 | below |
| `func_0202a240` | 0x3c | below |
| `func_02023274` | 0x204 | above brief 205's upper bound |

Also retried `func_020212cc` (0x160) — has the SAME literal-tail
trim trap as `func_02023478` (last entry `.word 0x618`). Skipped.

### Picks shipped (overlays — out of scope in brief 205)

| Overlay | Picks |
|---|---|
| ov001 | 1 (`021ca144`) |
| ov002 | 6 (`021c4c9c, 021e4ba8, 022476e8, 02247ad8, 02247b6c, 022b595c`) |
| ov004 | 5 (`021ca198, 021ca4f8, 021cab44, 021cb060, 021cb290`) |
| ov006 | 1 (`021be948`) |
| ov008 | 7 (`021aa94c, 021ac2ac, 021adaa8, 021adc44, 021ae3a0, 021ae70c, 021b01d8`) |
| ov010 | 1 (`021b3a1c`) |
| ov012 | 1 (`021c9f48`) |
| ov014 | 1 (`021b2908`) |
| ov016 | 2 (`021b2d4c, 021b8774`) |
| ov017 | 1 (`021b680c`) |
| ov020 | 1 (`021abbe8`) |

### Picks NOT attempted

Per the brief's filter — pool layouts with literal-tail (low
high bits) hit the same trim-trap as func_02023478, so were
skipped:

- `ov002:021aba60` last `.word 0xffff` → trim trap
- `ov002:021d9828` last `.word 0x868` → trim trap
- `ov002:0220eb00` last `.word 0x868` → trim trap
- `ov018:021ab1c4` last `.word 0x1ff` → trim trap
- `ov004:021dd648` — Thumb function, recipe needs `.thumb` directive (separate work)
- `ov011:021d3620` — already shipped via existing `.c` stub (sinit)

## Recipe used

Same as brief 202's vanilla `.s` recipe (no workarounds needed
for the picks that landed):

```asm
        .text
        .extern data_<sym>
        .global func_<addr>
        .arm

func_<addr>:
        ; ... orig body verbatim ...
.L_POOL_A:
        .word   data_<sym>
.L_POOL_B:
        .word   data_<sym>     ; duplicate — brief 202's C-34 trigger
.L_POOL_C:
        .word   data_<other>   ; or whatever the last entry was in orig
```

When the last entry is a `.word data_<sym>` (symbol ref) and the
symbol's address has non-zero high bits — i.e. all DS RAM
addresses 0x020xxxxx and overlay BSS 0x021/0x022/0x023xxxxx —
brief 204's patcher trim-protect fires (relocation in last 4
bytes), the section stays at its mwasm-emitted size, and the
linker packs everything correctly.

## Generator script

A decomper-local Python helper at `/tmp/gen_c34_s.py` converts
disasm to .s files. Two key transforms:
1. Extract data symbol refs (`data_<hex>`, `data_ov<N>_<hex>`)
   and function refs (from BL targets AND `.word func_...`
   pointer-table entries) → emit `.extern` directives
2. Strip `arm_func_start`/`arm_func_end` macros and `.text`
   directive (regenerate header at top)

Not committed; brief 208+ could formalise into `tools/` if
useful for future drains.

## Recommendation for brief 208+

1. **Enhance patcher trim-protect to handle literal-tails.**
   Cross-reference delinks.txt slot size during the patcher
   pass. If section's mwasm-emitted size matches the delinks
   slot size, never trim — the bytes are real, not padding.
   This unlocks `func_02023478`, `func_020212cc`, the 4 ov002/
   ov018 picks, and any future picks with literal-tail patterns.

2. **Thumb function recipe.** `ov004:021dd648` was the only
   Thumb C-34 candidate — the recipe extension is mostly
   `.thumb` directive + `.thumb_func` for the entry symbol.
   Worth a brief 208+ probe.

3. **Sweep complete?** Brief 207's full scan + sweep leaves
   ~6 C-34 candidates skippable for the above reasons. Once
   the patcher enhancement lands, those 6 should ship cleanly.

## Cross-references

- `docs/research/first-wave-wall-address-cse.md` — brief 202's
  C-34 wall research note
- `docs/research/first-wave-wall-routing-trilemma.md` — brief 204's
  C-35 composite + trim-protect fix
- `docs/research/brief-205-c34-full-scan-drain.md` — brief 205's
  initial main drain
- `tools/patch_section_align.py` — patcher (trim-padding +
  trim-protect heuristic)
- `src/main/func_02023478.s.deferred` — preserved deferred stub
