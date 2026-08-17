[//]: # (markdownlint-disable MD013 MD041)

# Codex Scaffolder — autonomous tooling queue

**Protocol:** loop until QUEUE-EMPTY — do NOT stop after one item. `python tools/work_queue.py next codex-scaffolder --claim` (⚠️ Windows: plain `python`, NOT `python3.13`). Gate each item's stated Gate (paste real output); the normal build gate includes the full pytest suite. Open ONE PR **per item**, `work_queue.py done codex-scaffolder <id>`, commit, then immediately take the next item. Effort HIGH.

**Worktree capability (match your gate to it — briefing bug b642):** `kb-map` = build-FREE (no baserom, no `dsd`) · `kb-types` = EUR baserom only · `scaffolder`/`decomper` = all 3 baseroms. If an item's gate needs a build you cannot run, say so and skip rather than forcing.

**Lane status (2026-07-22 — supersedes the old "this lane is thin" note):** the readable-C frontier REOPENED. Brief 651 corrected `wall_aware_headroom.py`; the honest pool went 47 → **6,117 candidates**, with only 32 files confirmed-permanent project-wide. There is real engineering work again. Still report QUEUE-EMPTY honestly if you genuinely exhaust it.

**Tooling budget (2026-07-23):** a NEW tool must do one of: replace/delete an existing tool, consolidate duplicated infrastructure, measurably cut cycle time, catch a demonstrated failure class, or directly ship functions/bytes — state which in the PR. **asm-void ≠ readable C:** inline-asm-in-C is coverage hygiene, counted separately from natural C (metric split shipped end-to-end, q-natural-c-metric [DONE]); prefer natural C, use asm-void only where a documented wall justifies it.

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

### q-objdiff-v3 — objdiff 2.7.1 → 3.7.3 upgrade feasibility [DONE]

> PARKED: kb-types EUR build gate passed, but pytest remains red with 12 failures (11 Windows/path/tool baseline plus stale generated research-index check); defer until q-green-pytest.

### q-itcm-reach — why ITCM's functions are unreachable [DONE]

ITCM is effectively an invisible 27th module: ~39 uncarved functions (11 EUR + 14 USA + 14 JPN per brief 643's census) that **no census, wave, or tool currently reaches**. Investigate the mechanism — is it a `dsd` config gap, a delinks/section modelling issue, or an addressing thing? Produce a diagnosis + a concrete proposal for making them reachable. Read-only investigation; do not attempt to carve them in this item.
**Gate:** the report, with the exact evidence (config/section/tool output) that explains the invisibility.

### q-c34-corpus — assemble the C-34 corpus (116 of 138 coercible) [DONE]

One taxonomy code, **C-34, covers 116 of the 138 coercible candidates** — the single biggest lever-shaped opportunity in the pool. Mechanically gather every C-34-cited file into one reference: address, module, size, the exact `.s` shape that triggered the citation, and any ALREADY-MATCHED example of the same shape (search matched `.c` for siblings). You are assembling evidence, NOT deriving the recipe — a CC agent cracks it; your job is to hand them the corpus so they don't spend hours collecting it.
**Gate:** the corpus doc + counts; doc-only, no build.

### q-tools-package — kill the tools/ boilerplate and parser duplication [DONE]

> PARKED: kb-types EUR configure+ninja sha1 passed; pytest remains red with 12 failures including the stale generated research-index check, so defer until q-green-pytest.

### q-dead-tools — audit the tool inventory for dead weight [DONE]

Of the ~93 `tools/*.py`, some are superseded or unreferenced (e.g. tools whose lane closed). For each: is it referenced by `build.ninja`, any workflow, any test, any doc, or another tool? Produce a table: KEEP / SUPERSEDED-BY-X / UNREFERENCED. ⚠️ **List only — delete nothing in this item.** A follow-up will action it after review.
**Gate:** the audit table; doc-only, no build.

### q-green-main — finish greening CI, then propose protection [DONE]

Lint has been red for weeks and **red is the baseline**, which means a real regression is invisible. Finish the cleanup (ruff autofixes, markdownlint over the generated dirs, regenerate both indices — that flips drift-check and unittest together), then **propose** (do not apply — it needs owner rights) a branch-protection ruleset requiring: `Python (ruff)`, `Markdown (markdownlint-cli2)`, `unittest`, `drift-check`, `pr-invariants (eur)`. ⚠️ Exclude the usa/jpn matrix legs — `continue-on-error` does NOT produce a green check-run, so requiring them would hard-block every PR.
**Gate:** the CI checks green on your own PR + the proposed ruleset written up for the owner to apply.

### q-c34-header-fix — correct the 30 mistagged C-34 citations [DONE]

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

### q-gate3-vacuous — make gate3 fail-loud when it runs nothing (r6 bet 3) [DONE]

gate3.py can print `GATE PASS` having executed ZERO checks (e.g. `--scope tests --no-tests`). Extract a `verdict()`, return exit-2 `GATE VACUOUS` when nothing ran, reject `--scope tests --no-tests` at argparse, add tests/test_gate3.py. The real merge oracle is the brain's 3-region sha1, but a vacuous PASS is dangerous.

**Gate:** `python -m pytest -q tests/test_gate3.py` green + demonstrate `GATE VACUOUS` exit-2 on the empty combination.

### q-c99-flag-hook — add a per-TU flag table to configure.py + adopt -lang c99 (r6 bet 6) [DONE]

r6 verified `-lang c99` is `.text`-NEUTRAL (1,106 SAME / 0 DIFF across all tiers/regions) and both pret NDS repos ship it; it legalises declaration-at-point-of-use (a real allocator lever). Table-ise the 3 version constants into `{suffix:(binary,flags)}` + a path-glob→flags map, land it as a `ninja sha1`-proven no-op, then flip the default to c99 on the neutrality evidence. Treat the reg-alloc PAYOFF as unproven — adopt on hygiene + to unlock future one-line flag experiments. Work from kb-types.

**Gate:** `python tools/configure.py eur && ninja sha1` OK (byte-neutral) + `python -m pytest -q tests` no-new-failures + the flag table.

### q-asm-void-counter — surface a per-PR asm-void byte counter (r6 bet 5 follow-on) [DONE]

The natural-C/asm-C split landed, but nothing GATES new asm-in-C content and the escape rate was accelerating (70.8% of new EUR C bytes on one 3-day burst). Retarget `scope_gate.py` (or add a small check) to count added/modified `asm void`/`asm {` `.c` under src/ and libs/ in a PR and surface it in the PR template/summary. Not a hard block — visibility, so asm-void ships are a deliberate choice.

**Gate:** `python -m pytest -q tests` no-new-failures + demo output on a sample diff.

### q-selector-addr — add --min-addr/--max-addr to wall_aware_headroom.py (r8 bet 6 — kills double-carves) [DONE]

The ONLY concurrent-collision prevention today is prose address-splits in queue items, so agents hand-filter JSON and `check_delink_dupes` only DETECTS an overlap at gate3 AFTER both lanes burned the carve (the brain then hand-resolves it every merge). `metadata['addr']` is already in scope — add `--min-addr/--max-addr` as a 4-line mirror of the existing size filter. Then the sweep lanes get concrete `--max-addr`/`--min-addr` commands instead of prose. Work from kb-types.

**Gate:** `python -m pytest -q tests` no-new-failures + demo: the flag filters the JSON by address range.

### q-delink-suffix-fix — fix_delink_suffixes.py preflight for routing ships (r8 bet 5) [DONE]

Routing ships rename `.c`→`.legacy.c`/`.legacy_sp3.c`/`.thumb.c`, and the delinks.txt TU-header must follow — it's missed routinely (brief 668 left all 17 headers plain `.c`; build passed but `check_match_invariants` went red repo-wide with missing_tu_source×17 for DAYS until hand-fixed). 347 routing files in src/main → recurs nearly every ship. Build `tools/fix_delink_suffixes.py` reusing `ROUTING_SUFFIXES`, wire it like `check_delink_dupes` (gate3 preflight).

**Gate:** `python -m pytest -q tests` + demo it fixes a deliberately-mismatched header + `python tools/configure.py eur && ninja sha1` OK.

### q-128b-reband — re-band the small-tier worklist at 128B (r8 bet 2) [DONE]

r8 measured the '≤256B runway' is really TWO populations split at 128B: ≤128B ships ~70% (0-64B 8/11, 65-128B 15/22), 129-256B only 20% (3/15), 257B+ 0/4 — holds within-module, so size is causal. The 1640-row worklist sorts shape-first, interleaving 725 low-yield rows through 915 high-yield. Split the band at 128B (lead with ≤128B), delete the `matched-sibling`/`provenance` columns (both 1640/1640 constant = useless), retier the summary.

**Gate:** doc-only; the re-banded worklist + the two dead columns removed.

### q-delink-stamp-fix — fix the phantom delink.yaml that makes EVERY gate re-delink (r9 lever #2, VERIFIED 87x) [DONE]

TOP RATE FIX — the 3-region gate is the brain's serial critical path. The delink ninja edge declares output build/<ver>/delinks/delink.yaml but dsd delink v0.11.0 NEVER writes it, so `ninja -d explain -n sha1` prints 'output ... delink.yaml doesn't exist / is dirty' and re-runs delink (12.5s) -> relink (56s) -> ROM (7s) on EVERY gate even with zero changes (~74s no-op tax). Creating the file once -> next `ninja sha1` = 853ms (87x). FIX: replace the phantom yaml output with a real .delink.stamp the delink rule touches; repoint the link edge's $in (configure.py ~997) from the yaml to the stamp. See configure.py:425 (arm9_delink_yaml), :483, the delink rule + link edge. The delink rule's REAL inputs (delinks.txt etc.) already re-trigger it, so correctness is preserved. Work from kb-types.

**Gate:** byte-identical: `python tools/configure.py eur && ninja sha1` OK; then a SECOND no-change `ninja sha1` must be <5s (paste both timings); `python -m pytest -q tests` no-new-failures.

### q-integrate-driver — tools/integrate.py — one-command merge-round driver (r9 lever #3) [DONE]

The brain hand-drives every merge round: ~10-15 serial git merges into brain/integ, conflict resolution, index regen, lint fix, gate3, push (86 hand-merge commits + ~40% bookkeeping in last-300). Build tools/integrate.py <branches...> reproducing it deterministically: merge each branch --no-ff; on conflict resolve by TYPE (config/*/delinks.txt = keep-ours + sort_delinks; docs/queue/* = union then dedup-by-id + MD022 blank-guard; docs/research/README.md = regenerate); then run gate3 --scope all --no-tests and report a summary (C added, .s removed, per-region sha1). Do NOT push (brain reviews). Biggest brain-overhead reduction.

**Gate:** `python -m pytest -q tests` + a dry-run demo on 2 real branches showing typed resolution + gate result.

### q-include-layer — ship the empty-but-wired include/ shared-header layer (r10 bet 4 [A], substrate — do FIRST) [DONE]

`-i include` is already on all 4 mwcc rules (build.ninja) yet include/ holds only .gitkeep — a zero-config drop-in slot sitting empty. 63 headers exist but all ovNNN_core.h (mostly sketch); main-arm9 (~4,047 funcs) has ZERO headers. Create the canonical home: include/game/types.h (game structs + NitroSDK primitive types), include/game/prototypes.h (stub, filled by q-prototypes-h), and per-module include/game/main_core.h etc. Instantly includable, NO configure.py edit needed. This is the substrate the prototypes + type-recovery lanes write into — land it first. Keep it byte-neutral (headers only change what's DECLARED, gate proves no codegen change).

**Gate:** `python tools/configure.py eur && ninja sha1` OK (byte-neutral) + `python -m pytest -q tests` no-new-failures + the header skeleton.

### q-data-metric-fix — fix the data metric — it counts opaque placeholders as 'typed' (r10 bet 3 [A]) [DONE]

The Typed-array metric (progress.py:49 _DATA_ARRAY_DECL_RE, :454) matches the opaque carve placeholder `unsigned char data_X[N]=` IDENTICALLY to a real struct array, so summarize_data_readability's 1.69% holds 0 BYTES of genuinely struct-typed data — retyping (cm-data-canary) would move it by ZERO. Add a named-struct sub-tier that EXCLUDES primitive-element arrays (unsigned char/int etc.) and counts only real `StructName foo[N]` typed data. Land it BEFORE the data-retype chapter scales, or the whole lane is invisible + unscorable.

**Gate:** `python -m pytest -q tests` no-new-failures + the new tier reports 0 now and >0 after cm-data-canary lands + a test.

### q-activation-invariant-gate — make the three-way count a real gate [DONE]

Build `tools/check_activation_invariant.py` to mechanically check a git range: added `func_*.c` files under `src/`, deleted `func_*.s` files, and delinks activation flips. Allow routing suffixes (`.legacy.c` / `.legacy_sp3.c`) and report data-file additions separately as informational. Add synthetic failure tests and verify PR #1372 and PR #1376 ranges.

**Gate:** synthetic missing activation exits non-zero; PR #1372 and PR #1376 ranges exit zero; `python -m pytest -q tests` no-new-failures.

### q-recursive-glob-sweep — close the non-recursive directory-scan bug class [DONE]

> DONE: PR #1385. Shipped without a queue entry — added retroactively by the
> brain at integration time so `work_queue.py` has a record. Fixed the flat
> scans in `port_census.py`, `pattern_library.py` and `scratch_bundle.py`, each
> with a synthetic nested-file regression test, plus a full classification audit
> of every `glob` call in `tools/`. Measured effect: `pattern_library.py` +258
> nested matched files; `port_census.py` USA/JPN unparsed names 52 -> ~521 (i.e.
> ~470 nested files per region were previously invisible to the parser).
> Deliberately-flat scans were left alone with reasons recorded. Third
> instance of this bug class (after #1366 and #1383).

### q-typed-array-brace-nesting-fix — Typed-array regex credits struct-internal fields, not just file-scope arrays [DONE]

**Resolution 2026-08-04:** stale premise on this base. The brace-aware
`_has_file_scope_array_decl()` fix already landed in `8446c3e7d`; all three
named TUs return `file_scope=False`. EUR progress is `Typed-array: 161052`
bytes both before and after this audit (delta `0`, not the proposed `1792`),
so no production change was justified. Added a focused regression for a
bracket-less scalar struct instance whose typedef body contains array fields;
it contributes to Named-struct but not Typed-array.

Sibling finding to the `q-metric-singleton-struct-gap`/`q-data-metric-fix` lineage — same metric, opposite direction (over-crediting `Typed-array` instead of under-crediting `Named-struct`). Filed by the Claude Scaffolder lane after tracing a real measurement discrepancy in `cm-bss-convert-2` (PR #1402); write-up and fix belong here since this is metric-tooling correctness, not data-carving.

`tools/progress.py`'s `_DATA_ARRAY_DECL_TYPE_CAPTURE_RE` (feeds `typed_array_bytes` via `summarize_data_readability`) is a line-based regex (`^\s*(...)+[A-Za-z_]\w*\s*\[...\]\s*(?:=|;)`, `re.MULTILINE`) with no brace-depth tracking. It matches any line shaped like `Type name[N];` — including a padding/buffer FIELD nested inside a `typedef struct { ... } Foo;` body, not just a genuine file-scope array declaration. Crediting is per-TU (any qualifying match anywhere in a TU's source credits that TU's whole `delinks.txt` byte range to `typed_array_bytes`), so a TU whose only top-level object is a bracket-less scalar struct INSTANCE (correctly `Named-struct`-only by design) still gets credited to `Typed-array` too, purely because its struct body happens to contain an array-shaped field.

Confirmed empirically: 3 shipped, gate-passing files each declare a scalar struct instance at file scope (no brackets on the instance itself) whose typedef body contains 1-2 array fields:

- `src/main/data/data_021a5340.c` — `data_021a5340_t data_021a5340;` (scalar), typedef body has `thread_state[0xc0]` + `stack[0x400]`
- `src/main/data/data_021a8b00.c` — `data_021a8b00_t data_021a8b00;` (scalar), typedef body has `_unk0c[0x14]` + `buffer[0x200]`
- `src/main/data/data_0219a8f4.c` — `Overlay0219a8f4 data_0219a8f4;` (scalar), typedef body has `_pad1[3]` + `_pad7[0x14]`

Each of these 3 TUs' full byte range (1216 + 544 + 32 = 1792 B) is counted toward `typed_array_bytes` in addition to `named_struct_bytes`, even though none has a genuine file-scope array. This is exactly the gap between `cm-bss-convert-2`'s naive per-symbol prediction (+17,408 B) and the measured `Typed-array` delta (+19,200 B). Verify directly:

```
python -c "import sys; sys.path.insert(0,'tools'); import progress; print(list(progress._DATA_ARRAY_DECL_TYPE_CAPTURE_RE.finditer(open('src/main/data/data_021a5340.c').read())))"
```

shows 2 matches, both struct-internal fields, zero file-scope arrays.

Worth checking (not confirmed — a plausible mirror-image risk under the same root cause, not directly observed in any shipped file): could a struct field that is itself an ARRAY OF A NON-PRIMITIVE TYPE (e.g. `SomeStruct sub[3];` nested inside an otherwise-primitive-only TU) falsely trigger `_tu_has_named_struct_decl` the same way, over-crediting `Named-struct` for a TU that should be neither tier? `_tu_has_named_struct_decl` checks every match from both `_DATA_ARRAY_DECL_TYPE_CAPTURE_RE` and `_DATA_SCALAR_DECL_TYPE_CAPTURE_RE` for a non-primitive type clause, with the same brace-blindness — worth a test case either way, whichever direction it turns out to go.

Proposed fix direction (not prescribed — pick what's right after investigating): track brace depth while scanning source text so only depth-0 (true file-scope) declarations qualify, or otherwise restrict both capture regexes from matching inside an unclosed `{` opened by a preceding `typedef`/`struct` line.

**Gate:** `python -m pytest -q tests` no-new-failures + a new regression test asserting a TU with ONLY a bracket-less scalar struct instance (whose typedef body contains an array field) does NOT credit `typed_array_bytes` + before/after `python tools/progress.py --version eur` showing `Typed-array` drops by exactly 1792 B (the 3 files above) with `Named-struct` unchanged.

### q-zero-width-bss-tu-fix — dsd's delink/LCF stage rejects a zero-width `.bss` TU [DONE]

**Resolution 2026-08-04:** permanent carve-time constraint, not a patchable
repo-side tool defect. The rejecting validator is inside the prebuilt `dsd`
binary (`cli/src/config/delinks.rs` is present in its embedded paths), and
Ninja invokes it directly through `./dsd lcf -c <config>`. The exact split
from cm-bss-convert-4 therefore remains invalid while the marker's
`.bss start:X end:X` entry is present. Future carve waves must omit a
zero-width TU from `delinks.txt` before the LCF step; retain the marker in
the source/symbol metadata, and keep the nonzero alias range as the sole
delinks owner. No production change was justified without a dsd source or
an accepted zero-width representation.

Filed by the Claude Scaffolder lane after hitting a real build failure in `cm-bss-convert-4` (PR #1413) while carving `data_ov001_021ca420_alias` — the canonical partial-coverage-trap symbol (`data_ov001_021ca420`, a 0-byte marker aliased to its real 32-byte storage under a second name, the established C-34 literal-pool-dedup trick documented in `docs/research/codegen-walls.md`). This is build-tooling correctness, not data-carving, so filing here rather than fixing it in that lane.

**The failure:** carving the 32-byte alias out into its own `.c` TU, while leaving the 0-byte marker alone in its original `bss/*.s` cluster file, produces this `delinks.txt`:

```
src/overlay001/bss/data_ov001_bss.s:
    complete
    .bss start:0x021ca420 end:0x021ca420

src/overlay001/data_ov001_021ca420_alias.c:
    complete
    .bss start:0x021ca420 end:0x021ca440
```

The first entry is genuinely zero-width (`start == end`) — the marker's `.space 0x0` contributes no bytes to the section at all, so its whole reason for existing is the symbol name, not any storage. `ninja sha1` never gets a chance to run: the delink/LCF generation step itself fails first —

```
Error: .bss in file 'src/overlay001/bss/data_ov001_bss.s' has mixed section order with previous file 'data_ov001_021ca420_alias.c'
```

**Why this is new, not a repeat of an already-solved wall:** every prior `.bss` carve wave (1 through 4, ~40 symbols shipped total, see `docs/research/data/cm-bss-convert-{1,2,3,4}-*.md`) split cluster files by peeling a target off the front, middle, or back of a run of *nonzero*-sized symbols. When a target was the very first symbol in a cluster (a "front-peel"), the carve tooling simply emits **no** preceding fragment entry at all — there was never a genuine zero-width TU in any of those ~40 conversions. This case is different only because the *thing being kept behind* is itself 0 bytes, which is exactly what the C-34 dedup convention requires (a nonexistent object can't have a nonzero size). Confirmed as the sole cause: reverting only this one symbol's carve made `ninja sha1` pass immediately on the same branch, with the other 8 unrelated carves in that same PR shipping cleanly.

**What's needed:** find whichever tool actually rejects this — most likely somewhere in the delink-stage/LCF-generation path invoked by `ninja` before `dsd rom build` (the error string `"has mixed section order"` should `grep` straight to it, whether that's in `dsd` itself, a wrapper script under `tools/`, or `patch_section_align.py`) — and determine whether a zero-width `.bss` TU can be made legal there, or whether the real fix is one level up: teach whatever writes `delinks.txt`/calls this validator to treat a zero-width TU as a no-op that should be *omitted* from the file list entirely rather than emitted and rejected. The reconciled C is already correct and ready to ship (`data_ov001_021ca420_alias` in `docs/research/data/cm-bss-convert-4-2026-07-31.md`) — this item only needs to unblock the mechanical split.

**Gate:** demonstrate the exact `data_ov001_021ca420_alias` split above builds (`python tools/configure.py eur && ninja sha1` OK) with the 0-byte marker's TU entry either accepted as zero-width or auto-omitted — plus `python -m pytest -q tests` no-new-failures. If investigation concludes this can't be fixed in the tool and must stay a permanent carve-time constraint instead, that's a valid completion too — write up the mechanism and the specific constraint for future carve waves to check against before attempting a similar split.

### q-cross-region-alias-guard — port_to_region.py's fallback resolution can silently bind to an unrelated cross-region symbol [DONE]

Filed by the Claude Scaffolder lane after finding (during unrelated `.bss`-carving work, `cm-bss-convert-6`) that EUR and JPN/USA can assign the same symbol name/address to genuinely *different* objects. This is port-tool correctness, not data-carving, so filing here rather than fixing it in that lane. Full investigation, methodology, and the complete data table: `docs/research/cross-region-symbol-aliasing-audit.md`.

**The condition:** EUR's module base address is never exactly equal to USA/JPN's (confirmed with zero exceptions, `main` + all 24 overlays), but the accumulated EUR↔target address shift drifts continuously through each module's range and crosses back through zero at scattered points — producing coincidental identical-absolute-address collisions between two *unrelated* objects. **105 such collisions confirmed** across `main` and 21 of 24 overlays (full table in the audit doc), 26 of which already have live consumers in `src/usa/**`/`src/jpn/**`.

**Resolved 2026-08-03 (brain):** shipped as `codex/cross-region-alias-guard` (cd3d19fd1, merged a3af3ce5e) — `tools/port_to_region.py` now imports `cross_region_aliases.load_blocklist` and emits a `refused: cross-region alias at 0x...` verdict. Original analysis retained below.

**Original status when filed: not a live bug.** Every one of the 26 live cases was individually verified safe — 16 via unsized/opaque externs (no size ever asserted, so a mismatch can't mislead), 10 via sized structs that were either independently matched against that region's own assembly, or traced to an EUR source using a *numerically different* address, safely re-paired by `port_to_region.py`'s primary resolution method (`derive_data_address_mapping` in `resolve_symbol`) — which pairs relocations by instruction offset within the already-fingerprint-matched sibling function, and so never consults either side's raw address or name text. That method is structurally immune to this class of coincidence. `ninja sha1` is currently green for all 3 regions (verified directly, not via CI — `compile-check.yml` explicitly skips the byte-identity check).

**Where the real risk lives:** the other 79 non-live addresses sit in still-raw EUR `.s` functions that haven't been matched/ported yet. `resolve_symbol`'s two fallback tiers — exact-address match, and D3 shift-consensus — both assume address correspondence across regions, and would be the path invoked if the primary reloc-pairing method doesn't cover a given reference (e.g. a comment-only or indirectly-reached data symbol). If either fallback ever resolves to one of these 105 addresses, it could silently bind to the target's unrelated same-numbered object without any error — the wrong reference would very likely fail `ninja sha1` if it changes program behavior, but a reference that's only ever used opaquely (address-of, never dereferenced with a size-dependent operation) could conceivably still compile byte-identical while being semantically wrong for its own region.

**What's needed:** `resolve_symbol`'s two fallback-tier branches should consult a maintained list of these 105 `(module, address)` pairs (the audit doc's table is a ready-made starting point) and either refuse to resolve silently against one (forcing a `NONE`/manual-review outcome instead of `EXACT_ADDR`) or at minimum downgrade confidence and surface a loud warning in the port's own output, rather than resolving as if the addresses always mean the same thing. The primary reloc-pairing method needs no change — it's already safe by construction.

**Gate:** a synthetic/regression test demonstrating that a fallback-tier resolution against one of the 105 flagged addresses is rejected or flagged (not silently accepted), plus re-running the 26-symbol live cross-reference from the audit doc to confirm no regression; `python -m pytest -q tests` green; queue entry updated to `[DONE]` in the same PR.

### q-activation-invariant-classifier — classify named C functions from authoritative metadata [DONE]

Fix `tools/check_activation_invariant.py`: named function files such as `Ov015_InitScroller.c` are currently reported as DATA because the classifier only recognizes `func_*`. Use the region's `delinks.txt`/`symbols.txt` metadata for `kind:function` vs data, with the existing filename-prefix fallback when metadata is unavailable. Add a synthetic named-function missing-activation failure test and recheck known-good PR #1387 and #1388 ranges. Report the real-range function/data split before and after.

**Gate:** synthetic named-function omission exits non-zero; PR #1387 and PR #1388 ranges exit zero; `python -m pytest -q tests` green; queue entry committed in the same PR.

### q-port-census-unparsed — 747 EUR TUs are invisible to the port census [DONE]

`tools/port_census.py` prints, on the current tree: `EUR baseline .c files (address-keyed): 4369; unparsed names: 747` (and USA 531 / JPN 530 on their side). The parser keys on `func_*` / `func_ovNNN_*`; every other filename shape falls out of the address map entirely.

The shapes it drops, counted on the current tree: `data_*` (325 + per-overlay variants), `ovNNN_ADDR` (~160 across modules, e.g. `src/overlay006/ov006_021b2ee4.c`), `sinit_*`, and `*_stubs_ADDR` — the last of which also carries a **truncated 5-digit address** (`ov009_stubs_ab840.c`) rather than the full 8-digit one, so even a widened prefix rule will not key it correctly without handling that.

Data and stub TUs are legitimately not function ports, so a large share of the 747 is expected to be benign. But `ovNNN_ADDR` is a *function* TU under a module-prefix naming style, and those would be silently missing from the port backlog — i.e. free byte-identical ports nobody is counting.

Audit: of the 747, how many are genuine portable function TUs? Extend the parser to whatever shapes qualify (use `delinks.txt`/`symbols.txt` metadata for `kind:function` rather than a wider filename regex, if that classifies more reliably — `q-activation-invariant-classifier` solved the same problem the same way). Re-run the census and report the backlog delta.

Either outcome is a good answer, and they are very different numbers: "N more free ports were hidden" feeds the Codex Decomper harvest lane directly, while "all 747 are correctly excluded" closes a standing doubt. Right now nobody knows which it is.

Effort: **HIGH** — this is classification judgment, not a mechanical edit.

**Gate:** `python -m pytest -q tests` no-new-failures + a regression test per newly-recognized filename shape (including the truncated-address `*_stubs_*` case) + before/after `port_census.py` counts for all three regions.

### q-kickoff-location-guard — kickoff_lint must require a working-directory assertion [DONE]

> ⚠️ **REOPENED 2026-08-03 — the shipped check is vacuous for the most likely
> wrong form.** It is line-local (good — a stray `exit 1` elsewhere no longer
> counts), but it accepts a location *probe* that merely SUCCEEDS rather than a
> location *assertion* that compares. Both of these pass today and neither
> proves the agent is in its assigned worktree:
>
>     pwd || exit 1
>     git rev-parse --show-toplevel || exit 1
>
> Both succeed inside **every** valid git worktree, including the brain
> checkout — which is exactly the tree the guard exists to keep lanes out of.
> Verified by running the merged linter against a kickoff whose only guard is
> `pwd || exit 1`: it reports `PASS location-guard`.
>
> **Repair:** require an actual equality comparison between the current repo
> root and an explicitly expected path, e.g.
>
>     EXPECT="$HOME/Dev/spirit-caller/<lane>"
>     [ "$(git rev-parse --show-toplevel)" = "$EXPECT" ] || { echo "WRONG WORKTREE"; exit 1; }
>
> **Negative tests are the deliverable here** — the check is only as good as
> what it rejects. Prove all four:
>
> 1. `pwd || exit 1` → FAIL
> 2. `git rev-parse --show-toplevel || exit 1` → FAIL
> 3. a comparison against the WRONG expected path → FAIL
> 4. a real equality assertion against the assigned path → PASS
>
> Case 3 matters most: it is the difference between "there is a comparison" and
> "the comparison is against the right thing". Do not mark this DONE again
> until all four are green and pasted.

**Incident response, part 2 of 2** (part 1 is the Brain-owned worker-transcript rule, PR #1438). Full brief with evidence: see the PR description and the failure narrative below.

On 2026-08-03 the Codex Decomper lane ran its entire port-harvest brief **inside the brain worktree**. Its shell started in the base checkout; the kickoff's PREFLIGHT verified the *base* (grep the queue file for the item id) and passed — same repo, same `origin/main`, same queue file — so nothing halted. `git checkout -B <branch> origin/main` then moved the brain worktree onto a feature branch and 33 ports were committed into the coordinator's working directory. Recovered by hand; nothing lost. **Second occurrence** — `cm-ov002-unknown-sweep-15` reported 4 of 5 agents starting in the base checkout, and survived only because its kickoff carried a `pwd` self-check.

**Root cause:** a base check and a location check are different questions. "Is my tree current?" was guarded; "am I in the right tree at all?" was not. `kickoff_lint.py` has no check for the second.

**Measured evidence.** A brain-side prototype run against the four kickoffs actually sent that morning: CC Decomper **PASS** (it carried a `pwd` / `git worktree list` self-check); CC Scaffolder, **Codex Decomper**, Codex Scaffolder all **FAIL**. The failing three are exactly the ones that lacked the protection the fourth had, and the offending lane is among them. All four passed the *existing* linter. Controls: base-check-only → FAIL; `pwd` echoed with no hard stop → FAIL; `rev-parse --show-toplevel` + `exit 1` → PASS; `git worktree list` + `STOP` → PASS.

**Suggested shape (yours to change or reject).** A required `location-guard` check registered immediately after `preflight`, matching the existing `check_*(text) -> tuple[bool, str]` convention: detect a location assertion (`pwd`, `rev-parse --show-toplevel`, `git worktree list`, `$PWD`) paired with a hard stop (`exit 1`, `|| { … }`, `STOP`). Location without a stop must FAIL — an echoed directory does not halt a misplaced lane.

⚠️ **`tests/test_kickoff_lint.py`'s `GOOD` fixture has no location guard** — it needs one added or `test_all_required_pass` breaks the moment the check becomes required. Suggested new tests: missing guard; guard-without-hard-stop; base-check-alone (the exact 2026-08-03 regression).

**Tooling budget:** qualifies on *catches a demonstrated failure class* — twice, the second time costing a frozen coordinator worktree and a manual recovery. No new tool; one check in an existing one.

**Gate:** `python -m pytest tests/test_kickoff_lint.py -q` green + paste the linter's verdict on a kickoff lacking a location guard (must FAIL) and one carrying it (must PASS).

### q-field-exposure-census — rank documented fields by distinct access sites [DONE]

Build `tools/field_exposure_census.py` to rank documented fields by distinct
matched `.c` and `.s` read/write sites. Keep the detector lexical and document
blind spots for masked read-modify-writes, bulk Fill32, and SDK calls.

**Gate:** `python -m pytest tests -q` no-new-failures, a small fixture regression
test, and the DuelStateSingleton canary with `f_cf8` near the top.

Implemented in `tools/field_exposure_census.py`. The DuelStateSingleton canary
ranked `f_cf8` third of 20 fields by total distinct sites (86 total: 76 reads,
12 writes), confirming it is near the top. The detector reports its explicit
lexical blind spots in the command output.

### q-workqueue-claim-side-effect — make queue discovery read-only by default [DONE]

`tools/work_queue.py next <lane>` now prints the first TODO without changing
the tracked queue file. Queue runners that want the old claim transition must
pass the explicit `--claim` flag; all four lane protocols use that opt-in.

### q-semantic-contradiction-check — flag documented enum ranges that matched code contradicts [DONE]

Companion tool to `cm-f-cf8-contradiction` (Claude Scaffolder lane). **Wait for that item's findings before building** — it reports whether this is one error or a class, which determines whether the tool is worth its budget. If the count comes back at one, say so and close this without building.

The failure it targets, confirmed: `docs/research/constants/DuelStateEnums.md` documents `data_ov002_022d016c.f_cf8` as a 0–3 duel-phase enum, while three dossiers derived from real disassembly compare it against literal 4 (`cmpeq r1, #0x4`) or bound it with an unsigned `> 3`. SHA-1 cannot catch this — the bytes are right and the *meaning* is wrong.

Scope one class only: an enum whose documented range excludes a value that matched `.c` or a dossier compares it against. Report flagged rows; do not auto-correct.

**Gate:** `python -m pytest tests -q` no-new-failures + a regression test using the f_cf8 case as its fixture + the count of rows flagged across `docs/research/constants/`.

### q-queue-state-drift-check — catch queue/state claims that the repo contradicts [DONE]

**Approved from the 2026-08-03 audit.** Two real drift instances, both found by hand this round:

1. `q-cross-region-alias-guard` sat `[TODO]` in `docs/queue/codex-scaffolder.md` after its work had shipped (`cd3d19fd1`, merged `a3af3ce5e`) — a lane would have redone finished work.
2. `docs/state.md` asserted **"Open PRs: 0"** while PR #1020 was open intentionally as a parked draft. "Zero active PRs" and "zero open PRs" are different claims and the docs conflate them.

Build the smallest checker that catches both: a queue item marked `[TODO]`/`[CLAIMED]` whose described artifact already exists on `main`, and a state-doc open-PR claim that disagrees with `gh pr list`. Distinguish **active** from **open** — a parked draft is legitimately open and must not be reported as drift.

⚠️ **Do not migrate the queue format.** The audit explicitly rejected a JSON/SQLite ledger: `work_queue.py` already parses these files as structured data, so the format is not the problem — the absence of a drift check is. A format migration would be architectural neatness for a problem a small checker solves.

**Gate:** `python -m pytest tests -q` no-new-failures + a regression test per drift class (use the two real instances above as fixtures) + the checker's output on the current tree.

### q-activation-basename-fallback — close the fallback path that let a wiped delinks edit pass the gate [DONE]

Found live by the Claude Decomper lane during `cm-c66-resweep` (PR #1443), reported in its own PR body rather than buried.

What happened: reverting an abandoned candidate with a blanket `git checkout <module>/delinks.txt` silently wiped an earlier, unrelated, already-good edit to the same shared file. **The gate then passed anyway** — `check_activation_invariant.py` resolved the activation through a **basename-fallback path** against the stale entry instead of failing. The lane caught it on the first post-merge run, fixed it with a targeted edit, and re-gated clean, so nothing shipped wrong. The blanket-checkout trap is already documented in the operating protocol (`tools/park_one.py` is the sanctioned alternative); **the fallback masking the wipe is new and is the actual defect.**

This is a vacuous-verifier instance: a checker that reports success by resolving around missing state rather than failing on it. The house rule is that a checker which cannot genuinely check must say so and FAIL, never quietly succeed.

Investigate `check_activation_invariant.py`'s basename-fallback resolution: when is it legitimate (routing suffixes `*.legacy.c` / `*.legacy_sp3.c` and data carves are the known-good cases), and when is it papering over a delinks entry that no longer matches its source? Make the illegitimate case fail loudly. Do not remove the fallback wholesale without checking the routing-suffix cases still resolve — they are the reason it exists.

**Gate:** `python3.13 -m pytest tests -q` no-new-failures + a regression test that reproduces the wiped-edit case and asserts the checker FAILS on it + confirmation that routing-suffix and data-carve activations still resolve.

### q-semantic-check-enum-lookup — the contradiction checker crashes on the live tree [DONE]

⚠️ **PR #1447 was held back from the 2026-08-04 integration for this.** The work is sound and its pinned-fixture tests pass; the defect only appears when #1447 and #1449 are combined, which is precisely what a consolidated integration gate exists to catch. Neither lane could have seen it alone.

`tools/semantic_contradiction_check.py` hard-codes a lookup for a `DuelPhase` enum and **raises** when it is absent:

    ValueError: enum 'DuelPhase' not found
      parse_enum_values(docs[candidate.doc_name], candidate.name)

That enum no longer exists. #1449 (Claude Scaffolder, merged) correctly replaced the closed `typedef enum DuelPhase { … }` in `constants/DuelStateEnums.md` with an observed-value-set prose form — because you cannot write a C enum for a set whose closure is unproven, which was the whole finding. Your fixtures still pass because they are pinned (correct — I asked for that); the **live scan path** is what breaks.

Two things to fix, and the second matters more than the first:

1. Stop depending on a specific enum name. Discover candidates from the document structure, and handle the observed-value-set form as a first-class case — it is now the *correct* shape for any range whose closure is unproven, so it will become more common, not less.
2. **Never raise on an unparseable candidate.** Report it as `UNPARSEABLE` and keep scanning. A checker that dies on the first thing it cannot read tells you nothing about the other candidates, and an exception is indistinguishable from "ran and found nothing" to any caller that isn't reading stderr. The house rule applies in both directions: a checker that cannot genuinely check must SAY SO, whether it finds nothing or cannot look.

**Gate:** `python -m pytest tests/test_semantic_contradiction_check.py -q` green + a regression test using the current observed-value-set form of `DuelStateEnums.md` as its fixture + a live `python3.13 tools/semantic_contradiction_check.py` run against the tree that **exits cleanly** and reports counts including any UNPARSEABLE rows. Paste the live run.

### q-attempts-ledger-backfill — attempts.tsv is blind to ~640 worktree-sweep parks; backfill it and make recording structural [DONE]

`docs/research/campaign-analytics/attempts.tsv` holds only ~61 excludable rows for ov002's 149-512 B band, but sweeps 9-15 parked ~640+ candidates in worktree rounds that never wrote the ledger — so `wall_aware_headroom.py --exclude-attempted` silently resurfaces already-diagnosed walls (this burned a candidate pull at least once, and sweep-17 is hand-cross-checking park tables THIS round to work around it — your backfill removes that tax from every future round). Backfill: harvest the per-candidate park tables from the `docs/research/cm-ov002-unknown-sweep-9` … `-15` docs and the sweep PR bodies (#1404 #1410 #1414 #1419 #1425 #1431 #1435) into attempts.tsv rows: address, band, verdict, park class where recorded, source ref. (Sweep-16's 12 rows are already in the tsv under brief-683 — a format reference, and proof the single-lane path records correctly.) Mechanical extraction with per-source count reconciliation. CANARY: reconcile ONE sweep doc's park count against its backfilled rows exactly before processing the rest. **Coordinate:** `cm-ov002-unknown-sweep-17` appends live rows in parallel — rows are append-only, so rebase before final push and the merge is mechanical. Then make recording structural: verify `park_one.py` writes attempts.tsv correctly from batch worktrees, fix + test if not.

Effort: **MEDIUM**. Tooling budget: catches a demonstrated failure class (stale-park resurfacing).

**Gate:** `python -m pytest -q tests` green + before/after row counts per source + a 10-row spot-check table (random backfilled rows traced to their source doc) in the PR body.

> **Result note 2026-08-07 (re-scoped):** The advertised per-candidate park
> tables do not exist in the sweep-9..15 docs or PR bodies. The recoverable
> source is the individual batch commit messages: 192 shipped rows and 195
> explicit parked rows. The remaining parks are disclosed in the PR body by
> sweep rather than reconstructed from guesswork.

### q-flags-producer-detection — a producer-site FINDER for masked-RMW / bulk-fill / SDK-call shapes [DONE]

The producer/consumer lens cannot audit flags-word/bitmask fields — 3 recurrences now (`GlobalData02104bac.flags` CONSUMER-ONLY with 3 unchased hypotheses: unmatched init fn / hardware latch / bulk Fill32; `BgCfg.f14`/`f18` excluded from sample-2 as untestable), and `field_exposure_census.py`'s own coverage note names the same blind spots. Build a **finder, not a judge**: given a field (base symbol + offset + width), surface candidate producer sites of the broadened shapes — (a) masked read-modify-write (`ldr` → `orr`/`bic`/`and` → `str` on the same base+offset), (b) bulk fills whose range covers the offset (memset / MI_CpuFill / Fill32 / DMA), (c) SDK-call writes (a call taking the field's address or its containing block). Output: ranked candidate sites with shape tags; the lens stays the verdict-maker. CANARY: `GlobalData02104bac.flags` — the tool must either surface at least one concrete producer-site hypothesis for it or honestly report none WITH the searched-shape list; paste that run. Then run it on the 4 known blocked fields and report.

Effort: **MEDIUM**. Tooling budget: catches a demonstrated failure class (3 recurrences of the flags-word blind spot).

**Gate:** `python -m pytest -q tests` green + the canary run pasted + the 4-blocked-fields table in the PR body.

### q-ledger-event-semantics — attempts.tsv is an EVENT log; the writer currently forbids the second event [DONE]

Repairs `#1467` (do NOT merge it as-is; fix on the same branch). Four defects, each verified at source by the brain — the first is the one that makes the whole structural fix a no-op:

1. **Module key mismatch — the structural recorder cannot be read by its only consumer.** `park_one.py::_ledger_identity` returns `parts[1]` of the source path verbatim, so `src/overlay002/func_ov002_021b0c54.c` records module `overlay002`. The sole consumer, `wall_aware_headroom.py::_source_module`, returns `ov002` for the same function (verified by running it), and `_attempted_keys` builds `set[(module, addr)]`. Every future park written for an overlay function therefore produces a key that can NEVER match the selector — and the entire ov002 campaign is overlay work. It passes today only because the one test uses `src/main/...`, where `parts[1] == 'main'` happens to be right. Derive the module with the CONSUMER's own function rather than a second implementation (import `_source_module`, or factor it into a shared helper) — do not hand-roll a third spelling. Also check `src/main/itcm/...`, which yields `main` from the writer and `itcm` from the consumer.
2. **Address-only dedup destroys repeat-attempt history.** `_record_attempt` suppresses a row when `any(row.get("addr") == addr for row in reader)` — address alone, no brief/source/verdict — then returns silently with exit 0, so the caller sees success while the event is dropped. The ledger is an event log by documented design: main already holds 9 addresses with two rows, 6 of them cross-round re-attempts that reached a DIFFERENT verdict (`0x021f058c` parked 39.5% then 97.4%; `0x021eba34` 42.5% then 76.3%), and `0x021bbc68` is a documented park-then-SHIP. Your own backfill contains 17 duplicate-address groups including two explicit park-then-ship pairs (`0x0224de94`, `0x0227b0b8`) — the PR ships a writer that forbids the very rows it backfills. Dedupe on the exact event (addr + module + brief/source + result) or not at all; the only consumer already folds duplicates into a set at read time, so writer-side dedup buys nothing.
3. **Park + ledger is not failure-safe.** The append is the LAST step, after `_flip_delinks` and `(ROOT / c_rel).unlink()`. A `ValueError` on header drift or an OSError on open/mkdir propagates uncaught, leaving the candidate fully parked and absent from the ledger. Validate the header and writability BEFORE any mutation, or roll back on failure. The docstring currently claims the opposite guarantee — fix that too.
4. **~19 never-attempted candidates are recorded as `parked`.** The source commits say so in plain text: `PR#1425:5dff46c7` reads "Not attempted (time budget): ... func_ov002_021b0c54 (420B, overlay002)" and the backfill records `0x021b0c54 ov002 ... parked`. Same for `PR#1414:bb6e87a4` ("Not drafted"), `PR#1419:6330b724`/`9187c1f7`, `PR#1425:18164de4`/`5f6094e0`, `PR#1431:1f596c3e`, `PR#1410:40c19714`, `PR#1414:2e2d2f3f`. `--exclude-attempted` would permanently hide 19 candidates nobody ever touched — the exact failure class this item exists to eliminate, running in reverse. Give never-attempted rows their own `result` value (e.g. `not-attempted`) that the selector does NOT exclude, or drop them.

Also fix while in there: **match_pct is mis-assigned by a line-wrap pairing bug** — the extractor attributes the first percentage on a physical line to every function on that line; 7 of the 35 rows with an explicit source percentage are wrong (`0x02264f00` 80.4→89.4, `0x0223cfec` 90.7→69.8, `0x021b33dc` 93.1→90.5, `0x0224e518` 18.3→10.5, `0x022bd080` 24→18.3, and `0x021b7218` 90.5→unknown, `0x021b9000` 45.2→unknown). A shifted percentage is worse than `unknown` — it attributes another function's evidence. And **the UNRECOVERABLE disclosure is wrong**: 503 distinct `func_<addr>` names appear across the 41 commit messages but only 385 were captured, because the extractor handles comma-separated inline lists but not bulleted per-candidate lists — `PR#1414:4fbb3f08` has an explicit `Parked (11)` bullet list (0 parked rows captured), `PR#1435:6355740e` names 13 parks WITH percentages (14 addresses missing), `PR#1435:55bd0f94` lists 8+ (10 missing). Harvest the bulleted form too, then restate the unrecoverable table honestly.

⚠️ **Your 10-row spot-check table was transcribed from the TSV, not verified against the sources** — 2 of the 10 rows contradict their own cited commits (`0x02264f00` and `0x021b0c54`, above). This is the tracked copied-not-verified pattern; re-do the spot check against the commit text this time and say so.

The PR is NOT genuinely conflicting: `.gitattributes` on main carries `docs/research/campaign-analytics/attempts.tsv merge=union`, and `git merge-tree` merges it cleanly (574 rows = main's 187 + your 387, exact multiset match, main's 152→156 correction retained). GitHub reports CONFLICTING only because its merge check does not apply the union driver. Merge `origin/main` into your branch locally and push — no hand-resolution.

**Gate:** `python -m pytest -q tests` green (paste the real tail) + `ruff check` clean + regressions for ALL of: (a) two attempts at the same address both preserved; (b) an exact duplicate event handled as you choose, documented; (c) a ledger failure (bad header AND unwritable path) leaving the tree unchanged or rolled back; (d) an overlay path round-tripping writer→consumer so `--exclude-attempted` actually excludes what `park_one.py` wrote — assert against `_source_module`'s output, not a hardcoded string; (e) a `not-attempted` row NOT excluded by the selector. Paste before/after row counts per source and a spot-check table verified against commit text.

### q-producer-anchoring — the RMW finder must prove the base register derives from the requested symbol [DONE]

Repairs `#1468` (do NOT merge as-is; fix on the same branch). CI is green — this is a correctness block, not a mechanical one.

`_scan_asm`'s masked-rmw path accepts on same-register + same-offset ALONE: `store.group("base") == access.group("base") and int(store.group("offset"), 0) == wanted`. `spec.symbols` is never consulted and `_contains_symbol` is never called on this path — even though the SAME function already calls it on the bulk-fill and sdk-call paths, so the omission is an oversight, not a design choice.

**The canary's own showcased result is a false positive, and the brain verified it at source.** Of the 16 candidates your PR body reports for `GlobalData02104bac 0x54`, all 12 masked-rmw hits are unanchored and the 4 anchored ones rank BELOW them (score 120 vs 90/75) — the ranking is inverted relative to provenance. Your rank-1 site `src/jpn/overlay014/func_ov014_021b369c.s:57` loads its base at line 55 as `ldr r2, _LIT0`, and line 125 of that same file reads `_LIT0: .word data_ov014_02234ff4`. The RMW is on a different symbol in a different overlay; `02104bac` appears ZERO times in the file. The literal pool that refutes it sits 68 lines away, in-file, unread.

Required: resolve the base register back to its `ldr rX, _LITn` producer and look up the `_LITn: .word <symbol>` line in the same file, comparing against `spec.symbols`. Then add an explicit `anchor` field to `Candidate` — **BASE-ANCHORED** vs **OFFSET-ONLY** — render it as a column, and make every OFFSET-ONLY hit score strictly below every BASE-ANCHORED one. Surfacing unanchored hypotheses is fine and useful; ranking them first while calling them "a concrete hypothesis result" is not.

Three more false-positive classes to close:
1. **Generic alias.** `_symbols()` hardcodes `if base.lower() in {"bgcfg", "bg_cfg"}: values.update({"cfg", ...})`, so any local named `cfg` qualifies. Three files declare `cfg` as a DIFFERENT struct type and do the identical RMW — `src/jpn/overlay022/func_ov022_021aa460.c:20` (`BgCfg021aa460 cfg;`), `src/overlay022/func_ov022_021aa540.c:20` (`BgCfg021aa540 cfg;`), `src/usa/overlay022/func_ov022_021aa460.c:20` — and a `BgCfg.f18` run ranks one of them at 135, the same score as a genuine site. Drop the bare alias or require the declared type to match.
2. **Offset-literal collision.** `_field_access`'s fallback `#?{offset}\b` matches any bare literal numerically equal to the offset, anywhere on a line containing the symbol: for `BgCfg 0x14`, `cfg.unrelated = cfg.unrelated | 20;` matches because `20 == 0x14`. Restrict it to a member-access / pointer-arithmetic context. (Same bug class as the `field_exposure_census.py` decimal-offset gap now queued on the Codex Decomper lane — cross-check your fix against that one.)
3. **No region filter.** `find_candidates` globs `src/**/*.c` + `src/**/*.s` with no region scoping, so EUR/USA/JPN mirrors triplicate every hit — 8 of the canary's 12 false positives are JPN/USA clones of 4 EUR sites, and your PR body's top-3 are all JPN while the commentary calls them "the EUR source corpus". Add a `--region` option defaulting to EUR-first, and re-state the 16/91/160 counts (the brain reproduced all three exactly, so they are accurate as raw counts but inflated ~3x as distinct evidence).

Also remove the per-input hardcodes in `make_spec` (`if base.lower().endswith("02104bac") and offset == 0x54: field_names.add("flags")`) and `_symbols` (the `duelstatesingleton` → `data_ov002_022d016c` special case) — with those in place the canary demonstrates a special case rather than generalisable behaviour.

⚠️ **`test_assembly_requires_same_register_and_offset_for_masked_rmw` currently codifies the bug as correct** — its fixture is a bare 3-line RMW with no symbol reference at all, structurally identical to the 12 real false positives, and it asserts the hit MUST be accepted. Rewriting it is part of the fix.

**Gate:** `python -m pytest -q tests` green (paste the real tail) + `ruff check` clean + NEGATIVE fixtures proving each class is rejected or downgraded: (a) an unrelated symbol doing the identical 0x54 RMW → OFFSET-ONLY, ranked below any anchored hit; (b) a `BgCfg021aa460 cfg` local of a different type → rejected or downgraded; (c) a bare decimal literal equal to the offset → not a producer. Re-paste the `GlobalData02104bac 0x54 2` canary with the anchor column, and re-paste the 4-blocked-fields table with the corrected counts.

### q-ledger-exclusion-regression — the repair's own consumer filter un-excludes genuine attempts [DONE]

Second pass on `#1467`, same branch. The code fixes from the first pass are sound and stay: the module key is now derived from `_source_module`, dedup is event-level, failure-safety is ordered before the mutation, and all six required regressions exist and pass. Three defects remain, one of them introduced BY the fix.

1. **BLOCKING — the new consumer filter is an ALLOWLIST.** `tools/wall_aware_headroom.py:280` reads `if (row.get("result") or "").strip().lower() not in {"parked", "shipped"}: continue`. That un-excludes every result value which is neither `parked` nor `shipped`, including `unknown`. Diffing the exclusion set (main's `_attempted_keys` over main's TSV vs the branch's over the branch's TSV) shows **16 `(module, addr)` keys that main excluded and the branch does not** — and 12 are genuine attempts with measured percentages, not never-attempted rows: `0x020b3168` (41.7), `0x02060fdc` (60), `0x0202bc38` (52.6), `0x0206eecc` (37.5), `0x020685c8` (29.2), `0x02073fc8` (22.9), `0x020403d4` (26.8), `0x0209a000` (19), `0x020915e4` (69.2), `0x020458d8` (48), `0x020967bc` (74.3), `0x022476e8` (park_class C-34). Three of those are already-diagnosed permanent walls that `--exclude-attempted` will now re-dispatch. Invert it to a **denylist** — exclude everything EXCEPT the explicitly not-attempted marker, e.g. `if result == "not-attempted": continue` — so an unrecognised or blank result stays excluded (fail-safe), never re-dispatched.

2. **BLOCKING — three genuinely-parked functions were relabelled `not-attempted`.** `PR#1414:2e2d2f3f` reads: "Parked (register-permutation or scheduler-level residuals only …); `func_ov010_021b7218` (90.5%); `func_ov017_021b33dc` (93.1%); `func_ov019_021b4a4c` (large, repetitive struct-builder, scheduling mismatch). `func_ov008_021b16f8` not attempted (time)." Only `021b16f8` is not-attempted — the trailing sentence was applied backwards over the tail of the preceding parked list. All four are `not-attempted` in the branch TSV. Your own PR-body spot-check table contradicts the shipped data here: it says `0x021b7218 | … | parked`. Re-derive these four from the commit text and audit every other row whose source commit mixes a parked list with a trailing not-attempted clause — this is a parser bug, so assume it is not the only instance.

3. **The match_pct pairing bug is not fully fixed.** `0x021b7218`'s 90.5% has been shifted onto `0x021b4a4c` (which the commit gives no percentage), and `0x021b7218` is left `unknown`. Same line-wrap pairing failure as the first pass, so re-verify the whole set rather than these rows alone.

CANARY: before changing anything, write a test that asserts the 12 genuine-attempt addresses above are STILL excluded by `--exclude-attempted`. It must FAIL on the current branch. Paste that failure, then the fix, then the pass. Then diff the exclusion set against `origin/main` and assert the only keys that changed are ones you can name and justify.

**Gate:** `python -m pytest -q tests` green (paste the real pytest tail) + `ruff check` clean + the exclusion-set diff vs `origin/main` pasted in the PR body with a justification per changed key + the four `PR#1414:2e2d2f3f` rows shown against the commit text.

### q-anchor-score-consistency — the score column contradicts the rank [DONE]

Second pass on `#1468`, same branch, one-line change. The anchoring repair is verified working — the base register now resolves to its `_LITn` producer, the previously-showcased false positives are gone, the different-typed `cfg` locals no longer rank as BgCfg producers, and the canary reproduces exactly (8 / 27 / 46 / 0).

The remaining gap: the `score` integer was never adjusted, so the sort is anchored-first but the rendered table reads `1 | 90 | BASE-ANCHORED | sdk-call` above `5 | 120 | OFFSET-ONLY | masked-rmw`. A reader comparing scores draws exactly the wrong conclusion — the same "shape score outranks provenance" artifact the review objected to, relocated from rank to score. Make every OFFSET-ONLY score strictly less than the minimum BASE-ANCHORED score (a fixed penalty or a clamp), so score and rank agree.

**Gate:** `python -m pytest -q tests` green (paste the real pytest tail) + `ruff check` clean + a test asserting `max(OFFSET-ONLY scores) < min(BASE-ANCHORED scores)` + the re-pasted canary table showing score and rank in agreement.

### q-ledger-residuals — three exclusion-set residuals the second pass left behind [DONE]

`#1467` and `#1468` are merged; the ledger's event semantics, the denylist, and the producer anchoring are all verified working. Three residuals surfaced during that verification, none of which blocked the merge but all of which cost future rounds if left:

1. **`0x0203d39c` is misclassified and is now dispatchable.** It carries `result=not-attempted` AND `match_pct=0` — the only `not-attempted` row in the whole ledger with a percentage. `PR#1414:bb6e87a4`'s own text says `func_0203d39c` was *"0% on first attempt, control-flow simplification diverged from the actual branch structure — not iterated further"*, i.e. a drafted, compiled, measured attempt. It belongs under the same correction applied to `021b7218`/`021b33dc`/`021b4a4c`. Because the new denylist un-excludes only `not-attempted`, this 392 B function will be re-dispatched. Fix the row, and add the one-line audit that found it: **`result == not-attempted` AND `match_pct` not in {unknown, blank} is a contradiction** — assert it over the whole ledger in a test so the class cannot recur.

2. **`park_class` transposition in the same `PR#1414:2e2d2f3f` group.** The second pass fixed `result` and `match_pct` there but left what looks like a straight swap: `0x021aae04` carries `reg-alloc` and `0x021b7218` carries `structural`, while the commit says the opposite (`func_ov008_021aae04` is *"early structural mismatch"*; `021b7218` at 90.5% sits in the register-permutation/scheduler-residual group). Same off-by-one shift as the match_pct bug, one column over. Re-derive that group's `park_class` from the commit text and check whether the shift touched other commits.

3. **The canary is fixture-only.** `test_measured_attempt_results_remain_excluded` builds a synthetic TSV in a `TemporaryDirectory` and patches `headroom.ROOT`; it never reads the real `docs/research/campaign-analytics/attempts.tsv`. It pins the CODE but not the DATA — if a future edit flips any of those 12 rows to `not-attempted`, the test still passes and the keys silently become dispatchable. Add a companion test asserting the 12 against the REAL committed ledger. (Your PR body pasted exactly this check as an ad-hoc run; commit it.)

Then one design question the verification raised, worth answering in the same PR: the 4 keys `main` excluded that the branch does not (`main/0x02010354`, `0x02021b38`, `0x02023478`, `0x0209085c`) are all genuinely `not-attempted` — but their `park_class` values are `complexity`, `permanent-header`, `C-23-C-36` and `C-31` (interwork-veneer), i.e. **diagnosed walls**. Under the denylist they are now dispatchable. A diagnosed wall should arguably stay excluded regardless of `result`. Decide it deliberately — either teach the filter about `park_class`, or record why a diagnosed-but-never-attempted candidate SHOULD be re-offered — and say which you chose and why. An explicit "these should be re-offered because X" is a fine answer; silently leaving it is not.

**Gate:** `python -m pytest -q tests` green (paste the real pytest tail) + `ruff check` clean + the contradiction assertion over the full ledger + the live-ledger canary + a before/after exclusion-set count with the `park_class` decision stated.

### q-ledger-hygiene-sweep — generalise the contradiction audit, fix the shape/park_class misuse [DONE]

`#1479` closed the ledger repair arc cleanly. This is the last sweep over `attempts.tsv`, then the lane moves on.

1. **Generalise the contradiction audit.** The check you added (`result == not-attempted` AND a measured `match_pct`) found exactly one row. Sweep the whole ledger for the other contradictions of the same family and report every hit: a `shipped` row with `match_pct` below 100; a `parked` row with `match_pct` exactly 100; a `park_class` naming a `C-NN` lever while `result` is `shipped`; a `module` value `wall_aware_headroom._source_module` would never produce for a real path; a `text_size` disagreeing with `delinks.txt` ground truth. Per family: how many rows, real errors or legitimate, and fix the real ones. Add each as a test so the class cannot silently return.

2. **The `shape` column is being misused.** `cm-main-tier-sweep-1` wrote wall descriptors (`P-20-bf94-result-register`, `predication-resistance-new`) into `shape` instead of `park_class`; sweep-2 fixed its own rows but wave-1's were never corrected. Move every non-shape value to `park_class` where that cell is empty, and list individually any row where both are populated and disagree — those need judgement, not an automatic move.

3. **Then decide, explicitly:** is the `attempts.tsv` schema worth enforcing mechanically? Several checks now live only as tests. A `--validate` mode on `park_one.py`, or a small checker wired into CI, would catch a bad row at write time rather than a round later. Tooling budget applies — argue it either way, but argue it.

CANARY: run the full contradiction sweep BEFORE fixing anything and paste the raw per-family counts. That baseline is the deliverable; some families may legitimately be zero.

**Gate:** `python -m pytest -q tests` green (paste the real pytest tail) + `ruff check` clean + per-family contradiction counts before/after + the shape/park_class migration count with conflicts listed individually + the stated decision on mechanical validation.

### q-ledger-validate-adopt — wire the validator into the loop that writes the ledger [DONE]

`q-ledger-hygiene-sweep` (#1485) built `tools/validate_attempts.py`, argued the case for mechanical enforcement, and fixed four real `text_size` errors. The checker exists but nothing runs it automatically, so the next bad row still lands and is found a round later — the exact latency the item set out to remove.

Close that: run it where rows are actually written and where they are actually reviewed. `park_one.py` writes rows; the CI doc/tool job reviews them. Wire it into both — a write-time check that refuses (or loudly warns on) a row failing validation, and a CI invocation so a hand-edited or backfilled row cannot merge dirty. Keep the exit semantics honest: a hard contradiction should fail, a legitimate-but-unusual row (the 31 `shipped` rows retaining a `C-NN` `park_class`, which you correctly classified as legitimate) must not.

Then run it once across the full merged ledger post-#1485 and report the residual: how many rows fail, in which families, and whether each is a real error or a rule that needs loosening.

Effort: **MEDIUM**. Tooling budget: consolidates a manual check into the loop that produces the data.

**Gate:** `python -m pytest -q tests` green (paste the real pytest tail) + `ruff check` clean + a test proving a bad row is refused at write time + a test proving the 31 legitimate rows still pass + the full-ledger residual table.

### q-validator-brittleness — the 31-row guard will red-fail the next legitimate ship [DONE]

`q-ledger-validate-adopt` (#1491) is adopted correctly: the write-time check runs strictly BEFORE the `.s` restore, `_flip_delinks` and `unlink()` (verified by execution, not just by reading), and the CI step lands inside `drift-check`, which is genuinely one of the three required contexts in the `main-protection` ruleset. That is real adoption, not a tool sitting unused.

One high-value fix, plus two smaller ones:

1. **The false-positive guard is itself brittle.** `tests/test_validate_attempts.py` asserts `len(report.shipped_with_c_lever) == 31` against a **live, append-only, growing** ledger. The moment any future round ships a function carrying a `C-NN` `park_class`, that test goes red on a **legitimate** row — which is exactly the "validator gets disabled within two rounds" pressure the item existed to prevent. Replace the equality with a property assertion: every `shipped_with_c_lever` row is `result=shipped` with `match_pct=100` and a well-formed `C-NN` class, and `error_count == 0`. Assert the *shape* of the exemption, not its cardinality. If you want a count for visibility, print it rather than assert it.

2. **Say in the PR body which check is required.** #1491 wired the validator into `drift-check` without stating that `drift-check` is a required context. That is the single most important fact about the adoption — a reader cannot tell from the PR whether a dirty row can merge. State it.

3. **Re-run the residual against current `origin/main`.** The ledger has grown since #1491's snapshot (sweep-5 added its parks). Re-run `validate_attempts.py` over the current file, report the row count and any new failures, and confirm the count matches `origin/main`'s `attempts.tsv` rather than an earlier copy.

Effort: **LOW-MEDIUM**. Tooling budget: prevents a required check from going red on correct data, which is how checks get switched off.

**Gate:** `python -m pytest -q tests` green (paste the real pytest tail) + `ruff check` clean + a test proving a NEW legitimate `C-NN` shipped row does not fail the guard (construct one; it must pass) + the re-run residual with the row count matching `origin/main`.


### q-ledger-ship-coverage — the ledger records parks and drops ships, so every rate from it is wrong [TODO]

`q-validator-brittleness` (#1499) is merged. You did the right thing with the
central fix: the `== 31` cardinality assertion is gone, replaced by a property
check that every `shipped_with_c_lever` row is `result=shipped`, `match_pct=100`
and a well-formed `C-NN`. That is the assertion that survives a growing ledger,
and it removes the pressure that would have got the validator disabled within two
rounds.

**One gap the brain found while verifying it, and it is yours to close here:**
the new test iterates `report.shipped_with_c_lever` and asserts a property per
row — so **if that list is ever empty the test passes vacuously**. A regression
that broke exemption detection outright would make the CI check silently
meaningless, which is the same failure mode in a new costume. Fix: assert the
list is non-empty before the per-row loop, and print the count for visibility
rather than asserting it (the item asked for exactly that, and it got dropped).

**THE MAIN ITEM — a structural bias the brain found in the ledger this round.**
`attempts.tsv` records parks and, round to round, silently drops ships:

| Round | shipped rows | parked rows | reality |
|---|---:|---:|---|
| `cm-main-tier-sweep-1` | 71 | 29 | complete |
| `cm-main-tier-sweep-2` | 59 | 41 | complete |
| `cm-main-tier-sweep-3` | **0** | 43 | shipped 57 |
| `cm-main-tier-sweep-4` | **0** | 25 | shipped 75 |
| `cm-main-tier-sweep-5` | **0** | 35 | shipped 65 |
| `cm-main-tier-sweep-6` | 10 | 35 | partial |
| `cm-main-tier-sweep-7` | **0** | 108 | shipped 43 |
| `cm-ov002-unknown-sweep-17` | **0** | 64 | shipped 42 |

`park_one.py` is the only recorder and it records parks by design, so whether a
round's ships reach the ledger depends on whether that round's lane happened to
add them by hand. **Consequence: any ship rate computed from `attempts.tsv` is
biased toward failure.** This is not hypothetical — `cm-main-tier-sweep-7`'s
kickoff told that lane to choose its Part 2 size band from "~600 recorded
attempts", and Part 2 came in at 16% against a 30-50% prior.

**THREE DELIVERABLES.**

1. **Quantify it.** Per round, shipped rows recorded vs functions actually
   shipped. Derive the truth mechanically, not from PR bodies: a round's shipped
   addresses are exactly the `.s:` to `.c:` flips in that round's `delinks.txt`
   diff, with sizes from the following `.text start:/end:` span. That is how the
   brain verified sweep-7's 43 functions / 8,116 B independently, and it
   reproduces exactly.
2. **Backfill the missing shipped rows** by that same mechanical derivation.
   ⚠️ **Do not invent fields you cannot derive.** `addr`, `module`, `text_size`,
   `result=shipped` and `brief` are all derivable. `match_pct` is 100 for a
   shipped function. `tier` is derivable from the file extension
   (`.c` / `.legacy.c` / `.legacy_sp3.c`). `shape` and `park_class` are NOT
   derivable for a backfilled ship — leave them empty rather than guessing, and
   mark provenance so a future analysis can tell a backfilled row from a
   contemporaneous one.
3. **Guard it.** A validator check that fails when a round's `brief` prefix
   appears among `delinks.txt` ship flips but contributes zero `result=shipped`
   rows. That is the check that would have caught all five rounds above.

⚠️ The Codex Decomper is normalising `park_class` this round and has been told
explicitly **not to touch `attempts.tsv`**, so this file is yours alone — but it
also means you must not add a `park_family` column or renormalise any existing
`park_class` value. Rows only.

CANARY before the bulk backfill: derive and paste `cm-main-tier-sweep-7`'s
shipped set and show it is **43 addresses totalling 8,116 B**, split
ov004 = 8 / 1,076 B, ov006 = 31 / 6,308 B, ov011 = 4 / 732 B. Those figures are
independently confirmed; if your derivation disagrees, your derivation is wrong,
and that is the finding to report before going any further.

**Gate:** `python -m pytest -q tests` green — paste the real pytest tail — plus
`ruff check` clean, `python tools/validate_attempts.py` exit 0 on the backfilled
ledger, the non-empty-list fix with a regression proving an empty exemption list
now FAILS, the per-round coverage table, and the canary reconciliation. Run
`npx markdownlint-cli2 --fix` on any doc before committing.

ONE PR; verify every PR-body claim against `git diff --stat`; `python
tools/work_queue.py done codex-scaffolder q-ledger-ship-coverage`; commit; report
the PR number with the pasted artifacts.

### q-ci-timeout-cache — no workflow sets a timeout; compile-check re-downloads the toolchain every run [TODO]

External audit lead (2026-08-14), brain-verified live on `main` twice — at
`b1015c872` and again at `fcb39a4c2`. Two independent CI-hygiene gaps:

1. **All 12 workflows in `.github/workflows/` lack `timeout-minutes`** (verified:
   `grep -L timeout-minutes .github/workflows/*.yml` returns 12 of 12). A hung
   job therefore burns GitHub's 360-minute default before it is killed.
2. **`compile-check.yml` has no toolchain cache.** It is a 3-region matrix on
   `windows-latest` firing on every `src/**` PR, and it fetches the ~87 MB
   mwcc/mwld toolchain via `tools/download_tool.py` on every run — so the
   download happens three times per triggering PR (verified: no `actions/cache`
   step anywhere in the file).

The work:

- Add `timeout-minutes` to every job in all 12 workflows. Size each one honestly
  from its own run history (`gh run list --workflow <name> --limit 20`, take
  roughly 3× observed p95, minimum 10) rather than picking one blanket number —
  the analysis-diff workflows are minutes; `compile-check` needs real headroom.
- Add `actions/cache` for the toolchain in `compile-check.yml`, keyed on the
  tool version/URL strings in `download_tool.py` so a future re-pin busts the
  cache automatically. Confirm `download_tool.py` short-circuits when a valid
  cached tree is present; if it has no such check, add one that is checksum- or
  marker-based, **never** mtime-based.

Effort: **LOW**. Build-free: CI config plus at most one Python touch.

**Gate:** `python -m pytest -q tests` green (paste the real pytest tail) +
`ruff check` clean + all 12 workflows carrying a stated, justified timeout
(list them with values in the PR body) + one real CI run on this PR showing a
`compile-check` cache hit on its second run — paste the cache step's log lines
from the Actions run, not a local claim.

ONE PR; verify every PR-body claim against `git diff --stat`; `python
tools/work_queue.py done codex-scaffolder q-ci-timeout-cache`; commit; report
the PR number with the pasted artifacts.
