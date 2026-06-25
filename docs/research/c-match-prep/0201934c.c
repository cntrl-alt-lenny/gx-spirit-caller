/* CAMPAIGN-PREP candidate for func_0201934c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     byte-table index then switch; cmp/movge override arms as if-assigns
 *   risk:       reshape-able: arms use signed movge/movlt (so g0/g1 must be `int`), and the dispatch is two-tier (`bgt`/`bge` for the 0x3b boundary + `addls pc` for 0..7) — mwcc may pick a different jump-table/branch split; case-body order must follow source to lay the table ascending.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0201934c (main, class C) — prep batch p_0004.
 * UNVERIFIED build-free draft. Drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: byte-table index then switch(key); each arm cmp/movge as if-assign returning override else unchanged key
 */
/* func_0201934c: in=r0. key = data_020be6c4[in] (ldrb). g0 = *(int*)(data_02104f4c+0x928),
 * g1 = *(int*)(data_02104f4c+0x92c) — both loaded up front and reused across arms. Returns key
 * UNCHANGED unless an arm overrides r0. Dispatch: switch(key) with a 0..7 jump table, plus
 * key==0x3b and key==0x49. Each override is `if (g0 >= K) r0 = V;` (movge = signed if-assign),
 * some chained (a second cmp g0,K2; cmpge g1,K3). 0x49 arm uses movlt (g0<0xa). 0x3b arm uses
 * cmpeq chains. Default arms (key 0,1,2,5,7 and miss) return key as-is. */
extern unsigned char data_020be6c4[];
extern char data_02104f4c[];

int func_0201934c(int in) {
    int r0 = data_020be6c4[in];
    int g0 = *(int *)(data_02104f4c + 0x928);
    int g1 = *(int *)(data_02104f4c + 0x92c);
    switch (r0) {
    case 3:
        if (g0 >= 0x24) r0 = 0x4a;
        break;
    case 4:
        if (g0 >= 0x29) r0 = 0x5e;
        break;
    case 6:
        if (g0 >= 0x18) r0 = 0x4b;
        if (g0 >= 0x17 && g1 >= 0x4) r0 = 0x4b;
        break;
    case 7:
        if (g0 >= 0x2c) r0 = 0x3f;
        if (g0 >= 0x2b && g1 >= 0x3) r0 = 0x3f;
        break;
    case 0x49:
        if (g0 < 0xa) r0 = 0x2d;
        if (g0 == 0xa) { if (g1 < 0x7) r0 = 0x2d; }
        break;
    case 0x3b:
        if (g0 == 0x21 && g1 == 0x3) r0 = 0x3c;
        if (g0 == 0x21 && g1 == 0x4) r0 = 0x3d;
        break;
    }
    return r0;
}
