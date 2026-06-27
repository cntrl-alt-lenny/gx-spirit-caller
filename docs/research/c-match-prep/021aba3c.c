/* CAMPAIGN-PREP candidate for func_021aba3c (ov008, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bind sl base + shifted r8 induction (+0x20<<23/iter); strh const +2/iter; store-order
 *   risk:       permuter-class: documented 20v20 reg-alloc wall (orig holds a0-1 in a fresh reg + reuses; mwcc subtracts in place), stable across operand orders; loop induction reg-alloc compounds it -> likely .s.
 *   confidence: low
 */
/* func_ov008_021aba3c (ov008, class D): command-record family, counted-loop
 * variant (cf. 021abba0/abb08, the documented 20v20 reg-alloc wall). One pre-
 * loop record then 2 loop records; each = pack a word from (a0-1)+i*0x20 and
 * (a1-K), strh a per-iter const, func_02005dac(2,0), func_020944a4(buf,h,8).
 * recipe: bind sl = ((a1+0x3f)&0xff | 0x4000 | 0x80000000); shift base r8 =
 * (a0-1) increments +0x20/iter; halfword const 0x27a increments +2/iter. */
#include "ov008_core.h"
extern int  func_02005dac(int a, int b);
extern void func_020944a4(void *buf, int handle, int len);

void func_ov008_021aba3c(int a0, int a1) {
    int buf[2];
    int i;
    int sh = (a0 - 1) << 23;
    int hw;
    int sl;
    buf[0] = ((a1 - 1) & 0xff) | 0xc0000000 | ((unsigned int)sh >> 7);
    *(unsigned short *)((char *)buf + 4) = 0x26a;
    func_020944a4(buf, func_02005dac(2, 0), 8);
    sl = (((a1 + 0x3f) & 0xff) | 0x4000) | 0x80000000;
    sh = (a0 - 1) << 23;
    hw = 0x27a;
    for (i = 0; i < 2; i++) {
        buf[0] = sl | ((unsigned int)sh >> 7);
        *(unsigned short *)((char *)buf + 4) = (unsigned short)hw;
        func_020944a4(buf, func_02005dac(2, 0), 8);
        sh += 0x20 << 23;
        hw += 2;
    }
}
