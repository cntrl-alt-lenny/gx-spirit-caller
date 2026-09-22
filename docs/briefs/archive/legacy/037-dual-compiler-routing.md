### cloud/dual-compiler-routing

**Goal:** Implement per-TU compiler routing in `tools/configure.py`
so specific source files compile with mwcc 1.2/sp2p3 (Style A
epilogue) while the rest stay on mwcc 2.0/sp1p5 (Style B).
Operationalises brief 036's research finding.

**Context:**

Brief 036 (PR #325, `docs/research/style-a-epilogue.md`) confirmed
that mwcc 1.2/sp2p3 emits Style A epilogues for the IRQ-bracket
medium-tier functions where mwcc 2.0/sp1p5 emits Style B. Cloud
verified byte-identical reproduction against 2 of brief 034's
targets (`func_0207cbbc`, `func_020a1e3c`). This is the same
dual-compiler pattern pokediamond uses ([pret/pokediamond
INSTALL.md](https://github.com/pret/pokediamond/blob/master/INSTALL.md):
"Metrowerks C Compiler versions 2.0/sp1 and 1.2/sp2p3").

The medium-tier pivot (brief 034) is currently **completely
blocked** by this — 11/11 attempted targets failed byte-compare
on epilogue alone. ~50% of remaining medium-tier candidates use
Style A by inspection. Cloud's research note has full evidence
+ the per-version sweep.

**Scope:**

1. **Add mwcc 1.2/sp2p3 download support.** Verify
   `tools/download_tool.py` can fetch the 1.2/sp2p3 bundle (cloud
   used these binaries during research; if they're already in
   the existing `mwccarm-latest` archive, just point at them).
   If not, extend `download_tool.py` to grab the older bundle.

2. **Add per-TU routing in `tools/configure.py`.** Brief 036
   proposed three shapes; pick the one with lowest friction:

   - **Filename convention.** Files ending in `*.legacy.c` (or
     similar — pick a clear suffix; cloud research suggested
     `_legacy.c` and `_armv4.c` as candidates) compile with
     mwcc 1.2/sp2p3. Lowest friction; the routing is
     self-documenting in the source tree.
   - **Per-file allowlist** in configure.py. Explicit, easy to
     audit, but adds a maintenance surface as more Style A
     targets are matched.
   - **Per-overlay default** — too coarse per cloud's research;
     skip.

   Recommend filename convention unless you find a strong reason
   otherwise; document the rationale in the PR body.

3. **Update mwcc rule(s) in `build.ninja`** so files routed to
   1.2/sp2p3 use a separate `mwcc_legacy` rule with the
   appropriate compiler path.

4. **Tests.** Extend `tests/test_configure_asm.py` with cases
   covering:
   - File matches the routing rule → uses sp2p3.
   - File doesn't match → uses 2.0/sp1p5 (default).
   - Smoke test that build.ninja contains both rules.

5. **Docs.** Update `AGENTS.md` *Brain onboarding* step 6 if
   the dual download adds a new step. Update `CLAUDE.md`
   toolchain table to list both compilers.

**Non-scope:**

- ❌ Any `src/` changes. Decomper handles the actual Style A
  matches in brief 038 once your routing lands.
- ❌ Dropping `mwcc 2.0/sp1p5` — it's still the default for the
  bulk of the project.
- ❌ Symbol-renaming, AGENTS.md flow rules, state.md.

**Success:**

- A file named per the routing convention compiles with
  mwcc 1.2/sp2p3, others with 2.0/sp1p5.
- `ninja rom` clean; `dsd check modules` baseline 24/27
  preserved.
- Smoke test from brief 036's recommendation: pick one of
  brief 034's 11 attempted targets (e.g. `func_0207cbbc`),
  rename the source to the routing convention, write the C,
  build — should produce a Style A epilogue and byte-match
  the target.
- Tests green; CI clean.
- PR body documents:
  - Which routing shape was picked + rationale.
  - One worked example showing brief 034 unblock (target
    asm + matched output).

**Branch:** `cloud/dual-compiler-routing`

**Priority:** HIGH. Decomper is on hold until this lands. Brief
038 (decomper medium-tier wave 2) immediately follows.

**After this brief lands:**

1. Brain queues brief 038 (decomper, medium-tier wave 2 with
   the new routing). Brief 034's 11 targets are the natural
   first batch.
2. State.md gets a "Style A unblocked" entry.
