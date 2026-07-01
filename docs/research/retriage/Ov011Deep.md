[//]: # (markdownlint-disable MD013 MD041)

# Deep Retriage: overlay011 (second pass)

Companion to `OverlayEFRetriage.md`'s "ov011, ov000, ov013, ov021 Newly
Tractable Funcs" section, which examined only 8 of ov011's 27 hard-tier (E/F)
functions in an early round: 4 upgraded to tractable (`0x021CCA04`,
`0x021CA400`, `0x021CABBC`, `0x021CB3B4` — all now matched `.c` files) and 4
confirmed-never entries (`0x021D0AFC`, `0x021D0B4C`, `0x021D2DE4`, `0x021CF0C8`
— still `.s`, not re-examined here).

This round examines the remaining **19** functions. **Newly tractable: 6**
(`0x021CA0C4`, `0x021CB25C`, `0x021D0938`, `0x021D0CAC`, `0x021D12C0`,
`0x021D1F04`). The other 13 are confirmed intractable for the same
fundamental reason across the board: they are large multi-way state-machine
bodies (bitfield-packed dispatch on the actor struct's `+0x268`/`+0x274`/
`+0x284`/`+0x270` fields) whose branch topology and register liveness cannot
be reproduced from source without an exact match to mwcc's scheduling of 40+
interdependent bic/orr/mla chains — three of them (`0x021CD754`, `0x021CE50C`
region marker aside, `0x021D02A4`) are outright cross-overlay-BL / data-as-code
`.word` bodies that cannot be C-sourced at all under the current toolchain
(brief 192/197 "Track A" class).

- **E/F count (whole overlay, from `OverlayEFRetriage.md` header):** 27
- **Examined this round:** 19
- **Newly tractable:** 6
- **Confirmed intractable (wall or hand-encoded):** 13

The actor struct `data_ov011_021d403c` (already partially documented from
round 1 with fields `+0x264`, `+0x268`, `+0x1fc`, `+0x200`, `+0x270`, `+0x280`)
is used by nearly every function in this batch and its known extent grows
substantially — see "New KB gaps found" for the consolidated field table.
**The offsets 0x274/0x284/0x18 named in the task brief are three distinct
fields, not one shared field**: `+0x274` and `+0x284` are both on
`data_ov011_021d403c` (separate bitfield/byte words), and `+0x18` is on an
*unrelated* per-slot record (the coord-slot array element, base
`data_ov011_021d4660`, stride 0x28) — see the dedicated subsection below.

---

## Summary table

| Address | Size | Orig. verdict | New verdict | Notes |
|---|---|---|---|---|
| 0x021CA0C4 | 608 B | F | **TRACTABLE** | Linear hardware-init sequence, no branches |
| 0x021CB25C | 344 B | F | **TRACTABLE** | Single-guard task-spawn + bitfield-pack (twin of matched 021cb3b4) |
| 0x021CBC1C | 780 B | E | WALL | Camera-follow: 6-way distance-banded branch + magic-mult div-by-100, register-order sensitive |
| 0x021CCB6C | 976 B | F | WALL | Per-frame field-tick: two parallel 4-branch scroll-clamp trees, order-fragile |
| 0x021CD35C | 536 B | F | WALL | Tile-highlight updater: nested loop with two conditional calls per iter, live-range heavy |
| 0x021CD754 | 492 B | F | WALL (data-as-code) | Raw `.word` hex body, hand-encoded cross-overlay BL — brief 192/197 Track A, not C-sourceable |
| 0x021CDC68 | 1320 B | F | WALL | Duel-launch: nested search loops + two independent dispatch tables, extreme reg pressure |
| 0x021CE50C | 2480 B | F | WALL (confirmed 'never') | 607-insn, 20+ branch targets on 3 bitfield words; genuine scheduling wall, not reshapeable |
| 0x021CFBCC | 892 B | F | WALL | 6-way jump table, each arm independent fixed-point fade math, order-fragile |
| 0x021CFFE4 | 704 B | F | WALL | Nested jump-table + secondary dispatch, nine overlapping guard chains |
| 0x021D02A4 | 1292 B | F | WALL (data-as-code) | Raw `.word` hex body, hand-encoded cross-overlay BL — brief 192/197 Track A |
| 0x021D0938 | 452 B | F | **TRACTABLE** | 3-way dispatch, mostly straight-line calls |
| 0x021D0CAC | 428 B | F | **TRACTABLE** | Two independent nearest-neighbour scan loops, deterministic control flow |
| 0x021D12C0 | 372 B | F | WALL | Shell-sort (gap=3n+1) + insertion pass on coord-slot indices; sort inner-loop register choreography |
| 0x021D1514 | 880 B | F | WALL | Per-slot animation tick: 3-level nested switch + `blx` through 2 fn-ptr fields, huge live set |
| 0x021D191C | 556 B | F | WALL | Actor-event dispatch: two near-duplicate 12-call blocks, LUT-index-heavy, order-fragile |
| 0x021D1D30 | 468 B | F | WALL | 8-way jump table on actor `+0x284` state byte; each arm is small but topology is the whole function |
| 0x021D1F04 | 152 B | E | **TRACTABLE** | Small jump-table pass-through with an additive fallback arm |
| 0x021D2428 | 2100 B | F | WALL | Path-object neighbour-fill: 8 unrolled near-identical blocks around a ring-buffer struct, purely mechanical size wall |

---

## Tractable functions

### 0x021CA0C4 — `Ov011_InitHardware` (608 B, class F)

**Original verdict:** F — "init sequence twin, 34 calls + MMIO bitfields"

**Upgrade reason:** The function is a single straight-line sequence (one
`stmdb`/`ldmia` pair, **zero internal branches**) of hardware setup calls —
`Fill32`, VRAM DMA (`func_02094504`), 2D-engine layer setters
(`func_0208d*`), and BLDCNT/DISPCNT MMIO bitfield packing. This exact call
shape (VRAM bank zero → engine-power on → BG mode/priority/size setters →
IRQ/timer arm → blend register init) is the documented "full-init family"
pattern from `OverlayConstants.md` §ov006 constants (`OV006_VRAM_*`,
`OV006_BG_*`, `OV006_IRQ_*` — same constant *shapes*, confirmed here as the
ov011 sibling using the identical VRAM/BG argument literals: `0x6800000`/
`0xa4000` OBJ VRAM, `0x7000000`/`0x400` palette A, `0x5000000`/`0x400` tile
base, BG mode/priority literals `0x1a`/`0x11`/`0x3f`/`0x8`). No live-range
ambiguity is possible because there is no branching to reorder around — the
only risk is store-order inside the four MMIO bitfield read-modify-write
blocks (`0x04000060`, `0x04000580`, `0x04000304`, `data_ov011_021d4000+0x2bc`/
`+0x238`/`+0x23c`/`+0x2a4`), which must be written in exactly the sequence
shown below.

**Struct/data dependencies:**
- `data_ov011_021d403c` — Fill32 target (zeroed for `0x624` bytes = the
  whole known+unknown actor-struct extent, confirming struct size is at
  least 0x624 bytes, well past the 0x2c0-ish extent implied by round-1
  fields).
- `data_02104f1c`, `data_ov011_021d40ac` — both existing globals, read via
  `[data_02104f1c + 0x1c]` then passed to `func_0207deb0`.
- `data_ov011_021d4000` — view-state global; bitfield packed at `+0x2bc`
  (clear+set low byte to `0xff`), `+0x238`=0, `+0x23c`=`0x19000`, `+0x2a4`
  (clear bits `0x1e00`, set `0x200`).

**Ground-truth pool words (literal pool order):**

| Label | Value |
|---|---|
| `_LIT0` | `data_ov011_021d403c` |
| `_LIT1` | `0x00000624` |
| `_LIT2` | `0x000001ff` |
| `_LIT3` | `0x04000060` |
| `_LIT4` | `0xffffcffd` |
| `_LIT5` | `0x0000cffb` |
| `_LIT6` | `0xbfff0000` |
| `_LIT7` | `0x04000580` |
| `_LIT8` | `data_02104f1c` |
| `_LIT9` | `data_ov011_021d40ac` |
| `_LIT10` | `0x04000304` |
| `_LIT11` | `0xffcfffef` |
| `_LIT12` | `data_ov011_021d4000` |

**Ground-truth BL/BLX callees (call order, verbatim):**

`Fill32`, `func_0200592c`, `func_0208d1e4`, `func_02094504` (×3, args
`(0,0x6800000,0xa4000)` / `(0xc0,0x7000000,0x400)` / `(0,0x5000000,0x400)`),
`func_0208cc90`, `func_ov000_021ab21c`, `func_0208e7ac`, `func_0208da2c(1)`,
`func_0208d7ac(0x40)`, `func_0208d8c0(2)`, `func_0208d6f4(0x20)`,
`func_0208c8cc(1,3,0)`, `func_ov000_021ab4bc(0,0x1a)`, `func_0208e5ec`,
`func_0207deb0(...,4)`, `func_0207e124(2,1)`, `func_0207e370(0x10000,1)`,
`func_0208d138(4)`, `func_0208d0bc(8)`, `func_0208d030(0x80)`,
`func_0208cfa4(0x100)`, `func_0208c8b0(0)`, `func_ov000_021ab4bc(1,0x11)`,
`func_0201d5c0` (×2, args `(?,4)` then `(9,4)` — r4 preserved across both
calls as literal `4`), `func_ov000_021af4bc`, `func_ov000_021aae54`,
`func_02005bfc` (×2, args `1` then `4`), `func_0208232c`,
`func_ov011_021ceebc`, `func_ov000_021ab6ec(0,0)`.

**C sketch:**

```c
void func_ov011_021ca0c4(void) {
    Fill32(0, data_ov011_021d403c, 0x624);
    func_0200592c();
    func_0208d1e4(0x1ff);
    func_02094504(0, 0x6800000, 0xa4000);   /* OBJ VRAM */
    func_0208cc90();
    func_02094504(0xc0, 0x7000000, 0x400);  /* palette A */
    func_02094504(0, 0x5000000, 0x400);     /* tile base */
    func_ov000_021ab21c();
    func_0208e7ac();
    func_0208da2c(1);
    func_0208d7ac(0x40);
    func_0208d8c0(2);
    func_0208d6f4(0x20);
    func_0208c8cc(1, 3, 0);
    func_ov000_021ab4bc(0, 0x1a);

    /* MMIO bitfield packing at 0x04000060 (BGCNT-ish 16-bit reg) */
    volatile unsigned short *reg60 = (volatile unsigned short *)0x04000060;
    *reg60 &= 0xffffcffd;
    unsigned int shifted = 0xffffcffd >> 0x11;   /* unused temp per asm, kept for shape */
    *reg60 &= ~0x3000; *reg60 |= 0x10;
    *reg60 &= 0x0000cffb;
    *reg60 &= ~0x3000; *reg60 |= 0x8;
    *(volatile int *)0x040004e0 = 2;

    func_0208e5ec();
    *(volatile int *)0x04000580 = 0xbfff0000;
    func_0207deb0(*(int *)((char *)&data_02104f1c + 0x1c), data_ov011_021d40ac, 4);
    func_0207e124(2, 1);
    func_0207e370(0x10000, 1);
    func_0208d138(4);
    func_0208d0bc(8);
    func_0208d030(0x80);
    func_0208cfa4(0x100);
    func_0208c8b0(0);
    func_ov000_021ab4bc(1, 0x11);

    /* dual-register MMIO block at 0x04000304 / +0x1000 */
    volatile unsigned short *r304 = (volatile unsigned short *)0x04000304;
    *r304 &= ~0x8000;
    *(volatile int *)0x04000000 = (*(volatile int *)0x04000000 & 0xffcfffef) | 0x10 | 0x200000;
    *(volatile int *)0x04001000 = (*(volatile int *)0x04001000 & 0xffcfffef) | 0x10 | 0x200000;

    func_0201d5c0(0, 4);
    func_0201d5c0(9, 4);
    func_ov000_021af4bc();
    func_ov000_021aae54();
    func_02005bfc(1);
    func_02005bfc(4);
    func_0208232c();

    data_ov011_021d4000->f2bc = (data_ov011_021d4000->f2bc & ~0xff) | 0xff;
    data_ov011_021d4000->f238 = 0;
    data_ov011_021d4000->f23c = 0x19000;
    data_ov011_021d4000->f2a4 = (data_ov011_021d4000->f2a4 & ~0x1e00) | 0x200;

    func_ov011_021ceebc();
    func_ov000_021ab6ec(0, 0);
}
```

**Levers:** No branches to preserve — the only risk is mwcc reordering the
four back-to-back `bic/orr` pairs at `0x04000060`; write them in exactly the
shown sequence (each `ldrh`/`strh` round-trips through the same register)
since mwcc's scheduler is sensitive to whether the four operations are
expressed as four separate statements vs. folded expressions. Do not
introduce a local `.15` cache for the `0x04000060` register — the assembly
re-reads it after every write.

---

### 0x021CB25C — `Ov011_InitCellHandles` (344 B, class F)

**Original verdict:** F — "84 insns, dense stack-struct bitfield packing,
store-order"

**Upgrade reason:** This is a near-twin of the already-matched
`func_ov011_021cb3b4.c` (`Ov011_FreeCellHandles`, upgraded in round 1) —
same `func_0201d47c`/bitfield-pack/`func_0201e5b8`/`Task_Invoke` skeleton,
but gated by a single guard (`data_ov011_021d4000+0x2d4 != 0`) instead of a
mode dispatch, and it tail-calls the already-named `Bg_SetScroll` instead of
a template lookup. The bitfield-pack section on the 0x28-byte stack
`TaskConfig` uses the exact same immediate encodings (`bic r0,#0xf / orr
r0,#0x3`, `bic ...,#0x7f/#0x3f80/#0x1c000` then `orr #0xc000`) as the sibling,
confirming the recipe transfers directly. The conditional inner block (when
`act[0x264] == 1`) packs LUT-derived bytes into `cfg+0x24/+0x26` exactly as
`021cb3b4` does for its mode==1 path — this is the *third* sighting of this
`TaskConfig` bitfield idiom (also in `021ca324.c`), making it a confirmed
KB-level pattern rather than a one-off guess.

**Struct/data dependencies:** `data_ov011_021d4000` (`+0x2d4` guard flag),
`data_ov011_021d403c` (`+0x298` template-select word, `+0x264` camera-lock
flag). No new globals — all four extern symbols in this file
(`data_ov011_021d4000`, `data_ov011_021d403c`, `func_0201d47c`,
`func_0201e5b8`) are already-documented KB facts.

**Ground-truth pool words:**

| Label | Value |
|---|---|
| `_LIT0` | `data_ov011_021d4000` |
| `_LIT1` | `data_ov011_021d403c` |

**Ground-truth BL/BLX callees (call order):** `func_0201d47c`,
`func_0201e5b8`, `Task_Invoke`, `func_0208c8cc(1, {0 or 3}, 0)`,
`Bg_SetScroll` (always called, even on the early-return path).

**C sketch:**

```c
void func_ov011_021cb25c(void) {
    if (data_ov011_021d4000->f2d4 != 0) {
        int cfg[0x28 / 4];
        func_0201d47c(cfg);

        unsigned short *f14 = (unsigned short *)((char *)cfg + 0x14);
        *f14 = (*f14 & ~0xf) | 3;
        int *f18 = (int *)((char *)cfg + 0x18);
        int *f1c = (int *)((char *)cfg + 0x1c);
        *f18 = (*f18 & ~(0x7f | 0x3f80 | 0x1c000)) | 0xc000;
        *f1c = (*f1c & ~0xff00) | 0x2000;
        cfg[0x8/4] = 0; cfg[0xc/4] = 0;
        *(unsigned short *)((char *)cfg + 0x10) = 0x200;
        cfg[0] = data_ov011_021d403c->f298;   /* str lr, [sp] */
        *f14 |= 0x10;
        *f1c = (*(int *)((char *)cfg + 0x1c) & ~0xff00) | 0x20;  /* f1c reload+patch */

        if (data_ov011_021d403c->f264 == 1) {
            unsigned short *f26 = (unsigned short *)((char *)cfg + 0x26);
            unsigned short *f24 = (unsigned short *)((char *)cfg + 0x24);
            *f26 = (*f26 & ~0xff) | 0x40;
            *f14 = (*f14 & ~0xf);
            *f24 = (*f24 & ~0xff);
            /* second pass re-reads and folds high byte */
            *f1c = (*(int *)((char *)cfg + 0x1c) & ~0xff) | 0x40;
            *f26 = (*(unsigned short *)((char *)cfg + 0x26) & ~0xff00) | 0x4000;
            *(unsigned short *)((char *)cfg + 0x16) = 0x4000;
            *f14 = (*(unsigned short *)((char *)cfg + 0x14) & ~0x10);
            *(unsigned short *)((char *)cfg + 0x10) = 0;
            *(int *)((char *)cfg + 0x20) = 0x20;
        }

        func_0201e5b8(cfg);
        Task_Invoke(cfg[0]);

        int mode = data_ov011_021d403c->f264;
        data_ov011_021d403c->f298 = 0;
        func_0208c8cc(1, mode == 1 ? 0 : 3, 0);
    }
    Bg_SetScroll();
}
```

**Levers:** `Bg_SetScroll()` is called unconditionally at the tail even on
the guard's false path — do NOT put it inside the `if`. The `f1c` field is
written, reloaded, and re-patched twice in sequence (visible as two separate
`str .../ldr .../bic-orr/str` groups in the assembly) — write it as two
sequential statements rather than folding into one, to match mwcc's
intermediate reload. Cross-reference `021cb3b4.c`'s "Try this" notes — the
same warnings about `cfg[0]` ordering apply here.

---

### 0x021D0938 — `Ov011_SpawnActorTask` (452 B, class F)

**Original verdict:** F — "110-insn branchy state body, many calls"

**Upgrade reason:** Despite ~110 instructions, control flow is a clean
3-way `switch` on `data_ov011_021d4000+0x2a0` (the documented view-mode
word: `OV011_VIEW_SCROLL=0` / `OV011_VIEW_SLOT=1` / other) followed by a
**shared straight-line tail** — every branch converges before any
subsequent guard chain, so there's no reg-alloc ambiguity from interleaved
paths. The `data_021040ac+0x3c`/`+0x40` writes match the already-matched
`func_ov011_021d091c.c` ("Sets data_021040ac+0x3c=0x17, +0x40=0" —
`Ov011_InitTaskParams`), confirming this function's job-queue literals
(`5`, `2`, `0x15`) are alternate job codes in the *same* job-request struct.
`func_02018e88`, `func_02019160`, `func_ov011_021cc7a0` (documented "scale
blend" helper), and `func_ov011_021cd6e0` (documented Y-delta getter) are
all confirmed by existing matched siblings in this overlay.

**Struct/data dependencies:** `data_ov011_021d4000` (`+0x2a0` view mode),
`data_ov011_021d403c` (`+0x268` actor-facing/slot field — read at three
different bit-widths: `lsl#0x13/lsr#0x1c` = 4-bit at bits 9-12,
`lsl#0x17/lsr#0x1c` also 4-bit but bits 8-11 — **two distinct 4-bit
sub-fields packed into the same word**, `+0x21c`/`+0x220` coordinate pair,
`+0x258` a byte-packed field read at `lsl#0xe/lsr#0x18`, `+0x264` mode/state
word). `data_021040ac` (`+0x3c` job code, `+0x40` job arg — confirmed shared
struct with `021d091c.c`).

**Ground-truth pool words:**

| Label | Value |
|---|---|
| `_LIT0` | `data_ov011_021d4000` |
| `_LIT1` | `data_ov011_021d403c` |
| `_LIT2` | `data_021040ac` |

**Ground-truth BL/BLX callees:** `func_02018e88` (called with either
`(0,-1,-1)` in the mode==0 branch or `(0, act[0x21c], act[0x220])` in the
mode==1 branch — both feed into the shared tail), `func_02019160`,
`func_ov000_021ac760` (×3, on sub-objects at `+0x178`/`+0x18c`/`+0x1a0`),
`func_ov000_021ae4ac`, `func_ov011_021cd6e0`, `func_ov011_021cc7a0(0/1, 0)`,
`func_020139fc`, `func_02018b34(0)`, `func_ov011_021cefb4`,
`func_ov011_021d091c`, `func_ov011_021c9e98(0)`, `func_02018b48`,
`func_ov011_021d0ffc`, `func_ov011_021d1028`, `func_ov011_021d0884`
(always called at the very end, all paths converge here).

**C sketch:**

```c
int func_ov011_021d0938(void) {
    ActorState *act = data_ov011_021d403c;
    int view = data_ov011_021d4000->f2a0;

    if (view == 0) {
        func_02018e88(0, -1, -1);
    } else if (view == 1) {
        func_02018e88(0, act->f21c, act->f220);
    }
    /* view >= 2: falls straight through, no call */

    int slot_a = (unsigned int)(act->f268 << 19) >> 28;   /* bits 9..12 */
    func_02019160(slot_a);

    if (func_ov000_021ac760(&act->f178) != 0) {
        data_021040ac->job = 5;
        int r = func_ov000_021ae4ac();
        data_021040ac->arg = r;
    } else if (func_ov000_021ac760(&act->f18c) != 0 || func_02018b48() == 4) {
        int slot_b = (unsigned int)(act->f268 << 17) >> 28;  /* bits 8..11 */
        func_ov011_021cd6e0(slot_b, 2);
        func_ov011_021cc7a0(0, 0);
        func_020139fc();
        func_02018b34(0);

        act->f264 = 1;
        int base = (act->f268 & ~0x1e00) | 0x400;
        act->f268 = (base & ~0x1e0) | (((unsigned int)(base << 19)) >> 15 /* re-encode shape */);
        func_ov011_021cefb4();
        func_02018e88(0, act->f21c, act->f220);
        int slot_c = (unsigned int)(act->f268 << 23) >> 28;
        func_02019160(slot_c);
        func_ov011_021d091c();
        func_ov011_021c9e98(0);
    } else if (func_ov000_021ac760(&act->f1a0) != 0) {
        data_021040ac->job = 2;
        int r = func_ov000_021ae4ac();
        data_021040ac->arg = r;
    } else {
        int packed = (unsigned int)(act->f258 << 0xe) >> 0x18;
        if (func_ov011_021d0ffc(packed) == 1) {
            int packed2 = (unsigned int)(act->f258 << 0xe) >> 0x18;
            int kind = func_ov011_021d1028(packed2);
            if (kind == 1) {
                data_021040ac->job = 0x15;
                data_021040ac->arg = 0;
            } else if (kind == 3) {
                func_ov011_021d091c();
            }
        }
    }

    func_ov011_021d0884();
    return 1;
}
```

**Levers:** `act->f268` is read at TWO different 4-bit windows in this
function (`lsl#0x13/lsr#0x1c` = bits 9-12 near the top, `lsl#0x17/lsr#0x1c`
= bits 8-11 in the mode-2/anim branch) — these are genuinely different
bitfields on the same word (not the same value re-extracted), consistent
with round-1's finding that `+0x268` packs a 4-bit actor-facing/slot field
at bits 8-11; this function shows a *second* 4-bit field at bits 9-12
overlapping it, worth flagging as a KB gap (see below). The final
`func_ov011_021d0884()` call is unconditional and must be the very last
statement regardless of which branch was taken.

---

### 0x021D0CAC — `Ov011_FindCoordSlotByActor` (428 B, class F)

**Original verdict:** F — "105 insns, nested loops, 64-bit smull dist math,
reg-heavy"

**Upgrade reason:** Despite the 64-bit `smull`/`adc` distance math (Q12
fixed-point squared-distance via `func_0208bf3c` = `FX_Sqrt`, matching the
documented `SysWork_GetPointDistance.c` idiom from `MainConstants.md`
§Fixed-point math), the function is **two independent, structurally
identical scan loops** with a shared epilogue — not truly reg-alloc-walled,
just verbose. Loop 1 scans the fixed 10 actor slots `1..9` (skipping via
three early-exit guards: `func_ov011_021d1210` "has-flag", `func_ov011_021d11f0`
"is-active", `func_ov011_021d0ffc` "state == 0 or 2"), converts each to a
distance via `func_ov011_021d1080` + `FX_Sqrt`, and tracks the maximum. Loop
2 walks a variable-length LUT-derived array (`data_ov011_021d334a`,
0x72-byte stride table — the SAME table documented in `021ca324.c`/
`021cabbc.md` context) computing the identical squared-distance formula
against each entry's `(x,y)` fields at `+0xa`/`+0xc`. Both loops share the
exact same 6-instruction Q12 distance kernel (`sub`, `smull` ×2, `adds/adc`
×2, `orr lsl#0x14` ×2, `add`, `bl func_0208bf3c`) — write it once as a
static helper if desired, or inline twice; either compiles to the same
code since mwcc doesn't inline across TUs anyway.

**Struct/data dependencies:** `data_ov011_021d403c` (`+0x268` actor-facing
4-bit slot, used to index `data_ov011_021d334a`), `data_ov011_021d334a`
(0x72-stride LUT, entries read at `+0xa`/`+0xc` as `s16` coordinate pair —
same table cataloged from `021cabbc.md`/`021ccb6c` context as an
animation/actor-position table), coord-slot query helpers `021d1210`/
`021d11f0`/`021d0ffc`/`021d1080` (all already matched or documented). Takes
two `int` args passed via the stack (`x`, `y` at `sp+0x34`/`sp+0x30` after
the double `stmdb`), one output pointer (`r2`→`sp+0` at entry, i.e. arg2 is
an `int *` out-param for "found actor index or -1... clamped to `0`
apparently" — see levers).

**Ground-truth pool words:**

| Label | Value |
|---|---|
| `_LIT0` | `data_ov011_021d403c` |
| `_LIT1` | `data_ov011_021d334a` |

**Ground-truth BL/BLX callees (call order):** `func_ov011_021d1210`,
`func_ov011_021d11f0`, `func_ov011_021d0ffc` (×2, second call only on the
`!= 0` path, compares result to `2`), `func_ov011_021d1080`,
`func_0208bf3c` (×2, once per loop), no other calls.

**C sketch:**

```c
int func_ov011_021d0cac(int out_unused_r1, int out_unused_r2, int *out_idx, int y, int x) {
    /* NOTE: signature reconstructed from stack layout; y/x arrive via
       sp+0x30/sp+0x34 due to the leading `stmdb sp!, {r0,r1,r2,r3}` save. */
    int best_idx = 0;
    unsigned int best_dist = 0x7fffffff;

    for (int slot = 1; slot < 10; slot++) {
        if (!func_ov011_021d1210(slot)) continue;
        if (!func_ov011_021d11f0(slot)) continue;
        if (func_ov011_021d0ffc(slot) != 0 && func_ov011_021d0ffc(slot) != 2) continue;

        int sx, sy;
        func_ov011_021d1080(slot, &sx, &sy);
        long long dx = (long long)(x - sx);
        long long dy = (long long)(y - sy);
        /* Q12 squared-distance, rounded: (dx*dx + 0x800) >> 12 combined
           into a 64-bit accumulator with dy*dy the same way, then summed */
        unsigned int dist = func_0208bf3c(fx_sq_sum(dx, dy));
        if ((int)best_dist < (int)dist) { best_dist = dist; best_idx = slot; }
    }

    int actor_slot = (unsigned int)(data_ov011_021d403c->f268 << 23) >> 28;
    unsigned char *row = data_ov011_021d334a + (actor_slot - 1) * 0x72;
    unsigned char count = row[0];
    if (count > 0) {
        for (int i = 0; i < count; i++) {
            short ry = *(short *)(row + 4 + i * 4 + 0xc);
            short rx = *(short *)(row + 4 + i * 4 + 0xa);
            long long dx = (long long)(x - rx);
            long long dy = (long long)(y - ry);
            unsigned int dist = func_0208bf3c(fx_sq_sum(dx, dy));
            if ((int)best_dist < (int)dist) { best_dist = dist; best_idx = i + 0x11; }
        }
    }

    if (best_dist == 0x7fffffff) best_dist = 0;
    *out_idx = best_idx;
    return best_dist;
}
```

**Levers:** The function begins with `stmdb sp!, {r0, r1, r2, r3}` BEFORE
the callee-saved push — this is mwcc's varargs-style incoming-register
spill, meaning the real parameter count/order needs confirming against a
call site (search `bl func_ov011_021d0cac` callers) before finalizing the
signature; the sketch above captures the arithmetic faithfully but the
exact C parameter list is the one open question. `best_idx` for loop-2
entries is `i + 0x11` (17) — an offset into a combined slot-index space
shared with loop-1's `1..9` range. Loop-1's `best_dist` compare uses signed
`cmp sl, r0 / movgt` (both loops use the *same* accumulator `sl`/`r8`
registers across the whole function — do not reset `best_dist` between the
two loops).

---

### 0x021D1F04 — `Ov011_LookupAndPlaySfx` (152 B, class E)

**Original verdict:** E — "pc-relative jump table dispatch, branch-heavy"

**Upgrade reason:** Only 2 real code paths despite the large-looking
`addls pc, pc, r0, lsl#2` table: for `arg0` in a specific set of ranges
(`<=0x12`, or `0x2b+{0,1,2,3,4,5,6}`, or `0x2b+{0xb}`) the function returns
`arg0` unchanged; for every other value it computes
`arg0 + func_0201397c(arg1)`. Both existing matched callers
(`func_ov011_021d1f9c.c`, `func_ov011_021d1fc8.c`) confirm the calling
convention exactly: `func_ov011_021d1f04(byte_value, secondary_arg)`. The
"jump table" is not real data-driven dispatch — it's mwcc's `addls pc, pc,
r0, lsl#2` encoding of a dense `switch` with mostly-identical case bodies,
which collapses to two `if` arms once the case list is read literally.

**Struct/data dependencies:** None — leaf-adjacent function; only external
call is `func_0201397c` (already a resolved main-TU symbol, called by both
existing callers' siblings elsewhere in the overlay).

**Ground-truth pool words:** none (no literal pool — small enough to encode
all immediates inline).

**Ground-truth BL/BLX callees:** `func_0201397c` (only on the fallback
path).

**C sketch:**

```c
int func_ov011_021d1f04(int arg0, int arg1) {
    /* Pass-through set: arg0 in {0..0x12} directly, plus the sparse
       set {0x2b, 0x2c, 0x2d, 0x2e, 0x2f, 0x30, 0x31, 0x36} (0x2b+0/1/2/3/4/5/6
       and 0x2b+0xb) all return arg0 unmodified. */
    switch (arg0) {
    case 0x00: case 0x01: case 0x02: case 0x03: case 0x04: case 0x05:
    case 0x06: case 0x07: case 0x08: case 0x09: case 0x0a: case 0x0b:
    case 0x0c: case 0x0d: case 0x0e: case 0x0f: case 0x10: case 0x11:
    case 0x12:
    case 0x2b: case 0x2c: case 0x2d: case 0x2e: case 0x2f: case 0x30:
    case 0x31: case 0x36:
        return arg0;
    default:
        return arg0 + func_0201397c(arg1);
    }
}
```

**Levers:** The `addls pc, pc, r0, lsl#2` jump table is generated from a
`switch` whose case range is `[0x2b, 0x40]` (22 entries, `sub r0,r4,#0x2b /
cmp r0,#0x15 / addls ...`) — reproduce it as a real `switch` statement
(not an if-chain) so mwcc emits the same branch-table shape; an if-chain
compiles to sequential `cmp/beq` and will NOT match. Verify the exact case
list against the table order in the .s (`b .L_254` = pass-through,
`b .L_25c` = fallback) before finalizing — the sketch above transcribes the
19 `b` targets literally (`.L_254`×11 total including the `<=0x12` short-
circuit, `.L_25c`×11) but a byte-for-byte objdiff pass is needed to confirm
switch-statement case order doesn't perturb the table.

---

## Confirmed-intractable functions

- **0x021CBC1C** (780 B) — Camera-follow distance banding drives SIX
  separate near-identical `bic/orr` scroll-offset updates (each guarded by a
  `cmp`/`bls`/`bhi` distance-vs-constant band test against
  `act[0x25c]`/`act[0x258]` extracted sub-fields), interleaved with a
  `func_0208c66c` external distance call and a `0x51eb851f` (÷100 magic-mult)
  scale. The six bands (`> 0x64`, `[0x33,0x64]`, `[0x1a,0x32]`, `< 0x1a` with
  a secondary `sub`/`and` ramp) share registers across band boundaries in a
  way that is extremely order-sensitive; reshaping the C to match failed on
  the two similar functions in round 1 that DID succeed (`021cca04`,
  `021ca400`) because those had far fewer interacting live ranges. The
  scheduling ambiguity is: which of the 6 band computations mwcc chooses to
  keep live across the `bne`/`beq` cascade, and in what order the `str
  [r5,#0x240]` writes interleave with the `#0x25c` bitfield reload — this is
  a classic multi-field-RMW reg-alloc wall (cf. `ov011-clean-c-drain.md`
  brief note).
- **0x021CCB6C** (976 B) — Two parallel 4-branch scroll-clamp trees (one for
  "idle" input via `func_02006110` touch coords, one for "moving" via
  `021d1080` actor coords), each producing `lsl#0xe/asr#0x4` fixed-point
  interpolation into `act[0x1fc]`/`act[0x200]`, gated by FOUR different
  state predicates (`021c9dd8`/`021c9e2c` idle-flags, `021cc374` active-actor,
  `act[0x274]` bit-11 test, `act[0x264]` mode == 1). The interpolation ramp
  constants (`0xe0..0x100`, `0..0x20`, `0xa0..0xc0`) recur per-branch with
  slightly different bounds — a genuine scheduling wall because the same
  physical registers (`r0`-`r3`) carry different logical values across the
  four branches and mwcc's allocator choice depends on which branch executes
  first at compile time, not reproducible from the C alone.
- **0x021CD35C** (536 B) — Per-frame tile-highlight update: an outer branch
  selects the highlight source (idle-touch vs. moving-actor vs. static), then
  a loop over up to `slot_count` bit-tested entries (`tst r5, act[0x26c]>>0x18`)
  each conditionally calling `func_ov011_021cd0dc` TWICE with near-identical
  args differing only in one register (`r7` vs `r9`) — the two calls' live
  ranges overlap the loop induction variables (`r6`,`r7`,`r8`,`r9`) in a way
  that any C loop restructuring changes which values are still live at the
  `ldrb r1, [r8, #0x4a]` compare, making this a scheduling wall rather than a
  logic gap.
- **0x021CD754** (492 B) — Raw `.word` hex body (brief 192/197 "Track A"
  cross-overlay-BL class). File header explicitly marks it "C-32 cross-
  overlay BL wall". Two real symbolic `bl`s survive (`func_ov010_021b3774`,
  `func_ov011_021cd700`); the rest is hand-encoded machine code including two
  literal cross-overlay `bl 0x021b36f4` / `bl 0x021b3754` targets that the
  current linker cannot resolve as named symbols. Not C-sourceable until the
  cross-overlay-call tooling changes; extracted the four trailing "load to"
  pool words for the record: `0x021d403c`, `0x021d323c`, `0x021d4000`,
  `0x021d32ba` (all `overlay(11)`-relocated addresses — `0x021d323c` and
  `0x021d32ba` are new, previously undocumented globals; see gaps below).
- **0x021CDC68** (1320 B) — Duel-launch sequence: an outer `0x60`-iteration
  search loop (`func_02018bc0` per-iteration probe against a computed target
  byte), nested inside which up to 3 independent sub-searches run
  (`0201b770`/`0201b6d4`/`021cdbd8` gated linear scan over a `0x72`-stride
  table; `0201ac1c`/`0201ac60` chained "get-next" walk over an opaque list).
  Each sub-search populates the SAME output coord-slot array via
  `021d0fb0`/`021d11a0`/`021d0ed0`/`021d1058`/`021d0fd4`/`021d1230` with
  different literal args per call site — 5 nearly-identical 6-call groups
  differing only in 1-2 immediate values, plus a final unconditional
  10-iteration cleanup loop (`021cdbac`) shared by three different entry
  points (`.L_4d8`, `.L_500`, and the fallthrough). The register pressure
  (`r4`-`r9`, `sl`, `fp` all simultaneously live across the outer loop) and
  the fact that three different early-exit paths converge on the same
  cleanup loop via different `b`-targets makes this a genuine scheduling
  wall, not a logic gap — every sub-block's C shape is individually simple
  but their interleaving in one register file is what's hard.
- **0x021CE50C** (2480 B) — **Confirmed 'never' by the heuristic; spent
  reduced time as instructed.** 607 instructions, 20+ internal branch
  targets, dispatching on THREE separate bitfield words
  (`act[0x274]` bits, `act[0x268]` bits 12-15, `act[0x264]` mode) with deeply
  nested `tst`/`beq` chains testing an 8-bit "input flags" byte
  (`data_02104bac+0x52`/`+0x54`) bit-by-bit (`0x1`,`0x2`,`0x10`,`0x20`,`0x40`,
  `0x60`,`0x80`,`0x90` — overlapping bit groups, not a clean enum), plus a
  magic-mult `0x66666667` (÷10) scroll-deceleration ramp reused 4 times with
  different scale variables, plus a per-slot LUT clamp
  (`data_ov011_021d2fc8`/`021d2fc9`) identical to the round-1-matched
  `021cca04`. This is a genuine wall: the sheer number of interacting live
  state words (at minimum `act[0x268]`, `act[0x274]`, `act[0x280]`, four
  scroll fields, and the two LUT bytes) exceeds what any register allocator
  reshape can control deterministically. **Pool words extracted for the
  record:** `data_ov011_021d4000`, `data_ov011_021d403c`,
  `data_ov011_021d3020` (new — 10×2-byte LUT copied to stack, previously
  undocumented), `data_02104bac`, `0xfffffffc`/`0xfffffffd`/`0xfffffffe`/
  `0xffffffff` (four sequential sentinel constants for a 4-way sub-dispatch),
  `0x66666667` (known ÷10 magic-mult), `data_ov011_021d2fc8`/`021d2fc9`
  (known scroll LUTs), `0x807fffff`/`0xffe01fff` (both known
  `BitFlagMasks.md` masks). **BL targets (deduplicated):**
  `func_ov011_021d1d18`, `func_ov011_021cf2dc`, `func_ov011_021ca6ac`,
  `func_ov011_021c9e2c`, `func_ov000_021ac78c`, `func_02037208` (×7 distinct
  toast-code call sites, args `4`/`0x38`/`0x3a` sub `1` each time — the
  documented toast-dispatch idiom), `func_ov000_021ac550` (×2, polled in a
  loop), `func_ov011_021ccad8`, `func_ov011_021cada4(1)`, `GetSystemWork`
  (×2), `func_02006264`, `func_ov011_021ca4d8`, `func_ov011_021cc374`,
  `func_ov011_021ce3a4`, `func_ov000_021ac760` (×5, on 5 different actor
  sub-objects `+0x164`/`+0x1b4`/`+0x18c`/`+0x178`/`+0x1a0`), `func_ov000_021ac770`,
  `func_ov011_021ca694`, `func_ov011_021ca630`, `func_ov011_021ca67c`.
- **0x021CFBCC** (892 B) — 6-way jump table (`cmp r0,#5 / addls pc,pc,...`)
  on `data_ov011_021d4000+0x2b0` bits 20-27; each of the 6 arms is
  individually tractable (fade-in/fade-out fixed-point ramps using the same
  `data_020bef80` LUT and `0x80808081` magic-mult ÷51 pattern seen elsewhere
  in this overlay) but they interleave writes to the SAME bitfield
  (`act[0x274]` bits 11-18) with different increment directions per arm, and
  arms 3/4 share a `func_ov000_021ab5ac` call with subtly different argument
  derivations. The scheduling ambiguity is which arm's `str [r4,#0x274]`
  write mwcc schedules relative to the shared tail (`func_ov011_021cd638`
  common to arms 2/3/4) — reshaping one arm risks perturbing all 6 case
  labels' relative code offsets in the jump table.
- **0x021CFFE4** (704 B) — Outer branch on `act[0x2b0]` bits (mirrors
  `021cfbcc`'s bitfield but a DIFFERENT range: `0`, `0x14`, `0x15`, `0x16`,
  else-wall), each of the 4 real cases fans out into its own 3-6-way nested
  guard chain against `act[0x284]`/`act[0x278]`/`act[0x264]` sub-fields, with
  two of the four cases sharing a `func_ov000_021ab6cc` call whose result
  feeds the OUTER function's return value (`r5`) — meaning the return value
  is set in exactly 2 of the ~9 leaf paths and left at its initial `0` in the
  rest, a control-flow shape that is easy to get logically right but whose
  exact branch ORDER (which nested `bne`/`beq` mwcc emits first) is
  unrecoverable without a match.
- **0x021D02A4** (1292 B) — Raw `.word` hex body (brief 192/197 Track A,
  same class as `021cd754`). Header explicitly marked "C-32 cross-overlay BL
  wall". ~25 symbolic `bl` targets survive individually resolvable (listed
  in the .s `.extern` block — `021cb218`, `021cd638`, `021ca67c`, `021ca630`,
  `021cdb7c`, `021ac760`, `021ca6c4`, `021ca664`, `021cf060`, `021af47c`,
  `021cc7dc`, `02019124`, `0201397c`, `021cabbc`, `0202c0c0` ×2 plus two
  literal cross-overlay `bl 0x021b1e40` targets, `021ae394`, `021ab4ec`,
  `021d0ffc`, `021d1028`, `021cdbd8`, `data_ov006_021cc7f8` (called as a
  function pointer — cross-overlay data-as-function), `021cdb94`,
  `021cf048`, `021ca03c`, `021ae48c`, `021ae4ac`, `021cfa50`, `021ac760`
  again, `021cfb24` ×2, `021ca694`, `021ca600`, `021cc3d4`, `021ccf3c`,
  `021cfaf8`, `021cf2dc`, `02018b48`, `021cfbcc`), but the body is
  predominantly raw encoded instructions (jump-table `.word` entries at the
  top computing the dispatcher target). Not C-sourceable under the current
  toolchain for the same structural reason as `021cd754`.
- **0x021D12C0** (372 B) — Shell-sort with gap sequence `gap = gap*3+1`
  (derived from the `0x55555556` ÷3 magic-mult, reused TWICE: once to
  compute the initial max gap from the count of "active" coord slots, once
  per outer iteration to shrink it) over an insertion-sort inner loop
  comparing `slot[i].f18`/`slot[i-gap].f18` at stride `0x28`
  (`data_ov011_021d4660`), followed by a SEPARATE final pass writing a
  computed rank byte back into each slot's `+0x18` field (masked to bits
  0-4, preserving bits 5+). This is the exact insertion-sort/Shell-sort
  shape the task predicted. The wall is the inner swap loop
  (`.L_b4`/`.L_c0`) which walks TWO pointers (`ip`+`r3` ascending, `lr`-`r6`
  descending) through the same conceptual array using byte-indexed
  (`ldrsb`/`strb`) accesses into an aux buffer at `sp+4` (10 bytes, one per
  slot) — reproducing the exact pointer-pair register choreography that
  mwcc chose for a `for`-loop-with-decrementing-inner-index shape is
  reg-alloc-fragile in the documented sense (cf.
  `mwcc-register-reuse-recipe.md`); several structurally-equivalent C
  reshapes were considered (do/while vs for, `<=` vs `<` bound) but none is
  confirmable without an actual build.
- **0x021D1514** (880 B) — Per-coord-slot animation tick: a 3-level nested
  `switch`-like structure (outer on `slot->f18` bit 6, middle on `slot->f18`
  bits 10-11 taking 3 values, inner calling either `func_ov011_021cc140`/
  `021cc15c`/`021cc194` OR indirecting through TWO different function-pointer
  fields loaded from the slot struct itself, `slot->f1c` and `slot->f20`
  (`blx r4` twice with different fields) — genuine data-driven dispatch, not
  reshapeable into a static call. The tail (past all the switches) computes
  a screen-space distance check (`GetSystemWork()[0x8e8]` bit test,
  `func_02018bc0` sub-object `+0x10` bit test) then, if in range, packs FIVE
  fields into an opaque hardware-adjacent struct (`func_02005dac(1,0x11)`
  result, written at offsets `+0`, `+4` with several `bic/orr` passes and a
  literal `0xfe00ffff` mask) — the packing order across 4 separate
  `str [r4, ...]` writes to the SAME two words is the wall; the logic is
  clear but the mwcc-chosen instruction order for the bitfield writes is not
  recoverable from source alone.
- **0x021D191C** (556 B) — Actor/NPC event dispatch: two near-duplicate
  ~12-call blocks (one for `arg0 >= 0x7d`, one for `arg0 in [0x66,0x7c]`, one
  fallback for `< 0x66`), each doing LUT-index math against THREE different
  overlay data tables (`data_ov011_021d3594`, `data_ov011_021d35ac`,
  `data_ov011_021d3394`) with byte-sized signed reads (`ldrsb`/`ldrsh`) whose
  results feed into 5-6 chained calls (`021cbc08`, `021ca400`, `021cbc1c`,
  `021cb218`, `021cd940`, `021ceffc`, `021ccfcc`, `021d18b4`/`021d1080`,
  `021d0e88`) that mutate `act[0x240]`/`act[0x268]`/`act[0x270]`/`act[0x280]`
  in an interleaved fashion — the specific interleaving of which bitfield
  write happens between which pair of calls is load-bearing and could not be
  confirmed to be reshapeable within the time available; flagging as wall
  rather than risk a wrong recipe.
- **0x021D1D30** (468 B) — `Ov011_RunStateTable`, the matched sibling's
  (`map/overlay011.md` line 176) *raw* form: an 8-way jump table
  (`addls pc,pc,r0,lsl#2`) directly on `act->f284` (interpreted here as a
  **signed** byte, `asr#0x18` not `lsr#0x18` — differs from the `lsr` byte
  extracts seen elsewhere on this same field, worth flagging), states 0-7
  each doing a small (2-6 instruction) guard+dispatch to one of
  `021ca6ac`/`021cf060`/`021cf048`/`021cb218`/`021ceffc`/`021ccfcc`/
  `021cdb94`/`021ce344`/`021d1b48`/`021d1b70`/`021ccf3c`. Individually every
  arm is trivial; the wall is purely that the function's *entire*
  observable behavior is the jump-table topology itself — there is no
  "simplify the logic" lever available since each case already IS the
  simplest possible C. This is the canonical case where a function is a
  wall not because of complexity but because a jump table's case-label
  ordering is exactly what's being matched and any hand-written switch
  risks producing a different table layout. (Not upgraded despite reading
  cleanly, because case-label-order sensitivity for `addls pc,pc,...`
  dispatch is exactly the class of "looks tractable, isn't" the campaign
  has learned to distrust — flagging for a build-time attempt rather than a
  confident recipe.)
- **0x021D2428** (2100 B) — Path-object 8-neighbour ring-buffer fill: EIGHT
  near-identical ~140-byte blocks (N, S, E, W, NE, NW, SE, SW probes around
  the current path cursor), each doing: bounds check via
  `func_ov011_021d2118` output, `func_ov011_021d20e8` grid-bit test, and on
  a clear bit, a ring-buffer push (with an occasional resize via
  `Task_PostLocked`/`Fill32`/`Copy32`/`Task_InvokeLocked` when the buffer is
  full) writing a 12-byte record (`x:s16, y:s16, u32, u32`) into
  `pathobj->f0[]` at `pathobj->f4 * 12`. This is a **pure mechanical size
  wall** — the 8 blocks are copy-paste-identical apart from the coordinate
  deltas (`+1,0`; `-1,0`; `0,+1`; `0,-1`; `+1,+1`; `-1,+1`; `+1,-1`; `-1,-1`)
  and could trivially be a `for` loop over an 8-entry delta table in
  cleaner source, but the ACTUAL compiled output is fully unrolled with
  per-block register allocation that differs slightly block-to-block
  (`r7`/`r8`/`r9` vs `r6`/`r5`/`r7` in different blocks) — writing it as a
  loop would not reproduce the unrolled instruction stream. The `PathObj`
  struct (`data_ov011_021d480c`, passed as `r4`/arg2) is confirmed:
  `+0x0`=record-array pointer, `+0x4`=count, `+0x8`=capacity — consistent
  with `func_ov011_021d2118.c` (decomposes `obj[0xc]`/`obj[0x10]` into grid
  dims, a DIFFERENT pair of fields on what is evidently a second nested grid
  object passed via `sp+0x20`/`sp+0x24`, not the PathObj itself) and
  `func_ov011_021d20e8.s` (`obj[0]`=bit-array ptr, `obj[0xc]`=packed
  row/col-stride dims — again the grid object, not PathObj).

---

## The `+0x274` / `+0x284` / `+0x18` recurring-offset question

The task flagged that `021cfbcc`, `021cffe4`, `021d1d30` all touch `+0x274`
on what looked like a shared struct, and asked whether resolving that
struct once unlocks all three plus `021d1514`/`021d191c` (offset `+0x18`).
Having read all 19 files closely, the answer is: **`+0x274` and `+0x284`
are both real fields on the actor struct `data_ov011_021d403c`, but they are
NOT the reason those three functions are walled** (all three are walled by
jump-table/nested-dispatch topology, not by unresolved struct facts — the
field accesses themselves are simple `ldr`/`bic`/`orr` on an already-known
base pointer). Specifically:

- **`+0x274`** is a packed status word read/written by `021cbc1c` (bits
  11-18, distance-band flags), `021ccb6c` (bit 11 test, byte sub-field
  bits 0-7 in the else-branch), `021cfbcc` (bits 11-18, an incrementing
  counter packed alongside other bits), `021cffe4` (full-word bic/orr with
  mask `0xffe01fff` — the SAME `BitFlagMasks.md` mask already documented for
  ov000's `field_2a4`, confirming `+0x274` uses the identical keep/clear
  convention), `021cdc68` (bit 12-15 sub-field test), `021ce50c` (bits 11-18
  again, plus a separate `& 0x807fffff` masked write), `021d1d30` (bits 11-18
  gate + bits 12-19 dispatch — the 5th-6th jump-table arms), `021d02a4` (raw
  word, several `and`/`orr` passes). Round 1 had already partially
  documented `+0x274` via `021cabbc.md` as "anim_en_raw, u8 in low byte" —
  **this round shows `+0x274` is actually wider than a single byte**; the
  low byte (bits 0-7) IS the anim-enable flag per `021cabbc`, but bits 11-18
  hold an entirely separate counter/flag cluster used by the camera/scroll
  functions. This is one field with (at least) two independently-addressed
  bitfield windows, not two different structs.
- **`+0x284`** is a SEPARATE packed byte/state field, distinct from `+0x274`:
  `021cdc68` reads it at bits 4-7 (`lsl#0x4/lsr#0x18`... actually a straight
  byte read), `021cffe4` reads/writes it extensively (bit 3 flag, low byte
  as a sub-mode 0-2, bit 28 flag), `021d1d30` dispatches its ENTIRE 8-way
  jump table on it as a signed byte (`asr#0x18`, low byte = state 0-7 —
  this matches the already-matched sibling behavior documented in
  `map/overlay011.md` line 174/176: `Ov011_SetSecondaryMode` sets
  `403c.284` low byte to 1, and the matched `Ov011_RunStateTable` name
  IS this function's twin — meaning **0x021D1D30 in THIS file is very
  likely an un-deduped near-copy of the already-matched state-table
  dispatcher**, differing perhaps only in which named actor slot it
  operates on, or simply not yet folded by symbol renaming). No new
  facts were needed to read `+0x284` — it was already fully legible from
  round-1 context plus the matched `021d1ce8.c`/`021d1d18.c` siblings.
- **`+0x18`** (from `021d1514`/`021d191c`) is **NOT** on the actor struct at
  all — it is the coord-slot record's field, base `data_ov011_021d4660`,
  stride `0x28`, already fully documented in `OverlayConstants.md` §ov011
  ("Coord array layout", `OV011_COORD_STRIDE = 0x28`) and confirmed again
  by the matched `func_ov011_021d0c38.c` (`(slot[0x18] << 26) >> 31 == 0` =
  "slot free" test, bit 5) and `func_ov011_021d11a0.c`/`021d11c8.c` (bit
  7/bit 6 setters on the same field). `021d1514` takes a coord-slot pointer
  directly as `r0`/`r6` (not an index into the actor struct), and its
  `slot->f18` bit-6 outer switch / bits-10-11 middle switch are two MORE
  bitfield windows on this already-known field, alongside the already-known
  bit-5 (in-use) and bit-6/bit-7 flags from `021d11a0`/`021d11c8`. `021d191c`
  does NOT touch `+0x18` on any struct at all in the code actually read for
  this round (it indexes three separate LUT tables by a decremented `arg0`,
  not by a slot-record field) — **the task's premise that 021d191c touches
  `+0x18` does not hold** for the function at that exact address in the
  current tree; it's possible the intended function was a neighbour
  (`021d18b4`, called BY `021d191c`, is still `.s` and unread this round —
  flagged below as a follow-up candidate) or the offset was inferred from
  a different build. Recommend a follow-up check of `021d18b4.s`
  specifically if the `+0x18`-on-`021d191c` claim needs to be run down
  further.

**Conclusion:** there is no single struct-layout fact whose resolution
would have unlocked additional functions in this batch — round 1 already
extracted the load-bearing struct facts (actor base, coord-slot base, both
strides) and this round's 13 walls are walls because of branch/dispatch
topology and register-allocator choreography, not missing field knowledge.

---

## New KB gaps found

Consolidated actor-struct (`data_ov011_021d403c`) field table, merging
round-1 facts with this round's findings (do not edit `OverlayConstants.md`
directly — this is a proposal for the next KB-maintenance pass):

| Offset | Width (as used here) | Evidence (this round) | Status |
|---|---|---|---|
| `+0x18` | — | NOT on this struct (see above) | not applicable — belongs to coord-slot record |
| `+0x1fc`/`+0x200` | s32 (Q12 scroll x/y) | `021ccb6c`, `021ce50c` (as `+0x230`/`+0x234`... — see note) | already known (round 1) |
| `+0x21c`/`+0x220` | s32 (coordinate pair) | `021d0938`, `021d0cac` (as `y`/`x` scan targets) | **NEW** — used as a fixed reference point fed to `func_02018e88` |
| `+0x230`/`+0x234` | s32 (secondary scroll x/y, Q12) | `021ccb6c`, `021d191c` | **NEW** — parallel pair to `+0x1fc`/`+0x200`, written by the touch-input branch specifically |
| `+0x240` | 3-bit low field (values 0/1/3/4/5) | `021cbc1c`, `021ccb6c`(indirectly via `021d191c`), `021d191c`, `021d1d30`(no, that's `+0x284`) | **NEW** — a small state enum, values seen: 0,1,3,4,5 |
| `+0x258` | packed byte fields (multiple sub-extracts: `lsl#0xe/lsr#0x18`, `lsl#0x16/lsr#0x16`, `lsl#0x1c/lsr#0x1a` seen across files) | `021cbc1c`, `021cd35c`, `021d0938`, `021ce50c`, `021d02a4` | **NEW** — heavily-reused packed word, at least 3 independent sub-fields, needs a dedicated bitfield map |
| `+0x25c` | packed byte fields (bit 6, bit 7, low-6-bits, `& 0x3f`) | `021cbc1c`, `021ce50c` | **NEW** — sibling packed word to `+0x258` |
| `+0x264` | s32 mode/lock enum (0, 1) | `021cca04`(known), `021ccb6c`, `021cd35c`, `021cdc68`, `021ce50c`, `021cfbcc`(indirectly), `021d0938` | already known (round 1), usage confirmed much wider |
| `+0x268` | 4-bit actor-slot field, bits 8-11 (round 1) **AND a second 4-bit window at bits 9-12** | `021d0938` (two different extracts in the same function) | **NEW sub-window** — needs disambiguation, may be two adjacent nibbles of one byte or an artifact of two different call sites reusing the same word for different purposes |
| `+0x270` | u8 low byte (anim_en, round 1) **plus bit-4/bit-28 flags used elsewhere** | `021cbc1c`(no — that one is `+0x274`... actually `021ccb6c` uses `+0x270` bit 0x10000000), `021cd35c`(low byte), `021cfbcc`(no, +0x274), `021d1d30`(bits 0xff00000 clear) | already known (round 1: anim_en byte); this round adds bit 28 (`0x10000000`) as a separate "settle in progress" flag cleared by several functions |
| `+0x274` | packed word: bits 0-7 = anim_en (round 1), **bits 11-18 = counter/flag cluster (NEW)** | `021cbc1c`, `021ccb6c`, `021cfbcc`, `021cffe4`, `021cdc68`, `021ce50c`, `021d1d30`, `021d02a4` | round 1 partial; this round doubles the known extent |
| `+0x278` | 4-bit field (values 0-2 seen) | `021ce50c`, `021cffe4` | **NEW** |
| `+0x280` | packed word: bit 9 flag (round-1 adjacent context), bits 0x200/0x100 flags (NEW) | `021ce50c`, `021cfbcc`, `021d191c`, `021cffe4`(no, that's 274)... | **NEW** — at least 2 independent flag bits beyond round 1's partial notes |
| `+0x284` | signed byte, 8-value state enum (0-7) — the `Ov011_RunStateTable` dispatch key | `021d1d30`, `021cdc68`(bit 2 test), `021cffe4`(bit 3, low byte, bit 28) | already known via matched siblings (`021d1ce8.c` sets it); this file confirms the FULL enum range and that reads use `asr` (signed) not `lsr` |
| `+0x288` | s32 counter/timer (0..0x200 range, step +0x14/+0x10/+0x8) | `021cfbcc` | **NEW** |
| `+0x298` | s32 template-select word | `021cb25c` (round-1 sibling `021cb3b4` already references it) | already implied, now directly confirmed |
| `+0x2d4`... wait, this is `data_ov011_021d4000`, not `021d403c` | — | `021cb25c` | (tracking note only, not a struct-offset gap) |

Other new undocumented globals surfaced this round:

- **`data_ov011_021d3020`** (accessed in `021ce50c` as a 10-entry, 2-byte-
  stride LUT copied to `sp+0` via an unrolled 10-iteration byte-pair copy
  loop) — likely a small lookup table parallel to the already-documented
  `data_ov011_021d2fc8`/`021d2fc9` scroll-target bytes, but with a different
  size/stride. Not previously cataloged anywhere in `docs/research/`.
- **`data_ov011_021d323c`** and **`data_ov011_021d32ba`** — both surfaced
  only as trailing relocation targets (`.word 0x021d323c ; load to
  0x021d323c (mod=overlay(11))`) in the raw hex body of `021cd754`; no
  context for their type/size is recoverable from that file alone since the
  surrounding code is unreadable machine code, not mnemonics. Flagging for
  whoever eventually tackles the cross-overlay-BL Track A class.
- **`data_ov011_021d334a`** — already used by the round-1-matched context
  (`021cabbc.md` mentions a `0x72`-stride table at a similar address
  implicitly) but this round is the first to nail down its exact base
  symbol name, confirmed stride `0x72` (114) bytes/row, and that row 0 is a
  1-indexed count-prefixed record (`row[0]` = count byte, entries at
  `row[4 + i*4 + 0xa/0xc]` as `s16` x/y — used identically by `021d0cac` and
  `021d191c`). Worth promoting into `OverlayConstants.md` §ov011 as a named
  table alongside the existing `OV011_LOOKAHEAD_ROW_STRIDE` entry (which
  documents a *different* table, `data_ov011_021d35ec`, also stride-0xa —
  do not conflate the two 0x72 vs 0xa stride tables).
- **`data_ov011_021d3594`**, **`data_ov011_021d35ac`**, **`data_ov011_021d3394`**
  — three LUT tables used by `021d191c` for NPC/actor event dispatch (signed
  byte/halfword reads, `(arg0 - 0x7d)` and `(arg0 - 0x65)` row-index math).
  No prior documentation found for any of the three.
- **`data_ov011_021d426c`** — a SEPARATE actor/camera-follow struct used
  exclusively by `021cbc1c`, distinct from `data_ov011_021d403c`. Fields
  accessed: `+0x230`, `+0x234`, `+0x240`, `+0x248`, `+0x258`, `+0x25c`,
  `+0x264` (dup name with the OTHER struct's mode field — worth double-
  checking these aren't actually the same object at a different observed
  base, though the `.s` clearly loads it via a distinct `_LIT0`/`_LIT1` pool
  pair, `data_ov011_021d426c` vs `data_ov011_021d403c`, both present
  simultaneously in the same function, so they are confirmed DIFFERENT
  objects), `+0x270`, `+0x278`. No prior documentation found.
- **`data_ov006_021cc7f8`** called as a function pointer (`bl
  data_ov006_021cc7f8`) from within `021d02a4`'s raw hex body — a
  cross-overlay data-as-function-pointer pattern; already partially
  cataloged as a data table in `Ov004Ov006DataTables.md` (`Ov006RecTypeA`,
  300-byte block) but its use here as a call target (not a data read) is
  new and suggests either a mis-disassembled relocation or a genuine
  computed-call into ov006 data — flagging for whoever resolves the
  Track A cross-overlay-BL class, since it can't be resolved from this
  file's raw bytes alone.

---

## Summary

- **E/F count (whole overlay):** 27
- **Examined this round:** 19
- **Newly tractable:** 6 (`0x021CA0C4`, `0x021CB25C`, `0x021D0938`,
  `0x021D0CAC`, `0x021D1F04`, plus `0x021D12C0` was analyzed in full but
  ultimately kept as WALL — see its entry; **final tractable count is 5**
  if `0x021D12C0`'s shell-sort is judged unreshapeable, or **6** if a build
  attempt on the insertion-sort recipe succeeds. Recorded as WALL above
  pending an actual build/objdiff attempt since the C logic is fully
  understood but the register choreography risk is high.)
- **Confirmed intractable / wall:** 13 (`0x021CBC1C`, `0x021CCB6C`,
  `0x021CD35C`, `0x021CD754`*, `0x021CDC68`, `0x021CE50C`, `0x021CFBCC`,
  `0x021CFFE4`, `0x021D02A4`*, `0x021D12C0`, `0x021D1514`, `0x021D191C`,
  `0x021D1D30`, `0x021D2428`) — note this list has 14 entries because
  `0x021D12C0` is counted here as the conservative call; two are marked `*`
  for the raw data-as-code Track A class distinct from ordinary
  reg-alloc walls.

**Final tractable count for this round: 5 confident (`0x021CA0C4`,
`0x021CB25C`, `0x021D0938`, `0x021D0CAC`, `0x021D1F04`), 1 borderline
(`0x021D12C0` — logic fully sketched, recommend a build attempt before
committing to tractable or wall).**
