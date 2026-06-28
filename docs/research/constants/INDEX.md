[//]: # (markdownlint-disable MD013 MD041)

# Constants / Enums Catalog

Recurring magic numbers, bit-flag masks, and enum-like integer sets inferred
from matched C source files and assembly, across all overlays and main arm9.

> Branch: `kb/types-round2`
> Do NOT regenerate — the brain handles the index at merge.

---

## Quick-reference: most important constants for C-matching

| Constant | Value | File | Why it matters |
|----------|-------|------|----------------|
| C-39 wildcard tag | `0x23` | [EntityTypeTags.md](EntityTypeTags.md) | Most-tested non-trivial constant (154 CMP hits); any ov002 type-gate function hits this |
| Player LSB mask | `0x1` | [BitFlagMasks.md](BitFlagMasks.md) | Most-used AND mask (3,944 hits); `player & 1` is everywhere |
| Byte extract | `0xFF` | [BitFlagMasks.md](BitFlagMasks.md) | Second most-used AND mask (3,333 hits) |
| Duel phase field | `data_ov002_022d016c.f_cf8` values 0–3 | [DuelStateEnums.md](DuelStateEnums.md) | Most-tested field in the duel state singleton |
| Card ID none | `0xFFFF` | [CardIdRanges.md](CardIdRanges.md) | Empty-slot sentinel across card arrays |

---

## Files

| File | Contents |
|------|---------|
| [EntityTypeTags.md](EntityTypeTags.md) | b6_11 enum (0x23 wildcard, 0x0F companion, full 8-value set); step checkpoint IDs (0x4B/0x4C/0x4D); record tier tags (0x1010/0x2010/0x3010) |
| [BitFlagMasks.md](BitFlagMasks.md) | RNG/LFSR (0x7FFF); NDS hardware register masks (0x1F00, 0x43, 0x8000, etc.); game-state flag masks (0x2F07, 0x8); utility masks (0x1, 0xFF, 0x7F) |
| [DuelStateEnums.md](DuelStateEnums.md) | Duel phase (0–3); per-overlay 4-state sub-machine; gauge kind (12/14/15); VRAM bank selector (0–9); slot-to-cell LUT; timer thresholds (0x3E8, 0x4B0, 0xBB8); state-pair handshake (0x7F/0x80) |
| [CardIdRanges.md](CardIdRanges.md) | Named card ID sub-ranges (0x1A70–0x1A75, 0x1A90–0x1A95, etc.); spirit card IDs (0x0FA7–0x0FCD); card ID triplets; bijective remap (+0x12) |

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
