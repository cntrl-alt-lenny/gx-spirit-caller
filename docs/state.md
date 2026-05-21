# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-22 afternoon, post-#617 + #618 merge,
briefs 178 + 179 queued. Brain on Mac. **🎉 SHA1 FINAL GATE
PASSES** across all 3 regions (brief 140, PR #558) and
continues to hold after 19 post-SHA1 rounds. **🎉 Bundle
generator validated at scale**: brief 176 (decomper) shipped
32 cross-region cluster B residue claims via brief 174's
generator — ov006 sub-pool's brief-170 pathology RESOLVED
via the more conservative bundles. **🎉 Unified
chunk-extent generator shipped** (brief 177, cloud):
`cross_region_chunk_extent.py` 3-phase algorithm
generalises brief 174 to multi-symbol Pattern 3 chunks.
Brief 175's headline failure reproduces + ships as worked
example. Brief 178 (decomper, queued) scales to full
cross-region D-3 (~62 region-matches). Brief 179 (cloud,
queued) Variant E — patcher 2-byte pool-shift handling to
close path-2 to n=0.

## The headline — SHA1 PASS achieved (briefs 137 → 140)

Mac brain's last full arc closed the SHA1 gap:

1. **Brief 137** — scoped the gap (99.995% was `.DS_Store` noise across
   the extract; 3-brief unlock plan).
2. **Brief 138** — `.DS_Store` filter shipped (100K → 5 bytes / 3 regions).
3. **Brief 139** — cluster A wave 4 + Pattern 3 wave 2 (305 effective
   candidates).
4. **Brief 140 — 🎉🎉🎉 `ninja sha1` PASSES** for EUR + USA + JPN. First
   byte-identical ROM rebuild across all 3 regions. **This is the
   `CLAUDE.md` final-gate criterion.**

Subsequent briefs (141 → 148) ran the post-SHA1 polish wave: ov004
cluster sweep (brief 141), 3-region 27/27 module baseline canonicalised
(brief 136 → 141), patcher generalisation for variable veneer counts
(brief 142 — `n ∈ [0, 86]`), first post-SHA1 decomp wave (brief 143 —
cluster B opened with 60 + 114 true scalars across two waves), Pattern
3 generator extern emission fix (brief 144), ov004 `.rodata` cluster
wave BLOCKED (brief 145) → patcher ctor-terminator detection (brief
146) → ov004 `.rodata` retry shipped 14 syms across 3 shapes (brief
147), cluster B pointer pool survey + recipe (brief 148).

## SHA1 PASS is now the floor

Every PR going forward must preserve 3-region `ninja sha1` PASS:

```
ninja sha1  # EUR — must say "OK"
python tools/configure.py usa && ninja sha1  # USA — must say "OK"
python tools/configure.py jpn && ninja sha1  # JPN — must say "OK"
```

This supersedes the old "24/27 module check" gate. If a PR drops any
region from PASS → FAIL, it does not merge. Cloud and decomper both
verify 3-region SHA1 PASS pre-PR; brain re-verifies pre-merge.

## Today's merges (just-landed)

- **PR #617 — decomper / brief 176 cluster B residue at
  scale.** ✅ **Brief 174 generator validated at scale.**
  32 cluster B residue claims shipped across USA + JPN
  (16 each); 14 main + 1 ov004 + 1 ov006 per region.
  **🎉 Brief 170 ov006 sub-pool RESOLVED** — brief 170
  reported a 32-byte `.data` ordering shift; brief 172
  didn't resolve; brief 174's more conservative bundle
  extents now ship cleanly (`data_ov006_021ce9e0` lands
  in this wave). Apply funnel: 30 worklist → skip 14
  (size=2/1 + odd-aligned + worked + overlap) → apply
  16. Self-extend both gates met (53% yield, 500+ B per
  region). Residue 16 (size-1/2 + odd-aligned) deferred
  to brief 180+. **3-region SHA1 PASS + 27/27 OK
  preserved.**
- **PR #618 — cloud / brief 177 unified chunk-extent
  generator.** 🎉 New `tools/cross_region_chunk_extent.py`
  generalises brief 174's bundle heuristic to multi-symbol
  Pattern 3 chunks. **3-phase algorithm**: Phase A lowers
  start LEFT to absorb predecessor; Phase B raises end
  RIGHT iteratively for inner extents; Phase C validates
  4-aligned + named-symbol + non-zero. **Brief 175's
  headline failure REPRODUCES + ships**: target
  `[0x021cca88, 0x021ccd08)` → adjusted
  `[0x021cca68, 0x021ccf68)` (1280 B). 2 worked examples
  shipped — USA + JPN ov006 (1280 B each) + USA main
  (816 B). 15 new tests; suite 1889 → 1904. Brain pushed
  F401 ruff fix + manual delinks.txt merge conflict
  resolution (both PRs touched same files; additive
  merge).

- **PR #578 — decomper / brief 151 ov004 .rodata wave 2.** ✅
  **28 source-level claims** (40% over ≥ 20 target). Per-shape:
  25 Pattern 1 .c (`.data` strings, brief 141 orphan recovery —
  the .c files were already in the working tree but were never
  wired into delinks.txt), 2 D-1 dispatch tables, and 1 Pattern 3
  mega chunk at `0x02200f18..0x02206738` covering a 22.5 KB
  block with 2 symbols. Total: 23,432 bytes. 3-region SHA1 PASS +
  27/27 OK preserved. **BONUS NOT MET**: couldn't drop ov004's
  veneer count `n` below 9 — investigation showed remaining
  candidates are ARM-code symbols misclassified as `data` in
  `symbols.txt`. Brief 154 (cloud, queued) takes the
  reclassification research as the next step.
- **PR #579 — cloud / brief 152 cluster B size-1/2 workarounds.**
  ✅ **Workaround #3 PASSES; workaround #2 FALSIFIED with root-
  cause diagnosis.** Empirical finding: `arm9.lcf`'s
  `ALIGNALL(2)` directive (not mwcc) is the alignment-cascade
  culprit — the `.o` reports `Algn 2**0` correctly, but mwldarm
  re-aligns every section to 4 bytes at link time, padding 3
  bytes after a 1-byte section. Workaround #3 (bundle the size-
  1/2 slot + zero-pad neighbours into `unsigned int[N]` covering
  the deduced range to the next named symbol) sidesteps the
  cascade. Worked example shipped: `data_021020b4` (16-int
  bundle, 64 bytes). 3-region SHA1 PASS + 1784/1784 tests.
  Research note at `docs/research/cluster-b-size-1-2-recipe.md`.
  Recipe ready for brief 153 (decomper) to drain.
