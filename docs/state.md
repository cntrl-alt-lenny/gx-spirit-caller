# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-07 (post-brief-023). Main tip is `9907258`
after PR #299 (cloud, brief 023 research note). Brief 022 is in
flight on a local-only `decomper/cluster-prop-0202b0e0` branch
(commit `591409b`, 24 byte-identical matches at 77% yield) — not
yet pushed; awaiting decomper push + brain review.

**Operational changes this session:**

1. **Decomper worktree** — set up
   `/Users/leo/Dev/gx-spirit-caller-decomper` as a sibling worktree
   so decomper sessions stop fighting brain over branch state in
   the main clone. AGENTS.md *Worktree convention* section
   documents the pattern. Decomper's brief 022 work currently
   lives in the main clone (mid-session); next decomper session
   should switch to the new worktree.
2. **Wine deprecation flagged** — `wine-stable`, `wine@staging`,
   and `wine@devel` homebrew casks all disabled 2026-09-01.
   Scoped as brief 026 (medium-low priority, ~4-month runway).

**Baseline:** Verified across all 8 PRs merged today —
`python tools/configure.py eur` clean, `ninja rom` 1011/1011 clean,
`./dsd check modules` 24/27 (3 expected: ARM9 main / DTCM / overlay
4). CI's `pr-invariants` + `pr-tier-delta` + `pr-pattern-clusters-
diff` + `pr-worklist-diff` all green on every shipped PR.

**Progress** (live from `python tools/next_targets.py --version eur`,
post-#299; brief 022's +24 not yet pushed/merged):

| Tier | Matched | Unmatched | Total | % matched | Δ since 5/7 PM |
|------|--------:|----------:|------:|----------:|---------------:|
| `trivial` | 136 | 0 | 136 | **100.0%** | — |
| `easy` | 744 | 366 | 1110 | **67.0%** | — |
| `sinit` | 51 | 0 | 51 | **100.0%** | — |
| `named` | 38 | 1 | 39 | 97.4% | — |
| `medium` | 94 | 62 | 156 | 60.3% | — |
| `hard` | 67 | 8290 | 8357 | 0.8% | — |

After brief 022 lands and the next state refresh runs, easy tier
projects to 768 / 1110 (69.2%), continuing the daily 31% → 67% →
~70% climb.

**Cluster yield track record** through brief 022:

| Brief | Anchor | Sib pool | Matched | Yield | Notes |
|------:|--------|---------:|--------:|------:|-------|
| 015 | `func_020498f0` | 144 | 18 | 12.5% | First pilot |
| 016 | `func_ov000_021aa4a0` | 70 | 2 | 2.9% | Diagnosed lit-substitution gap |
| 017 | `func_020085d4` | 41 | 13 | 31.7% | Offset-0 anchor sidestep |
| 020 | `func_02006164` | 23 | 20 | **87.0%** | Heterogeneous; per-shape templates unlock |
| 022 | `func_0202b0e0` | 31 | 24 | **77.4%** | Same heterogeneous unlock; 12-shape templating |

**Cluster ranking** (live from `python tools/find_pattern_clusters.py
--version eur --top 8`, post-#299, before brief 022 lands):

| # | Anchor | Size | Sig | Matched | Unmatched | Predicted yield |
|--:|--------|------|----:|--------:|----------:|-----------------|
| 1 | `func_ov006_021c81a4` | 0x1c | 0 | 1  | 44 | ≈20% LOW (heterogeneous, ≥15 shapes — see brief 023) |
| 2 | `func_ov006_021b7ce0` | 0x1c | 1 | 2  | 34 | ≈61% MED (heterogeneous, ≥8 shapes — see brief 023) |
| 3 | `func_02033f10`       | 0x18 | 0 | 16 | 31 | ≈37% MED |
| 4 | `func_0202b0e0`       | 0x20 | 1 | 10 | 31 | ≈74% HIGH (brief 022 in flight, draining) |
| 5 | `func_02001d84`       | 0x14 | 0 | 27 | 30 | ≈37% MED |
| 6 | `func_0202b4b4`       | 0x20 | 0 | 7  | 26 | ≈37% MED |
| 7 | `func_0208c428`       | 0x34 | 0 | 2  | 25 | ≈27% LOW |
| 8 | `ov010_021b4750`      | 0x1c | 1 | 3  | 22 | ≈64% MED |

**Brief 023 unblocked the ov006 problem analytically** — the
clusters' yields are correct, the clusters themselves are
heterogeneous bags. The recommended fix: a `find_shape_templates.py`
tool that automates the brief-020 / brief-022 manual workflow of
finding clone-candidates by opcode-sequence similarity across the
matched corpus. Now scoped as **brief 025** (rewritten this PR;
the original brief 025's A/B/C variants are now obsolete).

## Closed since previous refresh (5/7 PM → 5/7 evening)

Main tip moved from `a760991` → `9907258` (1 PR).

### Cloud track

- **PR #299** Brief 023 shipped — `docs/research/ov006-cluster-
  stuck.md`, 348 lines. 16/45 + 11/36 sampling diagnosis of both
  ov006 clusters. Recommends `find_shape_templates.py` as the
  unblock; brief 025 rewritten to scope it.

### Decomper track (in flight, not yet pushed)

- **brief 022** — local commit `591409b` on
  `decomper/cluster-prop-0202b0e0`. **24 byte-identical matches at
  77% yield**, beating the brief's 15-match floor by 60%. 12
  distinct shape templates (under the lifted 15-cap).
  Decomper hasn't pushed the branch yet; once they do, brain
  reviews + merges per standard workflow.

### Brain track (this PR)

- Refreshed state.md with brief 023 closed + brief 022 in-flight
  status.
- Set up `/Users/leo/Dev/gx-spirit-caller-decomper` worktree;
  documented the worktree convention in AGENTS.md.
- Rewrote brief 025 to scope `find_shape_templates.py` per cloud's
  recommendation. Original A/B/C variants are obsolete (brief 023
  showed the cluster fingerprint isn't bugged).
- Wrote brief 026 (`cloud/wine-migration-prep`) for the
  homebrew-wine deprecation. Medium-low priority; 4-month runway.
- Updated AGENTS.md *Brain onboarding* with a worktree-convention
  section and a wine-deprecation note.
- Recovery action: during this session brain accidentally
  `git reset --hard origin/main` while on the decomper branch
  in the main worktree. Recovered the decomper's brief 022 commit
  (`591409b`) from reflog before the next push. **Lesson: this is
  exactly the failure mode the worktree convention prevents.**

## In flight (post this brain-PR)

- **Open PRs (1):** #294 chore: update README progress badge —
  GitHub Actions bot. Self-managing.
- **`decomper`** — brief 022 (local commit, awaiting push). Then
  brief 024 (pre-queued, anchor-selection rule).
- **`cloud`** — brief 025 (now scoping `find_shape_templates.py`)
  + brief 026 (wine migration, non-urgent).
- **`brain`** — waiting for brief 022 push + brief 024 + brief 025
  PRs.

## Next-brain TODO

1. **Review brief 022 PR** when decomper pushes it. Standard
   gate: `ninja rom` + `dsd check modules` 24/27 +
   `check_match_invariants` (no new error categories) +
   `pr-tier-delta` matches the PR's claimed match count.
2. **Confirm decomper has switched to the new worktree** for
   brief 024 / future work. State.md and AGENTS.md cover the
   convention; cntrl_alt_lenny needs to point the next decomper
   session at `/Users/leo/Dev/gx-spirit-caller-decomper`.
3. **Review brief 024 PR** — pre-queued under the anchor-
   selection rule. Self-extend clause allows up to two follow-up
   PRs without a fresh brief; verify each new PR's selection
   matches the rule.
4. **Review brief 025 PR** when cloud opens it. The new
   `find_shape_templates.py` tool. Spot-check at least three of
   brief 023's sampled siblings to confirm clone-candidate
   surfacing.
5. **Review brief 026 PR** when cloud lands the wine migration.
6. **Pre-existing carryovers** —
   - `func_ov021_021aaf58` placeholder-in-complete-TU warning.
   - ov005 placeholder-name warnings (carryover from brief 003).
   - `match-invariants` not yet a required branch-protection
     check.

## New agents?

Still no. Brain + decomper + cloud + the auto-progress-badge bot
continues to scale. The worktree convention added this session
isolates brain and decomper enough that adding a second decomper
session is now low-friction if cntrl_alt_lenny wants to test it
(see this morning's brainstorm — that's a separate decision from
the worktree fix).
