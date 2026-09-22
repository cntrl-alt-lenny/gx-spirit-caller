### claude-pc/easy-tier-wave

**Goal:** Match ~25 easy-tier leaf functions across the overlays the
sinit/trivial work has made warmest — ov005, ov006, ov007, ov009.
These are size ≤ 0x20 with no unmatched callees, i.e. the kind of
1–3-line C function where the disassembly fits in your head in one
read. Not a bulk-copy pattern like briefs 003/004; each one is its
own small decomp puzzle.

**Context:**

- Brief 003 (sinits) + brief 004 (trivials) closed out the
  copy-paste tiers. Easy-tier is the next step up: you're now
  actually *reading* ARM to write C, not just emitting a template.
- `python tools/next_targets.py --version eur --tier easy` reports
  **1118 unmatched easy functions** across every module. Brief 005
  scopes a narrow slice so the decomper can validate the pattern
  before scaling:

  | Overlay | Easy unmatched |
  |---------|----------------|
  | ov006   | 42             |
  | ov005   | 11             |
  | ov007   | 7              |
  | ov009   | 3              |
  | **Target for this brief** | **~25** |

- Pattern template: the 5 ov005 easy leaves from PR #11 (before the
  brain handoff) — e.g. [`src/overlay005/ov005_021ab0fc.c`](../../src/overlay005/ov005_021ab0fc.c)
  — show the shape:
    1. Leading comment with the raw disassembly + what the
       instructions actually do (which registers, which loads).
    2. Minimal C that produces byte-identical output.
    3. `extern` declarations for anything called.
- Many easy-tier functions are **chained pointer loads, flag
  getters, bitfield extractors, conditional returns**. Read the
  disassembly, hypothesise the struct shape, write the C.
- For functions with >0 callers, run
  [`python tools/find_callsites.py --version eur <module>
  <addr>`](../../tools/find_callsites.py) first. A leaf called from
  5 callsites probably has a meaningful name; one called from
  nowhere is safe to leave as `func_<mod>_<addr>`.

**Scope:**

- `src/overlay<NN>/<filename>.c` for each matched function
  (one `.c` per function is cleanest for easy-tier; the stub
  batching from brief 004 is only for truly-identical empty
  functions).
- `config/eur/arm9/overlays/ov<NN>/delinks.txt` — append `complete`
  entries as each TU lands.
- Symbol renames are *optional* for this brief — if `find_callsites`
  makes the role obvious (e.g. "called only by `__sinit_ov005_*` —
  clearly a ctor"), rename via `tools/rename_symbol.py`. Otherwise
  keep `func_<mod>_<addr>`.

**Non-scope:**

- ❌ Failing modules (`main`, `dtcm`, `ov004`). Brief 004's scope-out
  still applies.
- ❌ Other overlays' easy-tier (ov000 has 46, ov010 has 19, ov011 has
  37, ov015 has 12 — future briefs).
- ❌ The 4 deferred sinit outliers. Separate brief.
- ❌ Medium/named/hard tier. Separate brief.
- ❌ Changes to `tools/`, `libs/`, `AGENTS.md`, workflow files.

**Success:**

- 100% objdiff match on each new `.c` file before you push.
- `ninja rom && ./dsd check modules` still reports **24/27 OK** —
  no regressions.
- `python tools/check_match_invariants.py --version eur` (Cloud
  shipped this in #67) — run it at the end of each PR as a pre-flight
  gate. Warnings are fine if they're the known brief-003 ctor/dtor
  stub cases; new warnings or errors should be investigated.
- `python tools/next_targets.py --version eur --tier easy` breakdown
  shifts by the number of matched functions (easy matched: 5 →
  30-ish).
- **PR cadence:** one PR per 5–8 matched functions, grouped by
  overlay where possible. The easy-tier effort-per-match is higher
  than brief 004's, so smaller batches give brain better review
  leverage if the pattern drifts.

**Branch:** `claude-pc/easy-tier-wave` (or per-overlay pair, e.g.
`claude-pc/easy-tier-ov005-ov009`).

**Useful toolchain for this brief:**

- [`tools/next_targets.py`](../../tools/next_targets.py) — per-overlay
  filtered lists, e.g. `--version eur --tier easy --module ov006
  --top 10 --no-outputs`.
- [`tools/find_callsites.py`](../../tools/find_callsites.py) —
  bidirectional xref to guess signatures and naming.
- [`tools/rename_symbol.py`](../../tools/rename_symbol.py) — for
  validated renames after objdiff confirms a match.
- [`tools/check_match_invariants.py`](../../tools/check_match_invariants.py)
  — pre-merge sanity check for metadata coherence.
- [`docs/decomp-workflow.md`](../decomp-workflow.md) (Cloud's new
  onboarding guide) — the narrative loop in one place.

**After this brief lands:**

1. **Brief 006:** easy-tier wave 2 — the heavier overlays (ov000,
   ov010, ov011, ov015). ~100+ targets; spread across 5–10 PRs.
2. **Brief 007:** the 4 deferred sinit outliers — targeted C
   incantations (`volatile`, arg-order variations, pragma tweaks) or
   reasoned asm exemptions.
3. **Brief 008:** named-medium tier (22 candidates) — first
   genuinely-non-trivial matching work.
