### decomper/hard-tier-byte-volume

**Goal:** Strategic pivot from function-count progress to **code-byte
volume**. Raise the hard-tier size cap aggressively to ≤ 0x40 (64
bytes / 16 instructions) and accept lower per-attempt yield in
exchange for ~2-3× more bytes per match. Goal: meaningfully move
the progress badge (currently 1.28% on main).

**Context:**

Project state after 14 waves + cluster pipeline:

| Tier | % matched (count) | Unmatched | Notes |
|---|---:|---:|---|
| trivial | 100% | 0 | done |
| easy | 84.1% | 177 | mostly walls / cluster residue |
| sinit | 100% | 0 | done |
| named | 97.4% | 1 | done in practice |
| medium | 80.1% | 31 | mostly documented walls |
| **hard** | **2.0%** | **8190** | bulk of remaining work |

**The badge (code-bytes-matched / total-code) sits at 1.28% on
main.** That's the standard decomp metric (decomp.me, pokediamond,
dqix all use it). Easy/medium/sinit have been ~80%+ matched by
function count for a while, but those are small functions —
thunks, wrappers, leaves — which barely move the byte counter.

To meaningfully advance the badge, the work has to shift to
**bigger functions** in the hard tier. The ≤ 0x28 cap (brief 049+)
maxed out yield by staying with small functions; the per-attempt
math now favours bigger targets even at lower yield:

- ≤ 0x20 cap, 90% yield, avg 28 bytes/match = **25 bytes/attempt**
- ≤ 0x40 cap, 60% yield, avg 50 bytes/match = **30 bytes/attempt**
- ≤ 0x40 cap, 50% yield, avg 50 bytes/match = **25 bytes/attempt**

Even at 50% yield, the cap raise breaks even by byte volume; at
60%+ it wins outright.

**Anchor selection:**

1. Run `python tools/next_targets.py --version eur`. Hard section
   has 8190 unmatched.
2. Filter:
   - **Size 0x28 ≤ N ≤ 0x40** (the new band).
   - Prefer candidates whose callees are already named (callable
     references resolve cleanly).
   - Mix all 3 routing tiers per disassembly.
   - **Skip ov004** until brief 054's BSS investigation lands a
     follow-up.
   - **Skip P-1 wall candidates** (`lsl 16; lsr 16` zero-extend
     thunks — wave 14 took 7 of these as misapplications; they
     are permanent).
3. **Apply** newly-documented coercions:
   - **C-2a** struct-copy form for multi-field copies (brief 052).
   - **C-15** routing-fix for mvn-vs-sub peephole (brief 052,
     mwcc-2.0-only).
   - All earlier C-1..C-14 from codegen-walls.md.
   - Operational note from cloud's PR #371 on cross-function
     cascade.

**Workflow:**

Standard. find_shape_templates corpus is now ~370+ functions.
Larger targets may need multiple iterations per function — budget
~2-3× the time per match vs the ≤0x20 era.

**Scope:**

- Match 4–8 hard-tier functions in the 0x28–0x40 band. **Quality
  > Quantity** for this brief: a 0x40 match is worth ~2 of the
  ≤ 0x20 matches by bytes.
- Standard verification gate.
- PR body documents:
  - **Per-target byte-count** so brain can calibrate next cap.
  - Per-target shape + routing tier.
  - Drops with codegen-walls bucket attribution.
  - Read on whether 0x28-0x40 sizes feel qualitatively different
    from ≤0x20.

**Non-scope:**

- ❌ Sizes < 0x28 (call those exhausted for this pass).
- ❌ Sizes > 0x40 (next brief if 0x28-0x40 holds).
- ❌ ov004 candidates (brief 054 follow-up).
- ❌ P-1 wall candidates.
- ❌ Tools / libs / include / AGENTS.md / state.md / docs/research
  edits.

**Success:**

- ≥ 4 byte-identical matches at the new band.
- Combined bytes-matched in this PR ≥ 200 (the rough byte-volume
  equivalent of 7-8 small matches).
- All matches verified locally + `pr-tier-delta` green.

**Branch:** `decomper/hard-tier-byte-volume`

## Self-extend clause

If yield ≥ 40% (lowered from 60% to reflect the cap-raise risk
explicitly) AND combined bytes-matched ≥ 200, decomper may file
up to **2** follow-up waves without a fresh brief. Same selection
rule.

If yield < 40% OR bytes-matched < 200, hand back to brain — the
cap-raise didn't pay back and brain re-scopes.

**After this brief (and self-extends) land:**

1. Brain refreshes state.md with the byte-volume datum.
2. If 0x40 cap holds its weight, brain queues 0x60 cap.
3. If yield collapses, brain pivots — possibly to a tooling
   investment, USA/JPN bootstrap, or accepting that hard-tier
   big-function work requires longer per-target investment.
