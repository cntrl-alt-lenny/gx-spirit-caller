[//]: # (markdownlint-disable MD013 MD041)

# main E/F Re-triage — Round 9 (R9)

Generated 2026-07-02. This is the **third** pass over main's E/F hard tier,
following R4 (`MainEFRetriage.md`, 80 funcs sampled by size < 300B,
8 clean + 2 conditional upgrades) and R8 (`MainEFRetriageR8.md`, 35 funcs
on a virgin slice, 100% tractable). The 50 addresses below were selected
by **size-ascending order from the TRUE residual** — i.e. every address
already excluded by both `MainEFRetriage.md` and `MainEFRetriageR8.md` —
covering the smallest ~50 of the ~710 functions in main's hard tier that
have never been examined in any retriage round.

KB docs referenced: `docs/research/types/GameSingleton.md`,
`docs/research/types/GlobalAudioState.md`,
`docs/research/types/GlobalData02102c7c.md`,
`docs/research/types/GlobalData02104bac.md`,
`docs/research/types/GlobalData02104e6c.md`,
`docs/research/types/GlobalData02104f1c.md`,
`docs/research/constants/MainConstants.md`,
`docs/research/constants/CardIdRanges.md`,
`docs/research/constants/BitFlagMasks.md`,
`docs/research/constants/DuelStateEnums.md`,
`docs/research/data/MainDataExtended.md`,
`docs/research/data/FunctionPointerTables.md`,
`docs/research/data/VtableDispatchPatterns.md`,
`docs/research/retriage/MainEFRetriage.md` (R4), and
`docs/research/retriage/MainEFRetriageR8.md` (R8).

## Calibration note (confirmed, not just predicted)

The task brief flagged in advance that this pool's original heuristic
notes skew toward "blx callback/vtable", "coin-flip register",
"IRQ/spinloop scheduling", and "float CPSR" language — qualitatively
different from R8's mostly "missing struct name" finds — and predicted a
**lower** hit rate than R8's 100%. That prediction held: **34/50 (68%)**
this round, materially below R8, and the 16 walls are concentrated in
exactly the categories the calibration note anticipated (undocumented
overlay-region vtables, CPSR-flag float compares, pure reg-alloc/
scheduling-bound arithmetic). Six of R4's own pre-flagged "Confirmed
Intractable" addresses (`0x02084ac4`, `0x020a1bbc`, `0x0207cd34`,
`0x020491ec`, `0x020b17ac`, `0x020059b0` — all six fell inside this
50-address sample) were independently re-verified against the *current*
`.s` and all six still hold as walls — no KB fact published since R4
resolves `data_021a98fc`, `data_021a0890`, `data_0219dc80`,
`data_021040ac+0x28`, or the HAKMEM popcount kernel's "no C equivalent"
status. A seventh R4-flagged address, `0x020970a8`, was initially
returned as an upgrade by this round's drafting pass (citing a coarse
worklist match in `brief-268-overfire-stylea-tail-subfamilies.md`); on
independent verification against the actual `.s` and against
`brief-271-overfire-drain-wave5.md` (which states only 6 of that brief's
23 "Family F" candidates are confirmed clean shells, the remaining 17
being "loop-bodied"), the reversal did not hold up — `0x020970a8` is a
3-way vtable-dispatch switch where the IRQ shell is only one of three
branches, and the vtable dispatch itself remains blocked on the same
undocumented `data_<r5>+0x50` struct R4 originally flagged. It is
reported as WALL below, consistent with R4 (all seven R4-flagged
addresses in this sample end up re-confirmed as walls).

## Summary

| Metric | Count |
|--------|-------|
| Addresses assigned | 50 |
| Skipped (already `.c`-matched) | 0 |
| Examined | 50 |
| **Newly tractable** | **34 (68%)** |
| Confirmed intractable (wall) | 16 (32%) |
| Of which: R4-precedent re-confirmed | 7 (incl. one contested-then-reverted, `0x020970a8`) |
| Of which: new walls (not in any prior doc) | 9 |
| New KB gaps found | 20 (see below) |

### Evidence-tier disclosure

Unlike R8 (which drew almost entirely on the seven canonical
`docs/research/types|constants|data/*.md` docs), a large fraction of this
round's tractable upgrades lean on a **secondary evidence tier**:
`docs/research/dossiers/`, `docs/research/dossiers-high/`, and
`docs/research/c-match-prep/*.c` sibling files. These are per-function
research artifacts from other campaign lanes, not the canonical KB docs
this brief specified. Some are genuinely shipped, buildable source
(`src/main/func_*.legacy.c` — verified present on disk, e.g.
`func_02092388.legacy.c`, `func_02091a0c.legacy.c`), which is strong
evidence. Others are explicitly self-labeled **"UNVERIFIED: built-free
swarm draft"** with a `confidence: low/med/high` field, and in at least
one case (`020a70fc.c`, `0209a0a4.c`) explicitly say struct offsets are
"guessed." Every tractable write-up below that depends on this tier is
marked **[secondary-tier]**; write-ups with no such marker rely only on
the seven canonical docs plus self-contained arithmetic/parameter
provenance. Treat `[secondary-tier]` verdicts as directionally right but
in need of a first-build objdiff check before being taken as gospel —
this is consistent with those source files' own stated `confidence`
fields.

---

## Newly Tractable Funcs

### 0x0209d3dc (92 B, class E)

**Original verdict:** low — "infinite irq-poll dispatch, blx rotation"

**Upgrade reason [secondary-tier]:** Standard NitroSDK IRQ-guarded poll/
dispatch idiom. `data_021a84c0` — not in a canonical KB doc — has an
internally-consistent partial layout established across five sibling
`docs/research/c-match-prep/` candidates (`0209c31c.c`, `0209c034.c`,
`0209c0dc.c`, `0209c1dc.c`, `0209c280.c`), all confirmed to be the same
global. `0209c0dc.c` shows `func_0209d3dc` (this exact function) being
*registered* as the task callback stored at `base+0x44`, explaining the
parameterless infinite loop and the `blx [r5+0x40]` dispatch-out call
each iteration.

**Struct/data needed:** `data_021a84c0` — NEW GAP: `+0x40` (fn ptr, called
each loop iter), `+0x104` (self-pointer, write-only here), `+0x114` (u32
flags, bit 0x8 tested).

**Ground-truth pool words (verbatim):** `data_021a84c0`

**Ground-truth BL/BLX targets (verbatim):** `bl OS_DisableIrq`,
`bl func_02091a8c`, `bl OS_RestoreIrq`, `blx r1` (resolved:
`data_021a84c0.field_40`, documented fn-ptr slot per sibling precedent)

**C sketch:**
```c
typedef struct {
    char _pad_00[0x40];
    void (*field_40)(void *self);
    char _pad_44[0x104 - 0x44];
    void *field_104;
    int  field_108;
    char _pad_10c[0x114 - 0x10c];
    int  field_114;
} data_021a84c0_t;
extern data_021a84c0_t data_021a84c0;

void func_0209d3dc(void) {
    data_021a84c0_t *base = &data_021a84c0;
    for (;;) {
        int saved = OS_DisableIrq();
        if (!(base->field_114 & 0x8)) {
            base->field_104 = (void *)((char *)base + 0x44);
            do {
                func_02091a8c(0);
            } while (!(base->field_114 & 0x8));
        }
        OS_RestoreIrq(saved);
        base->field_40((void *)base);
    }
}
```

**Levers:** MED — `+0x44` must literally be `base+0x44`, not a separate
named field, per sibling idiom. The inner do/while vs if+do/while framing
must match siblings' shape.

---

### 0x02045618 (96 B, class E)

**Original verdict:** low — "poll loop with delay call, scheduling"

**Upgrade reason [secondary-tier]:** `data_0219dad0` is confirmed by five
independent `c-match-prep` siblings (`02045678.c`, `02045744.c`,
`020457d8.c`, `02045828.c`, `02045954.c`) as a global pointer-to-singleton
with a `u16 f4` field at `+0x4`. This function is a teardown/deregister:
null-check, then either a fast dequeue path (`f4==1`) or a retry loop
polling `func_0203cb40()` with `func_02091768(10)` delays between
attempts.

**Struct/data needed:** `data_0219dad0` (global `S *`, field `+0x4` u16,
per 5x sibling precedent — no new gap, reuses established sibling struct).

**Ground-truth pool words (verbatim):** `data_0219dad0`

**Ground-truth BL/BLX targets (verbatim):** `bl func_0203cb40` (x2),
`bl func_02091768` (arg=10)

**C sketch:**
```c
typedef struct {
    int            f0;
    unsigned short f4;
    unsigned short f6;
} S;
extern S *data_0219dad0;

void func_02045618(void) {
    S *s = data_0219dad0;
    if (s == 0) return;
    if (s->f4 == 1) {
        s->f4 = 0;
        data_0219dad0 = 0;
        return;
    }
    if (func_0203cb40() == 0) {
        int delay = 10;
        do { func_02091768(delay); } while (func_0203cb40() == 0);
    }
    data_0219dad0 = 0;
}
```

**Levers:** LOW-MED — the singleton address is reloaded fresh at the final
store (not cached across calls), matching natural C codegen since r0
isn't callee-saved.

---

### 0x020a6ce0 (104 B, class E)

**Original verdict:** low — "loop with mul-index and many live regs"

