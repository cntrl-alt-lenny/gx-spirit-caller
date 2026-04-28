# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-04-27 (second refresh today). Main tip is
`31def5c` after PRs #233 / #235 / #237 / #238 / #239 (cloud sweep +
brief 015 ship). Brief 015 closed; brief 016 opens this chunk.

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
| `easy` | 345 | 765 | 1110 | **31.1%** |
| `sinit` | 50 | 1 | 51 | 98.0% |
| `named` | 38 | 1 | 39 | 97.4% |
| `medium` | 94 | 62 | 156 | 60.3% |
| `hard` | 36 | 8321 | 8357 | 0.4% |

Δ since previous refresh: `easy` 327 → 345 (+18 from brief 015's
propagation pilot). `find_pattern_clusters.py` now reports **53
ready-to-propagate clusters covering 821 unmatched** (down from 839).

## Merged since previous refresh

Main tip moved from `351899f` → `31def5c` (5 PRs + rebase).

### Decomper track

- **PR #237** — Brief 015 shipped. **18 byte-identical anchor-
  pattern matches** in `main`, all the singleton-pointer-getter
  shape (`extern void *data_<addr>; void *func(void) { return
  data_<addr>; }`). Out of 144 propagation candidates, 89 main + 37
  ov002 dropped at `TemplateMismatch` — instruction shape diverged
  despite shared `(size, reloc-sig)` fingerprint. **Hit rate
  ~12.5%** is the new realistic expectation for sig-1 cluster
  propagation. The cluster-finder tool is correctly refusing to
  ship wrong-C; that's the safety story playing out.

### Cloud track

- **PR #233** — Pin UTF-8 on stdout for emoji-emitting CI
  formatters. Fixes the latent Windows-cp1252 stdout bug previously
  flagged in state.md.
- **PR #235** — CI: gate generated docs against drift. Adds a
  workflow check that auto-regenerated doc artifacts (briefs index,
  tools index, etc.) match what's committed.
- **PR #238** — Unblock markdownlint CI: 9 errors across 5 files.
  Cleanup pass after the doc-drift gate exposed lint debt.
- **PR #239** — Rebase #234 + #236 onto post-#235 main with
  regenerated tools-index. Mechanical merge.

### Brain track (this PR)

- Refreshed this file again (#237's drop-rate intel needed a
  refreshed expectation in the next brief).
- Wrote brief 016 — cluster #2 propagation pilot. Anchor is already
  matched (`ov000 / func_ov000_021aa4a0`); propagate to the 72
  unmatched siblings, expect 5-15 to land per the new hit-rate
  baseline.
- AGENTS.md open-briefs list moves 015 → 016.

### Conflict-resolution note (carryover)

Wave 11's append-only delinks.txt overlap kept being painful. The
generic resolution is `sed -i '/^<<<<<<< /d; /^=======$/d;
/^>>>>>>> /d' config/eur/arm9/delinks.txt` because both blocks are
just additions. Brief 016 keeps PR scope to a single overlay's
delinks (`config/eur/arm9/overlays/ov000/delinks.txt`) so it
shouldn't conflict with anything else.

## In flight

- **Open PRs:** zero (post this brain-PR merge).
- **`decomper`** — brief 016 open. Branch:
  `decomper/cluster-prop-ov000-021aa4a0`. One PR, propagation-
  validated siblings of `func_ov000_021aa4a0` (anchor already
  matched).
- **`cloud`** — latent stdout + UTF-8 fixes shipped (PR #233);
  doc-drift CI shipped (PR #235). Remaining self-directed candidates:
  1. **`build.ninja` shell-wrapping fix** — configure.py emits
     compound rules with `&&` and no `cmd.exe /c` wrapper. Affects
     non-cmd shells on Windows; Linux/macOS unaffected. Touchy
     cross-platform; not blocking, but is what's keeping the brain
     shell on this exact setup from running `ninja rom`.
  2. **Cluster CI integration** — extend PR-comment workflows to
     surface "this PR drains N% of cluster X" or "promotes M new
     clusters to ready" using the freshly-shipped
     `tools/ci_format_pattern_clusters.py` (referenced in #237's
     diff but I haven't audited what it does yet).
  3. **Cluster fingerprint subdivision** — brief 015's 12.5% hit
     rate suggests `(size, reloc-sig)` alone is too coarse. A
     deeper signature (instruction-shape histogram, prefix bytes,
     literal-pool layout) on the cluster finder would push the
     hit rate up materially, which compounds across every future
     pilot. Tools-only, well-bounded.
- **`brain`** — waiting for brief 016 PR. Will re-run cluster
  analysis after to size brief 017.

## Next-brain TODO

1. **Review brief 016 PR when it opens.** Single overlay
   (`src/overlay000/`) + `config/eur/arm9/overlays/ov000/delinks.txt`
   — won't conflict with main delinks anymore. Verify: configure,
   `ninja rom`, `ninja objdiff` (every kept sibling 100%), `./dsd
   check modules` still 24/27, `check_match_invariants`. PR body
   will list dropped siblings; that's the propagation tool refusing
   to ship wrong-C, which is fine.
2. **Brief 017 candidate** — cluster #3, `ov006 / func_ov006_021b7ce0`
   (size 0x1c, sig 1, 60 unmatched). Same flow as 016.
3. **Brain shell repair** — carryover. If you can fix the
   Windows-bash + ninja `&&` issue (or just document
   cmd.exe / WSL / PowerShell as the recommended brain shell),
   it's an onboarding cliff for fresh brain sessions.
4. **Pre-existing carryovers** — `func_ov021_021aaf58` placeholder-
   in-complete-TU warning; `__sinit_ov004_02209a5c` (failing
   module); `match-invariants` not yet a required branch-protection
   check.

## New agents?

Still no. Brain + decomper + cloud + the auto-progress-badge bot
continues to scale. Codex CLI sessions have played all three roles
fluently across this chunk per past chats.
