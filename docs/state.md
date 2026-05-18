# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-18 (Mac brain — brief 138 + 139 merge).
**🎉🎉 SHA1 PATH IS 1 BRIEF AWAY.** Brief 138 (cloud) shipped the
`.DS_Store` filter — **3-region ROM diff = 5 bytes verified** on
combined main (EUR + USA + JPN identical shape). Brief 139
(decomper) shipped cluster A wave 4 + Pattern 3 wave 2 — **305
effective candidates** (298 .bss + 7 Pattern 3 chunks); cluster A
drain ~91% (1443 / 1586). 3-region 27/27 baseline preserved. The
remaining 5 bytes per region = **4 CRC16 header bytes + 1 patcher
off-by-1024 byte**. **Brief 140 (cloud, this round)** wraps both
fixes into one PR → `ninja sha1` PASSES.

EUR **1.79%**, USA + JPN **0.70%** (data-tier doesn't update %
badges directly; multi-module-OK is the visible milestone).

## Today's merges (just-landed)

- **PR #555 — cloud / brief 138 (`.DS_Store` filter).** **🔑
  99.995% SHA1-gap closure shipped.** `tools/clean_macos_junk.py`
  recursively removes `.DS_Store` / `._*` / `Thumbs.db` /
  `desktop.ini` from a directory tree (optional `--include-dirs`
  for `.AppleDouble/` / `.fseventsd/` / `.Trashes/`
  / `.Spotlight-*/`). Wired as a standalone `cleanup_macos_junk`
  ninja rule with phony driver + stamp output + `restat=True` so
  it runs every invocation but keeps rom_build's cache warm.
  19 unit tests (filename / dirname classification, multi-depth
  fixture clean, idempotence, missing-root paths, stamp
  lifecycle, CLI multi-dir). **Verified locally:** EUR / USA /
  JPN ROM diffs all drop to exactly 5 bytes; 3-region 27/27
  preserved. Drop-in 99.995% gap closure.
- **PR #554 — decomper / brief 139 (cluster A wave 4 +
  Pattern 3 wave 2).** **305 effective candidates** (target was
  ≥ 105; self-extend exercised). **Part 1**: 298 .bss symbols
  across 17 small overlays (ov001/3/5/7/8/10/11/12/13/15/16/17/
  18/19/20/22/23) — **drains the remaining cluster A pool in
  one wave**. Cluster A cumulative: 1443 / 1586 ≈ **91%
  drained**. Residue is ov004 (deferred to brief 141) +
  pre-processed-overlay refinement. **Part 2**: 7 Pattern 3
  chunks via `tools/cluster_c_pattern3_gen.py` (1048 bytes / 25
  syms). Generator gap exercised (`.word <name>` manual
  `.extern` declarations needed). 3-region 27/27 preserved.

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

**Open PRs: 0** once this brain-PR for brief 138 + 139
close and brief 140 + 141 queue lands.

**🎉🎉 SHA1 PATH IS 1 BRIEF AWAY.** All three regions:
**5-byte ROM diff verified on combined main.** Brief 140
wraps the patcher off-by-1024 fix + CRC16 implementation
into one cloud PR; on merge → `ninja sha1` PASSES.

**Cloud — brief 140 (HIGH, NEW): 🎉 SHA1 FINAL GATE**

- **`tools/patch_ov004_veneers.py` idempotent-path fix +
  `tools/patch_rom_header_crc.py`.** Two parts, single
  PR. **Part 1**: brief 134's patcher has an
  `expected_output_size = len(data) - 1024` bug on the
  YAML-only second invocation; detect already-patched
  state and skip the delta subtraction. Closes the 1
  byte at ROM file `0x8b30a` (ov4 ram_size). **Part
  2**: implement standard NDS CRC16 (poly `x^16+x^15+x^2+1`,
  init `0xFFFF`) over header `0xC0..0x15C` (logo) and
  `0x00..0x15D` (header). Write to ROM
  offsets `0x6C` and `0x15E`. Wire as a post-rom_build
  ninja rule (`rom_header_crc`) modeled on brief 138's
  `cleanup_macos_junk` integration. Closes the
  remaining 4 bytes.
  - End-to-end gate: `ninja sha1` PASSES for EUR + USA
    + JPN. Project's stated final gate.
  - Tests: idempotence regression (patcher) + CRC16
    golden values (logo CRC16 = `0x6FF7` is constant
    since the logo image is fixed).
  - Branch: `cloud/sha1-final-gate`.

**Decomper — brief 141 (HIGH, NEW):**

