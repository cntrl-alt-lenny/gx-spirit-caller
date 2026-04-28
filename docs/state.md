# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-04-27 (third refresh today). Main tip is
`1ee0935` after PR #241 (decomper, brief 016 ship). Brief 016 closed;
briefs 017 + 018 open this chunk.

**Baseline:** Per merged PR bodies, `ninja rom` clean and `./dsd
check modules` baseline preserved (3 expected failures: ARM9 main /
DTCM / overlay 4). My local Bash-on-Windows brain shell still can't
drive ninja's `&&` chains; the decomper's setup works fine across
brief 015's verification. CI's `pr-invariants` + `pr-tier-delta` +
`pr-worklist-diff` all green on every shipped PR.

**Progress** (live from `python tools/next_targets.py --version eur`):

| Tier | Matched | Unmatched | Total | % matched |
|------|--------:|----------:|------:|----------:|
| `trivial` | 136 | 0 | 136 | **100.0%** |
| `easy` | 347 | 763 | 1110 | **31.3%** |
| `sinit` | 50 | 1 | 51 | 98.0% |
| `named` | 38 | 1 | 39 | 97.4% |
| `medium` | 94 | 62 | 156 | 60.3% |
| `hard` | 36 | 8321 | 8357 | 0.4% |

Δ since previous refresh: `easy` 345 → 347 (+2 from brief 016, with
the third-refresh-today recalibration noted below).
`find_pattern_clusters.py` now reports **53 ready-to-propagate
clusters covering 819 unmatched**.

**Yield reality check after three pilots:** brief 015 → 12.5% (18/144),
brief 016 → 2.9% (2/70), brief 017 → predicted 12-15% (offset-0 shape
again, side-stepping brief 016's diagnosed problem). The pipeline is
working but bottlenecked on two specific tooling gaps (see brief 018
for cloud's formal scope to fix them).

## Merged since previous refresh

Main tip moved from `31def5c` → `1ee0935` (1 PR).

### Decomper track

- **PR #241** — Brief 016 shipped. **2 byte-identical matches**
  (`main_020498dc`, `ov008_021b1e0c`), both the
  `*data->field_NNN = arg` shape. Yield 2/70 (2.9%), well below
  the 5-15 calibrated band. Decomper's PR body diagnosed the
  collapse: `(size, sig_len)` cluster fingerprint groups wildly
  different shapes (tail-call thunks, constant-write setters,
  byte-store doubles, lookup-table loads, the actual anchor shape)
  AND `propagate_template` doesn't substitute numeric literals
  even when shape is right (the cluster has 81 different str
  offsets across siblings; the template's hardcoded `0x144`
  matched nothing). Decomper hand-patched the 2 surviving
  shape-correct siblings' integer literal — disclosed clearly,
  byte-verified.

### Brain track (this PR)

- Accept brief 016's literal-only patching pattern as the
  documented exception to "drop, don't patch" — see brief 017's
  rules section. Will be retired once brief 018 lands
  `--substitute-imm`.
- Wrote brief 017 — cluster pilot round 3 on an offset-0
  anchor (`func_020085d4`, 130 unmatched siblings, same shape as
  brief 015's 12.5%-yield cluster). Side-steps brief 016's
  literal-substitution gap until cloud ships brief 018.
- Wrote brief 018 — formal cloud scope for the two systemic fixes
  brief 016's PR diagnosed: `propagate_template --substitute-imm`
  + finer cluster fingerprint in `find_pattern_clusters.py`.
- AGENTS.md open-briefs list now points at 017 + 018.

## In flight (post this brain-PR)

- **Open PRs:** zero.
- **`decomper`** — brief 017 open. Branch:
  `decomper/cluster-prop-020085d4`. Predicted yield 12-15% on the
  130-sibling offset-0 cluster.
- **`cloud`** — brief 018 open. Branch:
  `cloud/cluster-tooling-upgrade`. Two specific propagation-tooling
  fixes that unblock yield rates on literal-bearing clusters.
- **`brain`** — waiting for whichever PR comes back first. Brief
  019 depends on 018's tooling.

## Next-brain TODO

1. **Review brief 017 PR when it opens.** Likely 15-20 propagated
   siblings + drops. Per-sibling delinks blocks across `main` and
   any overlays the cluster reaches. Verify: configure, ninja rom,
   ninja objdiff, dsd check modules (still 24/27),
   `check_match_invariants`. The literal-only-substitution
   exception (carryover from brief 016 disclosure) applies if
   needed; brief 018 retires the exception.
2. **Review brief 018 PR when it opens.** Tools-only:
   `tools/propagate_template.py` + `tools/find_pattern_clusters.py`
   + their tests. Run the smoke commands in the brief's *Success*
   section to confirm cluster #1 (offset-0) and cluster #2
   (offset-bearing) end up in different clusters under the new
   fingerprint, and that `--substitute-imm` rewrites at least one
   literal correctly.
3. **Queue brief 019** post-018 merge: rerun brief 016's cluster
   (`func_ov000_021aa4a0`, 68 still unmatched) with the new tooling
   to validate the bottleneck diagnosis. Predicted yield jumps
   2.9% → ~50-80% if the diagnosis is right.
4. **Brain shell repair** — carryover. Windows-bash + ninja `&&`
   issue. Cloud's autonomous-work option (build.ninja shell
   wrapping) was deprioritized into brief 018 directly — both
   propagation issues take precedence.
5. **Pre-existing carryovers** — `func_ov021_021aaf58` placeholder-
   in-complete-TU warning; `__sinit_ov004_02209a5c` (failing
   module); `match-invariants` not yet a required branch-protection
   check.

## New agents?

Still no. Brain + decomper + cloud + the auto-progress-badge bot
continues to scale. Codex CLI sessions have played all three roles
fluently across this chunk per past chats.
