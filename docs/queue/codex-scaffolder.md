[//]: # (markdownlint-disable MD013 MD041)

# Codex Scaffolder — autonomous tooling queue

**Protocol:** loop until QUEUE-EMPTY — do NOT stop after one item. `python tools/work_queue.py next codex-scaffolder` (⚠️ Windows: plain `python`, NOT `python3.13`). Gate each item's stated Gate (paste real output). Open ONE PR **per item**, `work_queue.py done codex-scaffolder <id>`, commit, then immediately take the next item. Effort HIGH.

**Worktree capability (match your gate to it — briefing bug b642):** `kb-map` = build-FREE (no baserom, no `dsd`) · `kb-types` = EUR baserom only · `scaffolder`/`decomper` = all 3 baseroms. If an item's gate needs a build you cannot run, say so and skip rather than forcing.

**Lane status (2026-07-22 — supersedes the old "this lane is thin" note):** the readable-C frontier REOPENED. Brief 651 corrected `wall_aware_headroom.py`; the honest pool went 47 → **6,117 candidates**, with only 32 files confirmed-permanent project-wide. There is real engineering work again. Still report QUEUE-EMPTY honestly if you genuinely exhaust it.

---

### q-drafter-ceiling-doc — write up the readable-C automation ceiling [DONE]
Consolidate b624 (0/135 accept), b626 (0→40% compile), b631/b632 (~10.66% avg match, struct-bank injection rejected) into ONE decision doc: docs/research/readable-c-automation-ceiling.md — the honest conclusion is that m2c-drafted readable-C caps at ~compile-but-not-match, so readable-C needs human judgment (CC), and cmatch_loop's value is draft-ASSIST not auto-ship. This stops future rounds re-attempting a dead end.
**Gate:** `python3.13 -m pytest tests -q` green + the committed doc.

### q-scopegate-audit — run scope_gate --kind carve as a retro-audit [DONE]
Run `scope_gate.py --kind carve` against the last ~10 merged C-match PRs' ranges to confirm none under-shipped (a completeness retro). Report any that would have flagged.
**Gate:** `python3.13 -m pytest tests/test_scope_gate.py -q` green + the audit summary.

### q-orphan-cleanup — delete the 29 orphaned dead .s files [DONE]
CC Decomper (2026-07-21) found 29 `.s` files under src/ that are NOT referenced by any delinks.txt — leftovers from brief-071's bulk-port that relocated the functions to libs/nitro/*.legacy.c and repointed delinks, but left the old src/ copies. Get the exact list: `python3.13 -c "import tools.wall_aware_headroom as w"` won't list them, so grep: for each src/**/*.s, check it appears in a delinks.txt; delete the ones that don't (mostly ov002/ov004/ov010/ov015/ov011/ov003). They are dead weight, not build inputs.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS (proves the deleted files were NOT build inputs — the 3-region ROM is unchanged) + count deleted.

### q-ci-compile-gate — build the baserom-free compile-only CI gate [TODO]

Improvement-swarm r5's S2. PROVEN feasible but never built: a game `.c` compiles to a valid ARM relocatable using only committed `include/` + `libs/` + `mwccarm.exe`; **0 mwcc edges reference `extract/`**, and `configure.py <ver> --skip-sha1` already runs baserom-free. Today **none of the 11 workflows compiles a single line of game C** — the existing comments conflate "can't verify byte-identity" with "can't build at all". Add `.github/workflows/compile-check.yml`: PR-triggered, paths filter `src/**`, fetch mwccarm, `configure.py <region> --skip-sha1`, map changed `.c` via `git diff` → `build/<region>/<path>.o`, `ninja` just those targets. Changed-file scoping keeps it seconds. **windows-latest needs no wibo** — prefer it. Do NOT attempt to put baseroms in CI.
**Gate:** the workflow file + a green run on your own PR (it will exercise itself), or if it can't self-trigger, paste the exact local equivalent commands and their output.

### q-objdiff-v3 — objdiff 2.7.1 → 3.7.3 upgrade feasibility [TODO]

Our own issue **#352 was CLOSED upstream 2026-07-10** (PR #359 merged); the "we own this patch forever" belief is dead, and v3.7.3 ships prebuilts for all three hosts. But this is NOT a blind bump: v3.0.0 self-describes as a rewrite (251 commits / 186 files), **10 `report.json` consumers ride this schema**, and the genuinely untested risk is dsd v0.11.0's `objdiff.json` ↔ v3 config schema. Produce a feasibility report: what breaks, which consumers need changes, whether our panic-filter case (a) can retire (case (b) stays), and a go/no-go with a migration order. Do a read-only trial if you can (fetch v3.7.3, run it against one unit) without changing the pinned version.
**Gate:** `python -m pytest -q tests` green + the report; do NOT change the pin in this item.

### q-itcm-reach — why ITCM's functions are unreachable [TODO]

ITCM is effectively an invisible 27th module: ~39 uncarved functions (11 EUR + 14 USA + 14 JPN per brief 643's census) that **no census, wave, or tool currently reaches**. Investigate the mechanism — is it a `dsd` config gap, a delinks/section modelling issue, or an addressing thing? Produce a diagnosis + a concrete proposal for making them reachable. Read-only investigation; do not attempt to carve them in this item.
**Gate:** the report, with the exact evidence (config/section/tool output) that explains the invisibility.

### q-c34-corpus — assemble the C-34 corpus (116 of 138 coercible) [TODO]

One taxonomy code, **C-34, covers 116 of the 138 coercible candidates** — the single biggest lever-shaped opportunity in the pool. Mechanically gather every C-34-cited file into one reference: address, module, size, the exact `.s` shape that triggered the citation, and any ALREADY-MATCHED example of the same shape (search matched `.c` for siblings). You are assembling evidence, NOT deriving the recipe — a CC agent cracks it; your job is to hand them the corpus so they don't spend hours collecting it.
**Gate:** the corpus doc + counts; doc-only, no build.

### q-tools-package — kill the tools/ boilerplate and parser duplication [TODO]

~93 flat `tools/*.py` with no package boundary: ~30 hand-roll delinks/symbols parsing while canonical `parse_delinks_file`/`parse_symbols_file` exist, and ~40 carry identical `sys.path.insert` + `# noqa: E402` boilerplate. Promote the canonical parsers into a shared module, make `tools/` importable, migrate the hand-rolled readers. ⚠️ `build.ninja` invokes tools AS SCRIPTS — preserve that (absolute imports or `-m`), and migrate in small batches, most-duplicated first. This is the root cause behind the C%-metric bug b566 had to fix.
**Gate:** `python -m pytest -q tests` green (do NOT add to the ~12 known Windows path-sep failures) + `python tools/configure.py eur` still succeeds + list which tools you migrated.

### q-dead-tools — audit the tool inventory for dead weight [TODO]

Of the ~93 `tools/*.py`, some are superseded or unreferenced (e.g. tools whose lane closed). For each: is it referenced by `build.ninja`, any workflow, any test, any doc, or another tool? Produce a table: KEEP / SUPERSEDED-BY-X / UNREFERENCED. ⚠️ **List only — delete nothing in this item.** A follow-up will action it after review.
**Gate:** the audit table; doc-only, no build.

### q-green-main — finish greening CI, then propose protection [TODO]

Lint has been red for weeks and **red is the baseline**, which means a real regression is invisible. Finish the cleanup (ruff autofixes, markdownlint over the generated dirs, regenerate both indices — that flips drift-check and unittest together), then **propose** (do not apply — it needs owner rights) a branch-protection ruleset requiring: `Python (ruff)`, `Markdown (markdownlint-cli2)`, `unittest`, `drift-check`, `pr-invariants (eur)`. ⚠️ Exclude the usa/jpn matrix legs — `continue-on-error` does NOT produce a green check-run, so requiring them would hard-block every PR.
**Gate:** the CI checks green on your own PR + the proposed ruleset written up for the owner to apply.
