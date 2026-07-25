# Brief 682 — sm64ds r3 lever verification (queue item cm-sm64ds-lever-verify)

**Result: all 14 imported "refine fan-out" levers tried against real local
candidates on our 2.0/sp1p5 tree. 5 VERIFIED-ON-2.0 (mechanism confirmed
real), 5 FAILED-ON-2.0 (tested, does not reproduce or has zero effect), 3
NO-CANDIDATE (no matching local residual found after a real search), 1
moot (lever's precondition doesn't arise on the only candidate found). 5
real ships landed (3 where the lever itself was load-bearing, 2 where the
candidate matched via a different approach than the one tested).
3-region (`gate3.py --scope all --no-tests` PASS: EUR, USA, JPN).**

## Scope

`docs/research/reshape-recipes/imported-sm64ds-r3.md` (brief 680) had
mined 14 register-coloring/scheduling levers from a sibling decomp
project's commit stream, all marked UNVERIFIED-ON-2.0 and explicitly
un-tried against our own tree. Per the queue text: for each lever, find a
real parked/near-miss candidate in our own corpus whose residual shape
matches the lever's stated mechanism, apply it, gate via a real build, and
record VERIFIED-ON-2.0 / FAILED-ON-2.0 / NO-CANDIDATE.

The three open residuals (TST-vs-ANDS instruction selection, the
4-register argument-spill ABI puzzle, byte-swap value-correct/order-wrong)
were re-confirmed as untouched by any of the 14 levers — the r3 doc's own
structured-DB query already established this (0 hits across all three),
and this brief's per-lever candidate search didn't surface a connection
either. Nothing new for any of the 3 from this lever set; their own
internal leads were separately executed in brief 680.

## Methodology

Two phases, matching the scale of the task (14 independent
technique-vs-candidate investigations):

1. **Candidate research** — 4 parallel read-only agents searched
   `docs/research/codegen-walls.md` (our own ~44 C-NN coercible patterns +
   13 live P-NN permanent walls), `attempts.tsv`,
   `cmatch-parked-and-floor.md`, `epilogue-wall-corpus.md`, and per-address
   dossiers for a real local function whose current residual plausibly
   matches each lever's described symptom. 3 of 14 came back honest
   NO-CANDIDATE after a genuine search; the rest surfaced 9 distinct
   candidate functions (some levers share a candidate — e.g. levers 1 and
   4 are two different techniques tried on the same near-miss).
2. **Apply + gate** — 9 worktree-isolated agents (one per candidate)
   applied the specific technique, compiled via `tools/verify.py --cc
   all`, and either shipped (delinks.txt flip, `.s` deletion, full `ninja
   sha1`) or reported a clean negative result. Isolated git worktrees let
   these run in parallel without file/build collisions.

Full per-lever ledger — technique, verdict, candidate, and result — is now
in `imported-sm64ds-r3.md`'s table; not duplicated here in full, only the
notable findings below.

## Notable findings

**Levers 3, 6, 12 — the technique itself was load-bearing.** These are the
cleanest results: a controlled A/B (with-lever vs. without) where the
lever's specific form is what closes the gap, confirmed via real compiles
rather than a single lucky draft.

- **Lever 3** (hidden-arg liveness) on `func_02087e54`: the caller was
  missing a real forwarded 3rd argument to `func_0208b0a4`, which left r2
  free for the compiler to reuse for a cached self-pointer (target wants
  r3). Diagnosed by reading two OTHER real call sites of the same callee
  for comparison, not by guessing.
- **Lever 6** (volatile-cast read pins order) on `func_02066ea0`: casting
  the first read of each byte-load pair through `volatile` pins it at its
  source position; a partial-application test (cast only one pair, not
  both) confirmed the two batches are independently controlled by this
  lever, not a whole-function toggle.
- **Lever 12** (field-by-field copy + guard) on `func_02085664`: the
  aggregate `*dst = *src` struct-assignment control WALLs on all 3 tiers
  (diverges from instruction 0); field-by-field matches byte-exact. Clean
  isolation of the lever's actual effect, not confounded by the rest of
  the function.

**Levers 13, 14 — real ships, but the tested lever was refuted.** Both
candidates matched, just not for the reason under test — worth recording
precisely rather than crediting the lever with a win it didn't earn.

- **Lever 13** (hoist tail stores) on `func_ov002_022a822c`: the call's
  argument is condition-dependent, so hoisting it out of the if/else
  changes the function's actual shape — both hoist variants tried measured
  worse (30v35, 34v35 words) than simply leaving the duplicate form the
  disassembly already shows. The *opposite* of the lever's hypothesis is
  what matches here.
- **Lever 14** (split pointer+offset) on `func_ov006_021b60a4`: mwcc
  already naturally emits the correct two-ADD-immediate sequence for the
  combined single-statement form; the split has zero effect. This
  candidate needed a stale documentation claim resolved first (a retriage
  doc citing it as "already matched, R4" turned out to be wrong — no `.c`
  for this function exists on any branch, and the citing doc's own
  conditional phrasing elsewhere confirms it hadn't matched as of that
  doc either) — the real work was correct reconstruction from
  disassembly, not the lever.