- **PR #575 — decomper / brief 149 cluster B wave 3.** ✅
  **Cluster B pointer pool fully drained**: 20 of 20 remaining
  candidates shipped via brief 148's locked recipe. 8 data-pointer
  singletons + 4 code-pointer singletons + two 4-element + one
  3-element fn-ptr "table" + one ov004 (bss pointee). **3-region
  SHA1 PASS + 27/27 OK preserved.** Notable empirical correction:
  **REJECTED brief 148's bundling-into-array hand-off** — checked
  `relocs.txt`, found each table slot is referenced by name from
  other code, so bundling would break per-slot symbol identity.
  All 20 shipped as singletons. **Size-1 workaround #1 (.s with
  explicit `.byte`) FALSIFIED** — same 1308 byte / 32-byte
  cascade as brief 148's naive .c attempt; mwasmarm respects the
  same LCF section-alignment cascade as mwcc. Workarounds #2 +
  #3 deferred to brief 152. Self-extend gate: yield 100% PASS,
  bytes-matched FAIL (80 B vs ≥250 B — pointers are 4 B). Brief
  closes after wave 1.
- **PR #576 — cloud / brief 150 low-n WITH_TERMINATOR.** Option
  A shipped (recommended): `_fix_ctor_and_pad`'s byte-detection
  is now the authoritative truth source; n-inference is an
  informational hint via stderr note on disagreement, not a
  fatal error. **Patcher accepts any `n ∈ [0, 86]` cleanly.**
  `expected_output_size_for` gains optional `ctor_pad_net`
  parameter that takes precedence over n-inference; `main()`
  passes the byte-detected truth into the YAML `code_size`
  rewrite. 8 new tests (`TestLowNWithTerminator` +
  `TestExpectedOutputSizeForCtorPadNet`) pin brief 147's n=2 +
  n=7 failing cases under brief 150 + assert stderr note
  semantics. **Test suite 1784/1784.** **3-region `ninja sha1`
  PASS preserved bit-for-bit at the historical n=86 case.**
  Cloud honestly documented test-scope limits: end-to-end smoke
  via an arbitrary source claim couldn't drop `n` below 9
  because suppression depends on the slot being an ov002
  cross-overlay pointer target — reverse-lookup tool is brief
  151+ territory. **Brief 134 → 142 → 146 → 150 patcher chain
  complete** — W7 mitigation now fully general.

