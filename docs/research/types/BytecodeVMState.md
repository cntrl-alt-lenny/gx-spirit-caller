[//]: # (markdownlint-disable MD013 MD041)

# BytecodeVMState

State for an embedded bytecode / scripting VM. Two functions confirm the same
struct: `func_02024630` (r6 = first arg) and `func_0202884c` (r9 = first arg).
Has a sub-region at +0x100 aliased as a second local pointer, and a register
file with entries at stride 0x2C starting from offset +0xAC.

## Confidence: MEDIUM

Two assembly functions agree on 15+ offsets. No matched C source yet —
inference is purely assembly.

## C Definition

```c
/* Register-file entry (embedded array, stride 0x2C, starts at +0xAC) */
typedef struct VMReg {
    /* +0x00  gap */
    int            f4;      /* +0x04 */
    int            f8;      /* +0x08 */
    int            fc;      /* +0x0C */
    signed short   f10;     /* +0x10  (s16) */
    unsigned char  f11;     /* +0x11 */
    unsigned char  f12;     /* +0x12 */
    unsigned char  f13;     /* +0x13 */
    /* +0x14..+0x2B  gap */
} VMReg;                    /* sizeof = 0x2C */

/* Sub-object at BytecodeVMState+0x88 (pointer) */
typedef struct VMObj88 {
    /* +0x00..+0x07  gap */
    int            f8;      /* +0x08 */
    int            fc;      /* +0x0C */
} VMObj88;

/* Sub-object at BytecodeVMState+0x94 (pointer) */
typedef struct VMObj94 {
    /* +0x00..+0x13  gap */
    int            f14;     /* +0x14 */
    int            f18;     /* +0x18 */
} VMObj94;

typedef struct BytecodeVMState {
    void          *pc;        /* +0x000  program counter / bytecode pointer */
    int            f4;        /* +0x004 */
    /* +0x008..+0x067  gap */
    int            f68;       /* +0x068  (store) */
    int            f6c;       /* +0x06C  (store) */
    int            f70;       /* +0x070  (store) */
    int            f74;       /* +0x074  (store) */
    /* +0x078..+0x07B  gap */
    int            f7c;       /* +0x07C  (store) */
    int            f80;       /* +0x080  (store) */
    VMObj88       *f88;       /* +0x088  pointer to sub-object */
    unsigned short f8c;       /* +0x08C  (store; u16) */
    /* +0x08E..+0x093  gap */
    VMObj94       *f94;       /* +0x094  pointer to sub-object */
    /* +0x098..+0x0A3  gap */
    int            fa4;       /* +0x0A4 */
    /* +0x0A8..+0x0AB  gap */
    VMReg          regs[?];   /* +0x0AC  register file (stride 0x2C; count unknown) */
    /* +0x100  start of in-struct sub-region (aliased as separate pointer) */
    /* +0x103  u8 (ldrsb, indexed by offset into sub-region) */
    /* +0x113  u8 */
    /* +0x123  u8 */
    /* +0x133  u8 */
    /* +0x142  u8 (store) */
    /* +0x143  u8 */
    /* +0x153  u8 */
    /* +0x162–0x166  u16 stores (3×) */
    unsigned short f16a;      /* +0x16A  flags halfword (r/w) */
    int            f16c;      /* +0x16C  (store) */
    int            f170;      /* +0x170  (store) */
    /* +0x174..+0x186  gap */
    unsigned char  f187;      /* +0x187 */
    unsigned short f18c;      /* +0x18C  (store) */
    unsigned short f18e;      /* +0x18E  (store) */
    unsigned short f190;      /* +0x190  (store) */
    /* +0x192..+0x199  gap */
    unsigned short f19a;      /* +0x19A  (r/w) */
    /* ... */
} BytecodeVMState;            /* sizeof >= 0x19C */
```

## Layout evidence

| Offset | Width | R/W | Source |
|--------|-------|-----|--------|
| 0x000 | ptr  | r/w | func_02024630, func_0202884c |
| 0x004 | s32  | r/w | both |
| 0x068–0x080 | s32×5 | store | func_02024630 |
| 0x088 | ptr  | r/w | func_0202884c |
| 0x08C | u16  | store | func_0202884c |
| 0x094 | ptr  | r/w | func_0202884c |
| 0x0A4 | s32  | load | func_0202884c |
| 0x0AC–0x13C | VMReg entries | r/w | func_02024630 |
| 0x16A | u16  | r/w | func_0202884c |
| 0x18C–0x190 | u16×3 | store | func_0202884c |
| 0x19A | u16  | r/w | both |

Sub-region at +0x100: byte accesses at stride +0x10 (0x103, 0x113, 0x123,
0x133, 0x143, 0x153) — register array with 0x10-byte entries, each having
an identifier byte at +0x3.

## Using functions

- `func_02024630` — bytecode execution loop (r6 = VM state; heavy register
  file access at 0xAC+)
- `func_0202884c` — VM state update / dispatch (r9 = VM state; heavy flags/
  pointer work at 0x88, 0x94, 0x16A, 0x18C)
