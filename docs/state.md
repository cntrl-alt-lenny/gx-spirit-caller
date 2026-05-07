# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-06. Main tip is `ba9d658` after PR #285
(progress badge). Five open `decomper/wave17-pr*` PRs (#286–#290) in
flight totalling **66 byte-identical matches**, none yet verified
locally by this brain — see *In flight* below.

**Baseline:** Verified fresh today on a brand-new macOS arm64 brain
shell — `python tools/configure.py eur` clean, `ninja rom` 1008/1008
clean, `./dsd check modules` reproduces the documented 24/27 (3
expected failures: ARM9 main / DTCM / overlay 4). The previous
brain's Bash-on-Windows `&&` issue is no longer relevant on this
shell. CI's `pr-invariants` + `pr-tier-delta` + `pr-worklist-diff`
all green on every shipped PR per merged bodies.

**Progress** (live from `python tools/next_targets.py --version eur`,
post-#285):

| Tier | Matched | Unmatched | Total | % matched | Δ since 4/28 |
|------|--------:|----------:|------:|----------:|-------------:|
| `trivial` | 136 | 0 | 136 | **100.0%** | — |
| `easy` | 658 | 452 | 1110 | **59.3%** | **+311** |
| `sinit` | 51 | 0 | 51 | **100.0%** | +1 (closed) |
| `named` | 38 | 1 | 39 | 97.4% | — |
| `medium` | 94 | 62 | 156 | 60.3% | — |
| `hard` | 67 | 8290 | 8357 | 0.8% | +31 |

The big mover is **easy** (+311 matches, 31.3% → 59.3%) driven by
the post-#255 hard-tier clustering pivot — see *Direction shift*
below — plus the ongoing easy-wave throughput. `sinit` closed
100% via PR #245 (`__sinit_ov004_02209a5c`).

**Cluster ranking** (live from `python tools/find_pattern_clusters.py
--version eur --top 5`, post-#278 with HIGH/MED/LOW yield labels):

| # | Anchor | Size | Sig | Matched | Unmatched | Predicted yield |
|--:|--------|------|----:|--------:|----------:|-----------------|
| 1 | `func_ov006_021c81a4` | 0x1c | 0 | 1  | 44 | ≈20% [LOW] |
| 2 | `func_02001d84`       | 0x14 | 0 | 22 | 35 | ≈37% [MED] |
| 3 | `OS_RestoreIrq`       | 0x18 | 0 | 12 | 35 | ≈37% [MED] |
| 4 | `func_ov006_021b7ce0` | 0x1c | 1 | 2  | 34 | ≈61% [MED] |
| 5 | `func_0209de5c`       | 0x18 | 1 | 19 | 32 | ≈74% [HIGH] |

55 ready-to-propagate clusters cover **493 unmatched** (was 728 on
4/28). The brief-017 anchor (`func_020085d4`) and brief-016 anchor
(`func_ov000_021aa4a0`) have both fallen out of the top — most of
their siblings drained through the cluster pipeline. The new top-5
HIGH cluster (`func_0209de5c`, 74%) is the most attractive next
pilot anchor.

## Direction shift since 4/28: hard-tier clustering

Brief 018's second half (`propagate_template --substitute-imm`)
was *not* pursued. Instead the cluster pipeline pivoted via:

- **#246** `docs/research/medium-tier-plateau.md` — diagnosed why
  medium tier sat at 60% for so long.
- **#255** `docs/research/hard-tier-clustering.md` — proposed
  applying the cluster signal to hard-tier siblings (which until
  then had been excluded as "too varied").
- **#263** `tools/tier_classifier.py` — operationalized the
  research; produces the per-tier candidate lists.
- **#264** first hard-tier cluster pilot — 18 single-call boolean
  wrappers, **94.7% yield** (18/19). Vastly outperformed brief
  016's 2.9% and matched brief 015's 12.5% by an order of magnitude.
- **#270, #276** rebase PRs draining hard-cluster waves
  (59 + 78 matches respectively). The 74-fn ov002 sweep in #276 is
  the single largest match wave to date.
- **#271** "hard cluster #8 (5/5): IRQ-pair siblings" — drained
  the cluster the old top-of-list (`OSi_IrqHandlerTimer3`, 85
  unmatched on 4/28) was anchoring.
- **#278** added per-cluster `predicted_yield` + HIGH/MED/LOW
  bucket labels; visible in the cluster table above.

Net: the substitute-imm gap brief 018 was meant to fix turned out
to be sidesteppable by going *up* the tier ladder (hard-tier
clusters with single-shape relocations) rather than *deeper*
(literal substitution within mixed easy clusters). Brief 018 is now
effectively **superseded**, not blocking; closing it formally below.

## Closed since previous refresh

Main tip moved from `9fef7ac` → `ba9d658` (27 commits).

### Brief closures

- **Brief 017** — shipped in PR #247. 13 offset-substitution
  matches on the `func_020085d4` cluster.
- **Brief 018 (first half)** — shipped in PR #243 (cluster
  fingerprint subdivision).
- **Brief 018 (second half)** — *superseded*, not shipped. Hard-
  tier clustering (#255 → #264 onward) is the working alternative;
  retiring the substitute-imm scope.

### Cloud track

- **PR #243** (4/28) `find_pattern_clusters: subdivide by reloc
  target type + data-size bucket` (brief 018 first half).
- **PR #251** Backfill unit tests for 3 cross-platform tools.
- **PR #252** `bulk_rename_candidates: add HIGH/MED/LOW confidence
  label`.
- **PR #263** `Add tools/tier_classifier.py — operationalize
  #246/#255 analysis`.
- **PR #278** `find_pattern_clusters: add predicted_yield +
  HIGH/MED/LOW labels`.
- **PRs #246, #255, #279** Research notes (medium-tier plateau,
  hard-tier clustering, trim-padding false-positive on relocation-
  tail .s files).

### Decomper track

- **PR #245** `named tier 39/39 closed: __sinit_ov004_02209a5c`.
- **PR #247** Brief 017 (13 matches).
- **PR #253** Rebase #248+#249+#250 (56 matches).
- **PR #256** `main thunk cluster: 13 0202bbxx-bcxx const-arg
  dispatchers`.
- **PR #258** `overlay easy wave 13: 10 thunks across 4 overlays`.
- **PR #261** Rebase #257+#259+#260 (38 matches).
- **PR #264** `hard-tier cluster #1 pilot: 18 single-call boolean
  wrappers (94.7% yield)`.
- **PR #270** Rebase #265+#266+#267+#268 (59 matches).
- **PR #271** `hard cluster #8 (5/5): IRQ-pair siblings produce
  dispatch + 2-call shapes`.
- **PR #276** Rebase #272+#273+#274+#275 (78 matches incl. ov002
  74-fn sweep).
- **PR #280** `overlay easy wave 16: 9 ov002 4-insn thunks`.
- **PR #281** `easy wave 16: 7 main 4-insn 0x14 thunks`.
- **PR #284** Rebase #282+#283 (36 matches).

### Brain track (this PR)

- Refreshed state.md to reflect 27-commit gap since 4/28.
- Wrote brief 019 (`cloud/configure-mwasmarm-output`) — fresh-clone
  bootstrap fix; documented in *Open briefs* below.
- Closed briefs 017 and 018 in AGENTS.md (017 shipped #247; 018
  first half #243, second half superseded).
- Verified the documented 24/27 baseline reproduces from a brand-
  new macOS arm64 brain shell after working through one new
  fresh-clone gotcha (the brief-019 bug).

## In flight (post this brain-PR)

- **Open PRs (5):** All `decomper/wave17-pr*`, all from cntrl-alt-
  lenny, all opened 2026-05-03. Cumulative wave 17:
  - **#286** easy wave 17: 19 main pool-data thunks (extends ov002
    sweep). +228/-0, 20 files.
  - **#287** hard wave 17: 20 mixed-shape leaf matches in main.
    +229/-0, 21 files.
  - **#288** hard wave 17: 10 bit-field + IPC + bit-test matches.
    +141/-0, 11 files.
  - **#289** hard wave 17: 10 main 5-insn 0x18 matches (lookups +
    comparators + 2-deref). +107/-0, 11 files.
  - **#290** hard wave 17: 7 main 5-insn 0x18 thunk variants.
    +77/-0, 8 files.

  Each PR body documents `ninja rom` clean + `./dsd check modules`
  3-failure baseline + N byte-identical. **None yet verified
  locally by this brain.** Default brain workflow per AGENTS.md is
  to pull each branch, replay verification, summarize for
  cntrl_alt_lenny in plain English, offer to merge. That's the next
  brain task — see TODO #1.

- **`decomper`** — wave 17 above. No outstanding brief; the wave
  was self-driven from the cluster output rather than a brain
  brief.

- **`cloud`** — brief 019 (this PR's brief) is the only open work.
  No prior cloud brief still in flight.

- **`brain`** — this PR refreshes state.md + files brief 019.

## Next-brain TODO

1. **Verify and review wave 17 (#286–#290)** locally. For each PR
   in order: pull branch, `python tools/configure.py eur`, `ninja
   rom`, `./dsd check modules` (must stay 24/27), `python
   tools/check_match_invariants.py`, `python tools/progress.py`.
   Summarize each in plain English for cntrl_alt_lenny, offer to
   merge. The 5 PRs may rebase into a single squash like #270 /
   #276 — ask cntrl_alt_lenny's preference (one rebase PR vs five
   sequential merges) before merging.
2. **Review brief 019 PR** when it opens (this PR's brief, scoped
   for cloud). Smoke test: `rm -rf tools/mwccarm && python
   tools/configure.py eur && ninja rom` should download mwccarm
   exactly once and proceed to compile, no manual `download_tool.py`
   step.
3. **Queue next pilot anchor.** Top HIGH cluster is
   `func_0209de5c` (size 0x18, 74% predicted yield, 32 unmatched).
   When the wave 17 dust settles, write a brief for decomper.
4. **Pre-existing carryovers** —
   `func_ov021_021aaf58` placeholder-in-complete-TU warning;
   `match-invariants` not yet a required branch-protection check.

## New agents?

Still no. Brain + decomper + cloud + the auto-progress-badge bot
continues to scale. Codex CLI sessions have played all three roles
fluently across multiple chunks.