- **ov004 cluster sweep — multi-cluster, single overlay.**
  Parallel-track decomper work while cloud closes the
  SHA1 final gate. ov004 was deferred from cluster work
  since brief 122 (W7 wall). Brief 134's binary patcher
  unlocked it; checksum has been OK across all 3 regions
  through every brief since. Sweep ov004 across cluster C
  (Pattern 1 `.rodata` chunks) + cluster D-1 (dispatch
  tables) + cluster D-2 (scalar arrays) + optional
  Pattern 3 chunks.
  - Target: ≥ 25 ov004 symbols total.
  - Critical verify: ov004 stays OK across all 3 regions
    (W7 patcher unaffected by cluster claims).
  - Branch: `decomper/ov004-cluster-sweep`.

**Data-tier backlog (post-139):**

1. **Cluster B wave 1 — true scalars** (decomper).
   81 true-scalar sub-pool per brief 123 v3.
2. **Cross-region cluster A apply** — port the 1443
   EUR cluster A symbols to USA + JPN (post brief 139
   wave 4 drain).
3. **3rd mega-array (`data_020b6ec4` 30 KB)** —
   biggest deferred Pattern 1 candidate.
4. **Cluster D-3** via Pattern 3 generator (~20
   complex nested structs).
5. **Single-pointer cluster D cleanup** — ~50 trivial
   pointer-code/pointer-data per brief 124.
6. **Pattern 3 generator `.extern` emission fix** —
   per brief 135 + 139 known-gap note (manual
   `.extern` declarations needed for `.word <name>`).
7. **`data_symbol_sizes.py` `kind:bss` extension** —
   per brief 139 funnel (currently only covers
   `kind:data`).
8. **Cluster A residue in pre-processed overlays** —
   refinements / sizes that wave 4 missed.
9. **Cluster C Pattern 3 main `.rodata` cleanup** —
   ~1-2 chunks remain per brief 139 drain trajectory.

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
**3-region 27/27 baseline** (every module OK across
EUR + USA + JPN). Function-tier matching: ~140 EUR +
~840 region-equivalents + 100 cross-project.
**Data-tier: 1443 cluster A `.bss` syms (~91%
drained) + 5 cluster E DTCM syms + 48 cluster D-1
dispatch tables + 131 cluster C Pattern 1 syms + 2
mega-arrays + 26 cluster D-2 arrays + 16 Pattern 3
chunks + 3 Cat 1 main TU fixes + ov004 binary-patch
tooling + `.DS_Store` filter.** ~1100+ cumulative
session match-equivalents (function-tier) + ~1680
data-tier symbols claimed. **🎉🎉 3-REGION 27/27
module baseline + 5-byte ROM diff verified.** Path
to first byte-identical ROM rebuild in project
history is concretely **1 brief away** (brief 140 =
patcher off-by-1024 fix + ROM-header CRC16 → `ninja
sha1` PASSES).

## Next-brain TODO

1. **Verify + merge cloud brief 140 (SHA1 final
   gate)** when it opens. **🎉 PROJECT'S STATED
   FINAL GATE.** Verify gate: `ninja sha1` PASSES
   for EUR, USA, JPN. Watch for: (a) patcher
   idempotence regression — running patcher twice
   on the same input must not double-subtract 1024
   from ov4 `code_size`; (b) CRC16 golden values —
   logo CRC16 is fixed at `0x6FF7` (header
   `0xC0..0x15C` is the immutable Nintendo logo
   image); (c) post-rom_build wiring must not break
   `restat`-based caching.
2. **Verify + merge decomper brief 141 (ov004
   cluster sweep)** when it opens. 3-region 27/27
   baseline preserved; **critical**: ov004 stays OK
   across all 3 regions (cluster claims must not
   disturb brief 134's W7 patcher). Watch for
   delinks.txt conflicts (cloud brief 140 doesn't
   touch delinks; should compose cleanly).
3. **After 140 lands and `ninja sha1` PASSES:**
   - Update state.md with the milestone framing —
     **first byte-identical ROM rebuild in project
     history**.
   - Tag the commit; consider a release.
   - File optional ds-decomp upstream issue for
     CRC16 + OS-junk filtering (W8 candidate).
4. **Brief 142+ candidates (queue after 140 + 141):**
   - **Brief 142 — Cluster B wave 1** (decomper, 81
     true scalars per brief 123 v3). New cluster
     opens; pool depth unknown but estimated 1-3
     waves.
   - **Brief 143 — Cross-region cluster A apply** —
     port 1443 EUR cluster A symbols to USA + JPN.
     Region-config plumbing per brief 116.
   - **Brief 144 — Pattern 3 generator `.extern`
     emission fix** (cloud, small tooling fix per
     brief 135 + 139 known gap).
   - **Brief 145 — `data_symbol_sizes.py`
     `kind:bss` extension** (cloud, small tooling
     per brief 139 funnel).
   - **30 KB main mega-array** (`data_020b6ec4`)
     final Pattern 1 mega.
5. **Pre-existing carryovers (unchanged across the session):**
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
