# Trivial-bucket re-validation — post-brief-211 (2026-05-25)

Brief 213 deliverable: re-validate the trivial-bucket (size ≤ 0x20)
worklist from
[`docs/research/unmatched-function-pool-survey-2026-05-25.md`](unmatched-function-pool-survey-2026-05-25.md)
against current state, then drain the surviving picks.

## Survey-vs-current drift

Brief 211 noted that surveys >3 briefs old need re-validation. The
2026-05-25 survey reported "Trivial (≤0x20) 231 picks" but used a
size-only bucket boundary; `tools/next_targets.py`'s tier classifier
splits the same address pool differently:

| Tier (next_targets.py)  | Definition              | Matched   | Unmatched   | Total |
|------------------------ |-------------------------|----------:|------------:|------:|
| `trivial`               | leaf, size ≤ 4 (`bx lr`) | 136       | 0           | 136   |
| `easy`                  | leaf, size ≤ 0x20       | 954 → 985 | 156 → 125   | 1110  |

The survey's "trivial (≤0x20)" maps to the tool's `easy` tier (leaf +
size ≤ 0x20). At the start of brief 213, that bucket held **156
unmatched picks**. Brief 213 drained 31 of them: easy tier now 985 /
125 / 1110 (88.7% matched, up from 85.9%).

The survey's named-BIOS-thunks pre-emption finding (`brief 211 Phase
2`) was confirmed: the dedicated BIOS thunk family is fully matched.

## Drain composition (31 picks shipped)

### Wave 1 — validation (4 picks)

Pure pool-load shapes. 3 of 4 matched as C, 1 needed `.s` (mwcc's
`tst r0, #1` shortcut for `(x & 1) ? 1 : 0` doesn't reach the orig
`lsl/movs lsr; movne/moveq` pattern):

| Module   | Address      | Size  | Shape                  | Recipe |
|----------|--------------|-------|------------------------|--------|
| main     | `0x020a584c` | 0x18  | bit-0 extract → 0/1    | `.s`   |
| ov002    | `0x022b8424` | 0xc   | `*p->_c5c = v; return 1;` | `.c`   |
| ov004    | `0x021d38a4` | 0x10  | global setter          | `.c`   |
| ov004    | `0x021d38b4` | 0x10  | global getter (already referenced as `extern` by `func_ov004_021d3dc8`) | `.c` |

### Wave 2 — pool-load setters / getters / predicates (8 picks)

5 of 8 matched as C, 3 `.s` (same `lsl/movs lsr; movne/moveq`
bit-test family + one struct-init where the pointer-load codegen
diverged):

| Module | Address      | Shape                                  | Recipe |
|--------|--------------|----------------------------------------|--------|
| main   | `0x020454f0` | two-global setter                      | `.c`   |
| ov002  | `0x021afb74` | `return &table[other_table[2]]`        | `.c`   |
| ov008  | `0x021b1ee0` | double-deref + offset                  | `.c`   |
| ov002  | `0x0229a04c` | `u16[]` indexed lookup                 | `.c`   |
| ov000  | `0x021ab6cc` | byte-zero check                        | `.s`   |
| ov000  | `0x021af5c0` | byte-zero check                        | `.s`   |
| main   | `0x02088d5c` | zero two globals                       | `.c`   |
| main   | `0x0207deb0` | 4-field struct init                    | `.s`   |

### Wave 3 — ov002 `0x0226acf8` trampoline cluster (18 picks)

Single dispatcher (`func_ov002_0226acf8`, signature `(int, int, u16,
u16)`) reached via 18 thin trampolines that munge args + set a
constant index in `r1`. Same shape across all 18, all shipped as
`.s` files since the recipe is mechanical:

```
ldr   ip, .L_target
mov   r3, r2, lsl #0x10     ; zero-extend r2 → r3 as u16
mov   r1, r1, lsl #0x10     ; zero-extend r1 → r2 as u16
mov   r2, r1, lsr #0x10
mov   r3, r3, lsr #0x10
mov   r1, #<index>          ; per-trampoline constant
bx    ip
.L_target: .word func_ov002_0226acf8
```

Addresses: `0x0226ae30`, `0x0226af38`, `0x0226af58`, `0x0226af78`,
`0x0226af94`, `0x0226afb4`, `0x0226afd0`, `0x0226aff0`, `0x0226b034`,
`0x0226b094`, `0x0226b0b0`, `0x0226b0d0`, `0x0226b11c`, `0x0226b13c`,
`0x0226b158`, `0x0226b174`, `0x0226b194`, `0x0226b258`, `0x0226b298`.

