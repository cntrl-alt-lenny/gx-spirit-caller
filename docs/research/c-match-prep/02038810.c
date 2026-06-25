/* CAMPAIGN-PREP candidate for func_02038810 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed s8 field_6a; bitfield via lsl/lsr u16 mask; bind ent base, accumulator-first orr
 *   risk:       orig binds ent(r5) and obj(r4) across uses and keeps two mask copies r8/r9; if mwcc collapses m/bit into one reg the asr loop reg diverges. reshape-able (separate locals m and bit, declared in use order)
 *   confidence: low
 */
#include <stdio.h>

typedef unsigned char u8;
typedef signed char s8;
typedef unsigned short u16;
typedef short s16;
typedef unsigned int u32;
typedef int s32;

struct Obj_2038810 {
    u8 _pad0[0x34];
    u32 field_34;      /* +0x34: lsr#0x14 & 0xf == 1 */
    u8 _pad38[0x68 - 0x38];
    u16 field_68;      /* +0x68: tst 0x6000 */
    s8 field_6a;       /* +0x6a: signed, < 4 */
};

struct Entry_84 {
    u16 mask;          /* +0x0 */
    u8 _pad2[0x84 - 2];
};

extern struct Entry_84 data_0219b550[];
extern struct Obj_2038810 *func_02037b58(int a, int b, int c);
extern void func_0203874c(void *p, int b, int c);
extern void func_02087df4(void *p, int mask, int b);

int func_02038810(int a0, int mask, int r2, int r3) {
    struct Obj_2038810 *obj;
    struct Entry_84 *ent;
    s8 t;
    u32 m;
    int bit;
    void *p;

    obj = func_02037b58(a0, mask, r2);
    if (obj == 0) return 0;
    t = obj->field_6a;
    if (t >= 4) return 0;
    if (((obj->field_34 >> 0x14) & 0xf) != 1) return 0;

    ent = &data_0219b550[t];
    if ((unsigned)mask < 0x10000) {
        mask = 1 << mask;
    }
    m = (u16)mask;
    bit = m;
    ent->mask |= (u16)m;
    if (m != 0) {
        p = (char *)ent + 4;
        do {
            if (bit & 1) {
                func_0203874c(p, r2, r3);
            }
            bit = (int)bit >> 1;
            p = (char *)p + 8;
        } while (bit != 0);
    }
    if ((obj->field_68 & 0x6000) == 0 && r3 == 0) {
        func_02087df4((char *)obj + 4, m, r2);
        ent->mask &= (u16)~m;
    }
    return 1;
}
