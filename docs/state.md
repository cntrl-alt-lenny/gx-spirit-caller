# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-07 night (post-brief-028). Main tip is
`79fe71d` after PR #309 (decomper, brief 028, 27 matches @ 61% yield).
One open brief (029, decomper). The previously-stuck ov006 problem is
fully resolved: both top-of-pool anchors drained.

**Today's totals:** **17 PRs merged**, **+167 byte-identical matches**.
Easy tier moved 31.3% → **76.1%** in a single day. Cluster pipeline
has settled into a tool-assisted rhythm yielding 60-100% on
heterogeneous clusters where the v2 fingerprint failed to subdivide.

**Baseline:** Verified across all of today's merges —
`python tools/configure.py eur` clean, `ninja rom` 1011/1011 clean,
`./dsd check modules` 24/27 baseline preserved. CI's gates all green
on every shipped PR. Markdown lint also green. macOS wine migration
to Game Porting Toolkit verified end-to-end (PR #307).

**Progress** (live from `python tools/next_targets.py --version eur`,
post-#309):

| Tier | Matched | Unmatched | Total | % matched | Δ today |
|------|--------:|----------:|------:|----------:|--------:|
| `trivial` | 136 | 0 | 136 | **100.0%** | — |
| `easy` | 845 | 265 | 1110 | **76.1%** | **+498** |
| `sinit` | 51 | 0 | 51 | **100.0%** | +1 |
| `named` | 38 | 1 | 39 | 97.4% | — |
| `medium` | 94 | 62 | 156 | 60.3% | — |
| `hard` | 67 | 8290 | 8357 | 0.8% | +31 |

**Cluster yield track record** through brief 028:

| Brief | Anchor | Sib pool | Matched | Yield | Notes |
|------:|--------|---------:|--------:|------:|-------|
| 015 | `func_020498f0` | 144 | 18 | 12.5% | First pilot |
| 016 | `func_ov000_021aa4a0` | 70 | 2 | 2.9% | Diagnosed lit-substitution gap |
| 017 | `func_020085d4` | 41 | 13 | 31.7% | Offset-0 anchor sidestep |
| 020 | `func_02006164` | 23 | 20 | 87.0% | Heterogeneous-cluster unlock pioneered |
| 022 | `func_0202b0e0` | 31 | 24 | 77.4% | Unlock generalised |
| 024 | `func_0202b43c` | 18 | 18 | 100.0% | Single-shape; selection-rule first test |
| 027 | `func_ov006_021b7ce0` | 34 | 32 | 94.1% | First find_shape_templates pilot |
| 028 | `func_ov006_021c81a4` | 44 | 27 | 61.4% | Hardest cluster; tool validated on sig=0 worst case |

**Cluster ranking** (live from `python tools/find_pattern_clusters.py
--version eur --top 8`, post-#309):

| # | Anchor | Size | Sig | Matched | Unmatched | Predicted yield |
|--:|--------|------|----:|--------:|----------:|-----------------|
| 1 | `func_02033f10`       | 0x18 | 0 | 16 | 31 | ≈37% MED |
| 2 | `func_02001d84`       | 0x14 | 0 | 27 | 30 | ≈37% MED (0.90 ratio — **brief 029 default**) |
| 3 | `func_0202b4b4`       | 0x20 | 0 | 7  | 26 | ≈37% MED |
| 4 | `func_0208c428`       | 0x34 | 0 | 2  | 25 | ≈27% LOW |
| 5 | `ov010_021b4750`      | 0x1c | 1 | 3  | 22 | ≈64% MED (matched <10, below floor) |
| 6 | `func_0201397c`       | 0x1c | 0 | 28 | 17 | ≈37% MED (1.65 ratio) |
| 7 | `func_0202b0b4`       | 0x2c | 1 | 1  | 15 | ≈36% MED |
| 8 | `func_02001e84`       | 0x10 | 0 | **42** | 14 | ≈37% MED (3.0 ratio — strongest in top 8) |

Both ov006 anchors are out of the top 8. **No remaining HIGH
candidates and no MED ≥60% with matched ≥10.** The cluster pool is
all MED 37% from here. Brief 029 picks the strongest-template-ratio
candidate; brief-028 experience suggests these MED predictions can
over-deliver via per-shape templating.

## Closed today (2026-05-07)

Main tip moved across the whole day from `9fef7ac` (this morning's
stale state.md) → `79fe71d` = **17 PRs merged**.

### Cloud track (today)

- **PR #292** Brief 019 — `outputs=[CC, LD, ASM]` fresh-clone fix.
- **PR #296** Brief 021 — markdown-lint cleanup + generator slug fix.
- **PR #299** Brief 023 — 348-line ov006 research note.
- **PR #304** Brief 025 — `find_shape_templates.py` tool.
- **PR #307** Brief 026 — wine migration to Game Porting Toolkit.

### Decomper track (today)

- **PR #293** Brain rebase of wave 17 — 66 matches.
- **PR #297** Brief 020 — 20 matches @ 87%.
- **PR #301** Brief 022 — 24 matches @ 77%.
- **PR #303** Brief 024 — 18 matches @ 100%.
- **PR #306** Brief 027 — 32 matches @ 94%.
- **PR #309** Brief 028 — 27 matches @ 61%.

### Brain track (today)

- **PRs #291, #295, #298, #300, #302, #305, #308, *this PR*** —
  eight brain refresh / brief-pre-queue PRs.
- Worktree convention added (#302). Wine deprecation flagged
  (#302) and resolved (#307).
- One worktree-collision incident — recovered from reflog before
  any data loss.

## In flight (post this brain-PR)

- **Open PRs (1):** #294 chore: update README progress badge —
  GitHub Actions bot. Self-managing.
- **`decomper`** — brief 029 (above). Next MED candidate selected
  by ratio; default suggestion `func_02001d84` (30 unmatched,
  0.90 ratio).
- **`cloud`** — nothing open. Standby.
- **`brain`** — waiting for brief 029 PR.

## Next-brain TODO

1. **Review brief 029 PR** when decomper opens it. Standard gate.
   Note which anchor decomper picked + whether the new tool's
   leverage scales differently with ratio.
2. **Decide brief 030** based on brief 029's yield:
   - Yield ≥ 50% → queue rank #6 `func_0201397c` (28/17, 1.65
     ratio) or rank #8 `func_02001e84` (42/14, 3.0 ratio,
     smaller pool but very high template confidence).
   - Yield 30-50% → queue same with adjusted expectations.
   - Yield < 30% → queue cloud research follow-up: investigate
     whether MED 37% predictions are systematically pessimistic
     under the new tool, or specific anchor types resist it.
3. **Pre-existing carryovers** —
   - `func_ov021_021aaf58` placeholder-in-complete-TU warning.
   - ov005 placeholder-name warnings (carryover from brief 003).
   - `match-invariants` not yet a required branch-protection
     check.

## New agents?

Still no. Today's 4-agent setup (brain + decomper + cloud +
auto-progress-badge bot) shipped 17 PRs / +167 matches without
operational issues after the worktree convention landed. Adding a
second decomper remains low-friction if cntrl_alt_lenny wants
parallelism, but throughput per-agent is high enough that the
case for it has weakened further.
