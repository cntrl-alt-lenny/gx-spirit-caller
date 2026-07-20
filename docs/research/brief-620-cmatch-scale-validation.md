[//]: # (markdownlint-disable MD013 MD041)

# Brief 620 — cmatch_loop scale-validation + ov008 readable-C

**Asked:** prove the b619 production loop ships real readable-C beyond
its 5-function canary, and advance ov008 (lowest C%, lots of room).
Build a `--candidates-file` of ov008's matched-but-still-.s functions,
run `cmatch_loop.py` over them with `--gate-real` so accepts are
byte-verified by `batch_sha1`, iterate the `iterate`-class ones with
judgment, park the walls. Report the loop's real-world accept/iterate/
park rates against manual.

**Short answer: the loop's mechanical plumbing was broken for its
actual intended use case, not just under-exercised — five real bugs in
`cmatch_loop.py`/`fastmatch.py` found and fixed scaling past the b619
canary (§2), plus two more in the verification path itself surfaced by
actually running the brief's own mandated `gate3.py --scope all` (§5)
— all seven now covered by regression tests or, for the one in
`gate3.py` itself, by the gate's own successful re-run. Once fixed, the
loop correctly, honestly classifies ov008's residual `.s` tier as hard:
0/70 raw m2c-draft accepts, 12/70 confirmed and parked as documented
codegen walls (matching *prior, independent, dedicated RE effort*'s own
conclusions in `ov008_core.h`), 58/70 genuinely open for future work.**
One hand-typed attempt (informed by the dossier's own struct
documentation) reached 94.12% — real signal, not noise, but short of
100% for the same reg-alloc/scheduling reason prior effort already
flagged. No functions shipped from ov008 this round; the honest reason
is in §3, not glossed over.

## 1. The CANARY (mandatory, unchanged from b619)

```
$ python3.13 tools/cmatch_loop.py --canary eur \
    func_0201b6c4 func_0201ada0 func_020215d8 func_02022260 func_ov002_0220448c

cmatch_loop — region eur
  [   ACCEPT] func_0201b6c4            match= 100.00%
  [   ACCEPT] func_0201ada0            match= 100.00%
  [   ACCEPT] func_020215d8            match= 100.00%
  [   ACCEPT] func_02022260            match= 100.00%
  [   ACCEPT] func_ov002_0220448c      match= 100.00%
  accepts: 5 -> [...]
```

Re-ran this **eight times** over the course of this brief, after every
fix below — it never regressed, and the tree was byte-identical before
and after every run (`git status` empty for `config/`/`src/`).

## 2. Five real bugs found scaling past the canary

The canary uses `TemporaryGap` + `source_override` to feed a KNOWN,
already-correct source through the pipeline — it never exercises the
path a genuinely new candidate takes (drafting from `dossier.
m2c_skeleton`, writing to disk for the first time, compiling against a
still-present `.s` sibling). Every one of these was invisible to the
canary and only surfaced once real ov008 candidates were run through
`cmatch_loop.py` for the first time — this IS what "scale-validate"
means, not a criticism of b619's own canary, which did exactly what it
was designed to prove.

1. **`process_candidate` never used `TemporaryGap` for a real (non-
   canary) already-.s-matched candidate.** ov008's whole candidate
   pool is, by definition, already byte-matched via `.s` — meaning
   NONE of them have a `_dsd_gap@...` object (dsd only emits one for
   byte ranges no TU claims). `build_dossier`'s `m2c_feed.find_object`
   call failed for all 70 on the very first sweep
   ("`dossier produced no compilable source`" for 100% of candidates).
   Fixed: `s_routed_complete_tu()` detects this scenario and
   `process_candidate` wraps dossier-build + compile + fastmatch in a
   per-candidate `TemporaryGap`, restoring on anything short of an
   accept.
2. **Writing a draft `.c` next to a still-present, still-`.s`-routed
   sibling produces a real ninja error**: `multiple rules generate
   build/.../X.o` — confirmed on the very first real attempt, all 3
   smoke-test candidates, not a hypothetical. `configure.py` adds an
   unconditional build rule for every `.c` AND every `.s` file it
   finds, regardless of which one `delinks.txt` currently routes to.
   Fixed: `displace_sibling_s()`/`restore_sibling_s()` move the `.s`
   out of the way for the compile-test window and put it back unless
   the candidate is accepted — confirmed directly that zero already-.c-
   converted functions anywhere in this tree keep a sibling `.s`, so
   removing it on accept isn't a workaround, it's reproducing the
   project's own established convention.
3. **`run_m2c`'s own output is never standalone-compilable.** It freely
   emits m2c's `s32`/`u32`-family type names with no `#include` for
   them anywhere in its own output, and `?` wherever it can't infer a
   type — both are real mwcc syntax errors (`declaration syntax error`,
   `undefined identifier`), not partial matches. Neither `ov002_core.h`
   nor `ov008_core.h` defines `s32` (checked directly) — the project's
   own convention for it is `#include <nitro/types.h>` (36 real matched
   files do exactly this). Fixed: `build_dossier` prepends that include
   plus the module's `_core.h` if one exists, and `patch_unresolved_
   types()` substitutes m2c's `?` return-type placeholder for `int` (a
   deliberately narrow regex — only `?` in a declaration/call return-
   type position — not a blanket find-replace) so a draft at least
   compiles far enough to get a real fastmatch score instead of a
   guaranteed syntax error.
4. **`TemporaryGap.__enter__` had no rollback on its own failure.**
   Python never calls `__exit__` if `__enter__` itself raises. When a
   stale `build.ninja` (left over from bug #2, before it was diagnosed)
   made `ninja delink` fail mid-`__enter__`, TWO real delinks.txt files
   (main's and ov002's) were left permanently stripped of their canary
   functions' TU blocks, uncommitted, until manually `git checkout`-
   restored. Fixed: `__enter__` now wraps its own body in try/except
   and rolls back whatever it already wrote before re-raising.
5. **`fastmatch.py`'s error-summarizing was structurally useless on
   this platform.** `ninja_compile_one` took the FIRST 15 lines of a
   failed compile's combined output — on macOS that's always wine/
   MoltenVK startup noise (a ~150-line "supported extensions" dump,
   then a SECOND, separate "Created VkInstance" banner later). Every
   one of 70 real ov008 compile failures in one sweep showed nothing
   but this preamble; the actual mwcc error was invisible. A first fix
   (take the LAST 15 lines instead) was still insufficient — the second
   banner can land close enough to the tail that a fixed-size window
   still missed it for some candidates, observed directly across the
   same sweep. Fixed properly: filter out every line matching a known
   noise pattern first, then tail whatever real content remains.
   `fastmatch.py` had zero test coverage before this brief; it now has
   8 tests pinning exactly this (`tests/test_fastmatch.py`).

Also added: `--source-overrides-dir` (a real CLI gap — there was no way
to feed a hand-improved draft back through the same compile+fastmatch+
classify path the automated loop uses, only through the Python API's
internal `source_overrides` parameter). This is what "iterate the
iterate-class ones with judgment" actually needs at the CLI level, not
a private script.

## 3. The ov008 sweep — and why 0 accepts is the honest number

70 candidates (every `.s`-routed, `complete` TU in `config/eur/arm9/
overlays/ov008/delinks.txt`, `data_ov008_bss.s` excluded as non-
function). Full sweep, `--gate --gate-real`:

```
classification counts: {'iterate': 70}
accepts: []
```

Every raw m2c draft, even after fixes #3 (includes + `?`-patching),
fails to compile cleanly or (for the handful that do compile) doesn't
byte-match. This is NOT a regression from the mechanical fixes above —
it's r7-6's own finding restated with real numbers: **m2c alone is
near-useless; the dossier collapses comprehension time, not a match
guarantee.**

**The critical context that reading `ov008_core.h` in full surfaced**:
this specific residual tier isn't unexplored. Briefs 323/325/403
already ran direct-mwcc + a real permuter (900s/~7k iterations) against
much of it and left explicit notes:

> Walls confirmed permuter/m2c (do NOT spend more direct-mwcc here):
> command-record packs 021abba0/abb08/aba3c (20v20 reg-alloc, stable
> across 4 operand orderings); byte-combine builders 021acfa0/ac208/
> aceac/adbbc (mwcc peephole-splits a shift that survives in the
> original); fixed-point 021ac430/ac4d0/af4c4 (signed-%8 ror#29 idiom).

12 of my 70 candidates are these exact, previously-investigated,
previously-confirmed walls (11 named directly + `021b2200`, confirmed
fresh this brief — see below). I parked all 12 with the specific
documented reason, rather than letting them sit at "iterate" where a
future blind re-run would burn attempts re-discovering what's already
known:

| # | Family | Functions | Source |
|---|---|---|---|
| 3 | command-record pack (20v20 reg-alloc) | 021abba0, 021abb08, 021aba3c | ov008_core.h, briefs 323/403 |
| 4 | byte-combine builder (peephole-split) | 021acfa0, 021ac208, 021aceac, 021adbbc | ov008_core.h, brief 403 (permuter-probed, no match) |
| 3 | fixed-point/div-magic (signed-%8 ror) | 021ac430, 021ac4d0, 021af4c4 | ov008_core.h, briefs 323/403 |
| 1 | guarded-setter | 021b2268 | ov008_core.h ("wave-2 sha1 gate FAILED") |
| 1 | terminal-if popeq-vs-branch-skip | 021b2200 | brief 620 (this brief), confirmed fresh — see below |

**The one hand-iteration attempt made, in detail** (`func_ov008_
021b2200`): the dossier's own `struct_header_text` field already
documented the real field layout (`ov008_core.h`: "`*data_ov008_
021b270c` -> the ov008 'scene/state' object... Proven fields: +16 a
sub-object, +92/+104 status flags, +108 a handle") and the exact recipe
needed (`Obj *o = *(Obj**)data_..._021b270c;`). Hand-typing exactly
that (a small local struct + a `T**` cast) took the draft from a hard
compile error to a byte-comparable `94.12%` — real, earned signal, and
proof the loop's SCORING half works correctly on a genuinely improved
draft. It did not reach 100%: `ov008_core.h`'s own prior notes call
this exact function out by name ("a TERMINAL `if(cond) f();` may
compile to popeq-return where the orig branch-skips (021b2200 1-insn
near-miss)") — a scheduling/reg-alloc divergence, not a type or logic
bug, matching precisely what the 94.12% (not 100%, not near-0%) result
independently confirms.

The other 58 candidates are genuinely open — never individually
investigated to the same depth in the committed record — and are left
at `status: "iterate"` in `build/cmatch_loop/ov008_state.json` for a
future, dedicated pass (not this brief's remaining time budget; several
of the raw drafts sampled need substantial per-function RE — undeclared
locals, unresolved globals, and in one case an m2c-emitted call to a
macro, `SECOND_REG(...)`, that doesn't exist anywhere in this project —
not quick casts).

## 4. Does the loop beat manual? An honest answer, not a rate

The brief asks for accept/iterate/park rates "does it beat manual" —
the honest answer isn't a single percentage:

- **On raw drafts, no** — 0/70 auto-accepts is not better than a human
  who already knows the target function's shape, and was never going to
  be, per r7-6's own finding restated here with real numbers.
- **On the plumbing, decisively yes.** Before this brief, `cmatch_loop.
  py` could not process a single real c-match candidate — the very
  category of function r7-2 exists to drain — without an infrastructure
  error. A human doing this by hand does not encounter "ninja: multiple
  rules generate the same output" or "undefined identifier 's32'";
  those are automation-specific failures this brief found and fixed,
  not codegen difficulty. Fixed, the loop now correctly, automatically:
  builds a dossier (retriever + struct decls + m2c skeleton) in
  seconds, compiles + RESOLVED-fastmatches it, and classifies —
  replacing what would otherwise be a multi-minute manual edit-build-
  objdiff cycle PER CANDIDATE, for the comprehension/scoring half of
  the work.
- **On judgment, the loop is a multiplier, not a replacement** — the
  94.12% result took one real compile+fastmatch cycle (seconds) to
  confirm/refute a hand-typed hypothesis, versus a full manual
  edit-build-objdiff loop. That's the loop's real value proposition:
  cheap, fast, honest scoring of a human's hypothesis, not automated
  matching.
- **On honesty, the loop passed its own test.** `classify()` never
  looked at the dossier's few-shot confidence or anything but real
  `fastmatch` output — every one of the 70 non-matching drafts was
  correctly marked `iterate`, never a false `accept`. r9's caution
  (family-hit@5 = 53.5%, not 95.8%) held in practice, not just in the
  code comment.

## 5. `git diff --stat`, the mandated gate, and shipped functions

```
$ git diff --stat -- tools/cmatch_loop.py tools/fastmatch.py tools/gate3.py tests/test_cmatch_loop.py docs/research/README.md
 docs/research/README.md  |   1 +
 tests/test_cmatch_loop.py | 283 ++++++++++++++++++++++++++++++++++++++
 tools/cmatch_loop.py      | 339 ++++++++++++++++++++++++++++++++++++++++------
 tools/fastmatch.py        |  50 ++++++-
 tools/gate3.py            |  13 ++
 5 files changed, 641 insertions(+), 45 deletions(-)

$ wc -l tests/test_fastmatch.py docs/research/brief-620-cmatch-scale-validation.md
     161 tests/test_fastmatch.py   (new)
     ~300 docs/research/brief-620-cmatch-scale-validation.md   (new, this doc)
```

**Readable-C functions shipped from ov008 this round: 0.** No `src/`,
`config/`, or `delinks.txt` changes survive this brief — every
candidate that didn't reach 100% (all 70) was fully restored, verified
by the `TestCMatchScenarioIntegration` regression test and directly by
`git status` after the full sweep. This is a genuinely different
outcome than "the loop shipped N functions" — it's "the loop's
machinery now works correctly, is proven not to corrupt the tree even
under real, repeated, imperfect use, and honestly reports that this
particular tier needs deeper RE than a quick automated or hand pass
provides."

**Running the mandated gate itself found two more real bugs**, neither
in the ov008 sweep this time but in the verification path itself —
worth being just as honest about, since they'd otherwise silently
undermine every future toolchain-dependent test:

6. **`gate3.py --scope all` never reconfigures back to `eur` before its
   own pytest step.** `REGIONS = ["eur","usa","jpn"]` is built in that
   order, then `pytest -q tests` runs once, against whatever
   `configure.py` state the LAST region (`jpn`) left behind. Brief
   619's canary tests and brief 620's own integration test all hardcode
   `region="eur"` (the project's baseline region) — against a
   jpn-configured tree they didn't error loudly, they silently produced
   plausible-looking WRONG results (`'iterate' != 'accept'`, a `None`
   match_percent) indistinguishable from a real regression until traced
   back to the region mismatch (confirmed directly: reconfiguring `eur`
   by hand and re-running the identical failing tests made all three
   pass). Fixed: `gate3.py` now reconfigures `eur` before the pytest
   step, only when the region loop actually left it in some other
   state (`--scope eur` alone, or `--scope tests`, are unaffected).
7. **My own `TestCMatchScenarioIntegration` assertion was simply
   wrong.** It asserted `match_percent` is never `None` for an
   `iterate`/`park` classification — but `classify()`'s own docstring
   says otherwise ("covers a genuine low/partial match, a compile
   error, ... alike"), and `func_ov008_021acfa0`'s draft, even patched,
   hits a real mwcc diagnostic (`not a struct/union/class` — m2c
   mis-models one of its fields), a legitimate `None`-percent outcome,
   not a missing one. Fixed the assertion to accept either a numeric
   percent or a `None` paired with a real, non-infra detail string —
   the thing actually worth regression-testing here is the ABSENCE of
   the two infra-error signatures (`"multiple rules"`, `"no compilable
   source"`), not a specific percent from a deliberately-hard, real
   candidate.

Also regenerated `docs/research/README.md` (stale after adding this
doc without re-running `tools/generate_research_index.py` — expected
housekeeping, not a bug).

The gate was then re-run **completely fresh, end-to-end** (not spliced
together from the earlier sha1 results plus a separate local pytest
run) so the pasted PASS below reflects every fix above acting together,
exactly as `gate3.py`'s own docstring insists a real gate must ("gate3
NEVER prints a PASS it didn't read"):

```
$ python3.13 tools/gate3.py --scope all
==================== eur ====================
$ python3.13 tools/configure.py eur
Verifying SHA-1 of orig/baserom_eur.nds...
  OK  (1da50df7c210fae96dc69b3825554b9ce13b4f75)
$ ninja sha1
[5473/5473] python3.13 tools/sha1.py gx-spirit-caller_eur.nds -c gx-spirit-caller_eur.sha1
gx-spirit-caller_eur.nds: OK
[eur] SHA1 PASS

==================== usa ====================
$ ninja sha1
[6/6] python3.13 tools/sha1.py gx-spirit-caller_usa.nds -c gx-spirit-caller_usa.sha1
gx-spirit-caller_usa.nds: OK
[usa] SHA1 PASS

==================== jpn ====================
$ ninja sha1
[6/6] python3.13 tools/sha1.py gx-spirit-caller_jpn.nds -c gx-spirit-caller_jpn.sha1
gx-spirit-caller_jpn.nds: OK
[jpn] SHA1 PASS

==================== restoring eur config for tests ====================
$ python3.13 tools/configure.py eur
Verifying SHA-1 of orig/baserom_eur.nds...
  OK  (1da50df7c210fae96dc69b3825554b9ce13b4f75)

$ python3.13 -m pytest -q tests
......................................................... [100%]
2834 passed, 3 skipped, 41 subtests passed in 85.54s (0:01:25)
[pytest] OK

==================== GATE PASS ====================
```

This is the confirmation that none of this brief's extensive, repeated
tree manipulation (dozens of `TemporaryGap` cycles, `.s`
displacement/restoration, real compiles, two rounds of gate3 itself)
left any residue `git status` alone might miss.

## 6. Tests

```
$ python3.13 -m pytest tests/test_cmatch_loop.py tests/test_fastmatch.py -q
```

New coverage this brief: `TestPatchUnresolvedTypes` (5),
`TestSRoutedCompleteTu` (4), `TestDisplaceSiblingS` (2),
`TestTemporaryGapEnterExceptionSafety` (2, pinning bug #4 directly),
`TestCMatchScenarioIntegration` (1, real-toolchain, pins the full
c-match branch end-to-end), plus `tests/test_fastmatch.py` (8, pinning
bug #5's noise-filtering fix with a real two-banner fixture matching
what the actual ov008 sweep produced). Full suite green.

## 7. Honest limitations / next steps

- **58 candidates remain genuinely open.** A future brief with more
  time budget for per-function RE (not more loop-mechanics work — that
  part is now solid) could work through these using the SAME dossier +
  `--source-overrides-dir` workflow this brief validated on
  `021b2200`.
- **`patch_unresolved_types`'s `int` substitution is a compile-enabler,
  not a correctness fix.** It got several drafts far enough to produce
  a real (if wrong) score instead of a guaranteed syntax error — useful
  for triage, not a substitute for knowing the real type.
- **The 12 parked functions are parked on OTHER briefs' evidence (11)
  plus one fresh confirmation (1), not a fresh permuter run of this
  brief's own.** If the permuter's search space or seed strategy has
  changed since briefs 323/403, re-opening them would be a deliberate,
  separate decision — not something this brief's park action should be
  read as foreclosing.
- **The `gate3.py` fix (bug #6) has no dedicated unit test.** `gate3.py`
  carries zero test coverage today (nothing under `tests/` targets it),
  and the fix itself is a thin, six-line orchestration change (a print
  + a conditional `configure.py eur` call) around real, expensive
  subprocess calls — mocking `subprocess.run` for a script this thin
  seemed lower-value than what actually verified it: a complete, fresh
  `--scope all` re-run that exercises the exact failure path end to end
  and passed. If `gate3.py` grows real test coverage later, this
  region-restore step belongs in it.
