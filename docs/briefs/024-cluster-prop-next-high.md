### decomper/cluster-prop-next-high

**Goal:** Pre-queued cluster-propagation pilot round 6, parameterised on
the post-#298 ranking so it stays valid no matter when brief 022 lands.
Pick the strongest-template HIGH or MED candidate available at the
moment you start.

**Context:**

Brief 022 is in flight against `func_0202b0e0` (rank #4 HIGH on
2026-05-07 PM). When 022 lands, that anchor drops out and the
ranking reshuffles. Rather than burn a brain-write cycle picking
brief 024's anchor *after* 022 merges, brain pre-writes 024 now
with an *anchor-selection rule* so decomper has zero idle time
between briefs.

This is the first of a planned class of "self-extending" decomper
briefs — see *Self-extend clause* below for the precedent.

**Anchor selection (do this when you start):**

1. Run:

   ```
   python tools/find_pattern_clusters.py --version eur --top 8
   ```

2. From the output, pick the highest-ranking anchor that satisfies
   **both**:
   - **Predicted yield ≥ 60% [HIGH or MED]** (skip LOW; pre-#243
     experience says LOW means tooling, not decomper effort).
   - **Matched ≥ 10** (template-confidence floor; brief 020
     succeeded with 28/23, brief 022 took on 10/31; below 10 the
     template is too thin to clone shapes from).
   - **NOT** any of the persistently-stuck ov006 anchors —
     `func_ov006_021c81a4`, `func_ov006_021b7ce0`. Brief 023
     (cloud, research-only) is investigating those; until that
     research lands, decomper effort there is wasted.

3. If multiple candidates tie under those filters, prefer the
   one with the **higher matched-to-unmatched ratio** (better
   template signal). Note your choice + the post-#022 cluster
   ranking in the PR body.

   As of 2026-05-07 PM, with brief 022's anchor removed, the
   probable winner is:
   - rank #5 `func_02001d84` — size 0x14, sig 0, **27 matched /
     30 unmatched**, predicted ≈37% MED. Template ratio 0.9 is the
     strongest in the top 8; brief 020 demonstrated MED predictions
     can dramatically over-deliver when a heterogeneous cluster
     responds to per-shape templating.

   Other plausible candidates if the ranking shifts:
   - rank #3 `func_02033f10` — 16/31, 37% MED.
   - rank #8 `func_ov010_021b4750` — 3/22, 64% MED (only if
     matched count climbs after 022 lands).

**Scope:**

- Match the unmatched siblings of the chosen anchor. Use the
  brief-020 / brief-022 unlock pattern: per-shape templates cloned
  from existing matched siblings, up to the same **15 distinct
  shape templates per PR** cap brief 022 carries. Hand-patches
  capped at 3.
- Standard cluster pipeline (`find_pattern_clusters` →
  `propagate_template apply` → `ninja rom` → `ninja objdiff`).
- Rename matched symbols in `config/eur/arm9/symbols.txt`.
- PR body: per-shape template table + dropped-with-reason list +
  carryover reg-alloc notes + 24/27 baseline confirmation.

**Non-scope:**

- ❌ Anything outside the chosen anchor's cluster.
- ❌ The two ov006 LOW/MED clusters (brief 023 territory).
- ❌ `tools/`, `libs/`, `include/`, `AGENTS.md`, `docs/state.md`.

**Success:**

- Lower bound: ≥ 40% of the chosen cluster's unmatched count
  matched (e.g. 12+/30 if `func_02001d84` is the chosen anchor).
  Higher if the cluster turns out heterogeneous like brief 020.
- All matches verified locally + `pr-tier-delta` green.

**Branch:** `decomper/cluster-prop-<addr>` where `<addr>` is the
8-hex address of the chosen anchor (e.g.
`decomper/cluster-prop-02001d84` if rank #5 wins).

## Self-extend clause

This brief introduces a precedent the brain wants to test: rather
than wait for brain to write a fresh brief between every cluster
pilot, decomper may, **after this brief lands**, immediately pick
the next anchor satisfying the same selection rule above and open
another PR — branched as `decomper/cluster-prop-<next-addr>` —
without waiting for brain to file brief 026.

Constraints on self-extend:

- Stay inside the *anchor selection* rule (HIGH/MED ≥60%, matched
  ≥10, not the ov006 anchors, prefer high template ratio).
- One cluster per PR. Don't bundle multiple anchors.
- Stop after **two** self-extended PRs in a row, or whenever
  cluster ranking has visibly shifted enough that a brain-written
  brief would benefit from a fresh look. Ping brain in the second
  self-extended PR's body asking for a brief or a clean break.
- If the chosen anchor turns out to be heterogeneous and yields
  >15 shape-templates, *that* is the trigger to stop and ping
  brain — the next pilot probably wants explicit scoping.

If self-extend works smoothly across briefs 024 → 026, brain
codifies the precedent in AGENTS.md as a permanent decomper
prerogative. If it produces noise (PRs landing on stale ranking,
duplicated work, surprise scopes), brain rolls it back and goes
back to one-brief-per-pilot.

**After this brief (and its self-extends) land:**

1. Brain refreshes state.md with the cumulative match wave +
   updated cluster ranking.
2. Brain decides whether self-extend graduates to AGENTS.md text,
   stays per-brief, or rolls back.
