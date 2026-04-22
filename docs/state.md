# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-04-22. Main tip is wherever the slug-rename PR
lands (see merged list below). No decomp regressions from the rename.

**Baseline:** `python tools/configure.py eur`, `ninja rom`, and
`./dsd.exe check modules -c config/eur/arm9/config.yaml` all pass on
Windows. Module check: expected **24/27 OK**. ARM9 main / DTCM / overlay 4
fail for the known placeholder-symbol reasons from CLAUDE.md, not from
agent work.

**Progress:** `python tools/progress.py --version eur` reports code
`2960 / 2386664` bytes (0.12%), data `0 / 4776528` bytes (0.00%),
and `142 / 254` units passing (55.91%).

**Matched breakdown** (live from `python tools/next_targets.py
--version eur`):

| Tier | Matched | Unmatched | Total | % matched |
|------|--------:|----------:|------:|----------:|
| `trivial` | 78 | 59 | 137 | 56.9% |
| `easy` | 59 | 1064 | 1123 | 5.3% |
| `sinit` | 46 | 5 | 51 | 90.2% |
| `named` | 0 | 22 | 22 | 0.0% |
| `medium` | 0 | 6 | 6 | 0.0% |
| `hard` | 0 | 8510 | 8510 | 0.0% |

`sinit` is effectively closed apart from 4-5 targeted outliers;
`easy` remains the main grind with ~1064 candidates.

## Merged since last refresh

Main tip moved from `0d33ec8` through the slug-rename chunk.

### Brain track (this chunk)

- **Slug rename: model-agnostic.** `claude-brain` → `brain`,
  `claude-cloud` → `cloud`, `claude-pc` → `decomper`. The Active
  Agents table's *Where it runs* column is now LLM-agnostic; Codex
  CLI has proven all three slots work regardless of which LLM backs
  the session. Historical branches keep their `claude-*` prefixes;
  only new branches use the new slugs. Updated AGENTS.md,
  `docs/decomp-workflow.md`, `tools/rename_symbol.py` comment, and
  `.github/labeler.yml` (old + new prefixes both matched).
- **Brief 008 published.** `decomper/ov011-tail-wrappers` — matches
  the `func_ov011_021ce324` / `021ce334` tail-call wrapper pair.
  Small PR, both functions in it. First brief using the new slug
  convention.

### Decomper / cloud tracks

Clean since PR #86 — no decomper or cloud work merged in this chunk.
The previous wave (Brief 007 / `func_ov000_021ac550`) is the last
function match on record; brief 008 opens the next small chunk.

## In flight

- **Open PRs:** zero (post-rename-merge).
- **`decomper`** — brief 008 open. Branch:
  `decomper/ov011-tail-wrappers`. Aim: one PR, two wrapper functions
  matched at 100% objdiff, baseline holds.
- **`cloud`** — no formal brief. Per AGENTS.md *Cloud autonomous work*,
  `cloud` may pick up unbriefed `tools/` / `docs/` work; if idle, stand
  by until brief 009 or a natural follow-up surfaces. Good candidates
  it could propose itself: a `tier-delta` wrapper on `next_targets.py`
  for PR bodies, an `--callers-of-callers` mode on `find_callsites.py`,
  or early scaffolding ideas for data-tier work.
- **`brain`** — waiting for the next PR to review. Will re-run
  `tools/analyze_symbols.py` + heatmap regen after brief 008 lands.

## Next-brain TODO

1. **Review brief 008 PR when it opens.** Decomper submits one PR with
   two `.c` files under `src/overlay011/` and two delinks-block
   appends. Verify locally: `python tools/configure.py eur`, `ninja rom`,
   `./dsd.exe check modules`, `ninja objdiff` (both functions should
   show 100%). Baseline must stay 24/27 OK. Then summarize for
   cntrl_alt_lenny and offer to merge.
2. **Write brief 009** on the `__sinit_ov002_022ca7e8` outlier once
   brief 008 is merged. Per Codex-decomper scouting (see note file):
   "loads `data_ov002_022d11bc`, stores `data_ov002_022cc4f4` at
   `+0x1f8`, returns. Wrinkle: getting mwcc to keep the `.init`
   placement and literal-load/store order."
3. **Consider making `match-invariants` a required branch-protection
   check** once brief 008 is done. It's been stable for many PRs;
   would give `missing_tu_source` errors actual merge-block teeth.
4. **Data-tier at 0%** — still waiting on first carved TU. Becomes
   relevant at brief 010+ territory.
5. **Stale remote-branch sweep** — none currently outstanding
   post-rename-merge, but check after brief 008 lands.

## New agents?

Still no. Brain + decomper + cloud continues to hold. Codex joining
didn't require a new slot — it slotted into the existing three
role-based slugs, which is exactly what the model-agnostic rename
captures. Reopen if:

- `libs/nitro/` or `libs/runtime/` scope balloons → dedicated `libs`
  agent.
- Asset pipelines (graphics/audio) become a decomp target → `assets`
  agent.
- Multiple concurrent sessions want the same role (e.g. two brains
  reviewing in parallel) — then we'd need per-model slugs like
  `codex-brain`, but we don't today.
