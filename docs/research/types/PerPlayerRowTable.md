[//]: # (markdownlint-disable MD013 MD041)

# PerPlayerRowTable (data_ov002_022cf16c)

A 2 × 0x868-byte BSS global in overlay002 that stores per-player duel data:
card counts, slot occupancy, and a 5-slot sub-array for the player's field
zone. Every ov002 function that enumerates cards or queries zone state accesses
this table with a `(player & 1) * 0x868` base offset.

## Confidence: HIGH (confirmed by 8+ independent matched C files and .s analysis)

Base address: `0x022CF16C` (ov002 BSS)

## Layout

```c
/*
 * Each player has a 0x868-byte region.
 * Player 0 at base+0, Player 1 at base+0x868.
 * Indexed as: (player & 1) * 0x868 from the base.
 */
typedef struct Ov002FieldZone {
    int            zone_count;     /* +0x000  card-in-zone count (the "cf16c counter") */
    /* +0x004 – +0x00F  gap */
    int            f_010;          /* +0x010  nonzero check — field occupied flag */
    /* +0x011 – +0x01B  gap */
    int            f_01c;          /* +0x01C  checked nonzero (from func_ov002_0220c8b0) */
    /* +0x01D – +0x02F  gap */
    Ov002Slot      slots[5];       /* +0x030  5-slot array, each Ov002Slot is 0x14 bytes */
    /* +0x030 + 5*0x14 = +0x094 ... */
    /* +0x094 – +0x867  gap */
} Ov002FieldZone;                  /* sizeof = 0x868 */

typedef struct Ov002Slot {
    /* +0x000 – +0x007  gap */
    unsigned short f4;             /* +0x004 (from cf1a6 table, u16) — node lookup value */
    /* +0x006 – +0x007  gap */
    unsigned int   id_lo13 : 13;   /* +0x008  13-bit card/slot id (lsl#19 >> #19) */
    /* word at +0x008 bits 13–31 gap */
    unsigned short f_0e;           /* +0x00E  u16 nonzero check */
    /* +0x010 – +0x013  gap */
} Ov002Slot;                       /* stride = 0x14 (20 bytes) */

extern Ov002FieldZone data_ov002_022cf16c[2];  /* player 0 + player 1 */
```

## Accessing the per-player base

```c
/* standard access pattern in matched ov002 .c files: */
char *base = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
int count  = *(int *)base;                  /* +0x000: zone_count */
int flag   = *(int *)(base + 0x010);        /* +0x010: f_010 */
```

## Parallel companion arrays (same stride)

Several related globals use the same `(player & 1) * 0x868` stride pattern,
indicating they are parallel fields of the same conceptual per-player record:

```c
extern char data_ov002_022cf178[];  /* event count (compared to > 6 threshold) */
extern char data_ov002_022cf17c[];  /* 0x260 list — checked nonzero before calling func_ov002_021ff3bc */
extern char data_ov002_022cf184[];  /* 0x3a0 list — per-player count */
extern unsigned short data_ov002_022cf1a6[];  /* node lookup u16 table — same 0x868 stride */
```

## Slot sub-array

The 5-slot sub-array at `+0x030` (one per field zone position) uses an inner
stride of 0x14 bytes. Each slot is identified by:

- `slot.id_lo13` — the card occupying the slot, as a 13-bit bitfield
  (`(word << 19) >> 19` in matched assembly → must be `: 13` not `& 0x1fff`)
- `slot.f4` — a u16 node-lookup value loaded from the `cf1a6` companion table

The slot is "empty" when `slot.id_lo13 == 0` (tested as `!= 0` in field loop).

## Field at +0x1C and +0x884 (cross-player check)

`func_ov002_0220c8b0` tests whether the sum of both players' zone states is
nonzero:

```c
/* data_ov002_022cf16c as a flat struct: */
typedef struct {
    char _pad_1c[0x1c];
    int  f_1c;
    char _pad_884[0x868 - 0x1c - 4];  /* = 0x844 bytes */
    int  f_884;                        /* player-1 region at same relative offset */
} state_022cf16c_t;
/* returns (f_1c + f_884) != 0 */
```

## Using functions (sample)

- `func_ov002_021c9be8` — reads `zone_count` (player card-in-zone counter vs threshold)
- `func_ov002_021b359c` — 5-iteration slot loop over `slots[]`, reads `id_lo13`
- `func_ov002_021d6e70` — ring walk via `cf1a8` companion; node `f4 : 4` type field
- `func_ov002_0220bcb8` — nonzero check on `f_010`
- `func_ov002_022087f8` — checks `cf17c[player*0x868/4]` before calling func
- `func_ov002_022819d4` — `cf178` event count `> 6` threshold
- `func_ov002_0220c8b0` — cross-player `f_1c + f_884 != 0`
