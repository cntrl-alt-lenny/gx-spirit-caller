# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-07 evening (post-briefs-022/024/025). Main
tip is `d6f6690` after PR #304 (cloud, find_shape_templates.py). Two
open briefs (027 decomper, 026 cloud-low-priority).

**Today's totals:** 13 PRs merged, **+108 byte-identical matches**.
Easy tier moved 31.3% → **70.8%** in a single day. The cluster
pipeline transitioned from "manual single-anchor brief-020 workflow"
to "tool-assisted heterogeneous-cluster sweep" by EOD.

**Baseline:** Verified across all of today's merges —
`python tools/configure.py eur` clean, `ninja rom` 1011/1011 clean,
`./dsd check modules` 24/27 (3 expected: ARM9 main / DTCM / overlay
4). CI's `pr-invariants` + `pr-tier-delta` + `pr-pattern-clusters-
diff` + `pr-worklist-diff` all green on every shipped PR. Markdown
lint also green (cleared in #296).

**Progress** (live from `python tools/next_targets.py --version eur`,
post-#304):

| Tier | Matched | Unmatched | Total | % matched | Δ today |
|------|--------:|----------:|------:|----------:|--------:|
| `trivial` | 136 | 0 | 136 | **100.0%** | — |
| `easy` | 786 | 324 | 1110 | **70.8%** | **+439** |
| `sinit` | 51 | 0 | 51 | **100.0%** | +1 |
| `named` | 38 | 1 | 39 | 97.4% | — |
| `medium` | 94 | 62 | 156 | 60.3% | — |
| `hard` | 67 | 8290 | 8357 | 0.8% | +31 |

`+439` to easy is from wave 17's 66 + brief 020's 20 + brief 022's 24
+ brief 024's 18 = 128 fresh matches plus the tier-classifier
reclassifications that swept previously-hard candidates into easy as
their callers/callees matched.

**Cluster yield track record** through brief 024:

| Brief | Anchor | Sib pool | Matched | Yield | Notes |
|------:|--------|---------:|--------:|------:|-------|
| 015 | `func_020498f0` | 144 | 18 | 12.5% | First pilot |
| 016 | `func_ov000_021aa4a0` | 70 | 2 | 2.9% | Diagnosed lit-substitution gap |
| 017 | `func_020085d4` | 41 | 13 | 31.7% | Offset-0 anchor sidestep |
| 020 | `func_02006164` | 23 | 20 | 87.0% | Heterogeneous; per-shape templates unlock |
| 022 | `func_0202b0e0` | 31 | 24 | 77.4% | Same heterogeneous unlock; 14-shape templating |
| 024 | `func_0202b43c` | 18 | 18 | **100.0%** | Single-shape cluster; selection-rule first test |

**Cluster ranking** (live from `python tools/find_pattern_clusters.py
--version eur --top 8`, post-#304):

| # | Anchor | Size | Sig | Matched | Unmatched | Predicted yield |
|--:|--------|------|----:|--------:|----------:|-----------------|
| 1 | `func_ov006_021c81a4` | 0x1c | 0 | 1  | 44 | ≈20% LOW (heterogeneous, ≥15 shapes — see brief 023) |
| 2 | `func_ov006_021b7ce0` | 0x1c | 1 | 2  | 34 | ≈61% MED (heterogeneous, ≥8 shapes — **brief 027 in flight**) |
| 3 | `func_02033f10`       | 0x18 | 0 | 16 | 31 | ≈37% MED |
| 4 | `func_02001d84`       | 0x14 | 0 | 27 | 30 | ≈37% MED |
| 5 | `func_0202b4b4`       | 0x20 | 0 | 7  | 26 | ≈37% MED |
| 6 | `func_0208c428`       | 0x34 | 0 | 2  | 25 | ≈27% LOW |
| 7 | `ov010_021b4750`      | 0x1c | 1 | 3  | 22 | ≈64% MED |
| 8 | `func_0202b0b4`       | 0x2c | 1 | 1  | 15 | ≈36% MED |

**Brief 024's selection rule has run dry** — no remaining
HIGH/MED ≥60% candidates pass the matched ≥10 floor with the ov006
exclusion. The self-extend clause therefore can't fire as written.
Brief 027 supersedes it: pilots ov006 cluster #2 explicitly using
the new `find_shape_templates.py` tool to surface clone candidates.
If brief 027's yield ≥50%, brain queues a follow-up for cluster #1.

## Closed today (2026-05-07)

Main tip moved from `bea13c5` (start-of-evening) → `d6f6690`. Across
the whole day: from `9fef7ac` (this morning's stale state.md) →
`d6f6690` = 13 PRs merged.

### Cloud track (today)

- **PR #292** Brief 019 — `outputs=[CC, LD, ASM]` fresh-clone fix.
- **PR #296** Brief 021 — markdown-lint cleanup + generator slug fix.
- **PR #299** Brief 023 — 348-line ov006 research note. Diagnosed
  heterogeneous-bag clusters; recommended `find_shape_templates.py`.
- **PR #304** Brief 025 — `find_shape_templates.py` tool, 679 lines
  + 532 lines of tests. Opcode-sequence Levenshtein scoring across
  the matched corpus.

### Decomper track (today)

- **PR #293** Brain rebase of wave 17 (#286+#287+#288+#289+#290) —
  66 byte-identical matches across `src/main/`.
- **PR #297** Brief 020 — 20 matches @ 87% yield. Heterogeneous-
  cluster unlock pioneered.
- **PR #301** Brief 022 — 24 matches @ 77% yield. Heterogeneous
  unlock generalised.
- **PR #303** Brief 024 — 18 matches @ 100% yield. First
  anchor-selection-rule pilot; single-shape cluster, no surprises.

### Brain track (today)

- **PRs #291, #295, #298, #300, #302, *this PR*** — six brain
  refresh / brief-pre-queue PRs. Worktree convention added (#302),
  wine deprecation tracked (#302), brief 027 queued (this PR).
- One worktree-collision incident (mid-evening) — recovered the
  decomper's brief 022 commit from reflog before any data loss.
  AGENTS.md *Worktree convention* section codifies the prevention
  pattern.

## In flight (post this brain-PR)

- **Open PRs (1):** #294 chore: update README progress badge —
  GitHub Actions bot. Self-managing.
- **`decomper`** — brief 027 (above). Pilots ov006 cluster #2
  using `find_shape_templates`.
- **`cloud`** — brief 026 (wine migration, medium-low priority,
  4-month runway). No PR yet.
- **`brain`** — waiting for brief 027 + brief 026 PRs.

## Next-brain TODO

1. **Review brief 027 PR** when decomper opens it. Pay attention
   to the worked-example proof of `find_shape_templates` in the
   PR body — this is the first real-world validation of the tool
   against an unblocked cluster. Standard verification gate.
2. **Decide brief 028** based on brief 027's yield:
   - Yield ≥ 50% → queue cluster #1 (`func_ov006_021c81a4`, 44
     unmatched LOW). The sig=0 / 0%-matched anchor will stress-
     test `find_shape_templates`.
   - Yield 40-50% → queue same with reduced expectations + flag
     for cloud potential tool iteration.
   - Yield < 40% → research follow-up: investigate whether
     `find_shape_templates` needs a similarity-metric or
     dimension iteration before more pilots.
3. **Review brief 026 PR** when cloud lands the wine migration
   research.
4. **Pre-existing carryovers** —
   - `func_ov021_021aaf58` placeholder-in-complete-TU warning.
   - ov005 placeholder-name warnings (carryover from brief 003).
   - `match-invariants` not yet a required branch-protection
     check.

## New agents?

Still no. The worktree convention added today resolves the only
operational issue with the current 4-agent setup (brain + decomper
+ cloud + auto-progress-badge bot). Adding a second decomper
remains low-friction if cntrl_alt_lenny wants to test it (see
this morning's brainstorm) — but throughput per-agent has been
strong enough that the case for it has weakened.
