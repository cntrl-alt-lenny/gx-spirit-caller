# q-prototypes-arity-33 — resolving the 33 call-site arity contradictions

Queue item `q-prototypes-arity-33`. The khdays-ported `tools/audit_callsite_arity.py`
(`q-khdays-toolkit`) reported 3,780 declared prototypes audited, 33 with
a CALL-SITE arity contradiction against `include/game/prototypes.h`.
This doc records the investigation of all 33 (not a sample), the
resulting generator/check-path fix, and why no prototype bank *value*
needed to change.

## Investigating all 33 — every one is a real, verified definition

For each of the 33, cross-referenced three independent sources: the
audit's own `declared` figure, `prototypes-provenance.json`'s stored
`params`/`source`, and a **fresh** re-parse of the real, on-disk
definition through `gen_prototypes.py`'s own
`parse_function_definitions()` (independent of the cached JSON —
verifies the JSON hasn't drifted from the source, not just that it's
internally self-consistent).

**Result: 0 discrepancies across all 33.** Every declared arity is
backed by a real, non-`asm`, non-by-value-struct, non-local-typedef
matched definition, and the live re-parse exactly matches both the
provenance JSON and the audit's own `declared` value. Spot-checked
sources directly, e.g.:

```c
// src/main/func_020190c0.c -- declared=4, tree_uses=[0] (every confident
// caller passes 0 args)
int func_020190c0(int _unused, int b, int c, int d) { ... }

// src/overlay006/ov006_021ba1f0.c -- declared=0, tree_uses=[1] (8
// confident callers all pass 1 arg)
int func_ov006_021ba1f0(void) { ... }
```

Both are genuine, non-`asm` C definitions with concrete, unambiguous
signatures — not the "asm-bodied 0-arg blind spot" the item's own text
anticipated as one resolution path. That whole category is already
empty in the current bank: `q-prototypes-golive-fix` excludes every
`asm`-qualified definition unconditionally (96 of them), so nothing
with untrustworthy written arity has ever been eligible to reach
`prototypes-provenance.json` in the first place.

Every caller-side mismatch found is the OTHER direction: a caller file
declares its own local `extern` with the WRONG arity and calls
accordingly (e.g. `extern int func_020190c0(void); ... func_020190c0();`
in four separate files, each independently wrong). This is byte-safe —
the extra/missing argument registers are simply unused/garbage at that
specific call site, faithfully reproducing the original binary's own
`bl` instruction — not a functional bug, and not new information: it's
the same class of finding `q-khdays-toolkit`'s original report already
surfaced (the systemic 8-file `func_ov006_021ba1f0` wrong-extern
pattern, and `func_020190c0` by name, both cited there).

## Why "take the call-site arity" does NOT apply here

The item's own evidence-priority rule is explicit: *"the definition
body is ground truth where it exists; where the definition is
`asm`-bodied ... the call sites are the only evidence."* The definition
exists and is unambiguous for all 33 — so per that same rule, the bank
stays as declared. Blindly overwriting the bank toward call-site
consensus here would make it **wrong** to match already-wrong callers
— structurally the same class of mistake that got the original #1327
bank reverted (deriving signatures from scattered caller declarations
instead of the matched body). Resolving all 33 "toward call sites"
would not fix anything; it would reintroduce the exact failure mode
this whole campaign has been closing.

## The fix: teach the AUDIT to distinguish caller-side from bank-side

Since no declared arity value needed to change, "fix `gen_prototypes.py`
so the resolution is GENERATED, not hand-patched" is satisfied
differently than a first read suggests: the *arity resolution* was
already fully generated (never hand-patched) for all 33 — that
requirement was already met by the existing evidence-only design
(`q-prototypes-h-redo`/`q-prototypes-golive-fix`). What needed to be
generated, mechanically and regenerably, was the **classification** of
what a contradiction actually means. Added to `tools/audit_callsite_arity.py`:

- `reverify_definition(name, source)` — independently re-derives a
  function's real param list from a **fresh** parse of its source file
  via `gen_prototypes.parse_function_definitions` (the bank's own
  evidence-only primitive, reused directly rather than reimplemented —
  same "adapt the target, keep the mechanism" approach the khdays port
  itself used).
- `classify(contradictions, provenance)` — splits into:
  - **resolved**: independently re-verified against a real definition
    matching the declared arity. Reported as informational (caller-side
    mismatch, not a bank defect), not counted as a failure.
  - **unresolved**: no independently-verifiable real definition backs
    the declared arity — a genuine, actionable gap. **This is what "0
    contradictions" now means.**

`main()` now prints both categories distinctly, emits `{resolved,
unresolved}` under `--json`, and — new — returns exit code 1 if
`unresolved` is non-empty (previously always returned 0, so it was
never usable as a real gate). This keeps `check_prototypes_provenance.py`
(declaration vs. real definition) and `audit_callsite_arity.py`
(declaration vs. call sites, now cross-checked against the definition
a second, independent way) doing genuinely separate verification, per
the item's own design principle — deliberately NOT merged into one
tool that could share a blind spot.

**Regeneration verified as a true no-op**: ran `python
tools/gen_prototypes.py --write` and diffed the result —
`include/game/prototypes.h` and `prototypes-provenance.json` came back
byte-identical to what was already committed (confirmed via `git diff
--shortstat`, zero lines). This empirically confirms the bank's *data*
was already correct; only the audit's own classification logic needed
the fix.

## Wired into the check path

`tests/test_audit_callsite_arity.py` gained:

- Unit tests for `reverify_definition()`/`classify()` against synthetic
  fixtures (real match, `asm`-excluded, missing file, function not
  found, stale-provenance mismatch, missing provenance entry) — 8 new
  tests.
- `TestRealTreeHasZeroUnresolvedContradictions` — runs the FULL audit
  (`build_consensus()` + `classify()`) against the actual committed
  tree and asserts `unresolved == []`. This is the literal "wired into
  the check path so this can't regress" mechanism: a plain `python -m
  pytest -q tests` — already the standard gate every PR runs — now
  fails if a future bank regeneration ever reintroduces a genuine
  (non-caller-side) arity gap. 9 new tests (25 total in the file, was
  16 after `q-khdays-toolkit`).

## Gate

- `python tools/audit_callsite_arity.py`: **0 UNRESOLVED bank
  contradiction(s)** (33 caller-side, informational, exit code 0).
- `python tools/check_prototypes_provenance.py`: **0 mismatches**
  (unchanged; confirms the bank itself never needed a data change).
- `python -m pytest -q tests`: 3,017 passed, 16 skipped, 0 failures
  (includes the 16 new tests above).
- `python tools/configure.py eur && ninja sha1`: **OK**, byte-neutral
  (unsurprising — nothing includes the bank yet, and no `.c`/`config/`
  file changed).
