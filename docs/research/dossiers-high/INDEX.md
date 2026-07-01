# HIGH-tier dossiers index

1067 dossiers (HIGH class A/B, not yet on main as .c). Each dossier includes:
- recipe + risk (from c-match-prep)
- SHA1 pitfall mode (A/B/D/E)
- **GROUND TRUTH** section: pool-word VALUES and BL/BLX callee targets extracted directly from the .s ship
- Mode-C reminder: never use `static const` arrays

The GROUND TRUTH section pre-empts Mode A (wrong pool value) and Mode B (wrong callee) failures — the campaign agent uses the correct values from the first attempt.

## Address range

| from | to | count |
|------|----|-------|
| `02001e5c` | `022bdf30` | 1067 |

## Files

| addr | recipe (brief) |
|------|----------------|
| 02001e5c | ACCESSOR (signed-byte) + double-negation bool |
| 0200592c | Sequential init calls + MMIO pool words (0x04000010, 0x04001014) |
| 02006524 | Ternary-chain conditional + bitfield extraction |
| 020071c4 | Mode D — duplicate pool words (data_02104f1c × 2); .s-only |
| 02007f38 | Counted copy loop + two data symbol pool words |
| 02007f58 | BITFIELD insert + shifted-immediate base |
| 020091f4 | switch dispatch + BL callees |
| 02009278 | ACCESSOR + ptr-chain |
| 0200a40c | BITFIELD :8 and :1 + BIND-once base + early-return loop |
| 0200a454 | counted copy loop, indexed load + computed-base store |

_(full list: 1067 entries — addr-sorted .md files in this directory)_

Total: 1067 dossiers
