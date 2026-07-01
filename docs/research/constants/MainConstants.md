[//]: # (markdownlint-disable MD013 MD041)

# arm9 Main Constants Catalog

Recurring constants, enum-like integer sets, and magic numbers found in matched
`src/main/` source files. Does not duplicate values already cataloged in
BitFlagMasks.md (0x7FFF, 0x1F00, 0x43, 0x8000, etc.), DuelStateEnums.md,
EntityTypeTags.md, or CardIdRanges.md.

---

## NDS ARM9 BIOS SWI codes

All matched as Thumb `swi N; bx lr` stubs in `src/main/`.

```c
typedef enum Arm9Swi {
    SWI_WAIT_BY_LOOP              = 0x03,  /* WaitByLoop — busy-wait N loop iters */
    SWI_INTR_WAIT                 = 0x04,  /* IntrWait — halt until interrupt mask fires */
    SWI_CPU_SET                   = 0x0b,  /* CpuSet — halfword/word memcpy+memset */
    SWI_CPU_FAST_SET              = 0x0c,  /* CpuFastSet — word-only, 32-byte-block rounded */
    SWI_SQRT                      = 0x0d,  /* Sqrt — integer square root */
    SWI_LZ77_UNCOMP_NORMAL_8BIT   = 0x11,  /* LZ77UnCompReadNormalWrite8bit */
    SWI_HUFF_UNCOMP_READ_CALLBACK = 0x13,  /* HuffUnCompReadByCallback */
} Arm9Swi;
```

Confirmed: `WaitByLoop.c`, `IntrWait.c`, `CpuSet.c`, `CpuFastSet.c`, `Sqrt.c`,
`LZ77UnCompReadNormalWrite8bit.c`, `HuffUnCompReadByCallback.c`.

Notes:
- All SWIs route through ARM9 BIOS at `0xFFFF0000` via the NitroSDK trap.
- `IntrWait` takes `(clear_first, mask)` — `r0=0` means don't clear first, `r1` is the IE-style bitmask.
- `CpuSet` vs `CpuFastSet`: CpuFastSet is word-only and rounds to 32-byte blocks; CpuSet is flexible but slower.

---

## Fixed-point math (NitroSDK FX)

```c
/* SysWork_GetPointDistance.c: inline FX_Mul macro */
#define FX32_SHIFT   12
#define FX_Mul(v1, v2)  ((fx32)(((s64)(v1) * (v2) + 0x800LL) >> FX32_SHIFT))
/* Rounding addend: 0x800 = 1 << (FX32_SHIFT - 1) = half-ulp round-to-nearest */

typedef signed int   s32;
typedef signed long long s64;
typedef s32 fx32;
/* func_0208bf3c = FX_Sqrt(fx32) — integer sqrt of Q12 fixed-point value */
```

Confirmed: `SysWork_GetPointDistance.c`.

Usage pattern: `FX_Mul(dx, dx) + FX_Mul(dy, dy)` then `FX_Sqrt`.

---

## SystemWork singleton

```c
/* GetSystemWork.c: the root accessor for the arm9 main state singleton */
extern char data_02104f58[];   /* singleton at this BSS address */
char *GetSystemWork(void) { return data_02104f58; }

/* Known field offsets within the 0x92c-byte block: */
#define SYSWORK_SIZE        0x92c   /* total size of the state block */
#define SYSWORK_POINT_X0    0x908   /* Q12 x-coordinate: first point */
#define SYSWORK_POINT_Y0    0x90c   /* Q12 y-coordinate: first point */
#define SYSWORK_POINT_X1    0x910   /* Q12 x-coordinate: second point */
#define SYSWORK_POINT_Y1    0x914   /* Q12 y-coordinate: second point */
#define SYSWORK_MODE_WORD   0x900   /* flag/mode bits; bit 12 tested by ov011 */
/* SysWork_ClearField0x810: Fill32(0, base+0x810, 0x20) */
#define SYSWORK_CLEAR_OFF   0x810
#define SYSWORK_CLEAR_SIZE  0x20    /* 32 bytes zeroed */
#define SYSWORK_ANIM_FRAME_COUNT 0x91c  /* primary progress/frame counter */
#define SYSWORK_ANIM_SUBFRAME    0x920  /* secondary tie-break counter */
```

Confirmed: `GetSystemWork.c`, `SysWork_GetPointDistance.c`,
`SysWork_ClearField0x810.c`.

`SYSWORK_ANIM_FRAME_COUNT`/`SYSWORK_ANIM_SUBFRAME` (retriage R7,
`Ov017Ov019Retriage.md`): the aliased base `data_02104f4c` used by several
ov017/ov019/ov003 functions is `data_02104f58 - 0xC` (verified by address
arithmetic), so its `+0x928`/`+0x92c` offsets land inside this same block at
`+0x91C`/`+0x920`. `+0x91C` is compared against thresholds (8, 0x17, 0x18,
0x24, 0x29, 0x2b) across functions; `+0x920` against 3/4.

---

## VRAM bank base address computation

```c
/* Vram_GetBankBaseCD.c / Vram_GetBankBaseE.c */
/* MMIO register addresses: */
#define VRAMCNT_CD  (*(volatile unsigned short *)0x04001008)
#define VRAMCNT_E   (*(volatile unsigned short *)0x0400100a)

/* OFS field: bits 5:2 of the VRAMCNT register */
#define VRAMCNT_OFS_MASK   0x3c    /* bits 5:2 */
#define VRAMCNT_OFS_SHIFT  2       /* right-shift to normalise OFS */
#define VRAM_PAGE_SHIFT    0xe     /* 14: each OFS unit = 16 KB */
#define VRAM_BASE          0x6200000  /* VRAM region base (shared by both) */

/* Full expression: ((VRAMCNT & 0x3c) >> 2) << 0xe + 0x6200000 */
/* Returns a void* (NitroSDK VRAM page pointer) */
```

Confirmed: `Vram_GetBankBaseCD.c`, `Vram_GetBankBaseE.c`.

---

## LCG random number generator constants

```c
/* Rand_Next.c: Microsoft Visual C LCG (same as MSVCRT rand()) */
#define RAND_MULTIPLIER  0x343fd
#define RAND_INCREMENT   0x269ec3
#define RAND_OUTPUT_MASK 0x7fff    /* bits 30:16 of state */
/* Already in BitFlagMasks.md as the RNG mask */

/* State layout: data_02197434 + 4 = LCG state word (u32) */
/* Output: (state * MULTIPLIER + INCREMENT) >> 16 & 0x7FFF */
```

Confirmed: `Rand_Next.c`.

---

## Doubly-linked list node layout

```c
/* List_Unlink.c: minimal doubly-linked list node */
typedef struct list_node {
    struct list_node *prev;  /* +0x00 */
    struct list_node *next;  /* +0x04 */
} list_node_t;

/* int List_Unlink(list_node_t *node): unlinks node, returns 0 */
```

Confirmed: `List_Unlink.c`.

---

## Task system

```c
/* Task_Invoke.c / Task_InvokeLocked.c / Task_InvokeLockedIrq.c */
/* Task handle is an opaque void*. Three dispatch tiers: */
/*   Task_Invoke          — unlocked, callable from any context */
/*   Task_InvokeLocked    — holds the task lock; safe from main thread */
/*   Task_InvokeLockedIrq — holds the task lock; safe from IRQ context */
/* All are thunks or thin wrappers (2–4 ARM instructions) */
```

Confirmed: `Task_Invoke.c`, `Task_InvokeLocked.c`, `Task_PostLocked.c`.

---

## Fill32 / memfill convention

```c
/* Used across the whole codebase via extern void Fill32(int value, void *dest, int count_bytes) */
/* NOTE: argument order is (value, dest, count) — reversed vs libc memset */
/* Internally: word-stride memset loop */
/* Examples: */
/*   SysWork_ClearField0x810: Fill32(0, base+0x810, 0x20) — zero 32 bytes */
/*   func_ov011_021d0c1c:     Fill32(0, coord_array, 0x1a0) — zero 416 bytes */
```

Confirmed: `SysWork_ClearField0x810.c`, `func_ov011_021d0c1c.c` (in overlay, but calls main Fill32).

---

## DMA / VRAM copy (func_02094504)

```c
/* func_02094504(mode, dest, size): NitroSDK VRAM DMA copy helper */
/* mode=0: zero-fill; mode=0xc0: copy from source */
/* dest: VRAM region pointer; size: byte count */
/* Used extensively in ov006 full-init family and ov000 */
```

---

## IRQ handler timer indices

```c
/* OSi_IrqHandlerTimer0.c .. Timer3.c: one file per timer */
/* Timer indices 0-3 map directly to NDS MMIO TIMERxCNT registers */
/* DMA indices 0-3: OSi_IrqHandlerDma0.c .. Dma3.c */
typedef enum NdsTimer {
    NDS_TIMER_0 = 0,
    NDS_TIMER_1 = 1,
    NDS_TIMER_2 = 2,
    NDS_TIMER_3 = 3,
} NdsTimer;
typedef enum NdsDma {
    NDS_DMA_0 = 0,
    NDS_DMA_1 = 1,
    NDS_DMA_2 = 2,
    NDS_DMA_3 = 3,
} NdsDma;
```

Confirmed: `OSi_IrqHandlerTimer0.c` .. `Timer3.c`, `OSi_IrqHandlerDma0.c` .. `Dma3.c`.

---

## func_02006c0c task-creation convention

```c
/* func_02006c0c(template, priority, flags): create/spawn a task */
/* priority arg appears as literal 4 in all matched call sites */
/* flags arg is always 0 in matched call sites */
#define TASK_CREATE_PRIORITY  4
#define TASK_CREATE_FLAGS     0
```

Confirmed: `func_ov000_021aae34` (calls with (x, 4, 0)),
`func_ov006_021b8c50`, `func_ov011_021ca324`.
