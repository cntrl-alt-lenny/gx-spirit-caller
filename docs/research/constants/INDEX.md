[//]: # (markdownlint-disable MD013 MD041)

# Constants / Enums Catalog

Recurring magic numbers, bit-flag masks, and enum-like integer sets inferred
from matched C source files and assembly, across all overlays and main arm9.

> Branch: `kb/types-round3`
> Do NOT regenerate — the brain handles the index at merge.

## Confidence and promotion rule

Confidence ratings (same scale as [`types/INDEX.md`](../types/INDEX.md)):
**HIGH** = multiple independent sources agree; **MED** = one confirmed
source or two partial; **LOW** = assembly-only inference.

**Any claim that asserts a closed range or enumeration** — not just "this
value occurs" but "these are *all* the values" — must state its own
confidence and source count at the claim, not just inherit whatever
blanket rating the containing document carries. A struct or catalog
entry rated HIGH overall can still contain one field whose *range* was
sampled from only 2-3 sources — that's MED at best, and writing it as a
closed set without saying so is how `cm-f-cf8-contradiction` happened: a
"0-3" range promoted from 3 matched files silently dropped the fact that
none of those 3 files tested a value ≥ 4, so the upper bound was never
actually verified, only assumed. Dossiers already carry a per-item
`Confidence:` field (see `docs/research/dossiers/`) — when promoting a
claim from a dossier into a `types/` or `constants/` doc, carry that
confidence forward verbatim instead of letting it round up to the
document's blanket rating.

---

## Quick-reference: most important constants for C-matching

| Constant | Value | File | Why it matters |
|----------|-------|------|----------------|
| C-39 wildcard tag | `0x23` | [EntityTypeTags.md](EntityTypeTags.md) | Most-tested non-trivial constant (154 CMP hits); any ov002 type-gate function hits this |
| Player LSB mask | `0x1` | [BitFlagMasks.md](BitFlagMasks.md) | Most-used AND mask (3,944 hits); `player & 1` is everywhere |
| Byte extract | `0xFF` | [BitFlagMasks.md](BitFlagMasks.md) | Second most-used AND mask (3,333 hits) |
| Duel phase field | `data_ov002_022d016c.f_cf8` — open observed-value set {0,1,2,3,4,5,7}, NOT a closed range (corrected 2026-08-04; the 2026-08-03 "0-4" fix was the same closure-assuming error one value later) | [DuelStateEnums.md](DuelStateEnums.md) | Most-tested field in the duel state singleton |
| Card ID none | `0xFFFF` | [CardIdRanges.md](CardIdRanges.md) | Empty-slot sentinel across card arrays |

---

## Files

| File | Contents |
|------|---------|
| [EntityTypeTags.md](EntityTypeTags.md) | b6_11 enum (0x23 wildcard, 0x0F companion, full 8-value set); step checkpoint IDs (0x4B/0x4C/0x4D); record tier tags (0x1010/0x2010/0x3010) |
| [BitFlagMasks.md](BitFlagMasks.md) | RNG/LFSR (0x7FFF); NDS hardware register masks (0x1F00, 0x43, 0x8000, etc.); game-state flag masks (0x2F07, 0x8); utility masks (0x1, 0xFF, 0x7F) |
| [DuelStateEnums.md](DuelStateEnums.md) | Duel phase (open set {0,1,2,3,4,5,7}, corrected 2026-08-04 — not a closed range); per-overlay 4-state sub-machine; gauge kind (12/14/15); VRAM bank selector (0–9); slot-to-cell LUT; timer thresholds (0x3E8, 0x4B0, 0xBB8); state-pair handshake (0x7F/0x80) |
| [CardIdRanges.md](CardIdRanges.md) | Named card ID sub-ranges (0x1A70–0x1A75, 0x1A90–0x1A95, etc.); spirit card IDs (0x0FA7–0x0FCD); card ID triplets; bijective remap (+0x12) |
| [OverlayConstants.md](OverlayConstants.md) | ov006: sub-machine state word, open observed-value set (corrected 2026-08-04, was wrongly documented as closed `{0,2-9}`) + audio init (0xa0/0xa2/0x80000) + VRAM (0x6800000/0x7000000); ov004: voice SE base 1601, phase field open observed-value set (corrected 2026-08-04, was wrongly documented as closed `{0,2,4,15,16}`), touch-region bounds; ov011: actor table (count 5, stride 0x14), coord stride (0x28), cell flags (0x2000/0x1C000); ov013: BLDALPHA layout, engine power codes; ov000: facing field (0xFFFF sentinel), display-engine selector — producer trace not yet done, see OverlayConstants.md |
| [MainConstants.md](MainConstants.md) | ARM9 BIOS SWI codes (7 entries); FX32_SHIFT=12; SystemWork singleton (base 0x02104F58, size 0x92C, field offsets); LCG RNG (mult 0x343FD, inc 0x269EC3); VRAM bank base 0x6200000; Fill32 arg-order; task-creation priority=4 |

---

## Assembly immediate statistics (top constants by frequency)

From analysis of all `cmp` and `mov` instructions across 16,340 .s files:

### Most common CMP immediates

| Immediate | Count | Notes |
|-----------|-------|-------|
| `#0x0` | 37,612 | Null/zero test |
| `#0x1` | 3,651 | One-value test |
| `#0x2` | 3,050 | Two-value test |
| `#0x4` | 2,131 | Four |
| `#0x3` | 1,763 | Three |
| `#0x80` | 438 | Queue state ACTIVE |
| `#0x23` | 154 | C-39 wildcard tag |
| `#0x7f` | 195 | Queue state DONE |
| `#0x3e8` | 51 | Timer threshold 1000 |

### Most common MOV immediates (non-trivial)

| Immediate | Count | Notes |
|-----------|-------|-------|
| `#0x14` | 1,689 | Anomalously frequent: VRAM bank + loop bounds |
| `#0x400` | 361 | 1024 — significant scale value |
| `#0x7f` | 357 | Queue state DONE (also used as general 127) |
