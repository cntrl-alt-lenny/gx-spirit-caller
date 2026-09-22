### decomper/single-region-hard-tier-cap-raise-0x60

**Goal:** Resume single-region EUR hard-tier matching with the
size cap raised from ≤0x40 to ≤0x60. Brief 081's three-wave
chain at ≤0x40 closed at **21 matches / 876 bytes / 67.7%
yield**. Pool drain analysis (PR #470 brief 082 wave 1) shows
the cross-project pokeheartgold lever is exhausted; cap-raise
on single-region is the highest-leverage forward move.

**Context:**

Three-way comparison of forward levers after brief 082 wave 1
closed below target (PR #470's funnel analysis):

| Lever | Estimated yield | Estimated bytes | Leverage |
|---|---|---|---|
| Brief 082 wave 2 (post-vendoring) | +5-6 ports | +250-300 B | LOW (gated on struct vendoring brief that doesn't exist yet) |
| **This brief 086 (cap-raise to ≤0x60)** | **30-50 matches** | **~1500-2500 B** | **HIGH — broad pool, proven yield** |
| More upstream sources (pokeplatinum) | similar 80%+ drain overlap | uncertain | LOW |

The math: brief 081 at ≤0x40 cap ran 67.7% yield. The 0x40-
0x60 band has ~3000+ EUR hard-tier candidates (per
`tools/next_targets.py --version eur --tier hard`). Even at a
yield haircut to 50% (conservative), expected output is 30+
matches at ~50 bytes/match = ~1500 bytes. The brief 057
cap-raise (the precedent) ran 70% / 70% / 25% across three
waves — chain closed when the band drained.

**Selection rule:**

- Tier: hard (no medium / easy / sinit / named — those are
  already in the high-80s/100%).
- Size cap: **≤0x60** (raised from brief 081's ≤0x40).
- Anchor by current `python tools/next_targets.py --version
  eur --tier hard --size-max 0x60` ranking. Prefer ratio
  but HIGH-prediction outliers (78%+) are fair game — same
  rule used since the brief 030-series chain.
- Target wave 1: 10-12 candidates, sized preferentially in
  the 0x40-0x60 band (i.e. the new territory the cap-raise
  unlocks). Mixing in a few ≤0x40 stragglers is fine if the
  ranking surfaces them as high-ratio.

**Self-extend gate** (same as brief 057, 060, 081):

- Yield ≥ 40%, AND
- Bytes-matched ≥ 250.

Both must hold for self-extend authorisation. Up to 2 self-
extends per brief (waves 2, 3); after 2/2 the brief closes
and brain scopes the next.

**Apply list — patterns surfaced since brief 081 closed:**

Carry these into shape-recognition while picking targets and
writing candidate C:

1. **C-22 adjacent-bitfield syntax (NEW — brief 084 /
   PR #471).** Target shows two adjacent `bic`/`orr` pairs
   on the same loaded register at different bit positions
   (e.g. `bic #0xf00; orr ...; bic #0xf000; orr ...`).
   Recipe: declare each window as its own C bitfield. mwcc
   2.0/sp1p5 (default SP) emits separate `bic/orr` pairs
   per bitfield write, matching orig's two-step pattern.
   The natural compound-mask form
   (`(v & ~0xff00) | (a<<8) | (b<<12)`) folds the two
   clears into one `bic` — different bytes. **Default-SP
   only**; don't route to `.legacy.c`.

2. **Wall-hypothesis methodology lesson (NEW — brief 084 /
   PR #471).** When a brief surfaces N candidates that
   *appear* to share a wall (e.g. typedef'd struct pointer
   + `->` field access), confirm via codegen sweep before
   classifying. Brief 081's 3 candidates turned out to have
   3 distinct walls (C-22, C-1, C-2+C-15-family) — symptom
   similarity was a syntactic coincidence. If wave 1 hits
   similar-looking residuals, run a 3-shape sweep before
   flagging a new wall.

3. **C-21 ternary-to-constants decomposition** (brief 057
   wave 21 / PR #391). Target: 4-insn
   `mov{cond} #small; mov{!cond} #small; lsl; rsb/add/sub`
   chain producing one of two constants. Recipe: split
   decision from value
   (`int sign = (cond) ? 1 : 0; result = LARGE - (sign << K);`).
   Natural ternary `(cond) ? X : Y` folds to 2 mov-
   immediates. C-21 was previously flagged pending decomper
   usage; if 086 wave 1 hits this shape it counts as
   discovery usage.

4. **C-20 halfword-pack recipe** (brief 057 wave 22). For
   the `lsl rN,#0x10 / lsr rN,#0x10 / orr ..., lsr #0x10`
   shape: route through `.legacy.c` (mwcc 1.2/sp2p3) with
   double-cast
   `((unsigned)(unsigned short)c << 16) | (unsigned)(unsigned short)b`.
   Drop-in for homogeneous halfword-pack triplets.

5. **S-1 padding off-by-one** (brief 057 / PR #398). When
   struct offsets disagree with mwcc's emitted offsets by
   exactly 4, scan back for a misaligned `char _pad[N]`
   array. Common trap: `[0x11]` followed by `int` aligns
   to the next 4-byte boundary.

**Self-extend pattern (locked in since brief 030 series):**

If wave 1 clears both gates, open wave 2's PR without
requesting a fresh brain brief. Same selection rule + apply
list. If wave 2 also clears both gates, open wave 3. After
wave 3, the brief closes — open a follow-up note "brief 086
closes at N/B/Y%" and brain scopes the next.

**Required smoke test (decomper runs pre-PR, brain re-runs
pre-merge):**

```
python tools/configure.py eur
ninja rom
./dsd.exe check modules -c config/eur/arm9/config.yaml
```

Expected: ROM builds clean; **24/27 baseline preserved**
(ARM9 main / DTCM / overlay 4 still the documented red
modules; no other module flips red).

USA / JPN cross-region apply is **NOT** required for this
brief — single-region only. The cross-region apply step is a
separate pipeline (briefs 075 / 078) that runs after
single-region matches accumulate.

**Non-scope:**

- ❌ Cross-region apply to USA / JPN. Single-region only;
  cross-region runs in a separate brief after this one
  closes.
- ❌ Cross-project ports (pokediamond / pokeheartgold).
  That pool is drained per brief 082 wave 1's analysis.
- ❌ Targets outside the hard tier or above 0x60. The
  cap-raise is bounded.
- ❌ Touching `tools/`, `AGENTS.md`, `docs/state.md`.

**Success:**

- Wave 1 PR opens with N matches in the 0x40-0x60 band
  preferentially, full smoke test passes, gate metrics
  reported in PR body (yield + bytes).
- Self-extend chain runs as far as the gates allow.
- Brain scopes a follow-up brief once 086 closes.

**Branch:** `decomper/single-region-hard-tier-cap-raise-0x60`

**Priority:** HIGH. Per brief 082 wave 1's drain analysis,
this is the highest-leverage decomper move. The 0x40-0x60
band's pool size and brief 081's validated yield make this
the obvious next chain.

**After this brief closes:**

1. Brain scopes the next decomper brief from post-086
   rankings — likely a further cap-raise, a tier pivot
   back to medium-tier ≤0x40, or a cross-region apply
   wave depending on remaining pool depth.
2. If 086 surfaces a fourth new wall hypothesis, brain
   queues a cloud follow-up brief in the brief-084
   pattern (codegen-sweep classification, not symptom
   hypothesis).
