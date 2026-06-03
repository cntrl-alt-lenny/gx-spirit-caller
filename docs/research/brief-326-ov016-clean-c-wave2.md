[//]: # (markdownlint-disable MD013 MD041)

# Brief 326 — ov016 clean-C wave 2 (consolidate)

**Brief:** 326 (decomper). Finish ov016's remaining `<0x100` mid-tier composites
before pivoting (wave 1 = 15, the two anchor families drained). Named targets:
`021b398c`, `021b7504`, `021b22d8` (only if clean), + a sweep for other clean
shapes. Do NOT force the permuter-class near-misses (`021b287c`/`28f4`, `2824`).
Gate = 3-region `ninja sha1`; audit carve sizes; divmod gotcha holds. Scaffolder
pivoted to ov005 (collision-free).

## Headline

**4 shipped, 3-region `ninja sha1` = EUR / USA / JPN all OK.** Below the 6–10
target — **ov016's clean tier is now drained.** The 4 picks are the realistic
remaining composites; everything else is a well-characterised **wall class**
(MMIO-bitfield-shuffle dispatchers + fixed-point/tile loops + a recursive
quicksort + permuter-class reg-swaps). **ov016 should pivot next wave.**

## The 4 picks

| func | shape | notes |
|---|---|---|
| `021b398c` | list-object rebuild | the 8a30 family's 10-arg `func_0201ef90` template, **minus** the guarded-release — the wave-1 "ambiguous 10-arg" flag dissolved once the template was understood |
| `021b5fb0` | clamped 2-digit number draw | `/10`,`%10` = **constant-divisor smull-magic**, matches via plain C operators |
| `021b7504` | card stat panel | calls `60cc` + `5fb0`×3 at fixed VRAM cells; unsigned clamp + `v=a2*3` placement |
| `021b8cd8` | **5th row-group-rebuild family member** | u16 guard, palette `(u16)*(p+464)+75` re-read per call, ede4 → `data_021bb1a4+28` |

`022b22d8` (the named "if clean" target) is a **62-instruction recursive
quicksort** — not clean (loop + recursion + the inline/outlined-return class); not
attempted per the brief.

## Recipe refinements banked

1. **Constant divisor inlines (matches); variable divisor traps.** `x / 10` and
   `x % 10` compile to smull-magic (`0x66666667`) with the *plain C operators* and
   match byte-for-byte — mwcc even recomputes `x/10` inside `x%10` like the orig,
   no problematic CSE. The `_s32_div_f`-undefined trap (→ explicit `func_020b3870`)
   is **variable-divisor only**. (`021b5fb0`.)
2. **10-arg `func_0201ef90` template generalises** beyond the row-group family:
   `021b398c` is the same call with no prior release and a void(void) prelude.
3. **Unsigned clamp emits `movhi`.** A `0..99` clamp on a byte must use an
   `unsigned` temp (`unsigned c; if (c > 99) c = 99;` → `cmp;movhi`); a signed
   `int` gives `movgt` (`021b7504`).
4. **Scratch placement at first-use.** `v = a2*3` had to sit *after* the first
   byte load, else mwcc hoisted the `mul` one slot early (`021b7504`).
5. **`(u16 field) + k` arg re-reads** (`ldrh` per use) — don't cache (`021b8cd8`).

## The wall class (endgame / permuter — characterised, not forced)

- **MMIO-bitfield-shuffle dispatchers** `021b6f08` / `021b32f0` / `021b3174`: the
  recurring `*reg = (*reg & ~0x1F00) | (((*reg & 0x1F00) >> 8 & ~N) << 8)`
  field-modify idiom (double MMIO read + `and`/`lsr`/`bic`/`orr`), plus
  literal-reuse (`sub r,#129` to make `-128` off a live `1`) and inline-vs-
  outlined `return`s. `021b3174` also depends on the deferred `28f4`.
- **reg-swap** `021b287c`/`28f4` (uniform `r1↔r2`, flipping operands inverts the
  branch) and `021b6074` (`a1+2`/`a0-13` `r1↔ip`, 22/22) — pure reg-alloc.
- **value-map** `021b5390` (inline vs branched constant returns); `021b2824`
  fn-ptr dispatch; `021b82e4` (`-160` via `84-244` register reuse).
- **loops / recursion**: `021b22d8` (quicksort), `021b60cc`/`296c` (tile-draw
  fixed-point loops), `021b61dc`/`2b2c` (init + nested tile loops), and
  `5284`/`5424`/`7fbc`/`7694`/`75c8`/`23b4`/`5244`/`2a8c`/`3a78`/`5188`/`7718`/
  `5dd0`.

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | **OK** (byte-identical, all 4 carved) |
| `check_match_invariants.py` | 0 errors (5096 warns, pre-existing placeholder names) |
| `ruff check .` | clean |
| `tests/` | passed |
| `ninja check` | NOT run (benign label drift, per the brief) |

EUR-only config change (+4 `complete` blocks); all 4 carve sizes audited vs the
gap symbol table — 0 mismatches. `ov016_core.h` §VERIFIED extended (and the
wave-1 walls line corrected: `398c`/`5fb0` are now matched).

## Recommendation for the brain — PIVOT

ov016 is **drained** for clean-C (15 → 4 across two waves). The ~40-function
residue is the wall class above. Two endgame moves, then pivot:

1. **Permuter pass** on the reg-swap pair (`021b287c`/`28f4`) and `021b6074` —
   uniform 1-instr misses, the highest-value cluster.
2. **Pivot to a fresh overlay** for the next clean-C wave (the scaffolder is on
   ov005; ov016's neighbours by census are the open question for the survey).

## Cross-references

- `docs/research/brief-324-ov016-clean-c-wave1.md` — wave 1 (the two families,
  the 10-arg/12-arg builder templates, the MMIO abs-addr recipe).
- `src/overlay016/ov016_core.h` — §VERIFIED (waves 1+2) + the wall-class catalog.