## In flight (post this brain-PR)

**Open PRs: 0** once this brain-PR lands.

**Decomper — one HIGH brief queued (apply brief 177 at scale):**

- **Brief 178 (HIGH, NEW)** — `decomper/cross-region-cluster-d3-with-generator`.
  Apply brief 177's `cross_region_chunk_extent.py` to
  USA + JPN cluster D-3 — same scope brief 175 falsified
  mechanically. Brief 177 shipped 3 worked examples;
  scale to full ~62 region-matches. Target ≥ 30 cross-
  region D-3 chunks per region.

**Cloud — one MEDIUM brief queued (patcher Variant E):**

- **Brief 179 (MEDIUM, NEW)** — `cloud/patcher-variant-e-2byte-pool-shift`.
  Extend patcher to handle 2-byte (or 1-3 byte) veneer
  pool shifts at low n. Per brief 173's hand-off. **Path-2
  mechanism works at veneer level (all 3 brief 173
  variants suppressed both remaining veneers); only the
  byte-layout shift fails SHA1.** Variant E closes the
  layout problem. After this lands, brief 180+ ships
  path-2 final wave dropping n=2 → n=0. W7 chain
  extends: 134 → 142 → 146 → 150 → 162 → 164 → 168 →
  179.

## Active clusters (post-SHA1 polish wavefront)

- **Cluster A** — `.rodata` (briefs 132 → 139 main run, then post-SHA1
  follow-up via 141). Largely drained.
- **Cluster B** — main `.data`. **EFFECTIVELY CLOSED**: true scalars
  174/174 (brief 143), pointer pool 23/23 (brief 149), size-1/2
  overlay 18/18 (brief 153), size-1/2 main 1/1 (brief 152), W6-
  rejected (value=0 size=4) main 18/21 (brief 155). 3 deferred
  W6-rejected candidates remain (sit between already-claimed
  wave-2 single-int TUs; wave-2 rewrite needed). Recipe locked
  for both bundle-with-zero-pad and bundle-with-value=0 shapes.
- **Cluster C / D-1 / D-2** — ov004 sub-clusters. 31 `.data` syms
  (brief 141) + 14 `.rodata` syms at n=9 (brief 147) + 28
  `.rodata` syms (brief 151, 22.5 KB block included) = **73 total**.
  Veneer count n=9 lower bound — dropping below 9 requires
  reclassifying ARM-code-as-data symbols (brief 154 falsified
  the naive byte-pattern approach; brief 156 cloud spot-disasm
  recalibrates the heuristic).
- **Cluster D-3** — complex nested struct arrays.
  **EFFECTIVELY CLOSED** post brief 163 wave 3 (9 chunks /
  ~12 KB shipped, including the 4.9 KB `data_020c7b44`
  mega). 4 waves total: brief 157 (9 / 6,664 B main) +
  brief 158 (12 / 5,852 B across 5 modules) + brief 161
  bonus (data_02101928 via brief 161 bundle-alias unblock)
  + brief 163 (9 / ~12 KB — 7 ov006 + 1 ov002 mid + 1 main
  mega). **~31 chunks / ~30 KB shipped to date.** Residue:
  2 hard candidates — `data_020c9694` (14.8 KB mega,
  deferred) + `data_020e0e70` (366 B, non-4-aligned size).
- **Cluster D** — `.bss`/zeros (briefs 130 + 142 framework). Continuing
  via the W7 patcher (now fully general 134 → 142 → 146 → 150).

## Worktree convention — isolation per agent, two equivalent mechanisms

Each agent runs in its own worktree to prevent parallel-session
interference that bit briefs 138 + 140 earlier. **AGENTS.md is the
canonical spec** (worktree-convention section there now covers both
mechanisms — updated in this brain-PR). Two mechanisms are
equivalent:

- **Mac convention (manual sibling worktrees):** `~/Dev/gx-spirit-
  caller`, `~/Dev/gx-spirit-caller-decomper`, `~/Dev/gx-spirit-caller-cloud`
  — three siblings at the same depth, set up once via `git worktree
  add`. Each has its own `orig/` baseroms. Adopted during the
  SHA1-milestone arc; PR #564 documented this in state.md.
