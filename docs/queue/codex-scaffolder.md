[//]: # (markdownlint-disable MD013 MD041)

# Codex Scaffolder — autonomous tooling queue

**Protocol:** loop until QUEUE-EMPTY — do NOT stop after one item. `python tools/work_queue.py next codex-scaffolder` (⚠️ Windows: plain `python`, NOT `python3.13`). Gate each item's stated Gate (paste real output); the normal build gate includes the full pytest suite. Open ONE PR **per item**, `work_queue.py done codex-scaffolder <id>`, commit, then immediately take the next item. Effort HIGH.

**Worktree capability (match your gate to it — briefing bug b642):** `kb-map` = build-FREE (no baserom, no `dsd`) · `kb-types` = EUR baserom only · `scaffolder`/`decomper` = all 3 baseroms. If an item's gate needs a build you cannot run, say so and skip rather than forcing.

**Lane status (2026-07-22 — supersedes the old "this lane is thin" note):** the readable-C frontier REOPENED. Brief 651 corrected `wall_aware_headroom.py`; the honest pool went 47 → **6,117 candidates**, with only 32 files confirmed-permanent project-wide. There is real engineering work again. Still report QUEUE-EMPTY honestly if you genuinely exhaust it.

**Tooling budget (2026-07-23):** a NEW tool must do one of: replace/delete an existing tool, consolidate duplicated infrastructure, measurably cut cycle time, catch a demonstrated failure class, or directly ship functions/bytes — state which in the PR. **asm-void ≠ readable C:** inline-asm-in-C is coverage hygiene, counted separately from natural C (metric split incoming, q-natural-c-metric); prefer natural C, use asm-void only where a documented wall justifies it.

---

## Items

### q-drafter-ceiling-doc — write up the readable-C automation ceiling [DONE]

Consolidate b624 (0/135 accept), b626 (0→40% compile), b631/b632 (~10.66% avg match, struct-bank injection rejected) into ONE decision doc: docs/research/readable-c-automation-ceiling.md — the honest conclusion is that m2c-drafted readable-C caps at ~compile-but-not-match, so readable-C needs human judgment (CC), and cmatch_loop's value is draft-ASSIST not auto-ship. This stops future rounds re-attempting a dead end.
**Gate:** `python3.13 -m pytest tests -q` green + the committed doc.

### q-scopegate-audit — run scope_gate --kind carve as a retro-audit [DONE]

Run `scope_gate.py --kind carve` against the last ~10 merged C-match PRs' ranges to confirm none under-shipped (a completeness retro). Report any that would have flagged.
**Gate:** `python3.13 -m pytest tests/test_scope_gate.py -q` green + the audit summary.

### q-orphan-cleanup — delete the 29 orphaned dead .s files [DONE]

CC Decomper (2026-07-21) found 29 `.s` files under src/ that are NOT referenced by any delinks.txt — leftovers from brief-071's bulk-port that relocated the functions to libs/nitro/*.legacy.c and repointed delinks, but left the old src/ copies. Get the exact list: `python3.13 -c "import tools.wall_aware_headroom as w"` won't list them, so grep: for each src/**/*.s, check it appears in a delinks.txt; delete the ones that don't (mostly ov002/ov004/ov010/ov015/ov011/ov003). They are dead weight, not build inputs.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS (proves the deleted files were NOT build inputs — the 3-region ROM is unchanged) + count deleted.

### q-ci-compile-gate — build the baserom-free compile-only CI gate [DONE]

Improvement-swarm r5's S2. PROVEN feasible but never built: a game `.c` compiles to a valid ARM relocatable using only committed `include/` + `libs/` + `mwccarm.exe`; **0 mwcc edges reference `extract/`**, and `configure.py <ver> --skip-sha1` already runs baserom-free. Today **none of the 11 workflows compiles a single line of game C** — the existing comments conflate "can't verify byte-identity" with "can't build at all". Add `.github/workflows/compile-check.yml`: PR-triggered, paths filter `src/**`, fetch mwccarm, `configure.py <region> --skip-sha1`, map changed `.c` via `git diff` → `build/<region>/<path>.o`, `ninja` just those targets. Changed-file scoping keeps it seconds. **windows-latest needs no wibo** — prefer it. Do NOT attempt to put baseroms in CI.
**Gate:** the workflow file + a green run on your own PR (it will exercise itself), or if it can't self-trigger, paste the exact local equivalent commands and their output.

### q-objdiff-v3 — objdiff 2.7.1 → 3.7.3 upgrade feasibility [PARKED]

> PARKED: kb-types EUR build gate passed, but pytest remains red with 12 failures (11 Windows/path/tool baseline plus stale generated research-index check); defer until q-green-pytest.

### q-objdiff-v3 — objdiff 2.7.1 → 3.7.3 upgrade feasibility [PARKED]

> PARKED: kb-types EUR rerun configured and ninja sha1 passed, but required pytest remains red (11 pre-existing Windows/path/tool-environment failures); v3 A/B probes still require a separate migration trial.
>
> PARKED: Report delivered; pytest gate ran but remains red on 11 pre-existing Windows/path/build-environment failures (2843 passed, 25 skipped, 55 subtests). Re-run on a POSIX/build-capable worktree before pin migration.
Our own issue **#352 was CLOSED upstream 2026-07-10** (PR #359 merged); the "we own this patch forever" belief is dead, and v3.7.3 ships prebuilts for all three hosts. But this is NOT a blind bump: v3.0.0 self-describes as a rewrite (251 commits / 186 files), **10 `report.json` consumers ride this schema**, and the genuinely untested risk is dsd v0.11.0's `objdiff.json` ↔ v3 config schema. Produce a feasibility report: what breaks, which consumers need changes, whether our panic-filter case (a) can retire (case (b) stays), and a go/no-go with a migration order. Do a read-only trial if you can (fetch v3.7.3, run it against one unit) without changing the pinned version.
**Gate:** `python -m pytest -q tests` green + the report; do NOT change the pin in this item.

### q-itcm-reach — why ITCM's functions are unreachable [DONE]

ITCM is effectively an invisible 27th module: ~39 uncarved functions (11 EUR + 14 USA + 14 JPN per brief 643's census) that **no census, wave, or tool currently reaches**. Investigate the mechanism — is it a `dsd` config gap, a delinks/section modelling issue, or an addressing thing? Produce a diagnosis + a concrete proposal for making them reachable. Read-only investigation; do not attempt to carve them in this item.
**Gate:** the report, with the exact evidence (config/section/tool output) that explains the invisibility.

### q-c34-corpus — assemble the C-34 corpus (116 of 138 coercible) [DONE]

One taxonomy code, **C-34, covers 116 of the 138 coercible candidates** — the single biggest lever-shaped opportunity in the pool. Mechanically gather every C-34-cited file into one reference: address, module, size, the exact `.s` shape that triggered the citation, and any ALREADY-MATCHED example of the same shape (search matched `.c` for siblings). You are assembling evidence, NOT deriving the recipe — a CC agent cracks it; your job is to hand them the corpus so they don't spend hours collecting it.
**Gate:** the corpus doc + counts; doc-only, no build.

### q-tools-package — kill the tools/ boilerplate and parser duplication [PARKED]

> PARKED: kb-types EUR configure+ninja sha1 passed; pytest remains red with 12 failures including the stale generated research-index check, so defer until q-green-pytest.

### q-tools-package — kill the tools/ boilerplate and parser duplication [PARKED]

> PARKED: kb-types EUR configure and ninja sha1 passed; required pytest remains red on 11 pre-existing Windows/path/tool-environment failures (2848 passed, 20 skipped, 55 subtests), so keep parked until the stated green pytest gate.
>
> PARKED: Parser facade and direct-call-site batch complete; exact configure gate unavailable because orig\\baserom_eur.nds is absent. pytest ran with 2843 passed, 25 skipped, 55 subtests and 11 pre-existing Windows/path/build failures; no new failures.
~93 flat `tools/*.py` with no package boundary: ~30 hand-roll delinks/symbols parsing while canonical `parse_delinks_file`/`parse_symbols_file` exist, and ~40 carry identical `sys.path.insert` + `# noqa: E402` boilerplate. Promote the canonical parsers into a shared module, make `tools/` importable, migrate the hand-rolled readers. ⚠️ `build.ninja` invokes tools AS SCRIPTS — preserve that (absolute imports or `-m`), and migrate in small batches, most-duplicated first. This is the root cause behind the C%-metric bug b566 had to fix.
**Gate:** `python -m pytest -q tests` green (do NOT add to the ~12 known Windows path-sep failures) + `python tools/configure.py eur` still succeeds + list which tools you migrated.

### q-dead-tools — audit the tool inventory for dead weight [DONE]

Of the ~93 `tools/*.py`, some are superseded or unreferenced (e.g. tools whose lane closed). For each: is it referenced by `build.ninja`, any workflow, any test, any doc, or another tool? Produce a table: KEEP / SUPERSEDED-BY-X / UNREFERENCED. ⚠️ **List only — delete nothing in this item.** A follow-up will action it after review.
**Gate:** the audit table; doc-only, no build.

### q-green-main — finish greening CI, then propose protection [DONE]

Lint has been red for weeks and **red is the baseline**, which means a real regression is invisible. Finish the cleanup (ruff autofixes, markdownlint over the generated dirs, regenerate both indices — that flips drift-check and unittest together), then **propose** (do not apply — it needs owner rights) a branch-protection ruleset requiring: `Python (ruff)`, `Markdown (markdownlint-cli2)`, `unittest`, `drift-check`, `pr-invariants (eur)`. ⚠️ Exclude the usa/jpn matrix legs — `continue-on-error` does NOT produce a green check-run, so requiring them would hard-block every PR.
**Gate:** the CI checks green on your own PR + the proposed ruleset written up for the owner to apply.

### q-c34-header-fix — correct the 30 mistagged C-34 citations [DONE]

### q-c34-header-fix — correct the 30 mistagged C-34 citations [DONE]

> PARKED: Corrected the live mistagged headers and recorded 58->28 main C-34 count; gate3 is blocked because kb-map lacks ./dsd. PR #1260 records the byte-neutral pass.
Brief 655 found that **30 of `main`'s 62 "coercible" files cite C-34 with zero supporting evidence** — the identical boilerplate paragraph pasted verbatim across unrelated bodies. Examples: `func_020061bc` is a SWAR population-count routine (pool constants `0xaaaaaaaa/0xcccccccc/0xf0f0f0f0/0xff00ff00`, no address anywhere); `func_02007f38` builds one MMIO-shadow constant via 3 `orr`s; `func_0200b2f4`/`func_0201a32c`/`func_0203244c`/`func_0206d79c` have **no `.word` pool entries at all**. None involve loading the same address twice — the citation's actual mechanism. Correct those headers (remove/replace the unsupported citation with an honest "never assessed" note) so `wall_aware_headroom.py` stops reporting them as lever-shaped. Get the full list from brief 655's report, and re-verify each yourself before editing.
**Gate:** `python tools/wall_aware_headroom.py` before/after counts + `python tools/gate3.py --scope eur --no-tests` (header comments must be byte-neutral — prove it).

### q-ov002-wall-record — document ov002's verified wall cohort [DONE]

Brief 654 drained ov002's coercible pool (23 shipped total) and **independently re-tested the remaining ~2,750 files' 288/290/294 reg-alloc-walled headers with fresh evidence** rather than trusting the blanket stamp. That verification is currently buried in a brief report. Promote it into a durable record (address ranges, the re-test method, what evidence was found) so no future round re-sweeps ov002 believing it's unexplored. This is the *negative* result that protects weeks of effort — write it to be found.
**Gate:** doc-only; cross-link it from `endgame-ledger.md` and the wall taxonomy.

### q-dead-tools-action — action the dead-tool audit [DONE]

> PARKED: No UNREFERENCED tools were found; requested configure gate is unavailable because kb-map has no EUR baserom. PR #1256 records the no-op and known baseline test failures.

Your own `q-dead-tools` audit produced a KEEP / SUPERSEDED / UNREFERENCED table. Now action it: delete only the rows you classified UNREFERENCED, one small batch at a time. ⚠️ Re-verify each is still unreferenced at deletion time (`build.ninja`, workflows, tests, docs, other tools) — the tree has changed since the audit.
**Gate:** `python -m pytest -q tests` (no NEW failures beyond the known 12 Windows path-sep ones) + `python tools/configure.py eur` succeeds + list what you removed.

### q-tools-package-2 — continue the parser migration [DONE]

> PARKED: Migrated 2 readers, but configure.py eur is blocked by the missing EUR baserom in kb-map; PR #1257 records the migration and known baseline test failures.

`q-tools-package` landed a shared parser facade. Continue: migrate the remaining hand-rolled delinks/symbols readers onto it, most-duplicated first, in small reviewable batches. ⚠️ `build.ninja` invokes tools AS SCRIPTS — preserve that. Stop and report if any migration would need a build-graph change.
**Gate:** `python -m pytest -q tests` (no new failures) + `python tools/configure.py eur` succeeds + count migrated.

### q-objdiff-v3-action — execute the objdiff bump if your study said go [DONE]

Your `q-objdiff-v3` feasibility report reached a verdict. If it was GO: perform the bump in the migration order you proposed, updating the report.json consumers you identified, and retire panic-filter case (a) — keep case (b). If it was NO-GO or conditional: do NOT bump; instead write the specific blocking condition and what would have to change. Either path is a valid completion of this item.
**Gate:** if bumping — `python tools/gate3.py --scope all --no-tests` PASS + all report.json consumers still work; if not bumping — the blocking-condition writeup.

---

## ⚠️ Re-routing note (2026-07-23, brain)

The five items above previously marked PARKED were parked **correctly** — their gates
needed a build and `kb-map` has no baserom. That was a briefing error, not your failure.
**Work them from `kb-types`, which HAS the EUR baserom**, and gate with EUR only:
`python tools/configure.py eur && ninja sha1` (⚠️ never bare `ninja`). If an item still
cannot be gated even there, re-park it with the specific reason — that remains the right call.

### q-epilogue-corpus — assemble the epilogue-shape wall corpus [DONE]

Brief 661 hit one recurring **epilogue-shape** mismatch **three times** on functions whose bodies matched 100% (`func_020915e4` loop body 100%, `func_020458d8` all four branch bodies 100%, `func_0206eecc`) — roughly 14% of its sample. The CC Decomper is trying to crack the lever (`cm-epilogue-wall`); your job is to hand it the full corpus so it isn't hunting.
Mechanically gather every candidate whose `.s` shows the same epilogue shape as those three: search `src/**/*.s` for the epilogue pattern they share, and for each hit record address, module, size, and the exact epilogue instruction sequence. Also list which routing tier each file currently uses (plain `.c` / `.legacy.c` / `.legacy_sp3.c` / `.thumb.c`) — the tiers exist for epilogue-shape families, so tier-vs-shape correlation is the key signal.
**Gate:** doc-only, no build; the corpus + the tier correlation table.

### q-green-pytest — make the suite GENUINELY green, no known-failure baseline [DONE]

External review (Sol) + swarm r5 agree: normalising 11-12 "known" failures makes real regressions invisible. Work from `kb-types` (has EUR baserom + dsd, so you can tell "missing prerequisite" from "real bug"). For EACH failing test classify and act:
- REAL cross-platform bug (e.g. path-separator assertions) → fix the TEST or the TOOL, whichever is actually wrong;
- MISSING-PREREQUISITE integration test (needs dsd / baserom / `cpp` binary) → `pytest.mark.skipif` with an explicit reason string checking for the prerequisite;
- STALE/invalid → fix or delete with justification in the PR body.
END STATE: `python -m pytest -q tests` fully green on Windows AND unchanged-green on POSIX (don't weaken what a test verifies where it CAN run). Then update the queue headers + gate3 guidance to drop the `--no-tests` advice — the full gate becomes usable everywhere.
**Gate:** full pytest output pasted green + `python tools/configure.py eur && ninja sha1` OK (byte-neutrality).

### q-natural-c-metric — split natural-C vs asm-in-C in the readable-C metric [DONE]

**108 of 10,519 matched `.c` TUs contain inline asm** (`asm void` / `asm {` — e.g. the cm-ov002-batch1 ships, plus legit BIOS wrappers like CpuFastSet.c) and ALL currently count toward "C-decompiled" — inflating the headline readable-C number. Fix the metric:
1. Grep-classify first and enumerate the exact in-tree patterns (`asm void`, statement `asm {`, anything else) — list what you find in the PR.
2. In the C-decompiled computation (tools/progress.py + the c_code_bytes path in generate_progress_bars.py): a TU whose source matches the patterns = ASM-C; else NATURAL-C. Emit two lines: `Natural-C` and `asm-C`; their SUM must equal the old C-decompiled number — prove sum-preservation in the PR with before/after.
3. Tests for the classifier (both classes + an edge: a comment containing the word "asm" must NOT trip it).
4. Update state.md's metric block to show the split.
**Gate:** pytest no-new-failures (green if q-green-pytest landed first) + before/after totals pasted + sum-preservation shown.

### q-headroom-textsize — add a text_size field to wall_aware_headroom.py (r6 bet 2 — unblocks the small-tier re-sweep) [DONE]

⚠️ HIGH-VALUE: the selector emits only bare path strings, so briefs 663/664 sized candidates by `.s` FILE bytes (~10x the real .text span) and brief 665 wrongly declared a 1,224-candidate small-.text range 'already swept'. Emit `{path,addr,text_size}` (a join on delinks the tool already parses) and add `--min-size/--max-size`. Then correct briefs 663/664/665's mis-measurement note. Work from kb-types (EUR baserom).

**Gate:** `python -m pytest -q tests` no-new-failures + before/after: the tool now reports text_size for a sample + `--max-size 256` filters correctly.

### q-gate3-vacuous — make gate3 fail-loud when it runs nothing (r6 bet 3) [TODO]

gate3.py can print `GATE PASS` having executed ZERO checks (e.g. `--scope tests --no-tests`). Extract a `verdict()`, return exit-2 `GATE VACUOUS` when nothing ran, reject `--scope tests --no-tests` at argparse, add tests/test_gate3.py. The real merge oracle is the brain's 3-region sha1, but a vacuous PASS is dangerous.

**Gate:** `python -m pytest -q tests/test_gate3.py` green + demonstrate `GATE VACUOUS` exit-2 on the empty combination.
