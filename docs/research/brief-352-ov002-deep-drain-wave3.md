[//]: # (markdownlint-disable MD013 MD041)

# Brief 352 — ov002 deep-drain wave 3 (select the easy sub-tier)

**Brief:** 352 (decomper). Play to ov002's FAST sub-tier (forwarder / predicate /
family shapes); defer the arithmetic / inline-branch sub-tier. No dual-compile
(ov002 is a 2.0 cohort — wave 2 confirmed `.legacy.c` doesn't apply). Gate =
3-region `ninja sha1`; carve audit; GOTCHA-18; divmod. Target 14–17.

## Headline

**16 shipped, 3-region `ninja sha1` = EUR / USA / JPN all OK.** The selection
strategy held: ~16 of ~22 attempted matched, and the misses were exactly the
codegen-finicky sub-tier (deferred as planned, not ground on). The wave also
banked a new **indirect-dispatch family** and a comparator fix for `blx`.

## New — the indirect-dispatch family (02257594 / c54 / ca8)

Resolve a record, then tail-`blx` a handler stored in it:

```c
char *r = func_ov002_02257464(arg0);
int (*fn)(void *, int);
if (r == 0 || (fn = *(int (**)(void *, int))(r + OFF)) == 0) return 1;
return fn(arg0, arg1);            /* OFF = 12 / 16 / 20 */
```

mwcc emits `blx r2`. **dcheck gotcha:** objdump renders `blx reg` as
`msr SP_hyp, reg, LSR pc` (the `LSR` form, distinct from `bx`'s `LSL` form) — the
comparator must normalise both, else a true match shows as a 1-line near-miss.
(Taught `/tmp/dcheck.py` the `blx` form this wave.)

## The 16 picks

- **indirect-dispatch family**: `02257594` / `02257c54` / `02257ca8` (+12/16/20).
- **021d479c arg-pack family** (now 3-payload): `021d87a4` (kind 41), `021e1aec`
  (kind 51, tag 13).
- **per-player + Ov002Slot.id tail-call**: `0228dda8`.
- **flag-compare predicates**: `0220b740`, `02286978`.
- **guard + forward** (pass-through arg1): `0226db7c`, `02237960`, `0223405c`.
- **multi-call / compute**: `022859b4` (snapshot pair), `0226ad24` (latch + copy
  + dispatch), `02202318` (2-query OR), `0222b704` (resolve + apply, return 0),
  `0220ced8` (abs-diff threshold).

## Recipes reused / banked

1. **pass-through arg1** — the d016c value lands in `r2` ⇒ `r1` is live ⇒ forward
   `arg1` to the sink (`02237960`/`0223405c`). A `>> 1` bit-test needs an
   **unsigned** holder (else `asr`, not `lsr`).
2. **load-ORDER steers reg-alloc** — declare the operand the orig loads *first*
   first (`0220ced8`: `int b = …+2152; int a = …+0;` to match `ldr r2,[+2152]`).
3. **return 0 after the last call** — `f(...); return 0;` (orig has a trailing
   `mov r0,#0`), not `return f(...)` (`0222b704`).
4. **per-player 0x868 stride + `Ov002Slot.id`** (32-bit holder, `lsl#19;lsr#19`).

## Deferred (codegen-finicky sub-tier — not walls)

- **mirror-reg twins**: `0220cff8` is `02206100`'s register mirror (same C, `r1`↔
  `r2` swapped) — a 1-reg-off near-miss.
- **multi-store scheduling**: `022592b8` / `02259324` (base/zero reg choice + a
  lazily-loaded `cd73c` base).
- **range-opt**: `0220cf0c` / `022abf88` — mwcc folds `==N||==N+1` to
  `sub;cmp;movls` where the orig kept explicit compares.

These go to a later permuter / hand-RE pass.

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | **OK** (byte-identical, all 16 carved) |
| `check_match_invariants.py` | 0 errors (5322 warns, pre-existing placeholder names) |
| `ruff check .` | clean |
| `tests/` | passed |
| GOTCHA-18 cross-wire | clean (no pick references an ov000 symbol) |

Carve-size audit: 0 mismatches (worklist sizes were accurate this batch). No stray
files. EUR-only config change (+16 `complete` blocks); `ov002_core.h` §VERIFIED
extended through brief 352.

## Recommendation for the brain

The fast-sub-tier strategy is the right play and yields ~16/wave reliably. Keep
the decomper on ov002, selecting forwarder/predicate/family shapes; the
finicky-sub-tier defers are accumulating into a clean **permuter/hand-RE backlog**
(mirror-reg, scheduling, range-opt) — worth a dedicated pass once the easy tier
thins. The indirect-dispatch and arg-pack families likely have more members to
sweep.

## Cross-references

- `src/overlay002/ov002_core.h` — §VERIFIED (waves 1–3) + the indirect-dispatch
  recipe + the `blx` comparator note.
- `docs/research/brief-350-ov002-deep-drain-wave2.md` — wave 2 (the sub-tier split
  + the negative legacy result).
