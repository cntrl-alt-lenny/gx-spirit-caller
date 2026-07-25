# q-khdays-toolkit: porting khdays-decomp's arity/permutation tools (2026-07-25)

r11's external lens found [khdays-decomp](https://github.com/Yokimitsuro/khdays-decomp)
(a matching decompilation of *Kingdom Hearts 358/2 Days*, Nintendo DS)
ships two CC0-1.0-licensed tools that map directly onto this project's
current blockers. Confirmed the license directly against the GitHub
API (`gh api repos/Yokimitsuro/khdays-decomp --jq '.license'` →
`cc0-1.0`) before porting anything.

## CC0-1.0 attribution

**Source**: https://github.com/Yokimitsuro/khdays-decomp
**License**: CC0-1.0 (Creative Commons Zero v1.0 Universal — public-domain-equivalent)
**Files ported**:
- `tools/audit_callsite_arity.py` → this project's `tools/audit_callsite_arity.py`
- `tools/declperm.py` → this project's `tools/declperm.py`

CC0 requires no attribution to remain compliant, but it's recorded
here anyway for provenance: both ported files carry a module-docstring
note crediting khdays-decomp and linking back to this report, and this
doc records exactly what was kept verbatim, what was adapted, and why.

## `audit_callsite_arity.py`

### What it does (unchanged from khdays)

Builds a **call-site consensus** — for every callee name, how many
arguments every real call site in the matched tree actually passes —
then flags any place a DECLARED arity contradicts that consensus at
high confidence (≥3 independent sites, khdays' own threshold, kept
as-is). The core insight (from khdays' own docstring, verbatim in
spirit): call sites are the only REAL evidence of arity; a written
declaration or definition signature can simply be wrong, and an
`asm`-bodied function's own parameter list carries no C-visible
argument references to cross-check against at all.

### What was adapted

khdays walks `src/**/nonmatching/*.c` (parked) vs. everything else
(matched) — its own directory-based split. This project has no such
convention, so the consensus source was re-pointed at `delinks.txt`
`complete`-status `.c`/`.cpp` TUs, exactly `gen_prototypes.py`'s own
existing convention (same EUR-only, region-port-excluded scope, for
consistency). khdays flags **parked files** whose own call sites
contradict the consensus; this project's actual blocker
(q-prototypes-golive-fix) is the **declared prototype bank**, not
parked files, so this port audits `docs/research/data/
prototypes-provenance.json` (gen_prototypes.py's own evidence-only
table) against the same consensus instead — directly answering "does
the canonical bank ever declare an arity no real call site uses?"

The core parsing (`split_args`, `call_sites`, the `KEYWORDS` denylist)
is kept close to verbatim — it's project-agnostic C-text analysis, not
khdays-specific.

### The arity-audit report (against the CURRENT tree)

```
python tools/audit_callsite_arity.py
```

**3892 declared prototypes audited, 39 with a call-site arity
contradiction.** Two genuinely different categories:

**Category A — 6 already superseded by q-prototypes-golive-fix (PR
PR #1341, not yet merged to main as of this branch).** All 6 are
`asm`-bodied functions (`Copy32`, `Fill32`, `OS_RestoreIrq`,
`func_0209448c`, `func_020944a4`, `func_ov002_0226ae30`) — exactly the
landmine class that item's asm-exclusion fix already removes from the
bank entirely (an asm body's written `(void)` is never trustworthy
arity evidence). Once that PR merges, this category should disappear
from future audit runs — direct, independent confirmation the two
fixes agree.

**Category B — 33 genuinely NEW findings, not touched by any prior
item.** The bank's declared arity here is CORRECT (evidence-backed
from a real matched body) — the contradiction is that call SITES
elsewhere in the tree use a wrong LOCAL `extern` for the same
function. Two illustrative, fully-verified examples:

- **`func_020190c0`**: real definition is
  `int func_020190c0(int _unused, int b, int c, int d)` (4 params,
  matched, evidence-backed). All 3 real callers
  (`func_020190ec.c`, `func_020190fc.c`, `func_0201a3ec.c`)
  independently declare their OWN wrong local extern
  (`extern void func_020190c0(void);` / `extern int
  func_020190c0(void);`) and call it with 0 args. Byte-safe only
  because the callee never reads `b`/`c`/`d` — but a textbook instance
  of the "wrong-extern rate in matched TUs is 50.2%" finding this
  whole prototypes-bank campaign exists to fix.