- **Windows convention (Claude Code automatic sandboxes):** Claude
  Code creates per-session worktrees inside `.claude/worktrees/<auto-
  name>/` for each agent. No manual setup. They share the main
  checkout's `orig/` baseroms. Side-effect: `gh pr merge --delete-
  branch` may fail to clean up the local branch while the agent
  session is active — harmless, server-side merge still succeeds.

Brief 142's clean cloud-side work + brief 143's clean decomper-side work
were the validation that worktree separation (either mechanism) is
sufficient.

## Brain-pattern locked

- **Self-merge by default.** Brain reviews + merges autonomously per
  cntrl_alt_lenny's stated working pattern. User gets the cloud /
  decomper messages afterward, doesn't gate each merge.
- **PR-URL deliverable.** Every agent message MUST end with "push the
  branch, run `gh pr create`, reply with the PR URL." Brain verifies
  origin before claiming review-ready; PRs missing from origin → ask
  user to nudge the agent rather than silently waiting.
- **Verify gate is now 3-region SHA1 PASS** (was 24/27 module check
  before brief 140). For tools-only PRs that don't touch the build
  path, EUR-only SHA1 PASS is sufficient evidence.

## Next-brain TODO

1. **Verify + merge decomper brief 178 PR** when it opens.
   Gate: 3-region `ninja sha1` PASS + 3-region 27/27
   modules OK. ≥ 30 cross-region D-3 chunks per region.
   Watch for "needs hand-tuning" candidates — log for
   brief 180+ refinement if any.
2. **Verify + merge cloud brief 179 PR** when it opens.
   Gate: 3-region SHA1 PASS preserved (current main n=2 +
   manual injection test at n=0). New tests pin 1-3 byte
   shift detection. Brief 180+ unlocked for path-2 final
   wave dropping n=2 → n=0.
3. **Scope brief 180+ candidates (queue after 178 + 179):**
   - **After brief 179 lands**: brief 180 = decomper
     path-2 final wave (odd-aligned ov004 claims via brief
     173's locked recipe; reaches n=0).
   - **Cluster C / D-1 / D-2 cross-region** — extend brief
     177's tool further.
   - **Cluster B size-1/2 + odd-aligned cross-region**
     (brief 176 residue, 16 candidates) — needs new
     recipe path.
   - **Cluster D-3 hard residue** (14.8 KB mega + 366 B
     non-aligned) — small cleanup.
   - **3 cluster B value=0 EUR deferred candidates** —
     wave-2 TU rewrite.
   - **Cross-region cluster A apply** — port 1443 EUR cluster A
     symbols to USA + JPN.
   - **Cluster D-3 via Pattern 3 generator** — ~20 complex
     nested structs.
4. **Watch for any new wall hypotheses** in upcoming wave PRs.
   Standing rule since brief 084's "3 walls not 1" methodology
   lesson: pre-empt symptom-vs-mechanism classification by requesting
   a cloud codegen-sweep brief before any wall gets a P-N or C-N
   number. C-23 candidate (MMIO register-base folding) from brief 086
   remains pending cloud sweep classification.
5. **Pre-existing carryovers (unchanged):**
   - `func_ov021_021aaf58` placeholder-in-complete-TU warning.
   - ov005 placeholder-name warnings.
   - `match-invariants` not yet a required branch-protection check.

## Cross-machine handoff notes

User alternates brain between Windows PC and Mac. The role is tied to
the local machine (toolchain + baserom on disk), not to a specific
Claude session. State.md is the bridge. Standing conventions:

- **Working pattern:** brain reviews + merges autonomously; user
  receives the cloud / decomper messages afterward.
- **Verify command (Windows):** `python tools/configure.py eur &&
  ninja sha1 && python tools/configure.py usa && ninja sha1 && python
  tools/configure.py jpn && ninja sha1` — substitute `./dsd` and
  POSIX paths on Mac.
- **Memory per-machine:** Each side's `~/.claude/projects/...` memory
  doesn't follow. State.md is the bridge.
- **Worktrees:** see *Worktree convention* above; 3-worktree split is
  now standard.

## New agents?

No. Continuing with 4-slot setup (brain + decomper + cloud +
auto-progress-badge bot).
