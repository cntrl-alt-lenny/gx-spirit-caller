/* CAMPAIGN-PREP candidate for func_021abb08 (ov008, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bind shared r4=(a0-1)<<23, reuse in both words; per-setup const; store-order
 *   risk:       permuter-class: documented 20v20 reg-alloc wall for this family (orig keeps a0-1 in a fresh reg + reuses across both setups; mwcc subtracts a0-1 in place), stable across operand orderings -> likely escapes to .s.
 *   confidence: low
 */
/* func_ov008_021abb08 (ov008, class D): command-record family, two-setup variant
 * (cf. 021abba0 = the documented 20v20 reg-alloc wall). Two 8-byte records that
 * SHARE r4 = (a0-1)<<23: word0 = ((a1-1)&0xff)|0x80000000|(((a0-1)<<23)>>7);
 * word1 = (((a1+0x1f)&0xff)|0x4000|0x80000000)|(((a0-1)<<23)>>7). Each: strh a
 * const (0x27e / 0x282), func_02005dac(2,0), func_020944a4(buf,h,8).
 * recipe: bind the shared shift base once; reuse it in both words; store-order. */
#include "ov008_core.h"
extern int  func_02005dac(int a, int b);
extern void func_020944a4(void *buf, int handle, int len);

void func_ov008_021abb08(int a0, int a1) {
    int buf[2];
    int sh = (a0 - 1) << 23;
    buf[0] = ((a1 - 1) & 0xff) | 0x80000000 | ((unsigned int)sh >> 7);
    *(unsigned short *)((char *)buf + 4) = 0x27e;
    func_020944a4(buf, func_02005dac(2, 0), 8);
    buf[0] = (((a1 + 0x1f) & 0xff) | 0x4000 | 0x80000000) | ((unsigned int)sh >> 7);
    *(unsigned short *)((char *)buf + 4) = 0x282;
    func_020944a4(buf, func_02005dac(2, 0), 8);
}
