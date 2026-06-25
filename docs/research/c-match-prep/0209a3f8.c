/* CAMPAIGN-PREP candidate for func_0209a3f8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     DECL-ORDER locals = asm load order (f58..f63) so reg alloc r1,r2,r3,lr,r6,r5 lines up
 *   risk:       permuter-class: orig hoists ALL 8 field loads up-front (into r1,r2,r3,lr,r6,r5,r0,ip) before the OR-chain branch; mwcc may fold the unused-on-zero-path loads into the call arm, dropping several ldrh/ldrb. struct-guessed base.
 *   confidence: low
 */
/* func_0209a3f8 (main, class C) — read a fixed HW block at 0x027ffc80, and if
 * any of {f58,f5e,f5a,f60} is nonzero call f_02099d80 with 4 reg + 5 stacked
 * args; on its 0-return (or if all four were zero) zero out 4 halfwords at
 * out and return 1. Always returns 1.
 * Field reads (decl-order = asm load order): f58(h),f5a(h),f5c(b),f5d(b),
 * f5e(h),f60(h),f62(b),f63(b). out=r0 held in r4. */

typedef struct {
    char _p[0x58];
    unsigned short f58;  /* +0x58 */
    unsigned short f5a;  /* +0x5a */
    unsigned char  f5c;  /* +0x5c */
    unsigned char  f5d;  /* +0x5d */
    unsigned short f5e;  /* +0x5e */
    unsigned short f60;  /* +0x60 */
    unsigned char  f62;  /* +0x62 */
    unsigned char  f63;  /* +0x63 */
} HwBlk_27ffc80;

#define HW_27FFC80 ((HwBlk_27ffc80 *)0x027ffc80)

extern int func_02099d80(void *out, int f58, int f5a, int f5c,
                         int f5d, int f5e, int f60, int f62, int f63);

int func_0209a3f8(unsigned short *out) {
    HwBlk_27ffc80 *hw = HW_27FFC80;
    int f58 = hw->f58;
    int f5a = hw->f5a;
    int f5c = hw->f5c;
    int f5d = hw->f5d;
    int f5e = hw->f5e;
    int f60 = hw->f60;
    int f62 = hw->f62;
    int f63 = hw->f63;
    if (f58 != 0 || f5e != 0 || f5a != 0 || f60 != 0) {
        if (func_02099d80(out, f58, f5a, f5c, f5d, f5e, f60, f62, f63) != 0) {
            out[0] = 0;
            out[1] = 0;
            out[2] = 0;
            out[3] = 0;
        }
        return 1;
    }
    out[0] = 0;
    out[1] = 0;
    out[2] = 0;
    out[3] = 0;
    return 1;
}
