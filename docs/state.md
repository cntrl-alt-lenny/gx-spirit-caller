# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-05-14 late, post-#470 + #471 merge, brief 086
queued for decomper. Main tip after PRs #470 + #471 (+ this brain-PR).
Brain back on Windows after Mac stretch. **Cross-project pipeline
declared drained** (pokeheartgold wave 1 = 1/30-60); **brief 086
single-region cap-raise to ≤0x60 is the next big lever**. EUR
**1.57%**, USA + JPN **0.26% each**.

## Today's merges (just-landed)

- **PR #470 — decomper / brief 082 wave 1 (pokeheartgold cross-
  project).** Target 30-60 ports; delivered **1** byte-identical
  match (`func_020921a8` = `OSi_RemoveLinkFromQueue`, 0x34). Funnel:
  379 byte-fingerprint HIGH candidates → 92% drained by prior briefs
  → 12 D1+D5-OK → 6 compile-fails (need struct vendoring) + 3
  byte-diff drops + 2 sinit drops → 1 match. All 3 regions verified
  24/27. Decomper flagged this a **natural-drain signal** for the
  cross-project pipeline; cumulative cross-project coverage now
  **100 ports / 5,840 bytes** across briefs 069/071/074/082.
- **PR #471 — cloud / brief 084 C-22 wall research.** Closed brief
  084 with **3/3 candidates recoverable** (spec required ≥1/3). The
  "struct-pointer silent-corruption wall" brief 081 hypothesised
  resolved into **three distinct walls**, not one: C-22 (new
  bitfield-pack), C-1 (predicated early-return, already known), and
  C-2+C-15-family (already known). Pure docs (+148/-2 in
  `codegen-walls.md`). The deeper lesson — wall hypotheses from N
  candidates should be confirmed by codegen sweep, not symptom
  similarity — captured at the top of the C-22 entry as a
  methodology note for future briefs.

## Cumulative pipeline state

| Pipeline | Output (cumulative) |
|----------|---------------------|
| Single-region EUR hard-tier (briefs 057+060+081) | 66 matches / 2964 bytes |
| Cross-region apply (briefs 075+078) | 39 ports × 2 regions = 78 region-matches |
| Cross-project bulk-port (briefs 069+071+074+082) | 100 ports / 5840 bytes (region-neutral, applies × 3 future regions) |
| Codegen-walls catalogued | 22 coercible + 8 permanent + family corollaries |
| Total session match-equivalents | ~280 |

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

**Open PRs: 0** once this brain-PR for brief 086 + state.md
refresh lands.

**Decomper:**

- **Brief 086 (HIGH, NEW)** — single-region EUR hard-tier
  cap-raise to ≤0x60. Highest-leverage forward move per PR
  #470's drain analysis. Wave 1 target 10-12 candidates in
  0x40-0x60 band. Apply list includes the new C-22 recipe
  (bitfield syntax for adjacent `bic/orr` pairs) and the
  methodology lesson (codegen-sweep wall hypotheses before
  classifying). Self-extend gate: yield ≥40% + bytes ≥250.

**Cloud — autonomous backlog:**

1. **Brief 063 (MEDIUM-LOW)** — permuter auto-runner. Carryover
   from earlier sessions. Picks up at cloud's discretion.
2. **Brief 087-or-similar (queued, post-086)** — if brief 086
   surfaces a fourth wall hypothesis, brain queues a sweep
   brief in the 084 pattern.
3. **C-21 "explicit-next-ahead walk loop" fold-in** pending
   decomper usage — carries to a future hard-tier follow-up
   that surfaces a linked-list walk pattern.

**Cross-project pipeline:**

Brief 082 wave 2 is technically still on the table — would
require a separate struct-vendoring brief to unblock the 6
compile-fails (OSContext, OSMutexQueue, `sRandSeed`, `printfStr`
etc.). Expected unlock: +5-6 ports. **DE-PRIORITIZED** — the
struct vendoring effort is similar size to the unlock; brief
086 is much higher leverage. Revisit only if brief 086 chain
exhausts the cap-raise pool earlier than expected.

## Next-brain TODO

1. **Verify + merge decomper brief 086 wave 1 PR** when it
   opens. Standard gate: EUR `ninja rom` + `dsd check modules`
   24/27. Watch wave-1 yield + size distribution — if matches
   are predominantly ≤0x40 (i.e. the cap-raise isn't drawing
   from the new band), pivot wave 2 selection toward 0x40-0x60
   preference.
2. **Verify + merge decomper self-extend waves 2/3** as they
   open. Same gate. Track yield trajectory — brief 057 ran
   70%/70%/25% (cap exhausted at wave 3); brief 060 ran 75%
   sustained (still had pool depth); brief 081 ran 67.7% (peak
   yield was at ≤0x40). Brief 086 at ≤0x60 should expect
   yield in the 55-70% range based on band-size scaling.
3. **Scope brief 087+ after 086 closes.** Options to weigh:
   - Cap-raise further (≤0x80) if 086's last wave still has
     pool depth.
   - Pivot back to medium-tier (~80% matched currently — may
     have follow-on candidates worth a wave).
   - Cross-region apply wave from accumulated single-region
     matches (briefs 075 / 078 pattern).
4. **Optional: scope brief 085 for struct vendoring** if the
   user wants to keep the cross-project lever warm despite
   the drain signal. Otherwise leave brief 082 wave 2
   de-prioritized indefinitely.
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
