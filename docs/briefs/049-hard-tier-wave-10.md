### decomper/hard-tier-wave-10

**Goal:** Continue hard-tier work past brief 047's allowance.
Same selection rule with **size cap raised cautiously to ≤ 0x28**
(40 bytes / 10 instructions). Main-module small-hard pool drained
in waves 7-9; this brief explicitly broadens.

**Context:**

Brief 047's three PRs (waves 7+8+9, including 2 self-extends)
shipped **41 hard-tier matches at ~91% combined yield**:

| Wave | Matches | Yield | Routing mix |
|---:|---:|---:|---|
| 7 (brief 047 itself) | 15 | 100% | 9 sp1p5 + 6 sp3 |
| 8 (self-extend 1) | 15 | 100% | 2 default (push-r0 C-12) + 5 sp2p3 + 4 sp3 + 4 sp1p5 |
| 9 (self-extend 2) | 11 | 73% | 7 sp1p5 + 4 sp3 |
| **total** | **41** | — | all 3 routing tiers + inline-asm |

Wave 9's PR body explicitly noted: "Main-module small-hard pool
is drained. ≤ 0x20 cap is exhausted there." Time to raise the cap.

**Anchor selection:**

- **Size cap:** ≤ 0x28 (was ≤ 0x20). Pull from
  `python tools/next_targets.py --version eur`'s `hard` section.
- **Skip recursive-callee functions** (same as brief 047).
- **Mix all 3 routing tiers per disassembly.**
- **Wave 9 P-1 drops are permanent** (`func_ov002_02211808`,
  `_0223fd10` — shift-pair vs mask-collapse). Skip equivalents.
- **Wave 9 provisional reg-alloc wall** (`func_ov002_021fbba8`,
  `_02243740` — target uses r2 for cmp-scratch, mwcc picks r1)
  is brief 050 cloud territory. Skip until brief 050 verdict.
- **C-12 push-r0** is now standard tooling; apply if you encounter
  push-r0 thunks (W-E pool was 2; both consumed in wave 8).

**Workflow:**

Standard. find_shape_templates corpus is now ~290+ functions
across all 3 tiers; tool leverage on routing-tier discriminator
should be strong.

**Scope:**

- Match 6–10 hard-tier functions (raised size cap).
- Standard rename / verification gate.
- PR body documents:
  - Per-target shape + routing tier picked.
  - **Whether bigger sizes (0x20–0x28) hit walls more than
    ≤ 0x20.** Wave 7's hypothesis was yes; this is the test.
  - New walls if any (flag for future cloud research).

**Non-scope:**

- ❌ Sizes > 0x28. Decomper's wave 7 hypothesis was bigger sizes
  hit more walls; testing 0x28 first before further expansion.
- ❌ Recursive-callee functions.
- ❌ Wave 9 provisional reg-alloc wall (brief 050 territory).
- ❌ Tools / libs / include / AGENTS.md / state.md /
  docs/research edits.

**Success:**

- ≥ 6 byte-identical hard-tier matches.
- All matches verified locally + `pr-tier-delta` green.

**Branch:** `decomper/hard-tier-wave-10`

## Self-extend clause

If yield ≥ 60% (raised from brief 047's 50% threshold to reflect
the cap-raise risk), decomper may file up to **2** follow-up
waves without a fresh brief. Same selection rule.

If yield 40–59%, hand back to brain for cap-revisit.

If yield < 40%, ping immediately — the cap-raise didn't work
and brain re-scopes.

**After this brief (and self-extends) land:**

1. Brain refreshes state.md.
2. If 0x28 cap held its yield, brain queues 0x30 cap.
3. If yield dropped, brain pivots — possibly to a tier-tooling
   investment brief (cloud) or USA/JPN bootstrap.
