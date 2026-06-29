[//]: # (markdownlint-disable MD013 MD041)

# Overlay Constants Catalog

Constants, enum-like integer sets, and magic numbers from overlay source files
outside ov002 (which has its own documentation). Covers: ov000, ov004, ov006,
ov011, ov013. Patterns inferred from matched `.c` files; all values confirmed
by reading the actual compiled source.

Do NOT duplicate values already in BitFlagMasks.md (0x1F00, 0x8000, 0x807FFFFF,
0xFFE01FFF, 0x1, 0xFF), DuelStateEnums.md, EntityTypeTags.md, or CardIdRanges.md.

---

## ov006 constants

ov006 is the multi-state "duel/overworld co-routine manager" overlay. It
contains 8 parallel per-state sub-machines, each with its own state word,
callback table, and VRAM setup. The state word values and audio channel fields
are the most important constants.

### Per-state sub-machine state enum

```c
typedef enum Ov006SubState {
    OV006_STATE_INIT     = 0,  /* pre-init / before first audio load */
    OV006_STATE_AUDIO    = 2,  /* audio bank loaded and started */
    OV006_STATE_READY    = 3,  /* both subsystem probes passed */
    OV006_STATE_ACTIVE   = 4,  /* full 6-step init complete, running */
    OV006_STATE_DONE     = 5,  /* finalize complete (teardown path) */
    OV006_STATE_SETTLE   = 6,  /* settle pass triggered (cf140 guard) */
    OV006_STATE_STEP7    = 7,  /* init+c19a8 complete */
    OV006_STATE_STEP8    = 8,  /* finalize via 021b43a0 path */
    OV006_STATE_STEP9    = 9,  /* func_ov005 bridge complete */
} Ov006SubState;
```

Confirmed: `func_ov006_021b2324` (→2), `func_ov006_021b2804` (→3),
`func_ov006_021b3290` (→4), `func_ov006_021b2f70` / `func_ov006_021b355c` (→5),
`func_ov006_021b2970` (→6), `func_ov006_021b287c` (→7),
`func_ov006_021b43a0` (→8), `func_ov006_021b2b08` (→9).

Each state struct is a global `int[]`; `[0]` is the state word, `[1]` is a
cleared flag, `[2]` is the "full-init arg" (display mode selector), `[3]` is
the teardown handle. There are at least six parallel structs:
`data_ov006_021cf140`, `data_ov006_0224f1b0`, `data_ov006_0224f1fc`,
`data_ov006_0224f248`, `data_ov006_0224f290`, `data_ov006_0224f2e8`.

### Dispatch table index sentinel (no-callback path)

```c
/* func_020071a4 toast call used when callback table entry is null */
#define OV006_DISPATCH_TOAST_CMD  4
#define OV006_DISPATCH_TOAST_SLOT 1
/* func_ov006_021b343c / func_ov006_021b4048 no-callback tail */
/* func_020071a4(4, 1, data_ov006_021cb518) */
```

Confirmed: `func_ov006_021b343c`, `func_ov006_021b4048`.

### Audio init constants

```c
/* func_ov006_021b2324: sound bank load + deferred start */
#define OV006_AUDIO_VOLUME_MAIN   0xa0   /* passed to func_020018d4 (master vol) */
#define OV006_AUDIO_WAVERAM_SIZE  0x80000 /* func_0200197c arg2: wave archive size */
#define OV006_AUDIO_DEFERRED_CMD  0x24   /* func_020373cc arg0: deferred-start opcode */

/* func_ov006_021b3498: channel-gated variant */
#define OV006_AUDIO_VOLUME_CHAN   0xa2   /* func_02001b18 alt path when chan != 0 */
```

Confirmed: `func_ov006_021b2324`, `func_ov006_021b3498`.

### Full-init VRAM binding constants

The "full-init family" (7 members, all structurally identical) calls
`func_02094504` with these fixed arguments to bind four VRAM banks before
re-setting the engines. These are NitroSDK VRAM DMA control values:

```c
/* func_02094504(mode, dest, size) VRAM DMA calls — same in all 7 full-init siblings */
#define OV006_VRAM_PALETTE_MODE   0xc0         /* palette VRAM: mode = 0xc0 */
#define OV006_VRAM_PALETTE_A      0x7000000    /* dest = OAM palette VRAM bank A */
#define OV006_VRAM_PALETTE_B      0x7000400    /* dest = OAM palette VRAM bank B */
#define OV006_VRAM_TILE_BASE      0x5000000    /* dest = BG tile VRAM base */
#define OV006_VRAM_TILE_BASE_B    0x5000400    /* dest = BG tile VRAM bank B */
#define OV006_VRAM_OBJ_BASE       0x6800000    /* dest = OBJ/sprite VRAM base */
#define OV006_VRAM_OBJ_SIZE       0xa4000      /* size = 0xa4000 bytes sprite VRAM */
#define OV006_VRAM_BLOCK_SIZE     0x400        /* standard 1 KB block */
```

### Full-init 2D engine layer parameters (display-mode path A, arg != 0)

```c
/* BG layer plane settings when arg=1 (full-3D mode): */
#define OV006_BG_MODE_3D          0x60   /* func_0208da2c: BG0 in 3D mode */
#define OV006_BG_PRIORITY_BG1     3      /* func_0208d4f0 */
#define OV006_BG_SIZE_BG2         0x10   /* func_0208d3fc */
#define OV006_BG_PRIORITY_BG3     4      /* func_0208d138 */
#define OV006_BG_OBJ_PRIO         8      /* func_0208d0bc */
#define OV006_BG_WIN_A            0x80   /* func_0208d030 */
#define OV006_BG_WIN_B            0x100  /* func_0208cfa4 */
```

### Full-init 2D engine layer parameters (display-mode path B, arg == 0)

```c
/* BG layer settings when arg=0 (2D mode): */
#define OV006_BG_MODE_2D          1      /* func_0208da2c */
#define OV006_BG_SUB_BG0          2      /* func_0208d8c0 */
#define OV006_BG_SUB_BG1          0x20   /* func_0208d7ac */
#define OV006_BG_SUB_BG2          0x40   /* func_0208d6f4 */
/* BG3,OBJ,WIN settings shared with path A: 4, 8, 0x80, 0x100 */
```

### Full-init IRQ / sub-display constants

```c
/* Sub-display and IRQ arming (both display-mode paths): */
#define OV006_SUB_DISP_MODE       0x10000  /* ORR into 0x04001000: sub display on */
#define OV006_IRQ_FRAME_TIMER     3        /* func_020211b4 arg0 */
#define OV006_IRQ_FRAME_PERIOD    8        /* func_020211b4 arg1 */
#define OV006_IRQ_HBLANK_TIMER    5        /* func_020211b4 arg0 */
#define OV006_IRQ_HBLANK_PERIOD   0xa8     /* func_020211b4 arg1 */
/* DMA copy args when arg!=0: */
#define OV006_DMA_BLOCK_SRC       0x10     /* func_0200f854 arg1 */
#define OV006_DMA_BLOCK_DEST      0x18000  /* func_0200f854 arg2 */
#define OV006_DMA_BLOCK_SIZE      0x3000   /* func_0200f854 arg4 */
#define OV006_DISP_BLANK_CMD      0x14     /* func_020057c8 arg0 */
```

Confirmed: `Ov006_FullInit`, `func_ov006_021b2400`, `func_ov006_021b359c`,
`func_ov006_021b3b40`, `func_ov006_021b43d8`.

### DISP_MAIN master-bright register blend mask

```c
/* func_ov000_021ab8b4 / ov006 display-mode switch family */
#define OV006_BLEND_MASK  0xc0   /* bits 6-7 of BLDCNT (blend effect select) */
/* DISPCNT display-mode field mask (shared with BitFlagMasks.md 0x1F00) */
/* Sub-engine enable: 0x10000 into 0x04001000 */
```

### Stride-table / slot count constants (func_ov006_021b6250 family)

```c
/* func_ov006_021b6250: seed stride tables; loop runs 5 iters, only i==0 runs */
#define OV006_STRIDE_SLOT_COUNT  5   /* table has 5 slots; 0..4 */
#define OV006_STRIDE_COL_COUNT   7   /* 7 columns per slot (idx 0..6) */
/* func_ov006_021b7b48: 5-iter-pass family */
/* func_ov006_021cc374 (ov011): 5-entry actor table, stride 0x14 */
```

### Lazy-init factory args (func_ov006_021b8c50)

```c
/* func_02006c0c(template, priority, flags) lazy task creation */
#define OV006_TASK_PRIORITY  4   /* second arg to func_02006c0c */
#define OV006_TASK_FLAGS     0   /* third arg */
```

Confirmed: `func_ov006_021b8c50`, `func_ov006_021b3290` (via `func_ov006_021b9ef8`).

---

## ov004 constants

ov004 is the "duel field / card placement / touch-panel" overlay. Key constant
families are: voice SE base ID, touch-region boundaries, phase state values,
timer seed values, and broadcast channel IDs.

### Voice SE base ID

```c
/* func_ov004_021c9d60: play voice for index 0..24 */
#define OV004_VOICE_SE_BASE  1601  /* func_0202c0c0(b + 1601); b in [0, 24) */
#define OV004_VOICE_SE_COUNT 25    /* valid range: 0..24 inclusive */
```

Confirmed: `func_ov004_021c9d60`.

### SE (sound effect) IDs used directly

```c
/* func_ov004_021d3818: card-placement teardown */
#define OV004_SE_PLACEMENT_TEARDOWN  232  /* func_0202c0c0(232) */
/* func_ov004_021da848: id-change handler base offset */
#define OV004_SPRITE_ID_OFFSET       219  /* id + 219 fires the change handler */
```

Confirmed: `func_ov004_021d3818`, `func_ov004_021da848`.

### Broadcast channel IDs (func_02034888 / func_0201cd1c)

```c
/* func_02034888(channel, buf, len) — multi-player broadcast */
#define OV004_BCAST_CHAN_MOVE    3   /* cursor-move / status packets */
#define OV004_BCAST_CHAN_CMD     6   /* 0201cd1c command channel */

/* func_02037208(msg_id, -1, 0, 1) toast notification IDs used in ov004: */
#define OV004_TOAST_CURSOR_SET   56  /* func_ov004_021d9724: cursor set */
#define OV004_TOAST_PANEL_OPEN   58  /* func_ov004_021d1360 / 021d9778 */
#define OV004_TOAST_CONFIRM      66  /* func_ov004_021ceb24 / 021d97c8 / 021cc3c0 */
```

Confirmed: `func_ov004_021ceb24`, `func_ov004_021d97c8`, `func_ov004_021d9724`,
`func_ov004_021d1360`, `func_ov004_021d9778`, `func_ov004_021cc3c0`.

### Phase state enum (b500+0x54)

```c
/* func_ov004_021d7c00: drive the b500.54 phase word */
typedef enum Ov004Phase {
    OV004_PHASE_IDLE    = 0,  /* no action in progress */
    OV004_PHASE_ENTER   = 2,  /* entering: latched early (v < 2) */
    OV004_PHASE_LEAVE   = 4,  /* leaving: bumped from enter on exit */
    OV004_PHASE_CMD_15  = 15, /* func_ov004_021d13dc status-15 phase */
    OV004_PHASE_CMD_16  = 16, /* func_ov004_021d1360 abort path */
} Ov004Phase;
```

Confirmed: `func_ov004_021d7c00`, `func_ov004_021d13dc`, `func_ov004_021d1360`.

### Timer seed values (func_ov004_021d4004 / 021d4238 / 021d4958 family)

```c
/* Timer record unk30 seed — differs by mode/context: */
#define OV004_TIMER_SEED_SHORT    4   /* func_ov004_021d4238: 020331f8!=1 path */
#define OV004_TIMER_SEED_LONG     8   /* func_ov004_021d4238: 020331f8==1 path */
#define OV004_TIMER_SEED_NTSC_A   17  /* func_ov004_021d4004: non-mode2 path */
#define OV004_TIMER_SEED_NTSC_B   23  /* func_ov004_021d4004: mode2 path */
#define OV004_TIMER_SEED_BRIDGE   11  /* func_ov004_021d4958: 020336a4 path */
```

Confirmed: `func_ov004_021d4004`, `func_ov004_021d4238`, `func_ov004_021d4958`.

### Mode value discriminator (b500+0x230)

```c
/* func_ov004_021ce9b8: active + mode==3 test */
#define OV004_MODE_3  3  /* b500.230 == 3 means "full active duel mode" */
```

### Touch-region boundaries

```c
/* func_ov004_021cc2f0 / 021cc3c0 / 021cec8c: touch-hit detection */
/* Main-field hit: z in [36, 193), x < 32, y < 30 */
#define OV004_FIELD_Z_MIN    36
#define OV004_FIELD_Z_MAX    193
/* Cancel/confirm zone: z in [228, 254) */
#define OV004_CANCEL_Z_MIN   228
#define OV004_CANCEL_Z_MAX   254
/* Extra close-field zone (021cec8c): c in [224,250), a in [164,190) */
#define OV004_EXTRA_C_MIN    224
#define OV004_EXTRA_C_MAX    250
#define OV004_EXTRA_A_MIN    164
#define OV004_EXTRA_A_MAX    190
/* Touch start zone (021d02f4): Q < 20 && N < 20 && P >= 227 && M >= 227 */
#define OV004_START_CORNER_MIN  227
#define OV004_START_Y_MAX       20
```

### Record type tag (func_ov004_021cc74c)

```c
/* Record type-demote: type-6 entry demoted to 2 when flag clear */
#define OV004_REC_TYPE_6  6  /* full/extended record */
#define OV004_REC_TYPE_2  2  /* demoted / compact record */
```

Confirmed: `func_ov004_021cc74c`.

### Struct-init literal (func_ov004_021d3a58)

```c
/* func_ov004_021d3a58: leaf struct seed */
#define OV004_STRUCT_FIELD12  35  /* p[12] = 35 */
#define OV004_STRUCT_FIELD14   1  /* p[14] = 1  */
```

### Backdrop palette triangle-wave fold (func_ov004_021d5d84)

```c
/* func_ov004_021d5d84: grayscale triangle wave from frame counter */
#define OV004_BACKDROP_FOLD  64   /* (counter & 63): fold point at v >= 32 */
#define OV004_BACKDROP_HALF  32   /* triangle folds here: v = 31 - (v - 32) */
/* Palette write to 0x0500045E: v | (v<<5) | (v<<10) */
```

### Data-transfer packet size (func_ov004_021d66f4)

```c
/* func_ov004_021d66f4: broadcast a 512-byte packet */
#define OV004_PKT_SIZE  0x126  /* func_02034888(3, buf, 0x126) */
```

---

## ov011 constants

ov011 is the "field/overworld view" overlay — handles map display, actor
management, BG scroll, and the view-settle loop. Key constants are: actor table
size, coordinate array capacity, cell config flags, and view-mode values.

### Actor table parameters

```c
/* func_ov011_021cc374 / 021cc3d4 / 021cc3d4: scan first 5 actor entries */
#define OV011_ACTOR_TABLE_COUNT   5    /* entries in data_ov011_021d41a0 */
#define OV011_ACTOR_ENTRY_STRIDE  0x14 /* bytes per entry */

/* func_ov011_021d0ffc: 2-bit state nibble of coord-array[slot].+8 */
#define OV011_COORD_SLOT_COUNT    16   /* coord array has slots 0..15 */
#define OV011_COORD_OOB_STATE      1   /* returned for out-of-range slot */
```

Confirmed: `func_ov011_021cc374`, `func_ov011_021cc3d4`, `func_ov011_021d0ffc`.

### Coord array slot states (bits 1:0 of +8 field)

```c
/* func_ov011_021cad00: slot-state test */
typedef enum Ov011SlotState {
    OV011_SLOT_IDLE    = 0,  /* slot inactive / not claimed */
    OV011_SLOT_CLOSING = 2,  /* slot closing (triggers Y nudge up by 0x10000) */
} Ov011SlotState;
```

Confirmed: `func_ov011_021cad00`.

### Coord array layout

```c
/* func_ov011_021d0fb0 / 021d0ffc: stride-0x28 parallel arrays */
#define OV011_COORD_STRIDE   0x28  /* bytes per coord-array slot */
#define OV011_COORD_X_OFF    0     /* data_ov011_021d4660 + idx*0x28 */
#define OV011_COORD_Y_OFF    0     /* data_ov011_021d4664 + idx*0x28 (sibling array) */
/* func_ov011_021d1884: reset all 10 coord slots */
#define OV011_COORD_SLOT_RESET_COUNT 10
/* func_ov011_021d0c1c: Fill32(0, &data_ov011_021d4660, 0x1a0) clears the whole array */
#define OV011_COORD_ARRAY_SIZE  0x1a0  /* 416 bytes = 10 * 0x28 + slack */
```

Confirmed: `func_ov011_021d1884`, `func_ov011_021d0c1c`, `func_ov011_021d0fb0`.

### View mode enum (bits 2:0 of data_ov011_021d4000+0x27C)

```c
/* func_ov011_021cad00: view-mode gate */
typedef enum Ov011ViewMode {
    OV011_VIEW_SCROLL   = 0,  /* free-scroll mode */
    OV011_VIEW_SLOT     = 3,  /* slot-anchored view */
} Ov011ViewMode;
```

Confirmed: `func_ov011_021cad00`.

### Cell config flags (func_0201e964 / func_0207fd28)

```c
/* func_ov011_021cc424: cell reconfigure */
#define OV011_CELL_FLAGS_A   0x2000  /* func_0201e964 arg8 (= 8192) */
#define OV011_CELL_W_A       64      /* func_0201e964 arg9: cell width */

/* func_ov011_021cc5c4: sibling over ov000 handle table */
#define OV011_CELL_FLAGS_B   0x1C000 /* func_0201e964 arg8 (= 114688) */
#define OV011_CELL_STRIDE_B  0x600   /* func_0201e964 arg9 (= 1536) */

/* func_ov011_021cc8bc: player status cell */
#define OV011_STATUS_CELL_FLAGS  0x1D680  /* func_0201e964 arg8 */
#define OV011_STATUS_CELL_W      64       /* func_0201e964 arg9 */
#define OV011_STATUS_CELL_ROW    16       /* func_0201e964 arg6 */

/* Release flag shared across all cell free calls */
#define OV011_CELL_FREE_FLAGS  0x1000    /* func_0207fd28 second arg */
```

Confirmed: `func_ov011_021cc424`, `func_ov011_021cc5c4`, `func_ov011_021cc8bc`,
`func_ov011_021cc250`, `func_ov011_021cc344`.

### Scroll scale (func_ov011_021cc7a0)

```c
/* func_ov011_021cc7a0: scale input by 0xFF, then by 0x400 << (12 + (arg1==1)) */
#define OV011_SCROLL_SCALE    0xFF   /* first scale factor */
#define OV011_SCROLL_BASE_SH  12     /* base left-shift before mode add */
/* Result: arg0 * 0xFF * (0x400 << 12) in mode 0, or * (0x400 << 13) in mode 1 */
/* Output count: 3 (mode 0) or 1 (mode 1) */
```

### SystemWork field offsets used in ov011

```c
/* func_ov011_021c9d60 / 021c9da0: bit 12 of word 0x900 in SystemWork */
#define OV011_SYSWORK_MODE_WORD  0x900   /* offset into GetSystemWork() */
#define OV011_SYSWORK_BIT12      (1<<12) /* checked via lsl#19/lsr#31 */
/* func_ov011_021c9da0: mirror bit into ov000.278 bit 16 */
#define OV011_OV000_FLAG_BIT16   0x10000
```

Confirmed: `func_ov011_021c9d60`, `func_ov011_021c9da0`.

### Actor remap threshold (func_ov011_021cff48)

```c
/* func_ov011_021cff48: if actor id's unk8 >= 0x10, remap to +0x55 */
#define OV011_ACTOR_REMAP_THRESH  0x10  /* unk8 byte threshold */
#define OV011_ACTOR_REMAP_OFFSET  0x55  /* offset applied above threshold */
```

### Lookahead table stride (func_ov011_021d1f9c)

```c
/* func_ov011_021d1f9c: data_ov011_021d35ec is a 0xa-stride table */
#define OV011_LOOKAHEAD_ROW_STRIDE  0xa  /* 10 bytes per row */
/* Access: table[(a0-1)*0xa + (a1-1)], 1-indexed on both axes */
```

---

## ov013 constants

ov013 is the "deck-list / inventory page" overlay — displays pages of cards
with navigation and BLDALPHA fade.

### Slot-to-cell mapping

```c
/* Ov013_SlotToCell: logical slot id → hardware cell index */
typedef enum Ov013Slot {
    OV013_SLOT_0 = 0,  /* → cell 8  */
    OV013_SLOT_1 = 1,  /* → cell 4  */
    OV013_SLOT_2 = 2,  /* → cell 3  */
    OV013_SLOT_3 = 3,  /* → cell 5  */
    OV013_SLOT_4 = 4,  /* → cell 6  */
    OV013_SLOT_5 = 5,  /* → cell 0x46 (70) */
    OV013_SLOT_6 = 6,  /* → cell 9  */
    OV013_SLOT_7 = 7,  /* → cell 0xa (10) */
} Ov013Slot;
#define OV013_SLOT_COUNT  8
```

Confirmed: `Ov013_SlotToCell`, `Ov013_SetPage`.

### Page layout constant

```c
/* Ov013_GetPageCount: ceil-ish divide by 3 */
#define OV013_CARDS_PER_PAGE  3  /* (count + 2) / 3 */
```

### BLDALPHA register layout (Ov013_SetBlendAlpha)

```c
/* Ov013_SetBlendAlpha: pack EVA/EVB into BLDALPHA at 0x4000014/0x5001014 */
#define OV013_BLDALPHA_SHIFT   12       /* .12 fixed-point → integer */
#define OV013_EVA_MASK    0x1ff         /* bits 8:0 */
#define OV013_EVB_SHIFT        16       /* EVB at bits 24:16 */
#define OV013_EVB_MASK   (0x1ff << 16)
/* EVA read from data_ov013_021cbc00[0x178], EVB from [0x17c] */
```

Confirmed: `Ov013_SetBlendAlpha`.

### Engine power codes (Ov013_InitGraphics)

```c
/* func_02005c60 engine-power arg: */
#define OV013_ENGINE_MAIN  1  /* main display engine */
#define OV013_ENGINE_SUB   2  /* sub display engine */
/* func_ov000_021ace2c: palette-set index 0 = default */
#define OV013_PALETTE_DEFAULT  0
```

Confirmed: `Ov013_InitGraphics`.

### SetPage slide direction codes

```c
/* Ov013_SetPage: slide animation direction */
#define OV013_SLIDE_FORWARD  2  /* func_ov000_021ab4bc arg1=2 at end of SetPage */
#define OV013_SLIDE_NORMAL   1  /* arg1=1: forward/reverse slide arm */
/* reverse!=0 → func_ov000_021ab4bc(1,1); else func_ov000_021ab4ec(1,1) */
```

---

## ov000 constants

ov000 is the "overworld/base engine" overlay — actor movement, facing,
display-mode control, audio idle test. Constants are mostly display-register
fields and facing-state values.

### Actor facing enum

```c
/* func_ov000_021aa7e0: facing field (4 bits) */
typedef enum Ov000Facing {
    OV000_FACING_DOWN  = 0,
    OV000_FACING_LEFT  = 1,
    OV000_FACING_RIGHT = 2,
    OV000_FACING_UP    = 3,  /* sets status = 0xffff */
    OV000_FACING_WRAP  = 4,  /* triggers wrap handler before changing */
} Ov000Facing;

#define OV000_STATUS_UP_SENTINEL  0xffff  /* written to obj->status when facing==3 */
```

Confirmed: `func_ov000_021aa7e0`.

### Display engine selector

```c
/* func_ov000_021ab474 / 021ab8b4: which engine to operate on */
typedef enum Ov000Engine {
    OV000_ENGINE_MAIN = 0,  /* reg base 0x04000000 */
    OV000_ENGINE_SUB  = 1,  /* reg base 0x04001000 */
} Ov000Engine;

/* BG name-table field mask in DISPCNT: bits 13..15 */
#define OV000_DISPCNT_BG_NAME_MASK  0xe000
#define OV000_DISPCNT_BG_NAME_SHIFT 13
```

Confirmed: `func_ov000_021ab474`.

### Mode word bit positions (data_ov000_021c758c+0x2a4)

```c
/* func_ov000_021af3f0 / 021af420: mode-bit sets written to field_2a4 */
#define OV000_MODE_FLAG_A    0x800000   /* standard overlay mode: bit 23 */
#define OV000_MODE_FLAG_B    0x2000000  /* alternate overlay mode: bit 25 */
/* func_ov000_021af378: tests (field_2a4 >> 23) & 0xFF != 0 */
/* func_ov000_021af420 also checks (field_26c >> 23) & 0xFF != 3 */
#define OV000_SUBMODE_3      3  /* sub-mode "3" checked at +0x26c */
```

Confirmed: `func_ov000_021af3f0`, `func_ov000_021af420`, `func_ov000_021af378`.

### State-word field_2a4 keep/clear masks (func_ov000_021ae4d8)

```c
/* func_ov000_021ae4d8: OR-init pattern */
#define OV000_F2A4_SET_A    0xfe000    /* bits 17..23 */
#define OV000_F2A4_SET_B    0x100000   /* bit 20 */
/* combined: (field & 0xffe01fff) | 0xfe000 | 0x100000 */
/* Note: 0xffe01fff is in BitFlagMasks.md — do not duplicate here */
```

### Deferred-task ready bit (func_ov000_021aca28)

```c
/* func_ov000_021aca28: bit 30 of flags word (offset +0x98) */
#define OV000_TASK_READY_BIT  0x40000000  /* set = "task pending for dispatch" */
/* fields: task@+0x70, f74@+0x74, f7c@+0x7c, flags@+0x98, f9c@+0x9c */
```

### f_28 / f_2c clear masks (func_ov000_021af780)

```c
/* func_ov000_021af780: partial clear then set */
#define OV000_F28_CLEAR_MASK   0xff0        /* BIC bits 4..11 */
#define OV000_F2C_CLEAR_MASK   0x3c000000   /* BIC bits 26..29 */
#define OV000_F2C_SET_VALUE    0x18000000   /* ORR bits 27..28 */
```

Confirmed: `func_ov000_021af780`.
