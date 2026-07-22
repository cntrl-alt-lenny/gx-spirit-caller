[//]: # (markdownlint-disable MD013 MD041)

# Codex Decomper — autonomous naming queue

**Protocol:** loop until QUEUE-EMPTY — do NOT stop after one item. `python tools/work_queue.py next codex-decomper` (⚠️ Windows: plain `python`). Every rename via `rename_symbol.py --cascade`, each naming batch gated `scope_gate.py --kind naming` (b610/b612 safety); paste real `dsd check` + `scope_gate` output. Open ONE PR **per item**, `work_queue.py done codex-decomper <id>`, commit, then immediately take the next item. Effort HIGH.

**This lane is now naming + ANALYSIS.** Naming alone is candidate-scarce (honest low counts / QUEUE-EMPTY are a SUCCESS — never invent names), so the queue below mixes renaming with research/census work that feeds the CC C-match lanes.

**Worktree capability:** `kb-map` = build-FREE · `kb-types` = EUR baserom only · `scaffolder`/`decomper` = all 3 baseroms. Match your gate to what you can actually run (briefing bug b642).

---

### q-sig-refresh-2 — rebuild the sig DB after the CC agents named more functions [DONE]
The CC C-match rounds add real names as they convert functions. Rebuild b630's sig DB from ALL currently-named functions (it grows as C-match progresses), re-apply across EUR/USA/JPN, report the delta vs b630's 29. Round-trip canary first.
**Gate:** `dsd check` green 3 regions + `scope_gate.py --kind naming --base origin/main` PASS + names-applied delta.

### q-name-crossprop-2 — cross-region twin propagation [DONE]
Any EUR-named function whose USA/JPN twin is still `func_*` → propagate via `rename_symbol.py --cascade` (byte-neutral, 3× multiplier). Sweep all modules.
**Gate:** `dsd check` green 3 regions + `scope_gate.py --kind naming` PASS + twins propagated.

### q-family-verify — verify brief 658's anchor-backed families [DONE]
Brief 658 found **91 new C-anchored relocation families** (`docs/research/campaign-analytics/family-census-2026-07.md`). Anchor-backed families are the highest-value C-match targets we have (a matched sibling means near-zero-shot propagation — VRAM 16/16, table-walker 7/7). But the census is mechanical, so some "anchors" may be false. Verify a sample (~20 families): does the claimed anchor really exist as matched `.c`, and do the members really share its shape? Also resolve the rows 658 flagged **ambiguous** (`sig=0` — empty relocation signature can describe unrelated leaf functions). Output: a VERIFIED / SUSPECT / AMBIGUOUS column added to the census, so the CC agents only sweep real families.
**Gate:** doc-only, no build; paste your verification method + counts.

### q-nomarker-census — classify the 294 no-marker files [DONE]
Brief 643's census found **294 `.s` files with no wall marker at all** — neither a taxonomy code nor the blanket cohort stamp. They're pure never-assessed candidates and nobody knows what they are. Census them: module, size distribution, shape (leaf/stub/dispatcher/large), and whether any have matched siblings. These are potentially the cleanest untouched pool in the project.
**Gate:** doc-only, no build; the census table + your read on which look most tractable.

### q-walls-doc-audit — audit codegen-walls.md against its own criteria [DONE]
Brief 640 found **0 of 5 sampled wall citations actually matched the criteria of the taxonomy entry they cited**, and brief 651 then split the buckets properly (permanent `P-NN` / coercible `C-NN` / unknown / no-marker). Now audit the taxonomy document itself: for each `C-NN`/`P-NN` entry in `docs/research/codegen-walls.md`, does its stated criteria match how it's actually being cited in `.s` headers? Flag entries that are (a) mis-filed as permanent when a documented lever exists, (b) too vaguely worded to cite correctly, or (c) cited far more than their criteria would justify (C-34 is cited 116 times — is that plausible, or is it a catch-all?).
**Gate:** doc-only; the audit table + specific rewording proposals. Do NOT rewrite the taxonomy in this item — propose.

### q-sig-refresh-3 — rebuild the signature DB from newly-named functions [DONE]
The CC C-match lanes add real names as they convert (briefs 650/654/655 are running now). Rebuild the signature DB from ALL currently-named functions, re-apply across EUR/USA/JPN, and report the delta vs the last refresh. Round-trip canary first (confirm a known-good signature still resolves before trusting a bulk apply).
**Gate:** `dsd check` green 3 regions + `scope_gate.py --kind naming --base origin/main` PASS + names-applied delta.

### q-name-crossprop-3 — cross-region twin propagation sweep [DONE]
Any EUR-named function whose USA/JPN twin is still `func_*` → propagate via `rename_symbol.py --cascade`. Byte-neutral, 3× multiplier on every name the CC lanes create. Sweep all modules. Brief 569's sig region-twin map (49/60 exact twins, 0/44 false positives) is the validated fallback when the name alone is ambiguous.
**Gate:** `dsd check` green 3 regions + `scope_gate.py --kind naming` PASS + twins propagated count.

### q-progress-history — build the C%-over-time series [DONE]
We have no historical view of the readable-C rate — only spot readings. Reconstruct it from git history: walk merge commits on `main` over the last ~6 weeks, and at each point compute readable-C bytes per region (the committed-delinks tier is build-free, so this is a pure history walk — see `tools/progress.py`'s C-decompiled path). Output a table + the derived rate (pp/week), plus per-module where cheap. This tells us honestly whether the campaign is accelerating or flat, which nothing currently answers.
**Gate:** doc-only, no build; the series + your stated method (say plainly if some points are un-computable).

### q-peer-techniques — mine peer decomps for MATCHING techniques [TODO]

Brief 659 studied peer projects as a *source of SDK code*; this is different — mine them for **techniques we lack**. Look at pret/pokeheartgold, pret/pokediamond, pmd-sky, sm64ds decomps, zeldaret/ph: how do they crack reg-alloc mismatches, what compiler-flag or pragma levers do they use per-TU, what tooling do they have that we don't, how do they organise a large C-matching push? ⚠️ Skip anything already in our ledger as dead: the m2c drafter (~10.66%, dead end), `-ipa` (would break our matches), `#pragma thumb` (already used), the illpragmas opt_* toggles (measured inert). Report only genuinely NEW techniques, each with a URL and an assessment of whether it applies to mwccarm 2.0/sp1p5.
**Gate:** doc-only; the technique list with URLs + applicability verdicts.
