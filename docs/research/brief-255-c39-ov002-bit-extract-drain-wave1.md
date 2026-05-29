[//]: # (markdownlint-disable MD013 MD041)

# Brief 255 — C-39 ov002 bit-extract drain, wave 1 (first post-C-42 wave)

**Brief:** 255 (decomper). Drain the 121 sole-C-39 ≤0x80 ov002 picks
(brief 252's scout cohort), smallest-first, with the verified bitfield
recipe; map wrappers to gotchas 4/5/7; STOP + report resisters.

## Headline

**24 .c shipped, all objdiff 100 % + 3-region SHA1 PASS.** 28 picks
attempted → **24 shipped / 4 reported as resisters = 86 % yield**
(within brief 252's 70-90 % projection). The C-39 base recipe
(bitfield `bit0` + `1 - bit0` + u16-cast-where-typed) and the
wrapper→gotcha mapping (4/5/7 + the brief-253 invert-polarity gotcha)
cover the cohort's wrappers. The resisters are a single coherent
sub-pattern: a **bit0-indexed strided table lookup** with a
reg-alloc / index-codegen divergence.

The cohort is shape-diverse exactly as scouted: the 121 picks
canonicalize to **113 distinct signatures (106 singletons)** — this is
pick-by-pick work, not a batch drain, but the mature catalog handles it.

## Recipe confirmation

Pilot `func_ov002_0223fd2c` re-confirmed end-to-end:
`objdiff 100 % (40/40 bytes)` + EUR SHA1 OK. The two required forms held
across the wave: **bitfield `self->bit0`** (not `& 1`) keeps the
`lsl#31;lsr#31` extract, and **`1 - self->bit0`** (not `== 0`) avoids
predication. New per-pick lesson: **match the helper arg's `u16`-vs-`int`
type to the disasm** — a `u16`-typed arg emits an extra `lsl#16;lsr#16`
the orig lacks when the orig's arg is `int` (`021ff954`, fixed).

## Shipped — 24 picks by wrapper shape (clean-vs-wrapped split)

| Wrapper class | Gotcha | Picks | Count |
|---|---|---|---:|
| Base: `helper(self, ±bit0); return K` | — | `0223fd2c` `02223e00`(reg-shift) `02229574`(4-arg) | 3 |
| `helper1(bit-expr…) + null-guard + tail helper2(self,arg)` | — | `02235d40` `0229126c` `022928d8` `02294e04` `02203db4`(fnptr) `022931f4` `0220a744` `0220ae74` `0220e0cc` | 9 |
| reg-alloc / arg-order (self or temp placement) | 7 | `02221af8`(self last, fnptr) `02201810`(5-arg, stack) | 2 |
| sign-check `if (r < 0) {…}` | 5 | `021f5058` | 1 |
| XOR of two bitfields `bit0 ^ bit14` | 4 | `02204168` | 1 |
| range-check guard (`b6_11 ==` …) + base/helper | — | `02217418`(bit2@4) `021ff954` `022044a4` `02208798` `0220dc20` | 5 |
| store-result `self->fc = helper1(…); helper2` | — | `02295ec4` | 1 |
| u16-field cast `helper(bit0, (u16)f14)` | — | `0221b23c` | 1 |
| inverted polarity (shared `return 0` epilogue) | 253 | `022879cc` | 1 |

`24/24 at objdiff 100 %` (per-unit `fuzzy_match_percent`, this session).
Per the brief I report the 100 % lines + the 3-region SHA1 below, not
`complete_units` / C-yield.

## Resisters (4 picks) — reported with byte-diff evidence, not ground on

### Bit0-indexed strided table lookup — `db973` family (3 picks)

`func_ov002_02205508` / `0220c940` / `0220e108`. Orig:
`table[self->bit0]` over a strided table (stride 0x868, base
`data_ov002_022cf17c`), then a null-guard + helper. Two source forms
tried — `*(int *)(base + self->bit0 * 0x868)` and an array-of-struct
`*(int *)&base[self->bit0]` — both produced the **same** 43.75 % miss:

```text
orig:  ldrh ip,[r0,#2]; ldr r2,0x868; ldr r3,base
       lsl ip,#31; lsr ip,#31; and ip,ip,#1        ; field in ip, REDUNDANT and #1
       mul r2,ip,r2; ldr r2,[r3,r2]                ; pools in r2/r3
mine:  ldrh r2,[r0,#2]; ldr r0,0x868; ldr r1,base
       lsl r2,#31; lsr r2,#31                       ; field in r2, NO and #1
       mul r0,r2,r0; ldr r0,[r1,r0]                 ; pools in r0/r1
```

Divergence is reg-alloc (orig field→ip, pools→r2/r3; mine field→r2,
pools→r0/r1) **plus** orig's redundant `and ip,ip,#1` index mask. No
source form observed that reproduces the index-codegen. **Candidate:
new C-39 sub-shape "bit0-as-table-index" or reg-alloc plateau** — wants
a scaffolder classification pass.

**Same sub-pattern, not attempted** (avoid grinding; db973 empirically
pins the mechanism): `8446c` (`02206490`/`02208720`), `f030a`
(`02204a68`/`0220b208`), `46a3d` (`022958a8`/`02296f54`), `e9e9e`
(`022056f0`/`0220aa64`) — 8 more picks with the same `mul stride; ldr
[base, idx]` table lookup. Expect the same divergence.

### Reg-alloc field-temp near-miss — `02200084` (1 pick)

`if (b6_11 == 2) return helper1(bit0, b1_5, f0); else helper2()`. 73.3 %.
The ONLY divergence is the CSE'd field@2 temp register:

```text
orig:  ldrh r3,[r0,#2]  … lsl r0,r3,#0x1f / lsl r1,r3,#0x1a   ; field kept in r3
mine:  ldrh r1,[r0,#2]  … lsl r0,r1,#0x1f / lsl r1,r1,#0x1a   ; field in r1, reused for b1_5
```

mwcc CSE'd the field into b1_5's destination reg (r1); orig kept it in
r3. The helper already takes 3 args (no free gotcha-7 lever), and the
field is loaded before any arg is live, so r1 is mwcc's natural choice.
Reg-alloc near-miss; left for a permuter pass.

### Deferred-complex (not attempted — not a clear catalog recipe)

`02208760` (multi-bitfield range + multi-return), `0220b774` (3-field
multi-extract), `0223ba28` (global-deref + XOR), `021f4d3c` (byte-pack
of two bit-exprs). These are larger composite shapes that belong to a
classification pass, not a wave-1 pilot.

## For the brain — permuter-pivot timing

- **C-39 drain is healthy.** 86 % yield this wave confirms the cohort is
  coercible by the mature catalog. The wrapper→gotcha mapping
  (4/5/7 + invert-polarity) plus per-pick `u16`/`int` matching is the
  whole toolkit.
- **Remaining ov002 sole-C-39 ≤0x80: ~97 picks** (121 − 24 shipped).
  Of those, ~11 are the table-lookup sub-pattern (likely resist) and ~4
  are deferred-complex; the rest (~80) are more wrappers, drainable in
  **wave 2 (and likely a wave 3)** before the permuter pivot.
- **One concrete classification ask for the scaffolder:** the
  bit0-indexed strided-table lookup (db973 + relatives, ~11 picks) —
  is the `field→ip + redundant and#1 + pool-first` codegen a new C-39
  sub-shape with a coercing idiom, or a P-N reg-alloc plateau?

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| objdiff per-pick | 24/24 at 100 % |
| `tools/check_match_invariants.py` | 0 errors (4416 pre-existing warns) |
| `ruff check .` | clean |
| `tests/` (full suite) | 2264 passed |

## Cross-references

- `docs/research/brief-252-post-c42-next-track-scout.md` — the C-39
  cohort + verified recipe this wave executes.
- `docs/research/codegen-walls.md` § C-39 + recipe-gotchas.md gotchas
  4 / 5 / 6 / 7 — the wrapper recipes.
- `docs/research/brief-253-*.md` — the invert-polarity gotcha reused on
  `022879cc`; the per-overlay-symbol caveat confirmed on the 86235 /
  db973 / 619c twins.
