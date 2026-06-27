/* CAMPAIGN-PREP candidate for func_021d9810 (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     VEIN B template + 3 b500 early guards; z@sp8,y@sp4 via 02006110 (decl z before y); buf[2] status msg; 02037208(0x42,-1,0,1) -1-not-folded; .64 once-latch
 *   risk:       struct-guessed/reshape-able: the epilogue returns r5 (the z/found latch, value 1 on the success path, 0 otherwise) NOT a separate r — the return var must be the SAME local set to 1 inside both hit-branches; b/y/z range constants and the b500.64 latch are confirmed but the return-var aliasing is the key reshape.
 *   confidence: low
 */
/* func_ov004_021d9810: cursor-validation (VEIN B template, extended). Three early
 * guards on b500 (.5c!=0, .54!=5, .224!=0) return 0; then if 02006194||0200617c
 * sample the cursor (02006110 fills z@sp8,y@sp4) and validate z in [0xe4,0xfe),
 * y in [2,0x1e); else test data_02104bac+0x54 & 2 with .224==0. On hit, once per
 * .64 latch, push a status message (02034888 + 021c9d8c + 02037208(0x42,-1,0,1)). */
#include "ov004_core.h"
extern char data_02104bac[];
extern int  func_02006194(void);
extern int  func_0200617c(void);
extern void func_02006110(int *a, int *b);
extern void func_02034888(int a, void *buf, int n);
extern void func_02037208(int a, int b, int c, int d);
extern void func_ov004_021c9d8c(int x);

int func_ov004_021d9810(void) {
    char *b = data_ov004_0220b500;
    int r = 0;
    int z, y;
    short buf[2];
    if (*(int *)(b + 0x5c) != 0) return 0;
    if (*(int *)(b + 0x54) != 5) return 0;
    if (*(int *)(b + 0x224) != 0) return 0;
    if (func_02006194() != 0 || func_0200617c() != 0) {
        func_02006110(&z, &y);
        if (z >= 0xe4 && z < 0xfe && y >= 2 && y < 0x1e) {
            r = 1;
            if (func_0200617c() != 0) r = 1;
        }
    } else if (*(unsigned short *)(data_02104bac + 0x54) & 2) {
        if (*(int *)(b + 0x224) == 0) { z = 1; r = z; }
    }
    if (r != 0 && *(int *)(b + 0x64) == 0) {
        int one = 1;
        *(int *)(b + 0x64) = one;
        buf[0] = 4;
        buf[1] = (short)(0x10000 - one);
        func_02034888(3, buf, 4);
        func_ov004_021c9d8c(one);
        func_02037208(0x42, -1, 0, one);
    }
    return z; /* NOTE: epilogue returns r5 (=z latch), see risk */
}
