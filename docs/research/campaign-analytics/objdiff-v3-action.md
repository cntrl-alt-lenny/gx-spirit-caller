# objdiff v3 action blocker

Status: **NO-GO for an immediate pin bump; conditional GO for a staged
trial.** This closes the action item without changing the pinned v2.7.1
binary or retiring either panic-filter path.

## Blocking conditions

1. This `kb-map` worktree has no baserom, generated `build/<region>` tree,
   project `objdiff.json`, or raw report input. The required report-generation
   and direct-diff A/B probes cannot run here.
2. The existing v3.7.1 trial showed stable complete-unit/complete-code and
   SHA-1 results but a 322-function drop in `matched_functions`, with material
   `fuzzy_match_percent` drift. A v3.7.3 bump must quantify that semantic
   metric change before any baseline is accepted.
3. v3 direct-diff JSON compatibility with `.claude/hooks/post_edit.py` and
   `tools/suggest_coercion.py` remains unverified. Report JSON field presence
   alone is not proof of direct-diff compatibility.
4. Upstream PR #359 addresses the code-less-object ARM panic, but this tree
   cannot prove it against the project's raw objects. Keep panic-filter case
   (a) until the raw report probe succeeds; keep routing-tier case (b)
   permanently for absent `.legacy`/`.legacy_sp3` objects.

## Required next trial

On a build-capable worktree, preserve the v2.7.1 EUR report, run v3.7.3
`report generate` against both filtered and raw/one-unit input, delete stale
`.resolved` sidecars, and compare complete/matched/fuzzy metrics. Then run
the same shipped unit through both versions' direct-diff JSON and assert the
post-edit hook and `suggest_coercion.py --json` consumers. Only a clean trial
should open a separate pin-bump PR.

See the [full v3.7.3 feasibility report](../objdiff-v373-feasibility.md) for
the consumer inventory, migration order, and the observed v3.7.1 metric
warning.

## EUR-capable rerun (2026-07-22)

The rerun from `kb-types` successfully configured EUR and completed the named
`ninja sha1` target with `gx-spirit-caller_eur.nds: OK`. The prior missing
baserom blocker is therefore cleared. The item remains conditional/no-go for
the pin bump: `python -m pytest -q tests` still has the same 11 Windows/path/
tool-environment failures (2,848 passed, 20 skipped, 55 subtests), and the
report-generation plus direct-diff A/B probes have not been run. Keep v2.7.1,
keep panic-filter cases (a) and (b), and schedule the A/B probe as a separate
migration trial.
