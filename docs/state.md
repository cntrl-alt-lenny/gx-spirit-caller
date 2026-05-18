# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-18 (Mac brain — brief 142 + 143 merge).
**🎉 SHA1 PASS holds across 3 regions** after first post-milestone
round. Brief 142 (cloud) generalised the W7 patcher to accept
any veneer count `n ∈ [0, 86]` — replaces hard `==86` assertion
with `expected_output_delta_for(n) = n × 12 - 8`. 11 new tests
(n=0/1/9/43/86 edge cases). Brief 143 (decomper) ran the first
post-SHA1 decomp wave: **60 cluster B true scalars** (2× the ≥30
target) across main + 7 overlays. Surfaced an empirical W6
cascade filter — `value != 0` is critical because mwcc 2.0/sp1p5
emits `int x = 0` to `.bss` not `.data`, shifting downstream
section addresses by 4 bytes per skipped scalar. **All 3 regions
SHA1 PASS preserved through both PRs.** Workflow note: cloud
ran in isolated `gx-spirit-caller-cloud` worktree this round,
matching decomper's pattern — no parallel-session interference.

EUR **1.79%**, USA + JPN **0.70%** (data-tier doesn't update %
badges directly; multi-module-OK is the visible milestone).

## Today's merges (just-landed)

- **PR #562 — cloud / brief 142 (patcher tolerance fix).**
  Generalised `tools/patch_ov004_veneers.py` to accept any
  veneer count `n ∈ [0, HISTORICAL_MAX_VENEER_COUNT=86]`.
  Replaced hard `EXPECTED_VENEER_COUNT=86` assertion with
  `expected_output_delta_for(n) = n × 12 - 8` (or 0 for n=0).
  `_scan_veneer_pool` returns `(-1, [])` for n=0;
  `_splice_veneer_pool` takes explicit `veneer_count`;
  `patch_ov004` derives delta from observed count. 11 new
  tests (5 end-to-end across n=0/9/43/86 + 6 helper) on top
  of 21 existing → 32 / module. **Test suite: 1758/1758.**
  Cloud ran in isolated `gx-spirit-caller-cloud` worktree to
  avoid the parallel-session interference flagged in brief
  140. **3-region `ninja sha1` PASS preserved** bit-for-bit
  (n=86 historical case still produces delta=1024).
- **PR #561 — decomper / brief 143 (cluster B wave 1).**
  **First post-SHA1 decomp wave.** Opened cluster B — the
  last unopened data-tier cluster. **60 true scalars**
  (target ≥ 30; self-extend exercised 2×). Per-module: 36
  main + 6 ov002 + 6 ov004 + 6 ov005 + 3 ov006 + 1 each on
  ov008/9/13. Recipe: singleton `int data_<addr> =
  0x<value>;` `.c` file per scalar. **Empirical W6 cascade
  filter discovered via bisection**: `value != 0` is
  critical — mwcc 2.0/sp1p5 emits `int x = 0` to `.bss`
  (not `.data`), shifting downstream section addresses by
  4 bytes per skipped scalar → cascade across all modules.
  Filter applied (size=4, addr%4=0, value!=0) → all 60
  land cleanly. **3-region SHA1 PASS preserved.** Cluster B
  true-scalar strict-aligned-nonzero sub-pool drained
  60/60. Brief 144+ candidates: 5 size-2 + 2 size-1 + 6
  zero-value + 1 non-4-aligned residue (need different
  recipes).

## Cumulative pipeline state