## Phase 3 — `Entry` close-pick (98.73% → 100% fuzzy)

`Entry` (`src/main/Entry.c`, 316 B) was already shipped as `asm
void` with full disassembly comments. Only one pool word diverged:
offset `0x128` (the 5th `.word` in Entry's literal pool).

Root cause: orig's delinked `.o` has the **address** `0x02000b68`
baked into that pool slot as a raw `.word`. My build has a
relocation against the symbol `BuildInfo` (which `symbols.txt` maps
to `0x02000b68`). Both link to the same byte in the final ROM (SHA1
matches), but `objdiff_resolve_relocs.py` resolves symbols to a
fictional FNV-hash address — so the resolved sidecars differ.

The other pool words (`main`, `func_01ff8180`, `data_027e0000`,
etc.) match because they ARE listed in `relocs.txt` and dsd's
delink emits them as symbolic relocations.

**Fix:** add `from:0x02000928 kind:load to:0x02000b68 module:main`
to `config/<region>/arm9/relocs.txt` for all three regions. dsd then
emits a relocation against `BuildInfo` in the delinked `.o`,
matching my build. SHA1 PASS preserved across all three regions
after the change.

This is the same root-cause class as brief 209's stragglers —
relocation-record divergence between dsd's delink and the source
build — but with a different remediation path: brief 210 patches
mwasmarm output; here we add the missing reloc to the config.

## Aggregate metric deltas (EUR)

|                          | Before | After | Δ            |
|--------------------------|-------:|------:|-------------:|
| `matched_functions`      |  1701  | 1733  | **+32**      |
| `complete_units`         |  1672  | 1703  | **+31**      |
| `matched_code_percent`   | 4.571% | 4.621%| +0.050 pp    |
| `fuzzy_match_percent`    | 5.632% | 5.668%| +0.036 pp    |

3-region SHA1 PASS preserved per pick: EUR ✓, USA ✓, JPN ✓.

## Recipe-routing breakdown

| Recipe                  | Count |
|-------------------------|------:|
| `.c` (mwcc 2.0)         | 9     |
| `.s` (vanilla recipe)   | 22    |

The bit-test → 0/1 family (`lsl/movs lsr; movne/moveq`) hit four
picks in this round. Each ships cleanly as `.s` but doesn't reach
from plain C — mwcc 2.0 collapses `(x & 1) ? 1 : 0` to `tst r0, #1`
which is 1 instruction shorter. A future scaffolder brief could
investigate whether a bitfield + cast idiom reaches the orig
shape, or classify this as a permanent C-N wall family. Until
then, `.s` keeps the matched_functions ticker moving (thanks to
brief 210's `$d → $a` patcher).

## Picks deferred (not attempted this round)

Hard-recipe picks I sampled but skipped:

| Module | Address      | Shape                          | Reason |
|--------|--------------|--------------------------------|--------|
| main   | `0x020a9914` | epilogue orphan (2-insn pop)   | needs careful neighbour-fn analysis; `.s` viable but defer |
| main   | `0x02074e4c` | epilogue orphan (`ldmia`+`bx`) | same |
| ov004  | `0x021dbe5c` | Thumb interwork shim           | C-31 family — brief 191 recipe applies but lower priority |
| various | thumb picks | Thumb mass-init / Thumb bit-test | Thumb routing has its own caveats |

`easy` tier currently shows 125 unmatched remaining (down from
156). The next 30 should come from the same recipe pool plus the
Thumb shim family.

## Notes for the brain

1. **Survey staleness confirmed.** The 2026-05-25 survey was 3
   briefs old when brief 213 ran; the trivial-bucket count was
   accurate (the size-≤-0x20 set has 156 not 231 — the survey
   over-counted by including non-leaf picks).
2. **Baseline drift.** State.md reported `matched_functions=1698`
   at the start of this round; a fresh local build showed `1701`
   before any of my changes landed. Likely the brain hadn't done a
   fresh `ninja objdiff report` after #666 + brief 211 merge.
3. **Brief 210's promise verified.** All 22 `.s` ships in this
   round registered as `matched_functions: 1/1` directly, no manual
   intervention needed.
4. **Brief 213 success criterion met:** ≥ 30 ships (31 actual) +
   3-region SHA1 PASS preserved + 0 match-invariants errors + ruff
   clean.
