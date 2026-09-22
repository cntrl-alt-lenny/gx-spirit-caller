### decomper/hard-tier-byte-volume-continued

**Goal:** Continue brief 053's byte-volume pivot. The pattern is
working — 3 waves shipped 19 matches / 884 bytes. This brief
keeps the cap at ≤ 0x40 (sustainable) and pushes for ~3 more
waves before considering a further cap raise.

**Context:**

Brief 053's full chain across waves 15/16/17:

| Wave | Matches | Bytes | Yield | Notes |
|---:|---:|---:|---:|---|
| 15 (initial) | 5 | 320 | 83% | All 0x40, all main, all default routing |
| 16 (self-extend 1) | 7 | 280 | 50% | All 0x28, all main, C-1r corollary surfaced |
| 17 (self-extend 2) | 7 | 284 | 70% | 0x28+0x2c, multi-module (main+ov010+ov011+ov015) |
| **total** | **19** | **884** | **66%** | |

The pattern: 0x28-0x40 sized hard-tier functions are reliably
matchable at ~60-70% yield, ~290 bytes/wave. Badge climbed
1.28% → 1.32% during the chain.

Wave 17's multi-module observation is important: the eligible
pool is broader than main; ov010/ov011/ov015 have ≤0x40
candidates too.

**Selection rule (same as brief 053):**

- Size 0x28 ≤ N ≤ 0x40 in hard tier.
- Prefer candidates whose callees are already named.
- Mix all 3 routing tiers per disassembly.
- **Skip P-1 walls** (`lsl K; lsr K` zero-extend collapse — all
  SPs, permanent — wave 14 lesson).
- **Skip C-1r over-predication shape** (wave 16 / brief 054 fold —
  cloud confirmed permanent across all 15 SPs).
- **Skip ov004** (BSS shift, per brief 052 research).
- **Apply C-16 / W-H** ldr-r1-vs-ip coercion if you encounter the
  pattern (brief 054 unblocks it; wave 15-17 didn't use this yet).

**Workflow:**

Standard. find_shape_templates corpus is now ~400+ functions.
Multi-module twins (like wave 17's `func_02089024`/`_0208910c` +
`func_ov015_021b34a4`/`func_ov010_021b3998`) suggest scanning
across modules for clones is high-leverage.

**Scope:**

- Match 5–10 hard-tier functions in the 0x28–0x40 band.
- Standard verification gate.
- PR body documents per-target byte counts (calibration for next
  cap-raise decision).

**Non-scope:**

- ❌ Sizes < 0x28 or > 0x40 (next brief if 0x28-0x40 dries up).
- ❌ ov004, P-1, C-1r-shape candidates.
- ❌ Tools / libs / include / AGENTS.md / state.md edits.

**Success:**

- ≥ 5 byte-identical matches AND bytes-matched ≥ 200.

**Branch:** `decomper/hard-tier-byte-volume-continued`

## Self-extend clause

Same as brief 053: yield ≥ 40% AND bytes-matched ≥ 200 → up to
**2** follow-up waves. Stop after 2 OR if yield collapses OR if
the ≤ 0x40 eligible pool drops below 5 viable per wave.

**After this brief (and self-extends) land:**

1. If the 884-byte-per-3-waves pattern holds → brain queues
   brief 057 with cap raised to ≤ 0x60 (test bigger functions).
2. If yield drops → brain pivots to cluster-pipeline-rescan or
   USA/JPN bootstrap.
3. If multi-module twin signal stays strong → brain queues a
   cloud brief to add module-aware ranking to
   find_shape_templates.
