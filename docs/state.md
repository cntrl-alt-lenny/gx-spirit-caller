# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-04-22. Main tip is `373c6b0` after merging
PR #88 (worklist-diff tool) and PR #89 (brief 008 wrappers). Brief
009 is now open, docs/state.md refresh follows the chunk.

**Baseline:** `python tools/configure.py eur`, `ninja rom`,
`ninja objdiff`, `ninja report`, and `./dsd.exe check modules -c
config/eur/arm9/config.yaml` all pass on Windows. Module check:
expected **24/27 OK** (ARM9 main / DTCM / overlay 4 still fail per
CLAUDE.md, not agent-caused).

**Progress:** `python tools/progress.py --version eur` now reports
code `2992 / 2386664` bytes (0.13%), data `0 / 4776528` bytes
(0.00%), and `144 / 257` units passing (56.03%). +32 bytes / +2 units
from PR #89's tail-wrapper match.

**Matched breakdown** (live from `python tools/next_targets.py
--version eur`):

| Tier | Matched | Unmatched | Total | % matched |
|------|--------:|----------:|------:|----------:|
| `trivial` | 78 | 59 | 137 | 56.9% |
| `easy` | 61 | 1062 | 1123 | 5.4% |
| `sinit` | 46 | 5 | 51 | 90.2% |
| `named` | 0 | 22 | 22 | 0.0% |
| `medium` | 0 | 6 | 6 | 0.0% |
| `hard` | 0 | 8510 | 8510 | 0.0% |

The two brief-008 wrappers count as `easy` (both 0x10, leaf-after-
tail-call). `sinit` still at 46 matched / 5 outliers — brief 009 aims
at one of those five.

## Merged since last refresh

Main tip moved from `c9e1b69` → `373c6b0`.

### Decomper track

- **PR #89** — brief 008 shipped. `func_ov011_021ce324` /
  `021ce334` tail-call wrapper pair, both 100% objdiff, 16/16
  matched code bytes each. Baseline stayed 24/27 OK. Used the
  `scaffold_batch.py --apply-delinks` flow end-to-end.

### Cloud track

- **PR #88** — `tools/ci_format_worklist_diff.py`. Takes two
  `next_targets --emit-json` snapshots and renders a Markdown
  before/after diff suitable for PR bodies. 27 new tests; full test
  suite green at 385 tests. Pairs naturally with the existing CI
  match-invariants comment gate — a future CI tweak could auto-post
  tier-delta on any src/ PR.

### Brain track

- Refreshed `docs/state.md` (this file). Next-brain TODO narrowed
  to brief 009 review + downstream planning.
- Wrote brief 009 on `__sinit_ov002_022ca7e8` (the safest sinit
  outlier deferred from brief 003).

## In flight

- **Open PRs:** zero (post brain-PR merge).
- **`decomper`** — brief 009 open. Branch:
  `decomper/sinit-ov002-outlier`. One 0x18 sinit outlier, one PR,
  one `.c` + delinks entry. See
  [`docs/briefs/009-sinit-ov002-outlier.md`](briefs/009-sinit-ov002-outlier.md)
  for the full shape + literal-pool-ordering risk notes.
- **`cloud`** — no open brief. Good self-directed candidates per
  AGENTS.md *Cloud autonomous work*:
  - Wire `ci_format_worklist_diff.py` (PR #88) into a GitHub
    Actions workflow so src/ PRs auto-post a tier-delta comment.
  - `--callers-of-callers` mode for `tools/find_callsites.py`.
  - Scaffolding research for the data tier (still 0% matched).
- **`brain`** — waiting for the next decomper PR. Will re-run
  analyzer + heatmap regen after brief 009 lands.

## Next-brain TODO

1. **Review brief 009 PR when it opens.** Single `.c` under
   `src/overlay002/`, one delinks-block append. Verify:
   `python tools/configure.py eur`, `ninja rom`, `ninja objdiff`,
   `./dsd.exe check modules`. Must stay 24/27 OK; the target function
   must hit 100% in `ninja report`. Summarize for cntrl_alt_lenny and
   offer to merge.
2. **Scope brief 010** once 009 is merged. Natural shape: the ov010
   sinit pair (`__sinit_ov010_021b89a8` + `__sinit_ov010_021b89f0`,
   two 0x48 shapes sharing a ctor-chain pattern) plus
   `__sinit_ov011_021d3620`. Closes the sinit tier down to just the
   ov004 outlier (which stays deferred while ov004 is failing).
3. **Pre-existing warning:** `check_match_invariants` notes that
   `func_ov021_021aaf58` sits inside a `complete` TU in ov021 but
   still uses a dsd-placeholder name. Not brief 008/009's fault —
   was there before. Minor: either rename it when the identity is
   clear, or leave it as a permanent warning. No action required
   this chunk; note for future brain.
4. **Consider making `match-invariants` a required branch-protection
   check.** Carryover from previous state. Stable across the brief
   007/008/009 wave; would give `missing_tu_source` errors actual
   merge-block teeth without trapping warnings.
5. **Data-tier still at 0%.** Becomes actionable after sinit
   tier closes (brief 010+ territory).
6. **Stale remote-branch sweep** — none currently outstanding.

## New agents?

Still no. The model-agnostic slug rename landed in PR #87 — Codex CLI
has successfully taken all three roles at various points. Reopen if:

- `libs/nitro/` or `libs/runtime/` scope balloons → dedicated `libs`
  agent.
- Asset pipelines (graphics/audio) become a decomp target → `assets`
  agent.
- Multiple concurrent sessions want the same role — then per-model
  slugs (`codex-brain` alongside `claude-brain`-as-role), but we're
  still at one-session-per-role today.
