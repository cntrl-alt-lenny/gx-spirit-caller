[//]: # (markdownlint-disable MD013 MD041)

# Project-improvement swarm — 2026-07-09

**Method:** 5 scout agents (agentic framework · peer decomps · Python libraries ·
codegen/matching methodology · CI/automation), each finding independently
**adversarially verified** (refute-by-default: does the lib/tool/repo actually
exist + maintained, genuinely fit our ARM/mwccarm/dsd/`ninja sha1` stack, and
not duplicate what we have or a prior swarm), then synthesized. 26 agents, 20
findings scouted, **8 refuted, 12 survived.**

## Headline

Every surviving finding is a **workflow / integrity / hygiene multiplier — none
moves coverage or match-rate**, exactly consistent with the two prior swarms
(leverage lives in multipliers on lanes that already work, not new codegen
capability). The adversarial pass killed the flashy peer-decomp ports
(sm64ds near-miss DB, dqix `mangle.py`, m2c batch loop) as nil-value-today.

## Top recommendations (ranked)

1. **`tools/gate3.py` — one-command clean-tree 3-region gate driver.** `low`
   effort / `high` impact / **confirmed**. The 3-region `ninja sha1` merge gate
   is the most-repeated, highest-stakes brain action and is entirely manual
   (`configure.py` is single-region). Hand-running it once faked a JPN PASS for
   ~2 weeks off a stale incremental `.o` (only a clean-tree gate caught it). A
   driver that always runs the clean sequence removes the typing and the
   footgun, and its stdout *is* the paste-able integrity evidence. ✅ **BUILT +
   committed this round** (see § Delivered).
2. **Automate the pre-merge delink-duplicate scan as a no-baserom PR check.**
   `low` / `medium` / **confirmed**. A sweep PR that re-carves a function already
   on main doubles its delink block → `dsd lcf` fails "overlaps with previous
   file" *at merge* while the branch's own sha1 is green, so no agent self-catches
   it (real incidents: PR #948, #198). Add a **delta-aware** delink-overlap
   invariant inside `tools/check_match_invariants.py` (it already rides
   `match-invariants.yml`'s no-baserom PR-comment plumbing): apply the PR's added
   AND removed address lines onto `origin/main`'s delinks and fail only if a
   `func_ovNNN` address range appears twice — key on the address range (the real
   dsd trigger), not the filename.
3. **Split `docs/state.md` (2031 lines) into a live head + `docs/STATE-LOG.md`.**
   `low` / `low` / confirmed. Its own header promises "catch up in under a minute"
   but only ~21 lines are live above 21 stacked round-logs. Move ONLY the dated
   `**Previously`/`**Prior` blocks out (newest-first) — the tail also holds LIVE
   standing-reference sections (handoff notes, worktree conventions, verify
   commands) that must stay.
4. **Fix stale obsolete-gate text in `.claude/agents/brain.md` + `AGENTS.md`.**
   `low` / `low` / plausible→**confirmed on inspection**. Both still describe the
   obsolete `ninja rom` + eur-only `dsd check` + "24/27 baseline (main/DTCM/ov004
   still fail — expected)" gate with **zero `ninja sha1`** — CLAUDE.md marks all
   27 green. A brain reading it would excuse real regressions. Manually fix both;
   do NOT build the proposed generator (AGENTS.md is itself the stale source).
   ✅ **AGENTS.md fixed this round;** brain.md queued.

## Quick wins

- **Record the ELF-library reject verdict** (keep hand-rolled ELF: LIEF rebuilds
  the container → breaks byte-identity; pyelftools is read-only) as a one-liner —
  closes the named-ELF-candidate question at ~zero effort.
- **Prune worktrees harder** (`prune_worktrees.py --apply --cap 3`) to reclaim
  ~12 GB of merged-PR checkouts; then add `--apply` to the end-of-round checklist.
- **Wire `m2c --context`** (`m2ctx.py` + per-overlay `*_core.h`) into `m2c_feed.py`
  so drafts emit named struct fields instead of raw `*(int*)(base+0xNN)` — a cheap
  quality win for the human C-match lane, independent of any batch loop.

## Deprioritized (survived verify, not worth it now)

- Kickoff template — batch_carve commit-on-pass already structurally fixed the
  ship-step miss; clauses already in AGENTS.md.
- Full m2c auto-verified `.s`→C batch loop — pipeline already built + adjudicated
  (briefs 379/381/383); byte-match is the wall, not comprehension. Do the
  `--context` subset (a quick win) only.
- sm64ds near-miss DB port — orthogonal to the ov002 coverage drain (0 near-misses
  by construction); ~0 permuter recovery on this class. Revisit if C-match-heavy
  waves return.
- `_elf.py` read-side refactor — cosmetic, zero gate/coverage impact.
- dqix `mangle.py` — nil today: the ROM is pure C (0 C++ target TUs, 0 mangled
  symbols). Park until a real `.cpp` target appears.
- CI 3-region `ninja sha1` in PR #1020's container — high effort, gated on the
  parked/unproven report-only image; unproven that mwldarm + post-link patchers
  link byte-identical under wibo. A post-merge safety net, not the pre-merge gate.

## Overlaps with prior swarms (deduped)

pyelftools reject, m2c/permuter/objdiff "already adopted", Capstone/Unicorn "cold
until a concrete consumer", sm64ds ingestion, kickoff process-polish clauses, and
the CI-container's decomp.dev/metroskrew prerequisites were all already recorded
in `tool-scout-swarm-2026-06-19.md` / `speedup-research-swarm-2026-07-03.md`. The
**local gate3 driver is NOT an overlap** — both prior swarms consciously left
local gate tooling out ("Gates don't move").

## Bonus finding (surfaced while building gate3)

Running the pytest suite via gate3 exposed **3 standing `cross_file_name_drift`
errors on main** (`func_02086800_dummy` extern in `src/{,jpn/,usa/}main/`,
unresolved in any `symbols.txt` — rebase drift per #171). Harmless to the
byte-identical ROM; worth a small cleanup brief.
