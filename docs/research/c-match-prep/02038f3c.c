/* CAMPAIGN-PREP candidate for func_02038f3c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     movlt clamp via if-assign; bind ip/global; ptr-arith arr[clamp]; loop stores +0x34 then +0x14 in order
 *   risk:       struct-guessed: arr14 at +0x14 and arr34 at +0x34 sizes inferred from base+i*4. Note orig writes [+0x34] before [+0x14] each iter; if struct decl reorders, store order swaps. reshape-able (keep store order)
 *   confidence: med
 */
#include <stdio.h>

typedef unsigned short u16;
typedef unsigned int u32;
typedef int s32;

struct Glob_9c480 {
    u8 _pad0[0x6];
    u16 field_6;       /* +0x6 <- r2 */
    u8 _pad8[0xc - 8];
    u32 *field_c;      /* +0xc <- lr + n*4 */
    u32 *field_10;     /* +0x10 <- r4 + n*4 */
};

typedef unsigned char u8;
extern struct Glob_9c480 data_0219c480;
extern u16 data_020fe4c0;

struct Obj_2038f3c {
    u8 _pad0[0x14];
    u32 arr14[8];      /* +0x14 */
    u8 _pad34[0x34 - (0x14 + 0x20)];
    u32 arr34[8];      /* +0x34 */
};

void func_02038f3c(struct Obj_2038f3c *obj, int n, int r2) {
    int clamp;
    int i;

    clamp = n;
    if (n < 0) clamp = 0;
    data_0219c480.field_6 = (u16)r2;
    data_020fe4c0 = (u16)clamp;
    data_0219c480.field_10 = &obj->arr14[clamp];
    data_0219c480.field_c = &obj->arr34[clamp];
    if (n < 0) {
        for (i = 0; i < 8; i++) {
            obj->arr34[i] = 0;
            obj->arr14[i] = 0xffff;
        }
    }
}
