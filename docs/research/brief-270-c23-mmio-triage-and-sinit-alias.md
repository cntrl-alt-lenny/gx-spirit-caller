[//]: # (markdownlint-disable MD013 MD041)

# Brief 270 — C-23 real-MMIO triage + the `.p__sinit` "blocked" family

**Status:** both deliverables settled. Direct-mwcc only (no ROM build,
no SHA1). Every verdict is a real mwcc compile this session vs the
`dsd`-delinked orig bytes.

## Headline

- **(A)** The C-23 real-MMIO tier (221 unmatched) is **95 %
  reg-alloc-sensitive** — 209/221 carry a materialized VALUE-constant
  that competes with the MMIO base register (the brief-269 `be9c`
  failure mode), now quantified with a precise discriminator. The
  **11 truly-clean (`be38`-class)** are the drainable sub-worklist;
  one fresh member (`func_ov006_021b4d68`) verified byte-identical.
- **(B)** The ov006 "blocked" family is **NOT blocked.** Its guard
  global `data_ov006_021cf140` is a clean dsd-local bss symbol —
  already `.global`-defined in `data_ov006_bss.s` and already
  referenced by two shipped siblings. The dotted `.p__sinit_ov003_
  021cf114` merely shares address `0x021cf140` (overlay overlap). The
  21-member family drains with **`return` the guard value** + the
  direct symbol. (mwcc rejects GCC asm-labels, so dotted symbols are
  unreachable from C anyway — but none is needed here.)

## (A) C-23 real-MMIO split — discriminator + worklist

**The wall recap (brief 086/199):** mwcc 2.0/sp1p5 folds 3+ MMIO pool
loads into one base+offset; 1.2/sp2p3 doesn't. Route `.legacy.c`. This
fixes the *base-fold* — but only if base-folding is the **only** issue.

**The discriminator (this brief).** `be38` (shipped) vs `be9c` (failed)
differ by exactly one thing: `be9c` stores a **value-constant**
(`mov r3, #0x1000`), which must occupy a register alongside the 3 MMIO
bases and tips the allocation; `be38` stores only args + `{0,1}`. So:

> A C-23 MMIO pick is **drainable** iff it materializes **no VALUE
> constant** that competes with the MMIO base — no `mov rN, #K`
> (K ≥ 0x100) and no pool `.word` that is a value (`< 0x01000000`,
> e.g. a mask `0x1ff`) rather than an address. Otherwise it is
> reg-alloc-sensitive → **defer** (per-pick / permuter).

| Tier | n | Signal |
|---|--:|---|
| **Drainable** (`be38`-class) | **11** | no value-constant; small; ≤6 pool loads |
| Defer — value-constant | 146 | `mov #K≥0x100` or pool value-word competes with MMIO base |
| Defer — large / many-pool | 63 | n > 24 or > 6 pool bases (reg-alloc unpredictable) |

**Anchors validate the split:** `be38` → drainable (shipped);
`be9c` → defer (`mov #0x1000`); `ov013:021ca5d4` → defer (pool value
`0x1ff` + mask expr, piloted → diverges, extra `lsl` + reg swap).

**Drainable sub-worklist (11; `0208be38` already shipped):**

```text
main:0208c2e0   ov021:021aa848
ov006: 021b2690 021b3240 021b382c 021b3dd0 021b4668 021b4d68 021b5340 021b5994
```

The 8 ov006 picks are a **uniform family** (guard → OR/compute globals →
write one MMIO reg → `return 1`). **Verified byte-identical this
session:** `func_ov006_021b4d68` (16 insns, 5 relocs all matching) on
the **default tier** (Style B `pop {pc}`; only one MMIO ref, so no
base-fold to undo — `.legacy.c` not even needed here).

**Drainable gotcha — commutative-operand order (gotcha 19).** The first
attempt put the `orr` operands in the wrong order; orig evaluates the
*shifted* term first. Source operand order controls pool-word order +
the commutative-op operand assignment: write
`(data_020c3e48 << 1) | data_02103da0` (shifted term first), not
`data_02103da0 | (data_020c3e48 << 1)`.

## (B) The ov006 `.p__sinit` family — not blocked

**What brief 269 saw:** the guard global at `0x021cf140` displays (in
objdiff) as `.p__sinit_ov003_021cf114` — a dotted compiler symbol
(`__sinit` = MWCC static-init routine; `.p__sinit` = its pointer word),
unreferenceable from C.

**What is actually true:**

1. `dsd`'s `ov006/relocs.txt` resolves `0x021cf140` to
   **`module:overlay(6)`** — the gap-obj reloc is
   `R_ARM_ABS32 data_ov006_021cf140`, a clean C identifier. The dotted
   `.p__sinit_ov003_021cf114` (in ov003) just shares the address
   because ov003 and ov006 **overlap** (overlay swap) — a red herring.
2. `data_ov006_021cf140` is already `.global`-defined in
   `src/overlay006/bss/data_ov006_bss.s` and already referenced by two
   **shipped** siblings (`func_ov006_021b23c8.c` does literally
   `data_ov006_021cf140 = 0x11;`). The symbol works end-to-end.
3. **mwcc rejects GCC asm-labels** (`extern int x asm(".p__sinit…");`
   → mwcc error: `asm("rN")` is reserved for *global register
   variables*). So a dotted symbol is unreachable from C regardless —
   but here a clean alias already exists.

**Recipe — `return` the guard value (gotcha 1).** The family
is `r = guard(); if (r) data_ov006_021cf140 = K; return r;`. Declaring
the function **`void`** misses by one register (mwcc reuses r0 for the
store address); **returning the guard value** keeps r0 live, forcing the
store address into r1/r2 — matching orig. **Verified byte-identical on
both sub-shapes:**

```c
/* simple guard — func_ov006_021b2b08: 8/8 byte-identical */
int f(void) { int r = func_ov005_021acfb0();
              if (r) data_ov006_021cf140 = 9; return r; }

/* multi-call guard — func_ov006_021b2970: 16/16 byte-identical */
int g(void) { int r = func_ov006_021c19ec(data_ov006_0225cbb8);
              func_ov006_021b2668(); func_ov006_021c1cb8(data_ov006_0225cbb8);
              func_ov006_021b2690();
              if (r) data_ov006_021cf140 = 6; return r; }
```

**Family worklist (21 unmatched; reference `data_ov006_021cf140`
directly + `return` the guard):**

```text
021b2280 021b22c8 021b2324 021b2400 021b2620 021b2690 021b26e0 021b2760
021b2804 021b287c 021b28c0 021b2970 021b29b0 021b2a58 021b2b08 021b2b28
021b2bd4 021b2c9c 021b2cbc 021b2d5c 021b2de0
```

(`021b2690` is also in the (A) drainable list — it both reads MMIO and
writes the cf140 guard.)

**Mechanism for genuinely-dotted symbols (future).** If a dotted
`.p__sinit_*` ever has **no** dsd-local alias, the fix is a one-line
`.global` alias in the overlay's bss/data `.s` (the `data_ov006_bss.s`
pattern), then reference the alias from C — **not** an asm-label (mwcc
rejects it). No shim is needed for this family.

