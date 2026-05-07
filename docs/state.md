# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-07 (post-brief-020 + post-brief-021). Main
tip is `9ac73e7` after PR #297 (decomper brief 020, 20 matches at 87%
yield). Two new briefs filed in this PR (022 decomper / 023 cloud).
No outstanding human-authored open PRs (#294 is the auto progress-
badge bot, self-managing).

**Baseline:** Verified on macOS arm64 by this brain across the 6 PRs
merged today — `python tools/configure.py eur` clean, `ninja rom`
1011/1011 clean, `./dsd check modules` reproduces 24/27 (3 expected
failures: ARM9 main / DTCM / overlay 4). CI's `pr-invariants` +
`pr-tier-delta` + `pr-pattern-clusters-diff` + `pr-worklist-diff` all
green on every shipped PR. **Markdown lint also now green on main**
after PR #296 — the 7 pre-existing failures (briefs/016, briefs/017,
tools-index.md) are cleared.

**Progress** (live from `python tools/next_targets.py --version eur`,
post-#297):

| Tier | Matched | Unmatched | Total | % matched | Δ since 5/7 AM |
|------|--------:|----------:|------:|----------:|---------------:|
| `trivial` | 136 | 0 | 136 | **100.0%** | — |
| `easy` | 744 | 366 | 1110 | **67.0%** | **+20** |
| `sinit` | 51 | 0 | 51 | **100.0%** | — |
| `named` | 38 | 1 | 39 | 97.4% | — |
| `medium` | 94 | 62 | 156 | 60.3% | — |
| `hard` | 67 | 8290 | 8357 | 0.8% | — |

Easy tier crossed 2/3 matched today. Brief 020 alone took the cluster
pipeline's all-time record yield from #264's 94.7% (boolean-wrapper
single-shape pilot) into the heterogeneous-cluster era at 87% on a
much-more-varied cluster — different style of win.

**Cluster yield track record** through brief 020:

| Brief | Anchor | Sib pool | Matched | Yield | Notes |
|------:|--------|---------:|--------:|------:|-------|
| 015 | `func_020498f0` | 144 | 18 | 12.5% | First pilot |
| 016 | `func_ov000_021aa4a0` | 70 | 2 | 2.9% | Diagnosed lit-substitution gap |
| 017 | `func_020085d4` | 41 | 13 | 31.7% | Offset-0 anchor sidestep |
| 020 | `func_02006164` | 23 | 20 | **87.0%** | Heterogeneous; per-shape templates unlock |

**Cluster ranking** (live from `python tools/find_pattern_clusters.py
--version eur --top 8`, post-#297):

| # | Anchor | Size | Sig | Matched | Unmatched | Predicted yield |
|--:|--------|------|----:|--------:|----------:|-----------------|
| 1 | `func_ov006_021c81a4` | 0x1c | 0 | 1  | 44 | ≈20% [LOW] |
| 2 | `func_ov006_021b7ce0` | 0x1c | 1 | 2  | 34 | ≈61% [MED] |
| 3 | `func_02033f10`       | 0x18 | 0 | 16 | 31 | ≈37% [MED] |
| 4 | `func_0202b0e0`       | 0x20 | 1 | 10 | 31 | ≈74% [HIGH] |
| 5 | `func_02001d84`       | 0x14 | 0 | 27 | 30 | ≈37% [MED] |
| 6 | `func_0202b4b4`       | 0x20 | 0 | 7  | 26 | ≈37% [MED] |
| 7 | `func_0208c428`       | 0x34 | 0 | 2  | 25 | ≈27% [LOW] |
| 8 | `ov010_021b4750`      | 0x1c | 1 | 3  | 22 | ≈64% [MED] |

57 ready-to-propagate clusters cover **434 unmatched** (was 454 on
5/7 AM). Brief 022's anchor (`func_0202b0e0`, rank #4) chosen as
the new top-HIGH; rank-#3 `func_02033f10` and rank-#5 `func_02001d84`
are the natural follow-up MED candidates if 022's heterogeneous-
cluster experience holds.

**The persistent ov006 problem:** ranks #1 and #2 are the same
clusters that have been sitting at the top across the entire post-
#243 cluster pipeline. Brief 023 (cloud, research-only) goes after
why — see *In flight* below.

## Closed since previous refresh (5/7 AM → 5/7 PM)

Main tip moved from `2023a67` → `9ac73e7` (2 PRs, 20 matches +
markdown-lint cleanup).

### Cloud track

- **PR #296** Brief 021 shipped — cleared the 7 pre-existing
  markdown-lint failures across `briefs/016`, `briefs/017`,
  `tools-index.md`. Bonus root-cause fix: `_heading_slug()` helper
  added to `tools/generate_tool_index.py` so future regenerations
  produce GFM-correct anchor fragments. Lint workflow now green
  on main.

### Decomper track

- **PR #297** Brief 020 shipped — **20 byte-identical matches at
  87% yield** (target ≥12, predicted 74%). Discovery: the cluster
  was heterogeneous (1 anchor shape + 11 sibling shapes all
  fingerprinting at the same `(size, sig_len)`). Decomper unlocked
  via per-shape templating (12 distinct shape templates, often
  cloned from existing matched siblings) rather than per-bit-
  position hand-patches. Brief 022 carries the lifted-cap
  guidance forward.

### Brain track (this PR)

- Refreshed state.md to reflect post-brief-020 cluster ranking
  and +20 easy-tier delta.
- Wrote brief 022 (`decomper/cluster-prop-0202b0e0`) — round-5
  cluster pilot. Anchor: rank-#4 `func_0202b0e0` (10/31, 74%
  HIGH). Updated cap from "3 hand-patches" to "15 distinct shape
  templates" based on the brief-020 unlock.
- Wrote brief 023 (`cloud/ov006-cluster-investigation`) —
  research-only diagnosis of the two persistently-stuck top-of-
  pool ov006 clusters. Land as `docs/research/ov006-cluster-
  stuck.md`. Doesn't ship tooling itself — that's a follow-up
  brief if research surfaces a recommendation.
- Closed briefs 020 and 021 in AGENTS.md (both shipped today).

## In flight (post this brain-PR)

- **Open PRs (1):** #294 chore: update README progress badge —
  GitHub Actions bot. Self-managing.
- **`decomper`** — brief 022 (above). Anchor `func_0202b0e0`
  cluster, target ≥15 matches.
- **`cloud`** — brief 023 (above). Research-only ov006 cluster
  diagnosis.
- **`brain`** — waiting for brief 022 + 023 PRs.

## Next-brain TODO

1. **Review brief 022 PR** when decomper opens it. Standard gate:
   `ninja rom` + `dsd check modules` 24/27 + `check_match_invariants`
   (no new error categories) + `pr-tier-delta` matches the PR's
   claimed match count. Affirm any per-shape-template overflow up
   to brief 022's lifted 15-cap; flag overshoot if it goes
   meaningfully past.
2. **Review brief 023 research note** when cloud opens it. Decide
   one of: (a) queue a decomper pilot on ov006 with updated yield
   band, (b) queue follow-up cloud tooling brief, (c) mark out-of-
   scope.
3. **Queue brief 024.** Likely: rank-#3 `func_02033f10` MED or
   rank-#5 `func_02001d84` MED — both have strong matched-template
   counts (16 and 27) so the heterogeneous-cluster unlock from
   brief 020 should transfer well.
4. **Pre-existing carryovers** —
   - `func_ov021_021aaf58` placeholder-in-complete-TU warning.
   - ov005 placeholder-name warnings (carryover from brief 003).
   - `match-invariants` not yet a required branch-protection check.

## New agents?

Still no. Brain + decomper + cloud + the auto-progress-badge bot
continues to scale. Codex CLI sessions have played all three roles
fluently across multiple chunks.
