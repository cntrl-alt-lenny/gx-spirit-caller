### cloud/sp3-routing-research

**Goal:** Decide whether the project should add mwcc 1.2/sp3
routing as a third compiler tier. Brief 042 (PR #334) verified
that W-B (`func_020467f4`) and W-C-Style-B-half
(`func_02023fec`) reproduce byte-identically with mwcc 1.2/sp3,
which neither sp2p3 nor 2.0 can match. The cost of a third
routing tier is ~1 day of cloud work and ongoing build complexity;
the benefit is unlocking N targets where N is currently unknown.

**Scope (research-only):**

1. **Sweep candidate detection.** Build a small script (or run
   ad-hoc):
   - For each unmatched medium-tier and easy-tier candidate, try
     compiling a stub `.c` with mwcc 1.2/sp3 + the project's
     standard flags.
   - Disassemble result, compare byte signature to target ROM.
   - If sp3 produces a closer match than sp2p3 or 2.0, count it
     as a sp3-candidate.

2. **Quantify.** Out of the remaining ~262 medium+easy unmatched
   candidates (or some sample if full sweep is too slow), how
   many are sp3-byte-identical-only? Bucket the result:
   - **≥ 10 candidates** — strongly worth the routing tier.
     Brief 045 implements `*.legacy_sp3.c` (or chosen suffix).
   - **5–9 candidates** — borderline. Recommend `.s` files for
     these specific targets instead of a third routing tier.
   - **< 5 candidates** — not worth the build complexity. Treat
     W-B / W-C-half as one-offs via `.s` files.

3. **Land** the findings as
   `docs/research/sp3-routing-decision.md` (same format as
   `style-a-epilogue.md`):
   - Method (sweep procedure, sample size if full sweep
     impractical).
   - Per-candidate result (or summary if too many) — count
     sp3-only matches.
   - Verdict against the 10 / 5 / <5 thresholds.
   - One-paragraph recommendation: ship sp3 routing /
     `.s` files only / shelve.

**Pick up the brief 041 provisional wall while you're here:**

Brief 041 (PR #335) flagged a provisional wall on
`func_0201904c` — clamped 16-bit add (`if (sum > 0xffff)` C
shape doesn't trigger the `orrhi/movls/orrls` predicated 3-way
target shape). Try sp3 + sp2p3 + 2.0 against this target as part
of the sweep. If sp3 matches, that's another data point for the
verdict.

**Non-scope:**

- ❌ Implementing the sp3 routing itself. That's a follow-up
  brief if the verdict is positive.
- ❌ Ad-hoc `.s` files for individual targets. That's decomper
  territory if recommended.
- ❌ AGENTS.md / state.md edits.

**Success:**

- `docs/research/sp3-routing-decision.md` exists with one of:
  ship-routing / .s-only / shelve verdicts.
- For the recommended path, the implementation brief is
  scoped at the bottom of the doc (so brain can copy it into
  brief 045 directly).
- Markdown lint clean.

**Branch:** `cloud/sp3-routing-research`

**Priority:** Medium-low. Decomper is not blocked on this; brief
043 explicitly skips the sp3-T-3 targets and continues with
mwcc 1.2/sp2p3 + 2.0/sp1p5. This brief informs whether to invest
in build infra or accept the W-B/W-C/W-A-residue-pattern as
permanent.

**After this brief lands:**

1. Brain reads the verdict.
2. If "ship routing" → brief 045 implements `*.legacy_sp3.c` (or
   chosen convention) in `tools/configure.py`. Same shape as
   brief 037 + brief 039 chain.
3. If ".s-only" → brain queues a small decomper brief that
   walks the listed targets via hand-assembled `.s` files.
4. If "shelve" → state.md notes the W-B/W-C/T-3 targets as
   permanently deferred unless future tooling surfaces.