## Falsification ledger (this session)

| Pick | Deliverable | Lever | Result |
|---|---|---|---|
| `func_ov006_021b4d68` | (A) drainable | direct C + shifted-term-first | byte-identical 16/16, 5 relocs |
| `func_0208be38` | (A) drainable anchor | `.legacy.c` recipe | shipped (brief 269) |
| `func_0208be9c` | (A) defer anchor | — | `mov #0x1000` reg-alloc diverge |
| `func_ov013_021ca5d4` | (A) defer anchor | pool `0x1ff` mask | piloted → diverges (extra `lsl`) |
| `func_ov006_021b2b08` | (B) guard family | `return r` | byte-identical 8/8 |
| `func_ov006_021b2970` | (B) guard family | `return r` | byte-identical 16/16 |
| `extern x asm(".p__sinit…")` | (B) mechanism | GCC asm-label | **rejected by mwcc** |

## What did NOT pan out

1. **The asm-label mechanism.** mwcc reserves `asm("…")` after a decl
   for global register variables (`asm("rN")`); a symbol name is a
   syntax error. Dotted symbols are unreachable from C — the fix is a
   `.s` alias, but the cf140 family doesn't need one.
2. **`ov013:021ca5d4` as "drainable".** The mov-only heuristic first
   mis-tiered it; adding the pool-value-constant signal (`0x1ff`)
   correctly moves it to defer (piloted divergence confirms).
3. **The C-23 real-MMIO tier as "the easy 220".** Only 11/221 are
   clean; 95 % carry the `be9c` reg-alloc risk. Brief 269's instinct
   was right — now quantified.

## Scope

Docs-only research. No `.c` ships (pilots in `/tmp`). No shim/symbols.txt
change needed — `data_ov006_021cf140` already exists. recipe-gotchas
gains gotcha 18 (dotted-symbol / overlay-overlap alias) + 19
(commutative-operand order); the C-23 MMIO doc gains the reg-alloc
discriminator. The Family F/G / C-39f / C23-noMMIO cohorts (brief 271)
are untouched.

## Verification

| Gate | Status |
|---|:---:|
| direct-mwcc pilots | 3 byte-identical (021b4d68 / 021b2b08 / 021b2970) + 2 defer-anchors confirmed diverging |
| `ruff check .` | clean |
| `tests/` (full suite) | 2276 passed (docs-only; index regenerated) |

## Cross-references

- `docs/research/first-wave-wall-mmio-base-folding.md` — the C-23 MMIO
  recipe; this brief adds the reg-alloc-sensitive split.
- `docs/research/brief-269-overfire-drain-wave4.md` — flagged both the
  C-23 reg-alloc sensitivity and the ov006 "blocked" family.
- `docs/research/recipe-gotchas.md` — gotcha 18 (dotted-symbol /
  overlay-overlap alias), gotcha 19 (commutative-operand order).
