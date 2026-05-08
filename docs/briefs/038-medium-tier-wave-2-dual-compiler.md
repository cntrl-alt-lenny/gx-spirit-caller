### decomper/medium-tier-wave-2-dual-compiler

**Goal:** Resume medium-tier matching with brief 037's dual-
compiler routing. Re-attack brief 034's 11 IRQ-bracket targets
that were blocked by the Style A epilogue wall, plus add new
medium-tier candidates as time allows.

**Context:**

Brief 034 (PR #323) attempted 11 medium-tier IRQ-bracket targets
and matched zero — all blocked on the Style A vs Style B
epilogue divergence. Brief 036 (PR #325) confirmed mwcc 1.2/sp2p3
emits Style A. Brief 037 (cloud) implements per-TU compiler
routing so files routed via the new convention compile with
sp2p3.

**Pre-condition:** Brief 037 must be merged before this brief
opens. Verify by running `python tools/configure.py eur` and
checking that `build.ninja` contains both an `mwcc` (default,
2.0/sp1p5) and an `mwcc_legacy` (or whatever cloud named it,
sp2p3) rule. If only one rule, ping brain — brief 037 hasn't
landed yet.

**Workflow:**

1. Re-read brief 034's PR body (#323) for the 11 targets and
   their per-target partial-match scores. Most reached 60-85%
   — the divergences were epilogue-only or epilogue + 1-2
   reg-alloc tweaks.
2. For each target, write the `.c` source using brief 037's
   routing convention (e.g. `src/main/func_0207cbbc.legacy.c`
   if the convention is `*.legacy.c`).
3. Build, byte-compare. The epilogue divergence should now
   evaporate; remaining body divergences fall back to existing
   codegen-walls patterns (most should resolve via C-2 *local-
   pointer reuse*, per cloud's brief 036 note on
   `func_02091690`).
4. Iterate. `find_shape_templates --version eur --target main
   <addr>` may surface clone candidates from already-matched
   sp2p3 functions once the first 1-2 land.

**Targets (priority order from brief 034's PR body):**

| Sym | Brief 034 best partial | Why now |
|---|---:|---|
| `func_02091690` | 79% | Highest partial; cloud's brief 036 confirmed unblock + body falls back to codegen-walls C-2 |
| `func_0209d6f0` | 77% | Same family as 02091690; high partial |
| `func_020a1e3c` | 73% | Cloud verified byte-identical with sp2p3 in brief 036 |
| `func_020916c8` | 71% | Same family |
| `func_0209d724` | 69% | Same family |
| `func_0207cbbc` | 67% | Cloud verified byte-identical with sp2p3 in brief 036 |
| `func_ov000_021ac85c` | 85% | Highest partial overall but had reg-alloc-only divergence (not epilogue) — try with sp2p3 anyway since same family |
| `func_0207b5f8` | 62% | |
| `func_02091714` | 54% | |
| `func_020467f4` | 57% | Style A only (no pool-dedup issue) |
| `func_02023fec` | 29% | Lowest; pool-dedup + Style A — may still need work |

The first 6 are the highest-confidence wins. Aim to land at
least those in this brief.

**Scope:**

- Match 6–11 of brief 034's targets using brief 037's routing.
- May expand beyond brief 034's list if time allows — pick
  additional medium-tier IRQ-bracket targets from
  `next_targets.py` and route them through sp2p3 too.
- Standard rename / verification gate: `ninja rom`,
  `dsd check modules` 24/27, `check_match_invariants` no new
  error categories, `pr-tier-delta` matches +N count.

**Non-scope:**

- ❌ Touching `tools/`, `libs/`, `include/`, `AGENTS.md`,
  `docs/state.md` — brain owns those.
- ❌ Modifying `configure.py` routing rule (cloud's brief 037
  territory; flag issues separately if you find any).

**Success:**

- ≥ 6 byte-identical matches (the brief-034 high-confidence
  set). 9+ matches would clear most of brief 034's blocked
  list.
- All matches verified locally + `pr-tier-delta` green.
- PR body documents:
  - Per-target shape (one-line C-equivalent).
  - Whether brief 037's routing convention was clean to use
    or had rough edges (feedback for cloud).
  - Whether `find_shape_templates` started surfacing
    matched-sp2p3 candidates after the first 1-2 lands.
  - Drops if any (with codegen-walls bucket attribution; new
    walls should be flagged for a brief 039 if they emerge).

**Branch:** `decomper/medium-tier-wave-2`

**After this brief lands:**

1. Brain refreshes state.md + writes brief 039 (next medium-
   tier wave or pivot, depending on what walls remain).
2. If yield is high (≥ 80%), the mwcc-1.2/sp2p3 unlock has
   roughly the same magnitude as brief 025's
   `find_shape_templates` did for the cluster pipeline —
   medium-tier work resumes at full pace.
