[//]: # (markdownlint-disable MD013 MD041)

# Brief 325 — ov008 co-drain wave 2 (medium tier)

**Brief:** 325 (scaffolder, co-drain). Drain ov008's `0x98–0xf4` medium tier
family-first (command-record packs, byte-combine stride-52 builders, fixed-point
div-magic) + confirm the wave-1 `021b2268` pool-layout near-miss. Per-pick gate =
EUR objdiff 100% (direct-mwcc). Collision-free (decomper on ov016). Target
~10–15; **flag when yield drops, then we pivot**.

## Headline — yield dropped HARD; the medium tier is permuter/m2c-bound

**1 shipped** (`021aa578`), EUR objdiff 100%, drops from a clean re-delink, EUR
`ninja sha1` PASSES. ov008 matched: 24 → **25**.

This is the yield-drop the brief asked me to flag. The `<0x98` easy tier (wave 1
= 12) is gone; the **`0x98–0xf4` medium tier resists direct-mwcc**. I attempted
**7 functions across all four named families + the broader cohort**; only the
one clean shape (a bounds-check) landed. The rest are not "hard to model" — they
are **byte-correct logic that mwcc schedules / allocates differently**, i.e.
exactly what the **permuter / m2c** anneal away and direct-mwcc cannot. Concrete
evidence below.

## The 1 pick

| family | func | objdiff |
|---|---|:---:|
| 4-arg bounds-check (1 call, 2 out-ptrs, `&&`-chain) | `021aa578` | **100%** |

Recipe (banked): a comparison chain that returns 0/1 must be written
`if (A && B && C && D) return 1; return 0;` — the `&&` short-circuits each clause
to a **shared `return 0`** (matching the orig's forward branches), where separate
`if(x) return 0;` statements get **predicated** (`addgt sp;movgt;popgt`) and
diverge, and a boolean-valued `return A && B && …;` computes booleans (worse).

## Why the rest didn't land — wall taxonomy (per family)

Every attempt reproduced the *logic*; the residual diff was always an
mwcc-codegen choice the C front-end won't make:

1. **Command-record packs** (`021abba0`/`abb08`/`aba3c`) — **20v20 register
   allocation**. `((a1-K)&0xff | FLAG) | (((a0-K)<<23)>>7)`. The orig puts
   `a0-K` in a fresh reg (`r3`) and reuses it for the final word; mwcc subtracts
   `a0` **in place** (`r0`). Stable across 4 operand orderings (wave 1 + wave 2).
   → **permuter**.
2. **Byte-combine stride-52 builders** (`021acfa0`/`ac208`/`aceac`/`adbbc`) —
   **mwcc peephole**. The index is `((hw<<16)>>24)+((hw<<24)>>24)`; the orig
   keeps both byte extracts as shifts (`lsl#24` folded into the add), but mwcc
   **simplifies `(hw<<24)>>24` → `and #0xff`**, which can't fold into the add →
   different instruction count + register pressure (`021acfa0` 23v30). Same
   divergence in every member. → **permuter / m2c**.
3. **Fixed-point / div-magic** (`021ac430`/`ac4d0`/`af4c4`) — signed `% 8` via
   the `(x<<29) … ror#29` idiom + nested search loops + range checks. Heavy RE,
   and the rotate-mod idiom is m2c territory.
4. **`021b2268`** — **NOT a pool artifact after all.** Built it and ran the sha1
   gate (the definitive test the brief asked for): **`ninja sha1` FAILED**. The
   29-vs-31 gap is a real codegen difference, not a per-TU pool offset. Reverted.

Broader-cohort near-miss documenting the same pattern: **`021aafa4`** (indirect
dispatch) cycled through **four** distinct codegen divergences as I fixed each —
`popeq`-vs-`beq` terminal return → pool-offset folding (`+2924`) → callee-saved
caching of the global → final **block instruction-scheduling** (the orig
interleaves the global-load between the two field-clears). Ended at 22v25, the
block alone. This is the signature of the whole tier.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (direct-mwcc, per-unit) | **1/1 byte-identical** (`021aa578`) |
| clean re-delink drop-out | **1/1** out of the ov008 gap objects |
| EUR `ninja sha1` | **OK** (full ROM byte-identical) |
| `ruff` / `tests/` / `check_match_invariants` | clean / pass / 0 errors |

`src/overlay008/` gains 1 `.c`; `ov008_core.h` gains a wave-2 §VERIFIED note +
the medium-tier wall taxonomy. No tool / USA / JPN change. Only shared file
`docs/research/README.md` (regenerated).

## Recommendation for the brain

1. **Pivot the scaffolder to a fresh overlay's easy `<0x98` tier** — that is
   where direct-mwcc is productive (ov008 wave 1 = 12, ov006/ov000 waves). The
   ov008 `0x98–0xf4` tier is not direct-mwcc-shaped. (Decomper holds ov016;
   brief-300 ranking after that is open — ov002 has the largest mapped cohort,
   or a fresh small overlay.)
2. **Route the ov008 medium tier to the permuter / decomper.** The near-misses
   are close and well-characterised — high-value permuter inputs:
   - command-record packs `021abba0`/`abb08`/`aba3c` (20v20, reg-alloc)
   - `021aafa4` (22v25, block schedule), `021aa4a0` popcount (27v27, mask sched)
   - byte-combine family (the `(x<<24)>>24` peephole — m2c may differ)
3. The medium tier is **not mined** — it is byte-present and ~half-RE-able with
   the right tool; it is just **the wrong tool for the scaffolder's direct-mwcc
   harness**. Don't burn more direct-mwcc waves on it.

## Cross-references

- `docs/research/brief-323-ov008-wave1-drain.md` — wave 1 (12 picks, easy tier)
  + the original medium-tier list this wave probed.
- `src/overlay008/ov008_core.h` — globals / sink sigs / family recipes /
  §VERIFIED wave-2 wall taxonomy.