**Lever 9 — mechanism confirmed real, confirmed wrong-direction.** The
candidate (`func_020947b8`) needs MORE `stmia` store-batching to match
target; u64-pointer-laundering is described as a technique that DEFEATS
batching. Rather than skip the test on a predicted-bad outcome, the
agent ran it anyway: laundering measurably moved the candidate further
from target (11→19 words) on every tier, confirming both that the
mechanism is real on our compiler AND that the flagged directionality
concern from the research phase was correct, not just a hunch.

**Lever 2 — mechanism confirmed real, blocked by an unrelated wall.** A
genuinely new, reproducible finding: declaring a call's callback pointer
as an *initialized* local (not a deferred assignment) shifts register
coloring exactly to target on `func_02097004`, confirmed across 4
independent variants. Not shipped — a completely separate prologue/
epilogue frame-shape wall (compact `push{r3,lr}` vs. target's expanded
`stmfd`+`sub sp,#4`+`ldmfd`) persists regardless of the coloring fix, and
nothing tried decouples the two.

**Lever 8 — moot, but a 93% near-miss fell out of testing it.** The
lever's precondition (needing to force a specific `sub`/`rsb` order)
doesn't arise on the only candidate found: a straightforward
transliteration of `func_ov004_021cd3b4` already produces the needed order
mechanically via ordinary register reuse. That transliteration reached 93%
(176/189 instructions) on a previously-untried 784-byte function — flagged
as a follow-up task rather than closed this pass, since the worktree that
found it had no baserom to run the project's real gate.

## Tool bug found and fixed: `tools/verify.py` hardcoded `wine`

**Six independent agents** hit the same real bug while running the
apply+gate phase: `tools/verify.py`'s `_compile()` unconditionally shelled
out through a bare `"wine"` launcher, which doesn't exist on native
Windows (this project's own documented path runs `mwccarm.exe` directly,
matching `configure.py`'s `WINE=""` branch) — and even where a fix
attempted a platform split, a hardcoded `"wine"` string for the non-
Windows branch would have been wrong on Linux too (CLAUDE.md documents
`wibo`, not `wine`, as the Linux runner). Several agents also hit a
second, related bug: relative compiler/binutil paths that native Windows
`CreateProcess` cannot resolve against a child `cwd=`.

Multiple agents independently wrote real fixes; merging the 5 ship
worktrees produced 3 real merge conflicts in this one file, all resolved
in favor of reusing the project's existing `exe_launch_prefix()` helper
(from `get_platform.py`) plus absolute paths via the established
`_binutil()`/`asm_escape.py` convention — this also correctly covers
wine64/wibo per-platform rather than a hardcoded string. `tests/test_verify.py`
(7/7) still passes post-merge.

## Mandatory verification: .c-added == delinks.txt-flipped == .s-deleted

**5 == 5 == 5**, verified by diff:

```
.c files added:                5
.s files deleted:              5
delinks.txt .s: -> .c: flips:  5
```

(`func_02066ea0.legacy_sp3.c`, `func_02085664.legacy.c`,
`func_02087e54.legacy_sp3.c`, `func_ov002_022a822c.c`,
`func_ov006_021b60a4.c`.)

## Gate

`python tools/gate3.py --scope all --no-tests` — 3-region PASS (EUR, USA,
JPN). Every shipped candidate individually gate-confirmed (`ninja sha1`)
in its own isolated worktree before merging; the merged branch re-gated
in full afterward to confirm the 5 ships integrate cleanly together.
`tests/test_verify.py` 7/7 passes with the merged tool fix.

These 5 ships are EUR-only for now, matching this campaign's established
phased EUR-first strategy — USA/JPN porting is deferred to a future
cross-region pass (the functions may or may not already be matched or
`.s`-identical in those regions; not checked this brief, out of scope for
a pure lever-verification pass).

## Remaining backlog for a future brief

- `func_ov004_021cd3b4`'s 93% near-miss (lever 8's candidate) — flagged as
  a standalone follow-up task, 2 small residuals remain (a task-config
  field-write scheduling order, one CSE difference).
- Lever 2's finding (fake-dependency coloring via an initialized local) is
  real and reusable on any FUTURE candidate with the same vtable-dispatch
  register-coloring symptom, even though `func_02097004` itself stays
  blocked by its unrelated frame-shape wall.
- The 3 NO-CANDIDATE levers (5, 10, 11) aren't necessarily dead — they
  reflect the CURRENT corpus having no matching residual shape, not that
  the techniques don't work. Worth re-checking if a future sweep produces
  a near-miss with the matching symptom (asymmetric shift-pair
  canonicalization; narrowed-intermediate-pointer at a ~19-word
  divergence; zero-init-above-early-return).