- **The `ov006` "constant-one predicate" family** (12 of the 33 — the
  single largest concentration): `func_ov006_021ba1f0`'s real
  definition is `int func_ov006_021ba1f0(void) { return 1; }` (0
  params). **8 separate matched, shipped caller files**
  (`func_ov006_021b2804.c`, `_021b2de0.c`, `_021b33c4.c`,
  `_021b39a4.c`, `_021b3f10.c`, `_021b493c.c`, `_021b4ea8.c`,
  `_021b559c.c`) all independently declare the IDENTICAL wrong extern
  (`extern void func_ov006_021ba1f0(void *);`) and call it with 1 arg
  — clearly a copy-pasted callback-table stub pattern, not 8
  independent mistakes. This is exactly the SHAPE of finding
  `audit_callsite_arity.py` is built to surface: not random noise, a
  systemic pattern worth fixing in one pass once prototypes.h is
  actually wired in (a separate future step, per q-prototypes-golive-fix's
  own explicit scope).

Full list: re-run `python tools/audit_callsite_arity.py --json` for
the machine-readable form, or plain `python tools/audit_callsite_arity.py`
for the human-readable one.

## `declperm.py`

### What it does (unchanged from khdays)

Detects a function's leading local-declaration block, tries every
permutation of that block's order (an initializer-bearing declaration
is split into a bare declaration + assignment first, so only ORDER is
permuted, never evaluation order), compiles and compares each
permutation against ground truth, and reports the best matches. Why:
declaration order colors callee-saved register allocation, and a
residual that's purely a register-letter permutation often falls with
the right order — khdays closed a real park at permutation 33 of 120
this way.

### What was adapted

khdays drives its own `tools/match.py` (`compile_c`/`text_relocs`)
against a prebuilt `build/func_index.json` ground-truth index — neither
exists in this project. This project's own `fastmatch.match_one()`
already provides an equivalent compile+compare primitive, built on the
real mwccarm/ninja toolchain and dsd's gap-object resolution, reused
here instead of reimplementing khdays' infrastructure. One
simplification falls out of this for free: `fastmatch`'s own tier
detection already reads the `.legacy.c`/`.legacy_sp3.c`/`.thumb.c`
filename suffix, so this port needs no khdays-style `--thumb` flag.

### A real bug found and fixed while porting (not present in the final port)

khdays' own bare-declaration regex has no notion of C keywords, so
`return a;` (return a single already-declared local, no expression) is
lexically indistinguishable from a declaration — `TYPE="return"`,
`NAME="a"` parses just as validly. khdays' own control-flow guard
(skip a line starting with `if`/`for`/`while`/... ) was only ever
applied to the WITH-initializer branch, leaving the bare-declaration
branch exposed to this extremely common shape
(`{ int a; int b; return a; }`). Found via this port's own test suite
(`tests/test_declperm.py`), not a hypothetical — fixed by applying the
same control-flow guard to both branches. Pinned with a regression
test (`test_return_of_a_bare_local_not_mistaken_for_a_declaration`).

### Proof it runs on this tree (real compile, real gap object)

`declperm.py`, like khdays' own version, needs a real ground-truth
object to compare against — for an ALREADY-matched function, no gap
object exists (the linker just uses that TU's own bytes directly).
Smoke-tested via `cmatch_loop.py`'s own `TemporaryGap` context manager
(the exact mechanism that module's own docstring describes as "the
ONLY way to canary-test fastmatch against a KNOWN match without
inventing a fake one"), which temporarily un-claims a real shipped
function's delinks.txt TU so dsd re-synthesizes its `_dsd_gap@` object,
then restores everything on exit:

```python
with TemporaryGap({delinks_path: [rel]}):
    results = declperm.run_sweep(c_path, "eur", "func_02001e94", max_perms=10)
```

Target: `src/main/func_02001e94.c` (2 leading locals: `unsigned int
outer; unsigned int j;`). Both permutations compiled and matched
**100.00%, 0 diffs** — this particular function's codegen doesn't
depend on THESE TWO locals' declaration order (a valid, useful result:
the tool correctly reports "order-insensitive here" rather than a
false negative). Confirmed via `git status --porcelain` +  an MD5
hash taken before and after that the source file and `delinks.txt`
were both restored byte-identical, exception-safe (the `finally`
block + `TemporaryGap`'s own restore both fired correctly). CLI
entry point (`declperm.main()`) tested the same way — correctly wrote
a `.MATCH` sidecar file on the 100% result, exit code 0; sidecar
deleted afterward (a real per-run inspection artifact, not meant to be
committed, matching khdays' own convention).

## Verification

- `python -m pytest -q tests` — 2938 passed (was 2911 on this branch's
  baseline, +27 new: 16 in `tests/test_audit_callsite_arity.py`, 11 in
  `tests/test_declperm.py`), no failures.
- Both tools run cleanly against this project's real tree (arity audit
  report above; declperm smoke test above).
- CC0 attribution recorded in this doc + both ported files' own module
  docstrings.