| Pipeline | Output (cumulative) |
|----------|---------------------|
| Single-region EUR hard-tier (briefs 057+060+081+086+092+097+098+101+102+104+105+106+108+109+111+112) | 139 matches / 8028 bytes |
| **Data-tier EUR cluster E (brief 115)** | 5 symbols / 1568 bytes | DTCM 24/27 → 25/27 |
| **Data-tier cluster A wave 1 (brief 116, EUR main)** | **647 .bss symbols claimed** | (zero-fill, no byte content change) |
| **Data-tier cluster A wave 2 (brief 118, EUR ov004+ov006)** | **307 .bss symbols claimed** | ov006 OK preserved; ov004 stays FAILED (`.text` residue) |
| **Data-tier cluster A wave 3 (brief 120, EUR ov009+ov021+ov014)** | **175 .bss symbols claimed** | all 3 overlays preserved OK baseline |
| **Cross-region DTCM parity (brief 116)** | 11 SDK names + libs/dtcm/ path move | **3 regions at 25/27** ✅ |
| **Cluster A coverage (cumulative briefs 116 + 118 + 120 + 139)** | **1443 / 1586 = ~91%** | residue in ov004 (brief 141) + pre-processed-overlay refinement |
| **Cluster C wave 1 Pattern 1 (brief 122)** | **37 symbols / 4672 bytes** | 9 modules, no W6 cascade |
| **Cluster D wave 1 D-1 (brief 124)** | **20 tables / 1652 bytes** | 11 modules; ~28% of D-1 pool drained |
| **Cluster C+D wave 2 (brief 126)** | **29 C Pattern 1 + 7 D-2 = 36 syms / 41 KB** | W6 cascade bisected; D-2 strict-alignment confirmed |
| **Cluster C wave 3 + Cat 1 main fix (brief 128)** | **39 C + 3 Cat 1 fixes = 42 syms / 4229 bytes** | Cat 1 byte-identical; main 21→16 bytes |
| **Cluster C wave 4 + D-1 wave 2 (brief 130)** | **26 C + 1 mega-array + 15 D-1 = 42 syms** | First mega-array shipped (4632 bytes) |
| **D-1 wave 3 + 2nd mega-array (brief 133)** | **13 D-1 + 5 KB mega = 14 syms** | D-1 multi-pointer pool exhausted (48/71) |
| **D-2 wave 2 + Pattern 3 wave 1 (brief 135)** | **19 D-2 + 7 Pattern 3 chunks = 26 effective** | D-2 ~60-75% drained; Pattern 3 generator validated at scale |
| **Cluster D recipe (brief 121)** | D-1 dispatch tables ~71 / D-2 scalar arrays ~30-40 | D-3 ~20 deferred or via Pattern 3 generator |
| **data_worklist v3 (brief 123)** | 4-byte sub-shapes + refined cluster filters | brief 117 sub-class reproduced at 94% |
| **Pattern 3 generator (brief 125)** | `tools/cluster_c_pattern3_gen.py` + 2 worked examples | Closes brief 119's FAILED Pattern 2 case |
| **ARM9 main scoping (brief 127)** | **21 bytes / 6 symbols** | Cat 1 fixed in 128; OV004 cascade fully fixed in 134 |
| **OV004 scoping (brief 129)** | **86 spurious veneers** / ~165K bytes cascade | W7 wall identified |
| **OV004 ALIGNALL Phase 1 (brief 131)** | **95% ov004 + 52% main diff reduction** | ov004: 165K→8125 bytes; main: 21→10 bytes |
| **OV004 Phase 2 (brief 132)** | **NO FLIP; 3 approaches falsified** | mwldarm veneer model documented |
| **OV004 Phase 3 binary patch (brief 134)** | **🎉 EUR 27/27 + USA 26/27 + JPN 26/27** | W7 FULLY MITIGATED |
| **USA/JPN main 2-byte fix (brief 136)** | **🎉🎉 3-REGION 27/27** | Duplicate-symbol-name root cause; canonical SDK naming |
| **SHA1-gap scoping (brief 137)** | **99.995% is `.DS_Store`** (100,805 → 5 bytes) | 3-brief unlock plan (138 / 139 / 140) → SHA1 PASS |
| **`.DS_Store` filter shipped (brief 138)** | **🔑 3-region ROM diff = 5 bytes verified** | `tools/clean_macos_junk.py` + 19 tests; standalone ninja rule with phony + stamp + restat |
| **Cluster A wave 4 + Pattern 3 wave 2 (brief 139)** | **305 effective** (298 .bss + 7 Pattern 3) | Cluster A drain 1145 → 1443 (~91%); 3-region 27/27 preserved |
| **🎉🎉🎉 SHA1 FINAL GATE (brief 140)** | **`ninja sha1` PASSES for EUR + USA + JPN** | First byte-identical ROM rebuild in project history. `patch_rom_header_crc.py` + patcher idempotent-path fix + 15 tests |
| **ov004 cluster sweep (brief 141)** | **31 ov004 syms** (25 C + 2 D-1 + 4 D-2) | First production ov004 cluster work; D-1 + D-2 pools exhausted; new W7 invariant (`.rodata` claims suppress veneers) |
| **W7 patcher tolerance (brief 142)** | Hard `n==86` → `n ∈ [0, 86]` | `expected_output_delta_for(n)=n×12-8`; 11 new tests; SHA1 PASS preserved bit-for-bit |
| **Cluster B wave 1 (brief 143)** | **60 true scalars** across 8 modules | First post-SHA1 wave; empirical W6 filter (value!=0 critical); 3-region SHA1 PASS preserved |
| Cross-region apply (briefs 075+078+090+094+110) | 419 ports + 35 region-only landings = ~837 region-matches |
| Cross-project bulk-port (briefs 069+071+074+082) | 100 ports / 5840 bytes (region-neutral, applies × 3 future regions) |
| Codegen-walls catalogued | **30 coercible** + **10 permanent** + 2 candidate + T-4 (analysis-tier) (C-25 / C-26 / C-27 / C-28 / C-29 / C-30 added this session; P-7 → C-27, P-8 → C-25, P-10 → C-29 promotions; **3 P-N → C-N permuter/sweep promotions total**) |
| Tooling unblocked | Permuter wrapper (096) + walls-research pipeline + natural-form-first rule + brief 094→095→110 cross-region tooling chain complete |
| Total session match-equivalents | ~1091 (138 EUR + 419 cross-region ports + 100 cross-project + research credits) |

