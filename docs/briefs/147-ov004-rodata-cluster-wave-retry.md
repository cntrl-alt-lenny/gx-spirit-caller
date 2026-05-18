### decomper/ov004-rodata-cluster-wave-retry

**Goal:** Retry of brief 145 (PR #566, **BLOCKED**) — now unblocked
by brief 146 (PR #570). Ship ≥ 20 ov004 `.rodata` cluster claims
across Pattern 1 .c, Pattern 1 .s, and Pattern 3 chunks (via brief
125 generator + brief 144's auto-`.extern` emission). All three
shapes that decomper reproduced the patcher bug with should now
ship cleanly.

**Context:**

Brief 145 specified ≥ 20 ov004 `.rodata` source-level claims; 0
shipped due to a residual bug in `tools/patch_ov004_veneers.py`'s
`_fix_ctor_and_pad` (assumed fixed 16-byte cluster shape; at n<86
mwldarm emits 12 bytes — patcher over-read by 4 → 4-byte short →
SHA1 FAIL). Decomper's research note
[`docs/research/ov004-rodata-patcher-blocker.md`](../research/ov004-rodata-patcher-blocker.md)
characterised the bug with three independent reproducer shapes.

Brief 146 (PR #570) shipped the fix: byte-detect cluster shape from
the post-splice byte content (bytes 12-15 — cloud empirically
corrected the brief's suggested 4-7 offset, see #570's "Discriminator
offset" section); `expected_output_delta_for(n)` branches on `n` for
the WITH_TERMINATOR (n=86, +8 net) vs NO_TERMINATOR (0 < n < 86, +12
net) paths. Tests pin the new behaviour; 3-region SHA1 PASS preserved
bit-for-bit for the historical n=86 case.

**Scope:**

- Target ≥ 20 ov004 `.rodata` symbols, mixing all three claim shapes:
  - Pattern 1 .c — 15-30 candidates from cluster A / C / D-1 / D-2
    sub-clusters per brief 141's sweep.
  - Pattern 1 .s — for assembly-friendlier shapes where the brief 117
    Pattern 1 recipe fits but `.c` would force unwanted compiler
    behaviour (e.g. alignment, signedness).
  - Pattern 3 chunk via brief 125 generator — now turnkey thanks to
    brief 144's auto-`.extern` emission; no per-chunk hand-edits.
- Per-claim verify: confirm byte-identical output at the claim's
  vaddr via `objdiff-cli diff` (per existing decomper habit).
- Wave verify: ov004 stays OK across 3 regions AND 3-region SHA1 PASS
  preserved.

**Selection rule:**

Use the cluster A / C / D-1 / D-2 candidate list from brief 141's
sweep (PR #557) as the starting pool. Brief 145's reproducer shapes
(Pattern 1 .c — `const unsigned char data_ov004_02200de8[12]`,
Pattern 1 .s — same shape via mwasmarm, Pattern 3 chunk —
`0x02200dbc..0x02200f18`, 14 symbols) are all valid first picks.
Beyond those three known-good shapes, the selection rule mirrors
brief 145's: prefer high-ratio cluster anchors with shape-similar
siblings; mix the three claim shapes 50/30/20 to exercise all three
patcher paths empirically.

**Required smoke test (decomper runs pre-PR, brain re-runs
pre-merge):**

```
python tools/configure.py eur && ninja sha1   # must PASS
python tools/configure.py usa && ninja sha1   # must PASS
python tools/configure.py jpn && ninja sha1   # must PASS
./dsd.exe check modules -c config/eur/arm9/config.yaml   # 27/27 OK
./dsd.exe check modules -c config/usa/arm9/config.yaml   # 27/27 OK
./dsd.exe check modules -c config/jpn/arm9/config.yaml   # 27/27 OK
```

Expected: all three regions PASS `ninja sha1` and report 27/27 OK
modules. **If any region's SHA1 drops from PASS to FAIL, the PR
does not merge** — same gate as brief 142 + brief 146.

**Apply list — carry forward + brief 146 calibration:**

1. **Brief 146 patcher fix is in play.** Any ov004 `.rodata` claim
   now triggers the n<86 NO_TERMINATOR path of the patcher. Verify
   by running `python -m unittest tests.test_patch_ov004_veneers`
   pre-PR — should be 38 passing tests (brief 146 added 6).
2. **Pattern 3 generator is turnkey.** Brief 144's auto-`.extern`
   emission means Pattern 3 chunks no longer need hand-added externs.
   Generate, commit, ship — no manual editing of the `.s` chunk file
   between generation and PR.
3. **Carryovers unchanged** — C-22 adjacent-bitfield, C-21 ternary
   decomposition, C-20 halfword-pack, S-1 padding off-by-one, S-2
   switch-case textual ordering (added in brief 086 wave 1), C-23
   candidate MMIO base folding (still pending cloud sweep
   classification).

**Self-extend gate** (same as brief 057, 060, 081, 086):

- Yield ≥ 40%, AND
- Bytes-matched ≥ 250.

If both hold, wave 2 self-extend is authorised. Up to 2 self-
extends per brief; after wave 3 the brief closes and brain scopes
the next.

**Non-scope:**

- ❌ Touching `tools/` (cloud's territory; brief 146 just landed).
- ❌ Extending the patcher to handle edge cases beyond the
  n ∈ [0, 86] band — brief 142 + 146 jointly cover the band.
- ❌ Cluster B size-1/2 + pointer subsets — those need brief 148
  (cloud pointer typedef research) first.
- ❌ `AGENTS.md`, `docs/state.md`.

**Success:**

- Wave 1 PR opens with ≥ 20 ov004 `.rodata` claims across the three
  shapes (Pattern 1 .c + Pattern 1 .s + Pattern 3 chunk).
- 3-region `ninja sha1` PASS preserved.
- 3-region 27/27 module OK preserved.
- Self-extend chain runs as far as the gates allow (up to 3 total
  waves).
- Brain scopes a follow-up brief once 147 closes (likely cluster B
  pointer wave gated on brief 148, or further ov004 sub-cluster
  drain).

**Branch:** `decomper/ov004-rodata-cluster-wave-retry`

**Priority:** HIGH. Brief 145 was the only post-SHA1 wave that
shipped 0 source-level claims; this clears the asterisk. Per
decomper's brief 145 funnel, all three reproducer shapes are
known-good once the patcher accepts them — execution risk is low.

**After this brief lands:**

1. Brain runs the 3-region SHA1 PASS + 27/27 OK smoke test.
2. Brain scopes the next wave based on remaining ov004 cluster
   depth (per brief 141's sweep table) and cluster B pointer-
   typedef readiness (brief 148 status).