**Upgrade reason [secondary-tier]:** `func_020a70fc`'s own
`c-match-prep` candidate explicitly documents `func_020a6ce0` as its
own null-arg fallback (`if (p == 0) return func_020a6ce0();`), confirming
a no-arg `int` signature. The function walks a bounded (≤3 records),
0x4c-stride table at `data_02102718`, touching only a single `+0x4` field
per record (a 3-bit extract) with no further unknown dereferences.

**Struct/data needed:** `data_02102718` — NEW GAP: array of records,
stride 0x4c, `+0x4` word with bits [7:5] gating a conditional call.

**Ground-truth pool words (verbatim):** `data_02102718`

**Ground-truth BL/BLX targets (verbatim):** `bl func_020a70fc` (plain
`bl` per iteration, NOT indirect)

**C sketch:**
```c
typedef struct {
    char _pad0[0x4];
    unsigned int field_4;
    char _pad8[0x4c - 0x8];
} Rec02102718;
extern Rec02102718 data_02102718[];

int func_020a6ce0(void) {
    Rec02102718 *base = data_02102718;
    int result = 0;
    int i = 1;
    Rec02102718 *cur = base;
    for (;;) {
        if ((cur->field_4 << 0x16) >> 0x1d) {
            if (func_020a70fc(cur) != 0) result = ~0;
        }
        if (i >= 3) { cur = base; break; }
        cur = (Rec02102718 *)((char *)base + i * 0x4c);
        i++;
        if (cur == 0) break;
    }
    return result;
}
```

**Levers:** HIGH — an unusual reg-alloc shape (accumulator register doing
double duty as loop sentinel) suggests the true source has a different
index/pointer relationship than this sketch; expect a real reshape.

---

### 0x02043b70 (108 B, class E)

**Original verdict:** low — "two poll loops, WaitByLoop, scheduling"

**Upgrade reason [secondary-tier]:** Near-exact structural sibling of two
already-drafted `c-match-prep` candidates (`02043c28.c`, `02043ca4.c`)
establishing the full idiom: poll-slot-ready, register a callback
(`func_02043b38`, itself a resolved sibling), then poll a second
condition with `WaitByLoop` delays. `WaitByLoop` is confirmed as an SWI
0x03 stub (`MainConstants.md`). My target hard-codes constant args where
the siblings take parameters — a simpler variant of the same shape.

**Struct/data needed:** None — pure parameter/constant-driven idiom.

**Ground-truth pool words (verbatim):** `func_02043b38`

**Ground-truth BL/BLX targets (verbatim):** `bl func_0209640c` (4,1),
`bl func_02096434` (4, &func_02043b38), `bl func_02043d3c` (7,0,0,0, in
loop), `bl WaitByLoop` (0x40000, in loop) — zero indirect calls

**C sketch:**
```c
int func_02043b70(void) {
    while (func_0209640c(4, 1) == 0) ;
    func_02096434(4, func_02043b38);
    while (func_02043d3c(7, 0, 0, 0) != 1)
        WaitByLoop(0x40000);
    return 1;
}
```

**Levers:** LOW — directly modeled on 2 near-identical siblings sharing
the exact two-loop-plus-register shape.

---

### 0x0203991c (116 B, class E)

**Original verdict:** low — "event loop with blx indirect call + reload
liveness"