Cross-region applies and cross-project ports are region-neutral
work — each port slot unlocks ×3 region matches when bootstrapped
configs land. Multi-region badge wiring (PR #411) ready to track
real numbers once the first multi-region wave lands.

## Windows brain status — fully supported

Brain on Windows runs `ninja rom` to completion on a fresh clone
(post-briefs 058+059 portability fixes). `dsd check modules`
reports 24/27 OK as expected. CI `windows-latest` job in
`.github/workflows/tests.yml` runs unit tests for the cmd /c
wrap + path-separator helpers on every PR. No regression risk
for these.

Mac brain is also operational (Mac stretch ran briefs 060→085
clean) via the Game Porting Toolkit cask path.

## In flight (post this brain-PR)

**Open PRs: 0** once this brain-PR for brief 142 + 143
close and brief 144 + 145 queue lands.

**🎉 SHA1 PASS holds.** First post-milestone round shipped
without regression. Two more briefs queued; both
contingent on preserving 3-region `ninja sha1`.

**Cloud — brief 144 (MEDIUM, NEW): Pattern 3 generator extern fix**

- **`tools/cluster_c_pattern3_gen.py` — emit `.extern`
  declarations.** Long-standing generator gap flagged in
  briefs 135 / 139 / 141 funnel notes: the chunk generator
  emits `.word <name>` references but omits the `.extern
  <name>` declarations they require, so every Pattern 3
  wave (briefs 135 + 139 = 14 chunks) has had to manually
  add 1-5 extern lines per chunk post-generation. Brief
  144 makes the generator emit externs from the start.
  Small focused tooling fix; high leverage on future
  waves (brief 145 + beyond).
  - Critical: 3-region SHA1 PASS preserved.
  - 1+ regression test pinning extern emission.
  - Branch: `cloud/pattern3-extern-emission-fix`.

**Decomper — brief 145 (HIGH, NEW): ov004 .rodata cluster wave**

- **First ov004 `.rodata` cluster wave — now-unlocked by
  brief 142.** Brief 141 ran ov004 `.data` cluster work
  (31 syms) but skipped `.rodata` due to the veneer-count
  assertion brief 142 just fixed. Now the patcher
  tolerates any `n ∈ [0, 86]`, the `.rodata` pool opens
  up. Three parts: Pattern 1 chunks (15-30), Pattern 3
  chunks via brief 125 generator (3-8), Cluster D
  candidates if any. Target ≥ 20 total ov004 `.rodata`
  symbols.
  - Critical: ov004 stays OK across 3 regions AND
    3-region SHA1 PASS preserved.
  - First production use of brief 142's generalised
    patcher — demonstrates W7 mitigation generality.
  - Branch: `decomper/ov004-rodata-cluster-wave`.

**Workflow note resolved:** cloud ran in isolated
`gx-spirit-caller-cloud` worktree this round, no parallel-
session interference. The 3-worktree setup (brain main +
decomper sibling + cloud sibling) is the new normal.

**Data-tier backlog (post-141):**

1. **Cluster B pointer sub-pool** (decomper, brief 144+).
   32 cluster B pointers; need typedef research.
2. **Cluster B unclassified** (brief 145+). 14 syms;
   needs worklist refinement.
3. **ov004 `.rodata` cluster wave 2** (decomper, blocked
   on brief 142). Pattern 3 chunks + cluster C `.rodata`
   in ov004.
4. **ov004 `.data` cluster C wave 2** (decomper).
   ~67/92 strict-aligned candidates remain in ov004.
5. **Cross-region cluster A apply** — port the 1443
   EUR cluster A symbols to USA + JPN.
6. **3rd mega-array (`data_020b6ec4` 30 KB)** —
   biggest deferred Pattern 1 candidate.
7. **Cluster D-3** via Pattern 3 generator (~20
   complex nested structs).
8. **Single-pointer cluster D cleanup** — ~50 trivial
   pointer-code/pointer-data per brief 124.
9. **Pattern 3 generator `.extern` emission fix** —
   per brief 135 + 139 known-gap note.
10. **`data_symbol_sizes.py` `kind:bss` extension** —
    per brief 139 funnel.
11. **Cluster A residue in pre-processed overlays.**
12. **Cluster C Pattern 3 main `.rodata` cleanup** —
    ~1-2 chunks remain.

**Function-tier backlog (de-prioritized during data-tier
session arc — revisit if data-tier proves slow):**

1. **T-4 application wave** — 23 unnamed BL targets.
2. **C-28 application wave** — ~10-20 candidates.
3. **C-26 wave 3** — ~116 candidates remain.
4. **C-27 wave 2** — retry post brief 112 hand-back.
5. **3 brief 109 + 2 brief 111 partial classifications.**
6. **Pre-stage source baselines for 5 brief-098 untested
   candidates** + permuter retry at 1200s.
7. **P-9 mask-form asm-void recipe.**
8. **W-stack-split codegen sweep** (3rd datapoint).
9. **W-popcount-mask-order** (1 datapoint).
10. **64 unrecovered brief-094 ports.**
11. **ARM9 main checksum recovery** — depends on cross-
    module relocations in `.text`/`.data`. Separate
    brief once data-tier momentum slows.

**Strategic state — major session-arc transition:**

**Function-tier phase (briefs 057-112):** complete + drained.
Walls-research pipeline mature: 8 NEGATIVE-finding
datapoints, 3 P-N → C-N permuter/sweep promotions,
30 coercible + 10 permanent + 2 candidate + T-4 catalog.
Cross-region tooling chain (094 → 095 → 110) complete.
Two consecutive application-wave hand-backs (briefs 108
+ 112) signal the function-tier residue is now recipe-
narrow.

**Data-tier phase (brief 113 onward):** **ACTIVE +
SCALING.** First 5 briefs shipped:
- Brief 113: 5-cluster taxonomy.
- Brief 114: data_worklist.py v2 + 1587-bss bug fix.
- Brief 115: cluster E DTCM pilot (EUR 25/27).
- Brief 116: cluster A wave 1 (647 syms in main) +
  cross-region DTCM parity (**all 3 regions 25/27**).
- Brief 117: cluster B research (W4 + multi-global
  wall + 47% sub-classification finding).

**Wave-size calibration:** brief 113's 50-100/wave for
cluster A was 13× too conservative. Brief 116 took 647
in one wave; per-wave throughput is **linear with
section gap-list size**, not capped by recipe
complexity. Cluster A may close in 2-4 waves (not
15-25).

**Updated cluster sizes** (post-brief-117 sub-class):
- Cluster A `.bss`: 1586 total (939 remaining post
  brief 116).
- Cluster B `.data` true scalars: **86** (was 247).
- Cluster B → cluster C strings: **+115** new
  candidates (47% mis-classification).
- Cluster B pointers: 32 (need typedef).
- Cluster B unclassified: 14.
- Cluster C native: 347. **Cluster C effective: ~462.**
- Cluster D struct arrays: 98.
- Cluster E DTCM: 3 (closed by brief 115+116).

**Brief 097 residue (31 candidates) is now FULLY
CLASSIFIED across 5 wall families:**

| Pattern | Wall classified | Application status |
|---|---|---|
| Indirect call (~12) | C-24 (brief 099) | 33 ports shipped via 101+102+104 |
| Critical-section (~8) | C-26 (brief 100) | 9 ports shipped via 104+106 |
| Predicated cascade (~6) | P-9 mask + scope refinement (briefs 103+105) | 5 P-9 early-return shipped via 106 |
| Pool-word (~3) | C-27 supersedes P-7 (brief 107) | 3 ports shipped via 108 (recipe narrower than projected) |
| Cross-module BL (~3) | T-4 analysis-completeness (brief 107) | ~25-33 unlocks awaiting brief 112+ |

**Brief 106 residue (5 candidates) ALSO classified
(brief 109):** 1 RECOVERY (C-28), 1 PERMANENT (P-10),
3 PARTIAL (needs follow-up).

A "0-yield" hand-back (brief 097) generated ~150+ future
matches across systematic walls research. End-to-end
demonstration of the methodology pipeline.

**Codegen-walls catalog at 30 coercible + 10 permanent +
2 candidate + T-4** (analysis tier). **Three P-class →
C-class promotions this session** (P-7 → C-27 via brief
107, P-8 → C-25 via briefs 098 + 100, P-10 → C-29 via
brief 111 permuter with longer budget).

**Cumulative session arc framing:**
EUR 1.79% / USA + JPN 0.70% (function-tier badge);
**🎉🎉🎉 3-REGION `ninja sha1` PASS** (first byte-
identical ROM rebuild in project history) — sustained
through 2 post-milestone PRs. Function-tier matching:
~140 EUR + ~840 region-equivalents + 100 cross-project.
**Data-tier: 1443 cluster A `.bss` syms (~91% drained)
+ 5 cluster E DTCM syms + 50 cluster D-1 dispatch
tables + 156 cluster C Pattern 1 syms + 60 cluster B
true scalars + 2 mega-arrays + 30 cluster D-2 arrays +
16 Pattern 3 chunks + 3 Cat 1 main TU fixes + ov004
binary-patch tooling (W7 mitigation generalised to
variable veneer counts) + `.DS_Store` filter +
ROM-header CRC patcher.** ~1100+ cumulative session
match-equivalents (function-tier) + ~1771 data-tier
symbols claimed. **The project's stated final gate is
green and holding.** Post-SHA1-PASS maintenance
discipline: every PR must preserve `ninja sha1` across
3 regions. Remaining work is decomp completeness
(cluster B residue + ov004 `.rodata` + cross-region
applies + mega-arrays), no longer gating SHA1.

## Next-brain TODO

1. **Verify + merge cloud brief 144 (Pattern 3 generator
   extern emission fix)** when it opens. Watch for:
   regression test pinning extern emission on a chunk
   with known external `.word` references; idempotent
   re-runs on already-generated chunks; 3-region SHA1
   PASS preserved (should be trivial — tooling-only,
   no source/binary change).
2. **Verify + merge decomper brief 145 (ov004 .rodata
   cluster wave)** when it opens. **Critical**: ov004
   stays OK across 3 regions AND 3-region SHA1 PASS
   preserved. Watch the patcher's "veneers spliced" line
   shift from 86 toward 0 as `.rodata` claims land —
   that's the brief 142 generality working as designed.
3. **Brief 146+ candidates (queue after 144 + 145):**
   - **Brief 146 — Cluster B residue** (decomper):
     remaining 14 syms (5 size-2 + 2 size-1 + 6
     zero-value + 1 non-aligned). Need `__attribute__
     ((section(".data")))` or `.s` recipe per brief 143
     funnel.
   - **Brief 147 — Cluster B pointer sub-pool**
     (decomper, 32 syms; needs typedef research).
   - **Brief 148 — `data_symbol_sizes.py` `kind:bss`
     extension** (cloud, small tooling per brief 139
     funnel).
   - **Brief 149 — Cross-region cluster A apply** —
     port 1443 EUR cluster A symbols to USA + JPN.
     Region-config plumbing per brief 116.
   - **30 KB main mega-array** (`data_020b6ec4`) final
     Pattern 1 mega.
   - **Optional W8 upstream PRs**: file ds-decomp issues
     for OS-junk filtering (brief 137) + ROM-header
     CRC16 computation (brief 140) — would let us drop
     local patchers eventually.
4. **Post-SHA1-PASS maintenance discipline (REMINDER):**
   - **Every PR going forward must preserve `ninja
     sha1`** across 3 regions. This is the new floor.
   - Consider adding `ninja sha1` to the required CI
     gates (currently `pr-invariants` only checks
     module-tier checksums).
5. **Workflow improvement DONE:** cloud now runs in
   isolated `gx-spirit-caller-cloud` worktree (matching
   decomper's `gx-spirit-caller-decomper` pattern). The
   3-worktree setup is the new normal — no parallel-
   session interference observed in brief 142.
6. **Pre-existing carryovers (unchanged across the session):**
   - `func_ov021_021aaf58` placeholder-in-complete-TU warning.
   - ov005 placeholder-name warnings.
   - `match-invariants` not yet a required branch-protection
     check.

## Cross-machine handoff notes

User alternates brain between Windows PC and Mac. The role is
tied to the local machine (toolchain + baserom on disk), not
to a specific Claude session. Each fresh session re-reads
`AGENTS.md` + this state.md + the open PR list to inherit role
context. Standing handoff conventions:

- **Working pattern locked since 2026-05-12:** brain reviews +
  merges autonomously; user gets the cloud / decomper messages
  afterward. Effectively makes AGENTS.md AFK-exception the
  default. Applies to every future brain session unless user
  explicitly revokes.
- **Build verify pattern.** Windows: `python tools/configure.py
  eur && ninja rom && .\dsd.exe check modules -c config/eur/
  arm9/config.yaml`. Mac: substitute `./dsd` and POSIX paths.
- **Memory files are per-machine.** Each side's
  `~/.claude/projects/...` memory does NOT follow the role.
  State.md is the bridge.
- **Worktree conventions:** main checkout for brain; sibling
  worktree (`gx-spirit-caller-decomper`) for decomper when both
  agents run on the same machine. Cloud branches arrive via
  Claude Code's own sandbox worktrees (`.claude/worktrees/`)
  and the brain can detached-checkout the branch by SHA to
  avoid locking conflicts.

## New agents?

No. Continuing with 4-slot setup (brain + decomper + cloud +
auto-progress-badge bot).
