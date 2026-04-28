# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-04-28. Main tip is `335ccbe` after PR #243
(cloud, half of brief 018). Cluster fingerprint subdivision shipped
clean; `propagate_template --substitute-imm` half is still pending
on cloud's queue.

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

Δ since previous refresh: tier counts unchanged (PR #243 was
tools-only). `find_pattern_clusters.py` now reports **57 clusters
covering 728 unmatched** (was 53/819) — the finer fingerprint split
mixed-shape buckets and ~91 functions whose old bucket was too coarse
fell out of clusters. That's expected and good.

**Cluster ranking under the new fingerprint** (top 8):

| # | Anchor | Size | Sig | Matched | Unmatched | Notes |
|--:|--------|------|----:|--------:|----------:|-------|
| 1 | `OSi_IrqHandlerTimer3` | 0x10 | 1 | 13 | 85 | needs `--substitute-imm` |
| 2 | `OS_DisableIrq`        | 0x14 | 0 | 12 | 45 | offset-0 candidate |
| 3 | `func_ov006_021c81a4`  | 0x1c | 0 | 1  | 44 | offset-0 candidate |
| 4 | `func_020085d4`        | 0x10 | 1 | 25 | 41 | brief 017 target |
| 5 | `func_ov011_021ca524`  | 0x14 | 1 | 2  | 40 | |
| 6 | `func_ov000_021abe54`  | 0x10 | 0 | 20 | 36 | offset-0 |
| 7 | `OS_RestoreIrq`        | 0x18 | 0 | 12 | 35 | offset-0 |
| 8 | `func_ov006_021b7ce0`  | 0x1c | 1 | 2  | 34 | |

`func_020085d4` cluster shrank 130 → 41; brief 017 updated to reflect
the new size. The new top cluster (`OSi_IrqHandlerTimer3`, 85
unmatched) is NOT brief-017-friendly because its anchor uses a
varying `mov r0, #N` immediate — that cluster is gated on the
second half of brief 018 landing.

**Yield reality check across the pilot wave:** brief 015 → 12.5%
(18/144), brief 016 → 2.9% (2/70). Brief 017's predicted band
revised to 25-50% (~10-20 matches) on the post-#243 tighter cluster.

## Merged since previous refresh

Main tip moved from `9fef7ac` → `335ccbe` (1 PR).

### Cloud track

- **PR #243** — `find_pattern_clusters: subdivide by reloc target
  type + data-size bucket`. The first half of brief 018. Splits the
  old `(size, sig_len)` bucket into smaller, more homogeneous
  groups. Effect: 53 clusters / 819 unmatched → 57 clusters / 728
  unmatched. `func_020085d4` cluster (brief 015's anchor shape) split
  130 → 41 unmatched; brief 015 anchor and brief 016 anchor are now
  in different clusters, validating brief 018's first success
  criterion. Tests: 28 cluster-tool tests pass; full suite has 6
  pre-existing failures (Windows path / executable-bit issues in
  `cluster_wave_propagate`, `permute`, `install_git_hooks`,
  `claude_hooks` — all confirmed pre-existing on main, not
  regressions).

### Decomper track (carryover from previous refresh)

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

- Verified PR #243 locally — 28 cluster-tool tests pass, full suite
  failures are pre-existing not regressions. Real-world cluster
  tool output confirms brief 018's first success criterion:
  brief-015-anchor (`func_020085d4`) and brief-016-anchor
  (`func_020498dc`) now land in different clusters under the
  finer fingerprint.
- Updated brief 017 to reflect the new cluster size (130 → 41
  unmatched) and revised the calibrated yield band (12-15% → 25-50%
  on the now-tighter cluster).
- Flagged the remaining half of brief 018 (`propagate_template
  --substitute-imm`) as still pending. Cloud's queue.

### Brain track (carryover from previous refresh)

- Wrote brief 017 — cluster pilot round 3 on an offset-0
  anchor (`func_020085d4`). Side-steps brief 016's literal-
  substitution gap.
- Wrote brief 018 — formal cloud scope for both systemic fixes:
  the finer cluster fingerprint (now shipped in #243) and
  + finer cluster fingerprint in `find_pattern_clusters.py`.
- AGENTS.md open-briefs list now points at 017 + 018.

## In flight (post this brain-PR)

- **Open PRs:** zero.
- **`decomper`** — brief 017 still open. Branch:
  `decomper/cluster-prop-020085d4`. Revised expectation post-#243:
  10-20 matches on a 41-sibling cluster (was 130-sibling). Brief
  text updated accordingly.
- **`cloud`** — brief 018 *half open*. PR #243 shipped the cluster-
  fingerprint subdivision; the second half (`propagate_template
  --substitute-imm`) is still pending. Brief 018's text retains
  the full scope; the next cloud PR should target that half on a
  branch like `cloud/propagate-substitute-imm`.
- **`brain`** — waiting for the next PR.

## Next-brain TODO

1. **Review brief 017 PR when it opens.** Decomper ships
   propagated siblings of `func_020085d4`. Verify: configure,
   ninja rom, ninja objdiff, dsd check modules (still 24/27),
   `check_match_invariants`. Literal-only-patching exception
   from brief 016 still applies until `--substitute-imm` lands.
2. **Review the second-half cloud PR** (substitute-imm). Tools-
   only: extending `tools/propagate_template.py` so the per-
   sibling `_pad`/`field_<hex>`/offset literals adapt to each
   target's actual baserom offsets. Smoke test: rerun brief 016's
   cluster (`ov000 / func_ov000_021aa4a0`) with `--substitute-imm`
   — should rewrite the literals correctly without hand-patching.
3. **Queue brief 019** once `--substitute-imm` lands: rerun brief
   016's cluster with the new tooling to validate the bottleneck
   diagnosis. Predicted yield jumps **2.9% → ~50-80%**.
4. **Queue brief 020** for the new top cluster
   (`OSi_IrqHandlerTimer3`, 85 unmatched). It's gated on
   `--substitute-imm` because the anchor's `mov r0, #N` immediate
   varies per sibling.
5. **Brain shell repair** — carryover. Windows-bash + ninja `&&`
   issue.
6. **Pre-existing carryovers** — `func_ov021_021aaf58` placeholder-
   in-complete-TU warning; `__sinit_ov004_02209a5c` (failing
   module); `match-invariants` not yet a required branch-protection
   check.

## New agents?

Still no. Brain + decomper + cloud + the auto-progress-badge bot
continues to scale. Codex CLI sessions have played all three roles
fluently across this chunk per past chats.