**Upgrade reason [secondary-tier]:** Every symbol has direct sibling
precedent. `data_0219c480+0x2` matches the `h2` field established by
`c-match-prep/0203a104.c` (itself a resolved sibling whose 0/1/0x81
return-value semantics directly explain this function's masking/store).
The terminal `blx r1` is a Pattern-B null-checked callback where `r1` is
loaded from a *named* global (`data_0219b300`), not an unnamed
overlay-region struct — the tractable case, not the wall case.

**Struct/data needed:** `data_0219b300` (NEW GAP: null-checked callback
slot, named global), `data_0219b30c` (NEW GAP: arg to that callback),
`data_0219b2f2` (NEW GAP: u16 flags, bit 0x4 tested+cleared),
`data_0219c480` (documented partial struct, `+0x2`/`h2` per sibling).

**Ground-truth pool words (verbatim):** `data_0219b30c`, `data_0219b300`,
`data_0219b2f2`, `data_0219c480`

**Ground-truth BL/BLX targets (verbatim):** `bl func_02091cf8`
(conditional), `bl func_0203a104`, `blx r1` (resolved:
`data_0219b300`, null-checked, arg=`data_0219b30c`), `bl func_02091a8c`

**C sketch:**
```c
typedef struct { unsigned short h0; unsigned short h2; } Flags;
extern void *data_0219b30c;
extern void (*data_0219b300)(void *arg);
extern unsigned short data_0219b2f2;
extern Flags data_0219c480;

void func_0203991c(void) {
    for (;;) {
        if (data_0219b2f2 & 0x4) {
            data_0219b2f2 &= ~0x4;
            func_02091cf8();
        }
        int r = func_0203a104();
        data_0219c480.h2 = (unsigned short)(r & 0x1);
        if (r != 0) { func_02091a8c(0); continue; }
        if (data_0219b300 != 0) data_0219b300(data_0219b30c);
        func_02091a8c(0);
    }
}
```

**Levers:** MED — the exact branch topology (single flat loop vs nested)
needs re-verification against the label graph before finalizing.

---

### 0x0207113c (116 B, class E)

**Original verdict:** low — "infinite loop, bswap+cmp dispatch, liveness"

**Upgrade reason:** Pure register byte-swap/mask arithmetic on a
callee-returned value plus literal comparisons — no struct/global lookup
beyond a single opaque field read on the pointer `func_0207397c`
returns. All four callees are named `.extern`s.

**Struct/data needed:** None (the `+0xc` field belongs to whatever
`func_0207397c` returns, treated opaquely).

**Ground-truth pool words (verbatim):** `0x00000806`

**Ground-truth BL/BLX targets (verbatim):** `bl func_0207397c`,
`bl func_020711b0` (cond, ==0x800), `bl func_02072a14` (cond, ==0x806),
`bl func_0207391c` (loop tail, every iteration)

**C sketch:**
```c
void func_0207113c(void) {
    int frame;
    for (;;) {
        void *r0 = func_0207397c(&frame);
        if ((unsigned int)frame > 0x22) { func_0207391c(); continue; }
        unsigned short raw = *(unsigned short *)((char *)r0 + 0xc);
        unsigned int swapped = (unsigned short)((raw >> 8) | (raw << 8));
        if (swapped == 0x800) func_020711b0((char *)r0 + 0xe, frame - 0xe);
        else if (swapped == 0x806) func_02072a14((char *)r0 + 0xe, frame - 0xe);
        func_0207391c();
    }
}
```

**Levers:** MED — byte-swap idiom must be written as a literal
16-bit-swap-and-zero-extend expression, not a builtin, to match the exact
4-instruction shape.

---

### 0x02093fb8 (120 B, class E)

**Original verdict:** low — "spin-wait poll loops + bit ops"

**Upgrade reason [secondary-tier]:** The `0x040000b0`-based spin-wait is
the documented DMA-busy-bit poll idiom (`BitFlagMasks.md`: bit 31 = DMA
busy). Corroborated by sibling `c-match-prep/02093c90.c` using the same
`0x040000bX` MMIO family. IRQ calibration case (a): poll on raw MMIO =
tractable.

**Struct/data needed:** None beyond raw MMIO address arithmetic.

**Ground-truth pool words (verbatim):** `0x040000b0`

**Ground-truth BL/BLX targets (verbatim):** `bl func_02093c20` (setup),
`bl func_01ff86fc` (payload, post-wait)

**C sketch:**
```c
void func_02093fb8(int self, void *dst, int count, int mode) {
    if (mode == 0) return;
    func_02093c20(self, dst, mode, 0);
    volatile unsigned int *dmacnt =
        (volatile unsigned int *)(0x040000b0 + ((self * 3 + 2) * 4));
    while (*dmacnt & 0x80000000u) {}
    func_01ff86fc(self, dst, count, ((unsigned int)mode >> 1) | 0x80000000u);
    while (*dmacnt & 0x80000000u) {}
}
```

**Levers:** MED — the address-calc sequence must reproduce exactly as
scaled-index pointer arithmetic; moderate reg-alloc risk on the held
dmacnt pointer across two loops.

---

### 0x02094030 (124 B, class E)

**Original verdict:** low — "DMA wait spinloops, mul addr calc, orr
magic"

**Upgrade reason [secondary-tier]:** Structurally identical to
`0x02093fb8` (same DMA-busy poll idiom, same callees); only the guard
condition and mask shift differ.

**Struct/data needed:** None; same DMA MMIO base arithmetic.

**Ground-truth pool words (verbatim):** `0x040000b0`

**Ground-truth BL/BLX targets (verbatim):** `bl func_02093c20`,
`bl func_01ff86fc`

**C sketch:**
```c
void func_02094030(int self, void *dst, int mode, int count) {
    func_02093c20(self, dst, mode, count);
    if (count == 0) return;
    volatile unsigned int *dmacnt =
        (volatile unsigned int *)(0x040000b0 + ((self * 3 + 2) * 4));
    while (*dmacnt & 0x80000000u) {}
    func_01ff86fc(self, dst, mode, ((unsigned int)count >> 2) | 0x88000000u);
    while (*dmacnt & 0x80000000u) {}
}
```

**Levers:** Same as `0x02093fb8`.

---

### 0x0207cdd0 (128 B, class E)

**Original verdict:** low — "asr/ror bit twiddling, predicated branches"

**Upgrade reason:** No struct/vtable/blx at all — pure carry-flag-driven
unsigned-compare arithmetic (a `cmp`-driven `if`, NOT a CPSR-write like
the float-compare walls below) plus a closed-form bit-rotate identity.
`data_021a08bc`/`data_021a08c0` are undocumented but accessed only via
direct byte load/store, self-contained.

**Struct/data needed:** `data_021a08bc` — NEW GAP: single byte scalar
(ring-buffer index/counter). `data_021a08c0` — NEW GAP: byte array,
indexed by a computed rotate-result (history/lookup table).

**Ground-truth pool words (verbatim):** `data_021a08bc`, `data_021a08c0`

**Ground-truth BL/BLX targets (verbatim):** none (leaf)

**C sketch:**
```c
extern unsigned char data_021a08bc;
extern unsigned char data_021a08c0[];

int func_0207cdd0(int a0) {
    unsigned char idx = data_021a08bc;
    unsigned char val = (a0 & 2) ? (unsigned char)((a0 >> 2) & 0xff)
                                  : (unsigned char)(((a0 >> 2) + 0x19) & 0xff);
    unsigned int rot = ((unsigned int)idx << 28) | ((unsigned int)idx >> 4);
    unsigned int off = (idx >> 31) + rot;
    data_021a08c0[off] = val;
    if (idx < 0x10) { data_021a08bc = idx + 1; return 0; }
    idx = idx + 1;
    off = (idx >> 31) + (((idx << 28) | (idx >> 4)));
    data_021a08bc = (unsigned char)(off + 0x10);
    return 0;
}
```

**Levers:** MED-HIGH — the rsb/ror bit-rotate identity must be
transcribed with extreme literalness; a naive simplification will likely
not reproduce the exact instruction pair, expect 1+ reshape.

---

### 0x02087444 (128 B, class E)

**Original verdict:** low — "loop with shift-mask retest, branch
reg-alloc"

**Upgrade reason [secondary-tier]:** All four callees are a confirmed
sibling family per `dossiers-high/02087174.md`, `dossiers-high/
020871ac.md`, and `dossiers/0208881c.md` — all calling the same four
functions in the same order. The struct is the function's own
caller-supplied first parameter, self-contained.

**Struct/data needed:** `r4` struct — NEW GAP: `+0x0`/`+0x8`/`+0xc`/
`+0x10`, inferred from direct-offset access only.

**Ground-truth pool words (verbatim):** none

**Ground-truth BL/BLX targets (verbatim):** `bl func_02095cfc` (x2),
`bl func_020955a8` (cond), `bl func_02095678` (cond, arg=1),
`bl func_020955e8` (cond/uncond)

**C sketch:**
```c
struct S87444 { int bit_idx; int flag8; int flagc; int val10; };

void func_02087444(struct S87444 *p) {
    if (p->flag8 == 0) {
        unsigned int mask = (unsigned int)func_02095cfc();
        if ((mask & (1u << p->bit_idx)) == 0) return;
        int h = func_020955a8();
        func_02095678(1);
        func_020955e8(h);
        return;
    }
    if (p->flagc == 0) { func_020955e8(p->val10); p->flagc = 1; }
    do {
        /* poll */
    } while (((unsigned int)func_02095cfc()) & (1u << p->bit_idx));
}
```

**Levers:** LOW-MED — variable-shift mask idiom reproduces cleanly;
moderate risk on which branch mwcc treats as fallthrough.

---

### 0x020909d0 (128 B, class E)

**Original verdict:** low — "blx callback + irq save/restore branches;
coin-flip regs"

**Upgrade reason:** IRQ calibration case (b): `OS_DisableIrq`/
`OS_RestoreIrq` (or register-preserving variants) bracket the whole body
— standard critical-section idiom. The `blx r7` is calibration case (a):
`r7` is the function's own 3rd parameter, a caller-supplied callback
argument — deterministic regardless of runtime callee identity.

**Struct/data needed:** None.

**Ground-truth pool words (verbatim):** none

**Ground-truth BL/BLX targets (verbatim):** `bl func_020937d0` (locked
variant) or `bl OS_DisableIrq`, `bl func_020947c8`, `blx r7` (cond,
caller-supplied 3rd-param callback), `bl func_020937e4`/`bl
OS_RestoreIrq` (matching branch)

**C sketch:**
```c
int func_020909d0(int a0, void *a1, void (*cb)(void), int locked) {
    int state = locked ? func_020937d0() : OS_DisableIrq();
    int result = func_020947c8(a0, a1);
    if (result == 0) {
        if (cb != 0) cb();
        *(short *)((char *)a1 + 0x4) = (short)a0;
    }
    if (locked) func_020937e4(state); else OS_RestoreIrq(state);
    return result;
}
```

**Levers:** LOW — direct offset store is unambiguous; reg-alloc across
the two-branch save/restore is moderate but well-precedented.

---

### 0x02093a44 (136 B, class E)

**Original verdict:** low — "bit-scan rsb/mvn shift loop, reg-alloc
heavy"

**Upgrade reason [secondary-tier]:** `data_021a66f8`/`data_021a66fc` are
documented by sibling `dossiers-high/02093acc.md` using the identical two
symbols with matching access shapes (u32 flags word, u16[9] array).
`OS_DisableIrq`/`OS_RestoreIrq` bracket the whole loop.

**Struct/data needed:** `data_021a66f8` (u32, per sibling),
`data_021a66fc` (u16[9], per sibling).

**Ground-truth pool words (verbatim):** `data_021a66f8`, `0x000001ff`,
`data_021a66fc`

**Ground-truth BL/BLX targets (verbatim):** `bl OS_DisableIrq`,
`bl func_02093a3c` (loop, repeated), `bl OS_RestoreIrq`

**C sketch:**
```c
extern unsigned int data_021a66f8;
extern unsigned short data_021a66fc[9];

int func_02093a44(unsigned int mask, unsigned short match) {
    int state = OS_DisableIrq();
    unsigned int cur = mask & data_021a66f8 & 0x1ff;
    for (;;) {
        int bit = func_02093a3c(cur);
        int shift = 0x1f - bit;
        if (shift < 0) break;
        unsigned int clearmask = ~(1u << shift);
        cur &= clearmask;
        if (match == data_021a66fc[shift]) {
            data_021a66fc[shift] = 0;
            data_021a66f8 &= clearmask;
        }
    }
    OS_RestoreIrq(state);
    return 0;
}
```

**Levers:** MED — `func_02093a3c`'s exact bit-scan semantics are
inferred from return-value arithmetic, not independently documented.

---

### 0x020a6dc4 (136 B, class E)

**Original verdict:** low — "stream flush, bitfield flags + blx vtable"

**Upgrade reason [secondary-tier, partial]:** Pattern B — the struct
pointer (`r5`) is the function's own first parameter (self), fully known
identity even though specific offsets aren't in a canonical doc. A
`c-match-prep/020a70fc.c` sibling corroborates `+0x18`/`+0x28` on the
same struct via a sibling caller.

**Struct/data needed:** struct at `r5`: `+0x18`/`+0x28` corroborated by
draft; NEW GAP: `+0x1c`, `+0x24`, `+0x4` bit 13, `+0x40` (fn ptr), `+0x48`.

**Ground-truth pool words (verbatim):** none

**Ground-truth BL/BLX targets (verbatim):** `bl func_020a6d90` (cond),
`blx ip` (uncond, self-struct vtable slot), `bl func_020a6d94` (tail)

**C sketch:**
```c
struct S6dc4 {
    char _pad0[0x4];
    unsigned int flags;
    char _pad1[0x14];
    int f18, f1c;
    char _pad2[0x4];
    int f24, f28;
    char _pad3[0x14];
    void (*f40)(struct S6dc4 *self, int *out, int a2, int a3);
    char _pad4[0x4];
    int f48;
};

int func_020a6dc4(struct S6dc4 *self, int *out_opt) {
    int delta = self->f24 - self->f1c;
    if (delta == 0) { func_020a6d94(self); return 0; }
    self->f28 = delta;
    if (((self->flags << 18) >> 31) == 0) func_020a6d90(self->f1c, &self->f28);
    int result = self->f40(self, &self->f28, self->f1c, self->f48);
    if (out_opt != 0) *out_opt = self->f28;
    if (result != 0) return result;
    self->f18 += self->f28;
    func_020a6d94(self);
    return 0;
}
```

**Levers:** MED — field-layout guesses for `+0x1c`/`+0x24`/`+0x48` are
unverified beyond arithmetic-consistency; no null-check visible before
`f40`, treated as always-valid.

---

### 0x02044424 (140 B, class E)

**Original verdict:** low — "nested loops, inner retry, reg-alloc heavy"

**Upgrade reason [secondary-tier]:** `data_0219da78` corroborated via
sibling `dossiers/02044384.md`/`02044528.md` using the exact same global
and the exact same three callees in the same call pattern.

**Struct/data needed:** `data_0219da78` (int, per sibling precedent).

**Ground-truth pool words (verbatim):** `data_0219da78`

**Ground-truth BL/BLX targets (verbatim):** `bl func_02043c28` (inner
retry-loop body), `bl func_02043bdc` (inner retry-loop condition),
`bl func_02043b70` (tail check)

**C sketch:**
```c
int func_02044424(void *base, void **ptrs, void *flags) {
    unsigned char *p = (unsigned char *)base;
    int h = data_0219da78;
    for (int i = 0; i < 4; i++) {
        if (ptrs[i] != 0) {
            do { func_02043c28(h, 0x100, p); }
            while (func_02043bdc(p, h, 0x100, flags) == 0);
        }
        p += 0x100;
        h += 0x100;
    }
    return func_02043b70() != 0;
}
```

**Levers:** MED — permuter-class register-hold risk flagged by the
sibling dossiers; extra risk from an array-index gate not present in the
pure sibling shape.

---

### 0x02094864 (140 B, class E)

**Original verdict:** low — "VRAM-bank wait poll-loop; sign-bit spin,
reg-rotation"

**Upgrade reason [secondary-tier]:** Same `0x040000b0` DMA-busy-poll
family as `0x02093fb8`/`0x02094030`. IRQ calibration case (a).

**Struct/data needed:** None beyond the same DMA-channel-stride address
arithmetic.

**Ground-truth pool words (verbatim):** `0x040000b0`, `0xaf000001`

**Ground-truth BL/BLX targets (verbatim):** `bl func_02093c90`
(priority-scan setup, arg=-1), `bl func_02093c20` (setup),
`bl func_01ff8770` (payload)

**C sketch:**
```c
void func_02094864(int self, void *dst, void *param, int count) {
    func_02093c90(self, -1);
    func_02093c20(self, dst, count, 0x1000000);
    if (count == 0) return;
    volatile unsigned int *dmacnt =
        (volatile unsigned int *)(0x040000b0 + ((self * 3 + 2) * 4));
    while (*dmacnt & 0x80000000u) {}
    func_01ff8770(self, dst, param, 0xaf000001);
}
```

**Levers:** LOW-MED — `0xaf000001` loaded right before the call suggests
a 4th argument, resolved by first-build objdiff.

---

### 0x020940ac (144 B, class E)

**Original verdict:** low — "DMA spinloop variant, irq-guarded, magic
orr"

**Upgrade reason:** IRQ calibration case (a) — `OS_DisableIrq`/
`OS_RestoreIrq` bracketing a spin loop around a raw fixed MMIO word (bit
31 poll), not an undocumented struct. `0x040000b0`/`0x040000e0` are raw
DMA-controller MMIO base addresses. `func_01ff8664` is a plain named
extern.

**Struct/data needed:** None (raw MMIO literals, param-driven).

**Ground-truth pool words (verbatim):** `0x040000b0`, `0x040000e0`

**Ground-truth BL/BLX targets (verbatim):** `bl OS_DisableIrq`,
`bl func_01ff8664`, `bl OS_RestoreIrq` — all plain `bl`, no indirect
calls at all

**C sketch:**
```c
#define DMA_BASE ((volatile unsigned int *)0x040000b0)

void func_020940ac(int a0, int a1, int a2, int a3) {
    if (a3 == 0) return;
    while (DMA_BASE[a0 * 3 + 2] & 0x80000000) {}
    int tok = OS_DisableIrq();
    *(volatile unsigned int *)((a0 << 2) + 0x4000000 + 0xe0) = a2;
    func_01ff8664(a0, a1, DMA_BASE[a0 * 3 + 2], ((unsigned int)a3 >> 2) | 0x84000000);
    OS_RestoreIrq(tok);
    while (DMA_BASE[a0 * 3 + 2] & 0x80000000) {}
}
```

**Levers:** MED — the exact array-indexing arithmetic and
`func_01ff8664`'s argument marshalling are inferred, need objdiff
iteration.

---

### 0x0208ae34 (148 B, class E)

**Original verdict:** low — "multiple blx fnptr dispatch with arg
shuffling"

**Upgrade reason:** Pattern B — every `blx` dereferences a field of `r4`,
the function's OWN 5th (stack) parameter, so the struct pointer's
identity is fully known. Two of the three calls are explicitly
null-checked before the call; the third is unconditional.

**Struct/data needed:** NEW GAP — a 6-field dispatch-table struct passed
as the 5th argument: `+0x4` unconditional callback, `+0x8`/`+0xc`
optional pre-callback + extra arg, `+0x10`/`+0x14` optional post-callback
+ extra arg.

**Ground-truth pool words (verbatim):** none

**Ground-truth BL/BLX targets (verbatim):** `blx lr` (target=`[r4,#0x8]`,
null-checked), `blx ip` (1st, `[r4,#0x4]`, unconditional), `blx ip` (2nd,
`[r4,#0x10]`, null-checked), `bl func_02092904` x2

**C sketch:**
```c
typedef struct {
    void *unused0;
    void (*mainCb)(int a, int b, int c, void *self);
    void (*preCb)(int extra);
    int  preExtra;
    void (*postCb)(int a, int b, int d, int extra);
    int  postExtra;
} DispatchTbl_0208ae34;

void func_0208ae34(int a, int b, int c, int d, DispatchTbl_0208ae34 *tbl) {
    if (tbl->preCb) tbl->preCb(tbl->preExtra);
    tbl->mainCb(a, b, c, (void *)tbl);
    if (tbl->postCb) tbl->postCb(a, b, d, tbl->postExtra);
    func_02092904(a, c);
    func_02092904(b, c);
}
```

**Levers:** MED — field names beyond "fn ptr at this offset" are
unverified guesses; register pressure (6 live values, 3 calls, 2 spills)
is a plausible reg-alloc iteration risk.

---

### 0x020947d0 (148 B, class F)

**Original verdict:** low — "LZ decompress, nested loops heavy reg use"

**Upgrade reason:** Fully self-contained, parameter-driven LZ-style
decompression loop — zero externs, zero data symbols, zero calls. A
bit-flag byte gates literal-byte copy vs back-reference copy, entirely
deterministic from the two raw pointer parameters.

**Struct/data needed:** None.

**Ground-truth pool words (verbatim):** none

**Ground-truth BL/BLX targets (verbatim):** none (leaf, no `bl`/`blx`
anywhere)

**C sketch:**
```c
void func_020947d0(unsigned char *src, unsigned char *dst) {
    unsigned int header = *(unsigned int *)src;
    src += 4;
    int remaining = (int)(header >> 8);
    unsigned char flagByte = 0;
    int bitsLeft = 0;
    while (remaining > 0) {
        if (bitsLeft == 0) { flagByte = *src++; bitsLeft = 8; }
        bitsLeft--;
        if (flagByte & 0x80) {
            unsigned char b0 = src[0], b1 = src[1];
            int len = 3 + (b0 >> 4);
            unsigned int off = (((b0 & 0xf) << 8) | b1) + 1;
            src += 2;
            remaining -= len;
            while (len-- > 0) *dst++ = dst[-(int)off];
        } else {
            *dst++ = *src++;
            remaining -= 1;
        }
        flagByte <<= 1;
    }
}
```

**Levers:** MED — the `swpb` atomic-byte idiom and the exact loop
restructuring around the bit-counter re-entry points is intricate control
flow mwcc may schedule differently.

---

### 0x02061e88 (152 B, class E)

**Original verdict:** low — "blx callback wrapper, refcount teardown"

**Upgrade reason:** Pattern B — the single `blx r1` dereferences
`[r4,#0x24]`, and `r4` is the function's own 1st parameter, fully known
identity. Explicitly null-checked before being reloaded and called.
`data_021014dc`/`data_021014e4` feed a fixed-args diagnostic call, only
ever used as bare literal-pool addresses (never dereferenced) — no doc
needed.

**Struct/data needed:** NEW GAP — `r4`'s struct: `+0x14` (refcount),
`+0x1c` (reentry counter), `+0x24` (callback fn ptr, null-checked).

**Ground-truth pool words (verbatim):** `data_021014dc`, `data_021014e4`

**Ground-truth BL/BLX targets (verbatim):** `bl func_020a6d54` (args `0,
data_021014e4, 0, 0x1b`), `blx r1` (`[r4,#0x24]`, null-checked, self
passed as sole arg), `bl func_02064aa0` (teardown path)

**C sketch:**
```c
typedef struct {
    char _pad[0x14];
    int  refcount;
    char _pad2[0x1c - 0x14 - 4];
    int  reentryCount;
    char _pad3[0x24 - 0x1c - 4];
    void (*teardownCb)(void *self);
} Obj_02061e88;

int func_02061e88(Obj_02061e88 *obj) {
    if (obj == 0) func_020a6d54(0, &data_021014e4, 0, 0x1b);
    if (obj == 0) return 1;
    if (obj->teardownCb == 0) return 1;
    obj->reentryCount++;
    obj->teardownCb(obj);
    obj->reentryCount--;
    if (obj->refcount != 0 && obj->reentryCount == 0) {
        func_02064aa0(obj);
        return 0;
    }
    return 1;
}
```

**Levers:** LOW — field semantics inferred from usage shape only, but the
two literal-pool globals are only ever bare addresses, so low risk.

---

### 0x0208c348 (156 B, class F)

**Original verdict:** low — "64-bit cross-product math, dense smull/sbc
liveness"

**Upgrade reason:** Fully self-contained 64-bit fixed-point cross-product
arithmetic — zero externs, zero data symbols, zero calls. Three `smull`
pairs compute cross-products of two 3-element vectors, `subs`/`sbc` form
64-bit subtractions, each result rounded and shifted by 12 — a standard
Q12 3D cross-product routine.

**Struct/data needed:** None — two input pointers (3x s32 fixed-point
vectors), one output pointer.

**Ground-truth pool words (verbatim):** none

**Ground-truth BL/BLX targets (verbatim):** none

**C sketch:**
```c
void func_0208c348(int *a, int *b, int *out) {
    long long p0 = (long long)a[1] * b[2] - (long long)a[2] * b[1];
    long long p1 = (long long)a[2] * b[0] - (long long)a[0] * b[2];
    long long p2 = (long long)a[0] * b[1] - (long long)a[1] * b[0];
    out[0] = (int)((p0 + 0x800) >> 12);
    out[1] = (int)((p1 + 0x800) >> 12);
    out[2] = (int)((p2 + 0x800) >> 12);
}
```

**Levers:** HIGH — the original heuristic's own "dense smull/sbc
liveness" flag is earned: 9 callee-saved registers pushed, three 64-bit
cross-products with heavily interleaved live ranges. The C semantics are
correct but first-build match probability is low without iteration
(possibly multiple reshapes on declaration order of the three 64-bit
temporaries).

---

### 0x0208a5e4 (160 B, class E)

**Original verdict:** low — "nested counted loops with many calls, early
return"

**Upgrade reason:** All five callees are already-named externs with no
data-symbol dependency — every field access is on a value returned
directly from a named call, with no further unknown dereferences. The
"nested loops with many calls" flag is a false alarm; control flow is a
fully bounded double loop with ordinary early-return.

**Struct/data needed:** NEW GAP — object returned by
`func_02089198(int idx)`: `+0x0` (u8 count), `+0x2` (u16), `+0x4`
(ptr/handle).

**Ground-truth pool words (verbatim):** none

**Ground-truth BL/BLX targets (verbatim):** `bl func_020893f0` (once),
`bl func_02089198` (per outer iter, null-checked), `bl func_02087fe0`,
`bl func_02087fc8`, `bl func_02087f34` (per inner iter) — all plain `bl`

**C sketch:**
```c
typedef struct {
    unsigned char  count;
    unsigned short f2;
    void          *handle;
} Entry_0208a5e4;

int func_0208a5e4(int self) {
    func_020893f0(self);
    for (int idx = 0; idx < 0x20; idx++) {
        Entry_0208a5e4 *e = func_02089198(idx);
        if (e == 0) continue;
        func_02087fe0(idx, e->count);
        func_02087fc8(idx, e->f2);
        if (e->handle == 0 || self == 0) continue;
        if ((signed char)e->count > 0) {
            for (unsigned int i = 0; i < e->count; i++) {
                if (func_02087f34(idx, self, e->handle) == 0) return 0;
            }
        }
    }
    return 1;
}
```

**Levers:** MED — the inner loop reloads `e->count` fresh each pass in
the `.s`; may need an explicit re-read pattern if a plain `for` mismatches.

---

### 0x0209e3ac (164 B, class E)

**Original verdict:** low — "loop sum + double smull magic-divide chain"

**Upgrade reason [secondary-tier]:** Matches an established project
convention (`c-match-prep/02020490.c`) for a raw low-RAM literal-address
dereference (`*(int*)0x027ffc3c`) — self-contained, never used as a named
struct field. `func_02093a20` fills a 6-byte buffer summed byte-by-byte.
`0x66666667` is the textbook mwcc division-by-10 reciprocal-multiply
idiom.

**Struct/data needed:** None beyond the raw literal address.

**Ground-truth pool words (verbatim):** `0x027ffc3c`, `0x66666667`,
`0x00000014`

**Ground-truth BL/BLX targets (verbatim):** `bl func_02093a20` (only
call)

**C sketch:**
```c
unsigned short func_0209e3ac(void) {
    unsigned char buf[6];
    unsigned int sum = 0;
    func_02093a20(buf);
    for (int i = 0; i < 6; i++) sum = (unsigned short)(sum + buf[i]);
    sum = (unsigned short)(sum + *(int *)0x027ffc3c);
    sum = (unsigned short)(sum * 7);
    sum = (unsigned short)((sum / 10) + 200);
    return sum;
}
```

**Levers:** MED — the `(unsigned short)` truncation points at each
intermediate step must be preserved precisely or the match diverges on
overflow-wraparound edge cases.

---

### 0x020018d4 (168 B, class E)

**Original verdict:** low — "nested loop, many live regs, caller-saved"

**Upgrade reason:** `data_020b46e0` is a fully-characterized 18-entry
flat pointer array per `MainDataExtended.md`. `data_020c3cc8` is the
**third confirmed sibling** in the exact family `MainEFRetriageR8.md`
already established twice (`data_020c3cd0` for `CardSlot_ScanHandlers2`
/ `0x0200197c`, `data_020c3cd8` for `CardSlot_FreeTask` / `0x02001b18` —
both "1-off" addresses in the same "2-entry color/palette-select array"
family). `func_02001ba4` is already matched. `func_02006c0c` is the
documented task-creation convention (`MainConstants.md`). `func_02091554`
is the render call cited throughout R8 and prior retriage docs. This is
effectively a fourth sibling of R8's `0x0200197c`/`0x02001b18` pair —
same 9-iteration bit-scan structure, same array family.

**Struct/data needed:** None beyond plain indexed-array reads — all three
data symbols accessed only via `[base, idx*4]`.

**Ground-truth pool words (verbatim):** `data_020c3cc8`, `data_02102d04`,
`data_020b46e0`

**Ground-truth BL/BLX targets (verbatim):** `bl func_02001ba4`,
`bl func_02091554` (x2, inner loop), `bl func_02006c0c` (x2, inner loop)
— no indirect calls

**C sketch:**
```c
extern int  *data_020c3cc8;
extern char *data_02102d04;
extern char *data_020b46e0;

void func_020018d4(int *flags_in) {
    char buf[0x1c];
    func_02001ba4();
    for (int i = 0; i < 9; i++) {
        if ((flags_in[0] >> i) & 1) {
            void **out_a = (void **)(data_02102d04 + i * 8);
            void **out_b = (void **)(data_020b46e0 + i * 8);
            for (int j = 0; j < 2; j++) {
                int sel = (i >= 5) ? 1 : 0;
                func_02091554(data_020c3cc8[sel], (char *)out_b[j], buf, 0);
                void *h = func_02006c0c(buf, 4, 2);
                if (h != 0) out_a[j] = h;
            }
        }
    }
}
```

**Levers:** MED — the exact arg order/types of the two calls need
iteration against objdiff; the sibling family's own precedent
(R8) confirms this general shape but not this exact 4th instance byte-for-byte.

---

### 0x0204f8f0 (168 B, class F)

**Original verdict:** low — "loop with shifted-mask, many live accessor
temps"

**Upgrade reason:** `func_020498f0` is the documented `GameSingleton`
getter. This function accesses `+0x2D0`, which **is** documented in
`GameSingleton.md` (`unsigned char f2d0`), directly confirming one of
this function's three touched offsets. `+0xE` and `+0x2F0` are new gaps
but both are terminal single-field reads with no further indirection —
self-contained per the R8 tractability rule. `data_0219dc94` is a plain
BSS scratch buffer, read/write only.

**Struct/data needed:** GameSingleton `+0xE` — NEW GAP (u8, terminal
signed-compare bound). GameSingleton `+0x2D0` — documented (matches
canonical doc). GameSingleton `+0x2F0` — NEW GAP (u32 bitmask, terminal).
`data_0219dc94` — NEW GAP (BSS scratch byte buffer, >= 0x20 bytes).

**Ground-truth pool words (verbatim):** `data_0219dc94` (x3, same
literal)

**Ground-truth BL/BLX targets (verbatim):** `bl func_020498f0` (x5, all
direct, reloaded each time per the doc's "neither caches the pointer"
convention), `bl func_020945f4` (memset, `MainConstants.md`-adjacent
convention)

**C sketch:**
```c
extern unsigned char data_0219dc94[];

int func_0204f8f0(int *out_ptr_field) {
    if (func_020498f0() == 0) { *out_ptr_field = 0; return 0; }
    func_020945f4(data_0219dc94, 0, 0x20);
    int idx = 0;
    signed char count = *(signed char *)((char *)func_020498f0() + 0xe);
    if (count >= 0) {
        unsigned char *cursor = data_0219dc94;
        do {
            unsigned char shift = *((unsigned char *)func_020498f0() + idx + 0x2d0);
            unsigned int mask = *(unsigned int *)((char *)func_020498f0() + 0x2f0);
            if (((1 << shift) & mask) == 0) break;
            *cursor++ = *((unsigned char *)func_020498f0() + idx + 0x2d0);
            idx++;
            count = *(signed char *)((char *)func_020498f0() + 0xe);
        } while (idx <= count);
    }
    *out_ptr_field = (int)data_0219dc94;
    return *(unsigned char *)((char *)func_020498f0() + 0xe) + 1;
}
```

**Levers:** MED — field types for `+0xe`/`+0x2f0` are inferred from
access width, not KB-doc-stated. Moderate risk on the exact
`idx + 0x2d0` addressing mode (array-of-singletons vs `getter()+idx`
indexing a parallel array) — needs objdiff iteration.

---

### 0x0206bd74 (168 B, class F)

**Original verdict:** low — "loop with blx + IRQ save/restore, many live
temps"

**Upgrade reason [secondary-tier]:** An infinite polling loop wired to
already-known functions. `func_02092388` — confirmed as **shipped
in-tree source** at `src/main/func_02092388.legacy.c` (not just a
draft) — fills a caller-supplied stack struct (`Container`) and returns a
pointer via `*out` on success. The `blx r1` dereferences `[r0]` where
`r0` is that same freshly-populated stack struct — the struct pointer's
identity is known (a local buffer just filled by a documented function),
satisfying the tractable case even though the runtime callback value
varies. `func_020924c0`, `func_0209256c`, `func_0206bf60`,
`func_02091690`, `func_020916c8` all have established signatures from
the same sibling batch.

**Struct/data needed:** Stack-local `Container`-shaped struct (per
`func_02092388.legacy.c`'s own documented type) — first word is a
callback fn ptr; `+0x4`/`+0x8` NEW GAP but self-contained (never
dereferenced beyond one hop).

**Ground-truth pool words (verbatim):** none

**Ground-truth BL/BLX targets (verbatim):** `bl func_02092388`, `blx r1`
(target = `*(fnptr*)stackbuf[0]`, populated by the immediately-preceding
call — deterministic per-node callback), `bl OS_DisableIrq`,
`bl func_020916c8`, `bl func_020924c0`, `bl func_0209256c` (cond),
`bl func_0206bf60`, `bl func_02091690`, `bl OS_RestoreIrq`

**C sketch:**
```c
typedef struct QNode {
    void (*cb)(void *arg);
    char pad04[0x6c - 0x04];
    void *f6c;
} QNode;
typedef struct StackRec { QNode *node; QNode *f4; void *f8; } StackRec;

void func_0206bd74(void *self) {
    StackRec rec;
    for (;;) {
        if (func_02092388(self, &rec, 1) == 0) return;
        void *cbresult = rec.node->cb(0);
        int irq = OS_DisableIrq();
        func_020916c8();
        func_020924c0(self, 0, 0);
        if (rec.f4 != 0) rec.f4->f6c = cbresult;
        if (rec.f8 != 0) func_0209256c(cbresult, 0, 0);
        func_0206bf60(&rec);
        func_02091690();
        OS_RestoreIrq(irq);
    }
}
```

**Levers:** MED — `StackRec`/`QNode` field types are guessed and may
diverge from `func_02092388`'s true `out` struct shape; moderate
reg-alloc/CSE risk typical of this tier (the shipped sibling's own risk
note: "usually need 1+ reshape").

---

### 0x02093e38 (168 B, class E)

**Original verdict:** low — "DMA setup, blx callback, orr magic,
scheduling"

**Upgrade reason:** `func_02093c20` is confirmed matched (ported
NitroSDK `MIi_CheckDma0SourceAddress`). `func_02093dc8`/`func_01ff8770`
are the documented DMA-programmer recipe pair. The `blx r4` is loaded
from `[sp,#0x18]` — a **stack-passed 5th argument at function entry,
before any loop** — the tractable parameter-passed-callback pattern,
deterministic regardless of the runtime callee. `0xC4000000`/`0x86000000`
DMA control-word constants are pure bit arithmetic.

**Struct/data needed:** None beyond DMA control-word constants (plain
immediates).

**Ground-truth pool words (verbatim):** none

**Ground-truth BL/BLX targets (verbatim):** `bl func_02093c20` (always
first), then `blx r4` (callback, param-passed) OR `bl func_02093dc8` +
(`bl func_020906dc` cond) + `bl func_01ff8770`

**C sketch:**
```c
void func_02093e38(void *dst, void *src, unsigned int size, unsigned int flag,
                    void (*cb)(void *arg)) {
    func_02093c20((unsigned int)dst, (unsigned int)src, size, 0);
    if (flag == 0) { if (cb != 0) cb(dst); return; }
    func_02093dc8(dst);
    if (cb != 0) {
        func_020906dc(dst, cb, src);
        func_01ff8770(dst, src, size, (size >> 2) | 0xC4000000);
    } else {
        func_01ff8770(dst, src, size, (size >> 2) | 0x86000000);
    }
}
```

**Levers:** LOW — matches an already-validated DMA-programmer recipe
closely; main uncertainty is `func_020906dc`'s exact param binding at
this call site (a differently-signatured `func_020906dc` exists
elsewhere), needs objdiff confirmation.

---

### 0x02061290 (172 B, class E)

**Original verdict:** low — "parity/checksum loop, heavy eor liveness,
permuter-class"

**Upgrade reason:** No `.extern` at all — the entire function operates
only on its own parameter (a byte buffer) with pure register arithmetic.
This is a self-contained checksum/parity function; the "permuter-class"
flag is a reg-alloc-risk warning, not an unresolved KB fact.

**Struct/data needed:** None — sole input is a flat byte array.

**Ground-truth pool words (verbatim):** none

**Ground-truth BL/BLX targets (verbatim):** none (leaf)

**C sketch:** (approximate — see Levers; the true C shape needs
conditional-select verification against the `.s`)
```c
int func_02061290(unsigned char *arr) {
    unsigned char a0 = arr[0];
    int acc = a0 & 1;
    for (int i = 1; i < 0x20; i++) {
        unsigned char prev = arr[i - 1];
        int t1 = (i ^ prev) & 1;
        acc ^= t1;
        acc ^= a0 & 1;
        /* remaining conditional-select chain omitted pending objdiff */
        if (acc == 0 && !(arr[i] & 1)) continue;
        return 0;
    }
    return 1;
}
```

**Levers:** HIGH — this is an approximate transcription of a dense
flag-coin-flip register chain (`movcc`/`movcs` conditional-select
pairs). Reproducing the exact C shape that compiles to branchless
conditional-selects (not branches) is genuinely the "permuter-class,
heavy eor liveness" risk the original heuristic flagged — real
reg-alloc/scheduling risk, likely multiple reshapes or a `.s` fallback.
Flagged tractable in the sense that no KB fact blocks it, not that it
will 1-shot match.

---

### 0x0206a984 (172 B, class E)

**Original verdict:** low — "ror/rsb mul-magic index math,
scheduling-bound"

**Upgrade reason [secondary-tier]:** All three callees are named/known:
`func_020aaddc` is matched as `strlen`-like, `func_020b3870` is the
extensively-precedented signed-divmod runtime helper (used identically
across many matched functions), `func_02067984` is called opaquely with
computed-pointer args on the function's OWN base (`r9`). The
`ror`/`rsb`/`mul` sequence is the standard mwcc division-by-constant
idiom feeding array indexing.

**Struct/data needed:** None beyond the function's own parameters; the
`[r9,#0x54]`/`[r9,#0x74]` offsets are on the function's OWN struct,
terminal.

**Ground-truth pool words (verbatim):** `0x000004bc`

**Ground-truth BL/BLX targets (verbatim):** `bl func_020aaddc` (once,
pre-loop), `bl func_020b3870` (in loop), `bl func_02067984` (once,
post-loop)

**C sketch:**
```c
void func_0206a984(void *self, signed char *b, int count) {
    char *base54 = (char *)self + 0x54;
    int len = func_020aaddc(base54);
    for (int i = 0; i < count; i++) {
        int idx = func_020b3870(i, len);
        signed char c1 = base54[idx];
        signed char c0 = b[i];
        int rot = ((i * c1) >> 27) | ((i * c1) << 5);
        signed char *slot = (signed char *)self + 0x74 + rot;
        *slot ^= (signed char)(((c0 ^ c1) << 0x18) >> 0x18);
    }
    func_02067984((char *)self + 0x4bc, (char *)self + 0x74, 8);
}
```

**Levers:** MED — the `ror`/`rsb`/`mla` chain computing the store index
is a classic mwcc division-by-constant lowering; reproducing the exact
scheduling is the primary risk, typical of "scheduling-bound" functions.

---

### 0x02079d30 (172 B, class E)

**Original verdict:** low — "carry-propagating add loop, cond-epilogue,
reg-alloc"

**Upgrade reason [secondary-tier]:** `func_02079e20` is a fully
documented helper (`c-match-prep/02079e20.c`): trims trailing-zero limbs
for bignum normalization, used identically by sibling matched-context
functions. This is a standard big-number ripple-carry-add loop over
`unsigned short` limb arrays, followed by a normalize-and-zero-fill tail
via the documented memset convention (`func_020945f4`).

**Struct/data needed:** None — pure arithmetic over three caller-supplied
`unsigned short*` limb-array parameters.

**Ground-truth pool words (verbatim):** none

**Ground-truth BL/BLX targets (verbatim):** `bl func_02079e20` (x2,
normalized lengths of both operands), `bl func_020945f4` (cond, tail
zero-fill)

**C sketch:**
```c
unsigned short *func_02079d30(unsigned short *dst, unsigned short *a,
                               unsigned short *b, int len) {
    int na = func_02079e20(a, len);
    int nb = func_02079e20(b, len);
    int n = (na < nb) ? nb : na;
    if (n != len) n = n + 1;
    unsigned int carry = 0;
    int i;
    for (i = 0; i < n; i++) {
        unsigned int sum = (unsigned int)a[i] + b[i] + carry;
        dst[i] = (unsigned short)sum;
        carry = sum >> 16;
    }
    if (dst == a || dst == b) return dst;
    func_020945f4(dst + i, 0, (unsigned)(len - i) * 2);
    return dst;
}
```

**Levers:** LOW-MED — the carry-propagate loop is a standard shape mwcc
typically matches cleanly; minor risk on which register mwcc reuses for
the post-loop carry.

---

### 0x02081bd8 (172 B, class E)

**Original verdict:** low — "nested mla index + flag tests + liveness
across call"

**Upgrade reason [secondary-tier]:** `func_02081c84` already has a full
`c-match-prep` body establishing the same "hdr{ofs,count,flags} +
indexed list" struct shape this caller walks, confirming the pattern is
a recognized convention in this code region. `func_020854f4` is a plain
named call with computed pointer/value args. Every offset accessed is on
the function's OWN parameters or on pointers freshly derived from them
in the SAME function — self-contained, single-hop, terminal.

**Struct/data needed:** NEW GAP — local record layout: base object
`+0x8` (header offset), header `+0x1`/`+0x2` (count/offset), sub-record
`+0x6`/`+0x2`/`+0x3` (offset/offset/flag), second object `+0x34`.

**Ground-truth pool words (verbatim):** none

**Ground-truth BL/BLX targets (verbatim):** `bl func_020854f4` (loop,
every iteration), `bl func_02081c84` (loop, cond)

**C sketch:**
```c
int func_02081bd8(unsigned char *self, unsigned char *other) {
    unsigned int hdrofs = *(unsigned int *)(self + 0x8);
    unsigned char *hdr = self + hdrofs;
    unsigned short subofs = *(unsigned short *)(hdr + 0x2);
    unsigned char *sub = hdr + subofs;
    if (*(unsigned char *)(sub + 0x1) == 0) return 1;
    int result = 1;
    for (int i = 0; i < *(unsigned char *)(sub + 0x1); i++) {
        unsigned short off6 = *(unsigned short *)(sub + 0x6);
        unsigned char *rec = sub + off6;
        unsigned short off2 = *(unsigned short *)(rec + 0x2);
        unsigned char *listrec = rec + off2 + i * 0x10;
        int r = func_020854f4(listrec, other + *(unsigned short *)(other + 0x34));
        if (r != 0) {
            unsigned short off6b = *(unsigned short *)(sub + 0x6);
            unsigned short base6 = *(unsigned short *)(sub + off6b);
            unsigned char *slot = sub + off6b + 4 + base6 * i;
            if ((*(unsigned char *)(slot + 0x3) & 1) == 0)
                func_02081c84(hdr, other);
        } else {
            result = 0;
        }
    }
    return result;
}
```

**Levers:** MED — struct field names/types are inferred, not
KB-documented; the `.s` reloads a field fresh rather than caching it
across a branch (classic "reload not bind" mwcc pattern), which the
sketch tries to mirror. Expect at least one round of struct-shape
correction via objdiff.

---

### 0x02091768 (172 B, class E)

**Original verdict:** low — "umull divmod magic + mla + loop + irq;
permuter"

**Upgrade reason [secondary-tier]:** `data_021a63c8` is a documented
sibling global (`c-match-prep/02091c44.c`: `void **`, ptr-to-ptr), used
exactly as documented (double-deref to a struct base, then a `+0xb0`
field store matching the SAME offset seen in `func_02091748`'s known
body). `func_02093454` and `func_02091748` both have fully known bodies.
`func_0209360c` is matched. Standard IRQ critical-section idiom bracketing
a 64-bit magic-multiply timer computation against a fixed constant — a
deterministic fixed-point scale, not scheduling ambiguity.

**Struct/data needed:** `data_021a63c8` (documented, `void **`). Target
struct's `+0xb0` field (matches `func_02091748`'s own documented offset —
consistent cross-reference).

**Ground-truth pool words (verbatim):** `data_021a63c8`, `0x000082ea`,
`func_02091748`

**Ground-truth BL/BLX targets (verbatim):** `bl func_0209360c`,
`bl OS_DisableIrq`, `bl func_02093454` (passing `func_02091748` as a
function-pointer VALUE, not called directly — a `.word` pool entry, not
an unresolved indirect call), `bl func_02091a8c` (loop, cond),
`bl OS_RestoreIrq`

**C sketch:**
```c
extern void **data_021a63c8;

void func_02091768(unsigned int scale) {
    int localbuf[2];
    func_0209360c(localbuf);
    void *obj = *data_021a63c8;
    int irq = OS_DisableIrq();
    unsigned int lo6 = (scale * 0x82ea) >> 6;
    *(int **)((char *)obj + 0xb0) = localbuf;
    func_02093454(obj, lo6, 0, func_02091748, (int)localbuf);
    int idx = 0;
    while (obj != 0) {
        func_02091a8c(idx++);
        obj = *data_021a63c8;
    }
    OS_RestoreIrq(irq);
}
```

**Levers:** MED-HIGH — the exact 64-bit `umull`/`mla` scale computation
needs precise reconstruction to match mwcc's fixed-point-multiply
instruction selection; this is the "permuter" flag from the original
heuristic and genuinely carries scheduling risk, but the risk is in
exact-bit-shape reproduction of KNOWN arithmetic, not an unresolved KB
fact.

---

### 0x020924c0 (172 B, class E)

**Original verdict:** low — "irq spin-loop + cond loads/stores; reg
coin-flip"

**Upgrade reason [secondary-tier]:** This function shares the `Container`
struct family (`{base, index, count}` at `+0x10/+0x18/+0x1c`) confirmed
in **shipped source** `src/main/func_02092388.legacy.c` and
`src/main/func_02091a0c.legacy.c` — genuinely in-tree files, not drafts.
`func_02091a8c` and `func_02091a0c` both have known signatures. This is
the canonical documented critical-section spin-loop (IRQ calibration
case b).

**Struct/data needed:** `Container` struct — cross-confirmed by two
shipped sibling `.legacy.c` files, not a fresh gap.

**Ground-truth pool words (verbatim):** none

**Ground-truth BL/BLX targets (verbatim):** `bl OS_DisableIrq`,
`bl func_02091a8c` (loop, cond), `bl func_020b3870` (divmod-family
helper), `bl func_02091a0c`, `bl OS_RestoreIrq`

**C sketch:**
```c
typedef struct Container {
    char _pad00[0x10];
    int *base;
    int  f14;
    int  index;
    int  count;
} Container;

int func_020924c0(Container *c, int *out, int flagarg) {
    int irq = OS_DisableIrq();
    if (c->count == 0) {
        int wantflag = flagarg & 1;
        for (;;) {
            if (wantflag == 0) { OS_RestoreIrq(irq); return 0; }
            func_02091a8c((char *)c + 0x8);
            if (c->count != 0) break;
        }
    }
    if (out != 0) *out = c->base[c->index];
    func_020b3870(c->index + 1, c->count);
    c->index = c->index + 1;
    c->count = c->count - 1;
    func_02091a0c(c);
    OS_RestoreIrq(irq);
    return 1;
}
```

**Levers:** LOW — near-identical in shape to the shipped, verified
`func_02092388` sibling from the same batch; the do/while-with-
predicated-return idiom is proven for this exact struct family. Main
open item is `func_020b3870`'s precise role in the index-increment
(mod-by-count wraparound), reshape-able not blocking.

---

### 0x0206904c (176 B, class E)

**Original verdict:** low — "three blx indirect dispatch on vtable ptr"

**Upgrade reason:** No `.extern` at all — every symbol is a function
parameter. **Correction to the original heuristic note:** the three
"blx" sites are NOT three different vtable slots — all three go through
the SAME field (`[r4,#0x630]`) on the function's own 4th parameter, one
call executed per switch-case with a different literal 2nd-arg
(`1`/`2`/`4`). Self-identified struct via param, one dispatch slot.

**Struct/data needed:** NEW GAP — `r4`+0x630 (fn ptr, called with fixed
mode constant per case), `+0x634` (3rd callback arg), `+0x628` (u32,
compared), `+0x62c` (u16, compared).

**Ground-truth pool words (verbatim):** none

**Ground-truth BL/BLX targets (verbatim):** `blx ip` (one call SITE
executes per invocation, target=`[r4,#0x630]`, self-derived struct field
— three code-duplicated call sites in the `.s`, not three distinct
slots)

**C sketch:**
```c
typedef struct Ctx {
    char pad600[0x600];
    unsigned short f62c;
    char pad60e[0x628 - 0x602];
    unsigned int f628;
    char pad62c[0x630 - 0x62c];
    int (*f630)(void *self, int mode, void *arg3);
    void *f634;
} Ctx;
typedef struct Out { unsigned int f0; unsigned short f4; } Out;

void func_0206904c(void *unused_r0, int selector, Out *out, Ctx *ctx) {
    switch (selector) {
    case 0: ctx->f630(ctx, 1, ctx->f634); break;
    case 1: ctx->f630(ctx, 2, ctx->f634); break;
    case 2: ctx->f630(ctx, 4, ctx->f634); break;
    default: break;
    }
    if (out == 0) return;
    if (out->f0 != (unsigned int)ctx->f628) return;
    if (out->f4 == ctx->f62c) ctx->f628 = 0;
}
```

**Levers:** LOW — a three-way switch through one self-derived function
pointer with constant args is a highly deterministic shape; main risk is
field type/size guesses and whether the `.s`'s call-site duplication
(rather than a shared tail) is naturally reproduced by a plain `switch`.

---

### 0x0206dc04 (176 B, class F)

**Original verdict:** low — "10 calls, iterator loop, irq; heavy call
sequencing"

**Upgrade reason [secondary-tier]:** True `bl` count in the `.s` is
exactly 10, matching the original note precisely. Every callee is
named/known: `func_020924c0` has a fully known body (this very document,
above); `func_0209256c`, `func_0206bf60`, `func_02091690`,
`func_0209198c` are all matched or confirmed-signature. Structurally a
near-sibling of `0x0206bd74` above, reusing the exact same
`func_020924c0`/`func_0209256c`/`func_0206bf60` triple in a very similar
IRQ-bracketed iterator loop.

**Struct/data needed:** None beyond `func_020924c0`'s already-established
`Container`-shaped `out` parameter; the stack-local record's `+0x8` flag
matches `0x0206bd74`'s identical offset on the same kind of record.

**Ground-truth pool words (verbatim):** none

**Ground-truth BL/BLX targets (verbatim, in call order):**
`bl func_02091af4`, `bl OS_DisableIrq`, `bl func_020916c8`,
`bl func_020924c0` (first), `bl func_0209256c` (cond, in loop),
`bl func_0206bf60` (cond, in loop), `bl func_020924c0` (second,
loop re-fetch), `bl func_02091690`, `bl func_0209198c`,
`bl OS_RestoreIrq` — 10 unique callees, zero `blx`

**C sketch:**
```c
typedef struct QRec { char pad08[0x8]; void *f8; } QRec;

void func_0206dc04(void *self) {
    if (self == 0) return;
    func_02091af4((char *)self + 0x20);
    int irq = OS_DisableIrq();
    func_020916c8();
    QRec *rec;
    if (func_020924c0(self, (int *)&rec, 0) != 0) {
        do {
            if (rec != 0) {
                if (rec->f8 != 0) func_0209256c(rec, -11, 0);
                func_0206bf60(rec);
            }
        } while (func_020924c0(self, (int *)&rec, 0) != 0);
    }
    func_02091690();
    func_0209198c();
    OS_RestoreIrq(irq);
}
```

**Levers:** LOW-MED — nearly a superset of `0x0206bd74`'s shape reusing
the exact same call triple, which de-risks the overall structure;
residual risk is the `-11` constant's role as `func_0209256c`'s 2nd arg
and the stack-slot aliasing between the two `func_020924c0` call sites.

---

## Confirmed Intractable (16 functions)

| Address | Size | Note | Specific ambiguity |
|---------|------|------|---------------------|
| `0x02084ac4` | 40 | blx through fnptr at `[r0+0xc]` | R4-precedent, re-confirmed unchanged: caller parameter's own struct type has no KB doc anywhere (not just the callback slot — the object itself is unnamed) |
| `0x020a1bbc` | 60 | blx via `data_021a98fc[0]+0x14e4` | R4-precedent, re-confirmed unchanged: `data_021a98fc` overlay-region global, zero KB doc |
| `0x0207cd34` | 72 | blx via `data_021a0890[0x28]` | R4-precedent, re-confirmed unchanged: `data_021a0890` overlay-region global, zero KB doc |
| `0x020800b8` | 92 | list-walk + predicated `mlals`/`ldmlsfd` | conditional-return-via-MLA fusion has no equivalent single C statement (mwcc predication artifact), compounded by an undocumented linked-list node type |
| `0x020805b0` | 92 | morton-interleave mla chain | zero symbols to resolve — pure bit-interleave scheduling/register-assignment ambiguity, not a documentation gap |
| `0x020b2c68` | 92 | float compare, CPSR bit 29 write | comparison result written directly into CPSR via `mrs`/`msr`, observable past `bx lr` — no C construct sets a specific condition flag as a caller-visible side effect |
| `0x020b2cc4` | 92 | float compare, CPSR bit 29 write | same construct as `0x020b2c68`, inverse polarity |
| `0x02088620` | 128 | blx through runtime-discovered callback record | target loaded from a stack slot populated at runtime by a `func_020924c0` callback — neither a named global nor a caller parameter, unresolvable from any KB fact |
| `0x020491ec` | 132 | blx via `data_0219dc80[0x34/0x38]` | R4-precedent, re-confirmed unchanged: `+0x34`/`+0x38` remain undocumented even in informal sibling notes (which cover only `+0x0`/`+0x8`/`+0xc`/`+0x10`) |
| `0x020907b4` | 144 | conditional `mlale`-based base select into `data_021a6354` | struct has no entry in any of the 6 KB-documented structs; the two near-identical `cmp`/`mlale` branch-range blocks are a genuine "coin-flip register" reg-alloc shape, not resolvable without seeing source layout for the target array |
| `0x02070bac` | 148 | blx through `data_0219ef14`, reloaded every loop iteration | bare undocumented-global-hosted fn ptr with no null-check and no parameter origin; `data_021a63d0+0xa4` further dereferenced is likewise undocumented |
| `0x020b17ac` | 148 | 64-bit HAKMEM popcount | R4-precedent, re-confirmed unchanged: `0x55555555`/`0x33333333`/`0x0f0f0f0f` classic reduction chain, pure constant-chain arithmetic with no reliable C-source equivalent for mwcc's exact scheduling |
| `0x020b2978` | 152 | float compare, CPSR bit 29 write | same construct as `0x020b2c68`/`0x020b2cc4` |
| `0x0209a000` | 164 | blx via `data_021a8394[0]` | overlay-region-style global; even the project's own best unverified guess for this exact struct explicitly flags "struct offsets guessed" / "confidence: low" — not KB-resolved by any tier |
| `0x020970a8` | 172 | vtable blx then result-dispatch + spin loop | R4-precedent, re-confirmed after a contested reversal was independently checked and rejected (see Calibration note above) — the IRQ shell is only one of three switch branches; the `blx [*r7+0x50]` dispatch and the struct hosting it (`data_<r5>`) remain undocumented for all three branches |
| `0x020059b0` | 176 | binary-search + blx r8 (stack arg), `data_021040ac+0x28` | R4-precedent, re-confirmed unchanged: the callback-arg part alone is tractable, but the compounding write-target offset `+0x28` is absent from `GlobalAudioState.md`'s full documented field list |

---

## New KB gaps found

Listed inline per-function above; consolidated here for follow-up. None
of these are edits to shared docs — this is a worklist for a future KB
extension pass.

1. **`data_021a84c0`** (main overlay-region global) — `+0x40` (fn ptr,
   dispatch-out slot), `+0x104` (self-pointer), `+0x114` (u32 flags, bit
   0x8). Evidence: `0x0209d3dc` plus 5 `c-match-prep` siblings.
2. **`data_0219dad0`** — pointer-to-singleton, `+0x4` (u16 `f4`).
   Evidence: `0x02045618` plus 5 `c-match-prep` siblings.
3. **`data_02102718`** — record array, stride 0x4c, `+0x4` (u32, bits
   [7:5] gate a call). Evidence: `0x020a6ce0`.
4. **`data_0219b300`** / **`data_0219b30c`** / **`data_0219b2f2`** — a
   null-checked callback slot + its arg + an unrelated flags word.
   Evidence: `0x0203991c`.
5. **`data_021a08bc`** / **`data_021a08c0`** — a byte index/counter and a
   byte lookup/history array it indexes. Evidence: `0x0207cdd0`.
6. **`r4`-struct family (0x02087444)** — `+0x0`/`+0x8`/`+0xc`/`+0x10`
   int fields on a caller-supplied struct, self-contained.
7. **`data_021a66f8`** (u32 flags) / **`data_021a66fc`** (u16[9] array)
   — corroborated by sibling dossier. Evidence: `0x02093a44`.
8. **`S6dc4` struct family (0x020a6dc4)** — `+0x1c`, `+0x24`, `+0x4` bit
   13, `+0x40` (fn ptr), `+0x48`; `+0x18`/`+0x28` partially corroborated.
9. **`data_0219da78`** (int) — corroborated by 2 sibling dossiers.
   Evidence: `0x02044424`.
10. **Object returned by `func_02089198(idx)`** — `+0x0` (u8 count),
    `+0x2` (u16), `+0x4` (ptr/handle). Evidence: `0x0208a5e4`.
11. **`Obj_02061e88` struct** — `+0x14` (refcount), `+0x1c` (reentry
    counter), `+0x24` (callback fn ptr, null-checked).
12. **`data_020c3cc8`** — third confirmed sibling of the
    `data_020c3cd0`/`data_020c3cd8` 2-entry select-array family
    (`MainEFRetriageR8.md`). Evidence: `0x020018d4`. **This one should
    be folded into a future KB doc update alongside its two R8
    siblings — it is the strongest-evidence gap in this batch.**
13. **GameSingleton `+0xE`** (u8, terminal) and **`+0x2F0`** (u32
    bitmask, terminal) — extends the existing canonical doc. Evidence:
    `0x0204f8f0`. `+0x2D0` is already documented and was independently
    re-confirmed by this function.
14. **`data_0219dc94`** — BSS scratch byte buffer, >= 0x20 bytes.
    Evidence: `0x0204f8f0`.
15. **`StackRec`/`QNode` struct** (stack-local, populated by
    `func_02092388`) — `+0x0` (callback fn ptr), `+0x4`, `+0x8`.
    Evidence: `0x0206bd74`, reused by `0x0206dc04`.
16. **Local record layout (0x02081bd8)** — base `+0x8`, header `+0x1`/
    `+0x2`, sub-record `+0x6`/`+0x2`/`+0x3`, second object `+0x34`.
17. **Target struct `+0xb0`** (int-ptr field) reached via
    `data_021a63c8`'s double-deref — cross-confirmed against
    `func_02091748`'s own documented offset. Evidence: `0x02091768`.
18. **`Ctx` struct (0x0206904c)** — `+0x628` (u32), `+0x62c` (u16),
    `+0x630` (fn ptr, single dispatch slot called with 3 different mode
    constants), `+0x634` (3rd callback arg).
19. **`Container` struct** — `{base +0x10, index +0x18, count +0x1c}` —
    already cross-confirmed by two shipped `src/main/*.legacy.c` files
    (`func_02092388`, `func_02091a0c`); this round's `0x020924c0` and
    `0x0206dc04`/`0x0206bd74` are additional independent confirmations.
    **Strong candidate for a canonical KB doc**, on par with
    `GlobalData02104f1c.md` in confidence.
20. **`0x0209a000`'s `data_021a8394`** — explicitly flagged unresolved;
    even the project's best unverified guess admits "struct offsets
    guessed." Listed here as a negative result — do not treat the
    existing informal guess as usable evidence for a future pass.
