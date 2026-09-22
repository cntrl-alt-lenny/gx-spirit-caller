### decomper/hard-tier-cap-raise-0x60

**Goal:** Raise the byte-volume cap from ≤ 0x40 to ≤ 0x60 (96 bytes
/ 24 instructions). Brief 053 + 055 together shipped 41 matches /
1832 bytes at 67% combined yield across 6 waves — the ≤ 0x40 band
is calibrated and the toolkit is proven. Time to push for more
bytes per match.

**Context:**

Cumulative byte-volume pivot results:

| Brief | Waves | Matches | Bytes | Yield |
|---:|---:|---:|---:|---:|
| 053 | 3 | 19 | 884 | 66% |
| 055 | 3 | 22 | 948 | 69% |
| **total** | **6** | **41** | **1832** | **67%** |

Badge moved 1.28% → 1.36% during this — visible but slow. At
~150 bytes/wave / 67% yield, the per-attempt math is **~27
bytes**. The math for ≤ 0x60:

- ≤ 0x60: avg ~70 bytes/match × 50% yield = **35 bytes/attempt**
- ≤ 0x60: avg ~70 bytes/match × 40% yield = **28 bytes/attempt**

Even at the 40% floor, the cap-raise breaks even by byte volume;
at 50%+ it wins outright. Function pool: hard tier has 8171
unmatched; a meaningful fraction are 0x40-0x60.

**Selection rule:**

- Size 0x40 ≤ N ≤ 0x60 in hard tier.
- Mix all 3 routing tiers per disassembly.
- **Apply** codegen-walls coercions as they fit:
  - C-2a struct-copy (multi-field copies)
  - C-9 uninitialised temp (saturating-counter shape)
  - C-12 push-r0 (inline-asm if needed; pool exhausted but recipe
    documented)
  - C-14 W-F r2-vs-r1 reg-alloc (2-arg pass-through)
  - C-15 W-G mvn-vs-sub peephole (mwcc 2.0 only → route legacy)
  - C-16 W-H ldr-r1-vs-ip (natural C source produces it)
  - C-17 bitfield-write mask redundancy (strip redundant masks)
  - C-18 + C-19 (wave 19 combined-AND + int-vs-int-or-uint
    comparison flavor)
- **Skip** P-1 (lsl/lsr collapse), P-4 family (fnptr reg-alloc),
  P-6 (≥4-op predication threshold), P-7 (pool dedup), C-1r
  over-predication shape, ov004.

**Workflow:**

Standard. find_shape_templates corpus at ~430+ functions. Bigger
functions may need more iterations per match — budget ~2-3× the
time per match vs the 0x28-0x40 band, accept that the per-wave
match count will probably drop while bytes-per-wave should rise.

**Scope:**

- Match 4–8 hard-tier functions in the 0x40-0x60 band.
- **Quality over quantity** — a 0x60 match is worth ~2 of the 0x30
  matches. Aim for **≥ 250 bytes** combined per wave.

**Non-scope:**

- ❌ Sizes < 0x40 (call those exhausted for this brief).
- ❌ Sizes > 0x60 (next brief if 0x40-0x60 holds).
- ❌ Documented-wall candidates (see Selection rule skips).
- ❌ Tools / libs / include / AGENTS.md / state.md edits.

**Success:**

- ≥ 4 byte-identical matches AND bytes-matched ≥ 250.
- All matches verified locally + `pr-tier-delta` green.
- PR body documents per-target byte counts so brain can calibrate
  next cap-raise or fallback.

**Branch:** `decomper/hard-tier-cap-raise-0x60`

## Self-extend clause

If yield ≥ 40% AND bytes-matched ≥ 250 → up to **2** follow-up
waves under the same rule. Same constraints as brief 055.

If yield < 40% OR bytes-matched < 250, hand back to brain — the
cap-raise didn't pay back, fall back to ≤ 0x40.

**After this brief (and self-extends) land:**

1. If the 0x40-0x60 band sustains → brain queues brief 059 with
   cap raised to ≤ 0x80.
2. If yield collapses → fall back to ≤ 0x40 OR pivot to
   USA/JPN bootstrap OR tools investment (find_shape_templates
   improvements based on accumulated corpus).
