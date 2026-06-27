/* CAMPAIGN-PREP candidate for func_0203a5d4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     stride i<<1 base+offset re-derived per use; lsr#0x18&1 dispatch; (v<<8)>>8 mask; sl=2 hoisted const
 *   risk:       orig recomputes base+i<<1 twice (r0 reload) and holds sl=#2 + base(r5) + i(r4) across loop; mwcc may CSE the address into one reg, dropping the second add. reshape-able (recompute e inside the if)
 *   confidence: low
 */
#include <stdio.h>

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef int s32;

struct Slot_a5d4 {
    u8 _pad0[0x4];
    u16 field_4;       /* +0x4 : ld halfword, sentinel 0xffff */
};

extern struct Slot_a5d4 *func_020892c4(int r7);
extern void *func_02089260(int idx);
extern int func_02039180(int r8, int r7, int r3, int r6);
extern int func_0203953c(u32 a, int two, int r6);

int func_0203a5d4(int r8, int r7, int r6) {
    struct Slot_a5d4 *base;
    int i;
    int sl;
    struct Slot_a5d4 *e;
    void *q;
    u32 v;

    base = func_020892c4(r7);
    if (base == 0) return 0;

    sl = 2;
    for (i = 0; i < 4; i++) {
        e = (struct Slot_a5d4 *)((char *)base + (i << 1));
        if (e->field_4 == 0xffff) continue;
        q = func_02089260((int)e->field_4);
        if (q == 0) return 0;
        v = *(u32 *)q;
        if ((v >> 0x18) & 1) {
            e = (struct Slot_a5d4 *)((char *)base + (i << 1));
            if (func_02039180(r8, r7, e->field_4, r6) != 0) continue;
            return 0;
        } else {
            v = (v << 8) >> 8;
            if (func_0203953c(v, sl, r6) == 0) return 0;
        }
    }
    return 1;
}
