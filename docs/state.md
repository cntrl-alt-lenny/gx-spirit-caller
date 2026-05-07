# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-07 late-evening (post-briefs-026/027). Main
tip is `1a16c8d` after PR #307 (cloud, wine migration to Game Porting
Toolkit). One open brief (028, decomper).

**Today's totals:** **15 PRs merged**, **+140 byte-identical matches**.
Easy tier moved 31.3% → **73.7%** in a single day. Wine deprecation
unblocked. The cluster pipeline now runs `find_shape_templates`-
assisted on previously-stuck heterogeneous clusters and is delivering
70-94% yields where brief 023 had calibrated 40-60%.

**Baseline:** Verified across all of today's merges —
`python tools/configure.py eur` clean, `ninja rom` 1011/1011 clean,
`./dsd check modules` 24/27 (3 expected: ARM9 main / DTCM / overlay
4). CI's `pr-invariants` + `pr-tier-delta` + `pr-pattern-clusters-
diff` + `pr-worklist-diff` all green on every shipped PR. Markdown
lint also green. Brief 026 verified the same baseline against the
Game Porting Toolkit wine binary — ROM SHA-1 bit-identical to the
wine-stable output from the same `src/`.

**Progress** (live from `python tools/next_targets.py --version eur`,
post-#307):

| Tier | Matched | Unmatched | Total | % matched | Δ today |
|------|--------:|----------:|------:|----------:|--------:|
| `trivial` | 136 | 0 | 136 | **100.0%** | — |
| `easy` | 818 | 292 | 1110 | **73.7%** | **+471** |
| `sinit` | 51 | 0 | 51 | **100.0%** | +1 |
| `named` | 38 | 1 | 39 | 97.4% | — |
| `medium` | 94 | 62 | 156 | 60.3% | — |
| `hard` | 67 | 8290 | 8357 | 0.8% | +31 |

**Cluster yield track record** through brief 027:

| Brief | Anchor | Sib pool | Matched | Yield | Notes |
|------:|--------|---------:|--------:|------:|-------|
| 015 | `func_020498f0` | 144 | 18 | 12.5% | First pilot |
| 016 | `func_ov000_021aa4a0` | 70 | 2 | 2.9% | Diagnosed lit-substitution gap |
| 017 | `func_020085d4` | 41 | 13 | 31.7% | Offset-0 anchor sidestep |
| 020 | `func_02006164` | 23 | 20 | 87.0% | Heterogeneous; per-shape templates unlock |
| 022 | `func_0202b0e0` | 31 | 24 | 77.4% | Same heterogeneous unlock; 14-shape templating |
| 024 | `func_0202b43c` | 18 | 18 | 100.0% | Single-shape cluster; selection-rule first test |
| 027 | `func_ov006_021b7ce0` | 34 | 32 | **94.1%** | First find_shape_templates pilot; ov006 cluster #2 |

**Cluster ranking** (live from `python tools/find_pattern_clusters.py
--version eur --top 8`, post-#307):

| # | Anchor | Size | Sig | Matched | Unmatched | Predicted yield |
|--:|--------|------|----:|--------:|----------:|-----------------|
| 1 | `func_ov006_021c81a4` | 0x1c | 0 | 1  | 44 | ≈20% LOW (heterogeneous, ≥15 shapes — **brief 028 in flight**) |
| 2 | `func_02033f10`       | 0x18 | 0 | 16 | 31 | ≈37% MED |
| 3 | `func_02001d84`       | 0x14 | 0 | 27 | 30 | ≈37% MED |
| 4 | `func_0202b4b4`       | 0x20 | 0 | 7  | 26 | ≈37% MED |
| 5 | `func_0208c428`       | 0x34 | 0 | 2  | 25 | ≈27% LOW |
| 6 | `ov010_021b4750`      | 0x1c | 1 | 3  | 22 | ≈64% MED |
| 7 | `func_0202b0b4`       | 0x2c | 1 | 1  | 15 | ≈36% MED |
| 8 | `func_02001e84`       | 0x10 | 0 | **42** | 14 | ≈37% MED (3.0 template ratio — strongest in top 8) |

Cluster #2 (`func_ov006_021b7ce0`) drained out via brief 027.
Cluster #1 still rank #1; brief 028 targets it next. Rank #8
`func_02001e84` is interesting for a follow-up: 42 matched / 14
unmatched is a 3:1 template ratio that should over-deliver under
brief-020-style heterogeneous unlock if the cluster turns out
multi-shape.

## Closed today (2026-05-07)

Main tip moved across the whole day from `9fef7ac` (this morning's
stale state.md) → `1a16c8d` = **15 PRs merged**.

### Cloud track (today)

- **PR #292** Brief 019 — `outputs=[CC, LD, ASM]` fresh-clone fix.
- **PR #296** Brief 021 — markdown-lint cleanup + generator slug fix.
- **PR #299** Brief 023 — 348-line ov006 research note. Diagnosed
  heterogeneous-bag clusters; recommended `find_shape_templates.py`.
- **PR #304** Brief 025 — `find_shape_templates.py` tool, 679 lines
  + 532 lines of tests.
- **PR #307** Brief 026 — wine migration to Game Porting Toolkit
  cask. AGENTS.md *Brain onboarding* + *Wine on macOS* sections
  updated. `tools/configure.py` gains `_resolve_macos_wine()`
  helper that auto-detects `wine` (existing) or `wine64` (GPTK).
  Brain locally verified.

### Decomper track (today)

- **PR #293** Brain rebase of wave 17 (#286+#287+#288+#289+#290) —
  66 byte-identical matches across `src/main/`.
- **PR #297** Brief 020 — 20 matches @ 87% yield. Heterogeneous-
  cluster unlock pioneered.
- **PR #301** Brief 022 — 24 matches @ 77% yield. Heterogeneous
  unlock generalised.
- **PR #303** Brief 024 — 18 matches @ 100% yield. First
  anchor-selection-rule pilot.
- **PR #306** Brief 027 — 32 matches @ 94% yield. First
  `find_shape_templates` pilot; ov006 cluster #2 fully drained.

### Brain track (today)

- **PRs #291, #295, #298, #300, #302, #305, *this PR*** — seven
  brain refresh / brief-pre-queue PRs.
- Worktree convention added (#302). Wine deprecation flagged
  (#302) and now resolved (#307).
- One worktree-collision incident — recovered from reflog before
  any data loss; AGENTS.md *Worktree convention* prevents
  recurrence.

## In flight (post this brain-PR)

- **Open PRs (1):** #294 chore: update README progress badge —
  GitHub Actions bot. Self-managing.
- **`decomper`** — brief 028 (above). ov006 cluster #1, 44
  unmatched, second find_shape_templates pilot.
- **`cloud`** — nothing open. State.md backlog suggests a tool
  iteration brief if 028's yield falls below 30%.
- **`brain`** — waiting for brief 028 PR.

## Next-brain TODO

1. **Review brief 028 PR** when decomper opens it. Standard gate.
   Pay attention to:
   - Per-shape template table referencing brief 023's
     classification.
   - Time-spent ballpark vs brief 027 — useful signal for whether
     the tool's leverage scales with cluster size.
   - First-pass / second-pass split per the brief's suggested
     cadence.
2. **Decide brief 029** based on brief 028's yield:
   - Yield ≥ 50% → queue rank-#8 `func_02001e84` (42 matched /
     14 unmatched, 3:1 template ratio, MED 37% — should over-
     deliver per the brief-020 pattern). Or pick the next rank-
     #2 `func_02033f10` MED 37%.
   - Yield 30-50% → queue cluster-#1 leftovers + cluster-#2
     leftovers as a sweep PR.
   - Yield < 30% → queue cloud research follow-up: investigate
     whether `find_shape_templates` needs a sig=0 dimension
     boost (byte-prefix fingerprint to disambiguate same-opcode-
     sequence functions).
3. **Pre-existing carryovers** —
   - `func_ov021_021aaf58` placeholder-in-complete-TU warning.
   - ov005 placeholder-name warnings (carryover from brief 003).
   - `match-invariants` not yet a required branch-protection
     check.

## New agents?

Still no. Today scaled fine through 4 agents (brain + decomper +
cloud + auto-progress-badge bot). The only operational issue
(worktree collision) was resolved with the worktree convention.
A second decomper remains low-friction to add if cntrl_alt_lenny
wants to test it, but throughput per-agent is high enough that
the case is weak.
