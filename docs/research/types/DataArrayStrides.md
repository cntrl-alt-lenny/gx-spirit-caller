[//]: # (markdownlint-disable MD013 MD041)

# Data Array Strides (from symbols.txt)

Pure-stride runs in `config/eur/arm9/symbols.txt` reveal array element sizes
for structs that exist as global data. These are struct-size constraints with
no field-name information yet — they narrow the search space for future
C-matching.

## Source

Derived from stride analysis of 7,013 `kind:data` entries in
`config/eur/arm9/symbols.txt`. Groups of ≥ 5 consecutive symbols at exactly
the same stride are treated as arrays.

## Candidate struct sizes

| Stride (bytes) | Elements | ROM range | Notes |
|----------------|----------|-----------|-------|
| 0x10 (16)  | 147 | 0x020C45C8 – 0x020C4EE8 | **16-byte struct array, 147 entries** |
| 0x18 (24)  | 125 | 0x020FC8BC – 0x020FD45C | 24-byte struct array, 125 entries |
| 0x14 (20)  |  74 | 0x020C51DC – 0x020C5790 | 20-byte struct array, 74 entries |
| 0x0C (12)  |  59 | 0x020E2FAC – 0x020E3264 | 12-byte struct (could be `Rect`×2 or u32×3) |
| 0x0C (12)  |  51 | 0x020E2560 – 0x020E27B8 | 12-byte struct, 51 entries |
| 0x34 (52)  |  47 | 0x020E38AC – 0x020E4204 | **52-byte struct array, 47 entries** |
| 0x30 (48)  |  40 | 0x020F91A4 – 0x020F98F4 | **48-byte struct (= Matrix3x4 + 3×u32?)** |
| 0x08  (8)  |  34 | 0x020C6B94 – 0x020C6C9C | 8-byte pairs (u32 + u32 or ptr + int) |
| 0x08  (8)  |  30 | 0x020C5A30 – 0x020C5B18 | 8-byte pairs |
| 0x18 (24)  |  24 | 0x020C5ED0 – 0x020C60F8 | 24-byte struct, 24 entries |
| 0x1C (28)  |  21 | 0x020C60F8 – 0x020C6328 | **28-byte struct array, 21 entries** |

## Large BSS struct instances (single instances of big structs)

| Symbol | BSS base | Inferred size | Notes |
|--------|----------|--------------|-------|
| `data_021040ac` | 0x021040AC | ≥ 0xC4C | GlobalAudioState (see separate file) |
| `data_0219747c` | 0x0219747C | ~0xFB8 | unknown large struct |
| `data_02193440` | 0x02193440 | ~0xF00 | unknown large struct |
| `data_02102d4c` | 0x02102D4C | ~0xD94 | large BSS object near GlobalAudioState |
| `data_0219b940` | 0x0219B940 | ~0xAC8 | unknown large struct |

## Array of 0x1800-byte structs (BSS)

Five entries starting at `0x02186BC8`, each 0x1800 bytes apart:
- `data_02186bc8`, `data_021883c8`, `data_02189bc8`, `data_0218b3c8`, `data_0218cbc8`

Each entry is 6144 bytes — likely a large overlay or graphics buffer per
entity/player slot (5 entries suggests 2 players + 3 spirit monsters, or
5-monster formation).

## Notes

- The 0x10-byte stride array (147 entries) is the largest uniform array by
  element count. At 147 × 16 = 2352 bytes, it could be a card-data array
  (147 ≈ common DS card-pool count for early GX titles).
- The 0x30-byte stride (40 entries) matches `sizeof(Matrix3x4)` exactly —
  this could be an animation bone table or a 40-frame keyframe array.
- The 0x34-byte stride (47 entries) = Matrix3x4 (0x30) + 4 extra bytes;
  likely an extended transform record (matrix + int id or matrix + ptr).
