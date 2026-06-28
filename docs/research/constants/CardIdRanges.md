[//]: # (markdownlint-disable MD013 MD041)

# Card ID Ranges

The card ID space in GX Spirit Caller spans `0x0F00`–`0x1B00` (approximately).
ID membership predicates are the most common switch-free conditional pattern
in main arm9 code — each function tests whether a given u16 ID belongs to a
named card family.

---

## Named sub-ranges (confirmed from matched C)

Each range below was confirmed from a distinct matched function that tests
`id >= lo && id <= hi` or `id == val` patterns:

| Range | Values | Source function |
|-------|--------|----------------|
| C-39 family A | `0x1A70`–`0x1A75` | `func_0202f430` |
| C-39 family B | `0x1A90`–`0x1A95`, `0x1AF1`, `0x1B4B` | `func_0202f46c` |
| C-39 family C | `0x1AAA`–`0x1AAD` | `func_0202f4cc` |
| C-39 family D | `0x1AD6`–`0x1AD8` | `func_0202f59c` |
| Bijective remap | `0x164A`–`0x164F` → `0x165C`–`0x1661` (+0x12 offset) | `func_02031838` |
| Scattered IDs A | (non-contiguous singles) | `func_0202ef08` |
| Scattered IDs B | (non-contiguous singles) | `func_0202effc` |
| Scattered IDs C | (non-contiguous singles) | `func_0202f5cc` |

The "C-39 family" naming reflects that these IDs cluster around the `0x1Axx`
range, which corresponds to the powerful C-39 series of cards in the game's
data.

---

## Card data address ranges

Cards with confirmed database entries span `0x0FA7`–`0x0FCD` (and likely
beyond — these are the first entries in `data_020c7b44` and `data_020c8e84`):

| Card ID | Notes |
|---------|-------|
| 0x0FA7 | First entry in card attribute table and display record table |
| 0x0FAA | Confirmed in display records |
| 0x0FBC | Confirmed in display records |
| 0x0FC9 | Confirmed in display records |
| 0x0FCD | Confirmed in display records |

The 5 display-record entries (0x0FA7, 0x0FAA, 0x0FBC, 0x0FC9, 0x0FCD) likely
correspond to the **5 main Spirit monsters** — the spirits the player can
summon in the game. This matches the 5-slot BSS array at `0x02186BC8`
(see `DataArrayStrides.md`).

---

## Triplet table (`data_ov002_022ca9bc`)

A 96-entry table of 3-card groupings. IDs range `0x0FB5`–`0x12CB`:

- Sample triplet 0: `{ 0x0FB5, 0x1034, 0x10CB }`
- IDs span from 0x0F00 to approximately 0x12xx

These triplets likely encode fusion material sets or card interaction groups
(3 cards that can combine or interact with each other).

---

## High-card range

The upper card IDs (`0x1Axx`–`0x1Bxx`) represent the "C-39 family" of
ultra-powerful cards. These IDs trigger special handling in 7+ distinct
membership-test functions, all returning a boolean 0/1.

---

## The bijective remap (+0x12)

`func_02031838` maps IDs in `0x164A`–`0x164F` to `0x165C`–`0x1661` with a
fixed +0x12 (18) offset. This is likely a card-variant remapping — two sets
of 6 IDs that represent alternate versions of the same cards (e.g. foil vs
non-foil, or different attribute variants).

---

## Sentinel ID values

| Value | Meaning |
|-------|---------|
| `0xFFFF` | "No card" / empty slot sentinel (u16 all-bits-set) |
| `-1` (as s16) | Same sentinel in signed context (equality test after lookup) |
| `0` | Valid starting card ID (some zones use 0 as "unoccupied") |

---

## C-match implications

Membership-predicate functions (returns 1/0 for "is this ID in the set?") are
among the most mechanical functions in the codebase. They typically compile to:

```c
return (id >= 0x1A70 && id <= 0x1A75) ? 1 : 0;
```

or for non-contiguous sets:

```c
return (id == 0x1A90 || id == 0x1A91 || ... || id == 0x1B4B) ? 1 : 0;
```

mwcc 2.0/sp1p5 compiles contiguous ranges with `cmp lo` + `sub` + `cmp hi`
(unsigned range trick). Non-contiguous sets compile to a series of `cmp; beq`.
The matching issue is usually which form the compiler chooses for the boundary
cases — verify via objdiff that the range vs equality form matches.
