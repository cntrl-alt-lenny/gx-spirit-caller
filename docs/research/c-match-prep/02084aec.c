/* CAMPAIGN-PREP candidate for func_02084aec (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     flag-0x10 lazy-init w/3 Fill32+guards; singleton-ctx install/call/clear
 *   risk:       reshape-able: data_021a1b1c is reloaded for the second branch (ldr _LIT0 again) vs bound; the early-return/fallthrough split must keep the two epilogues. If diff shows one merged epilogue, the if/return shape is right.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02084aec (main, class C) - p_0033.
 * UNVERIFIED build-free draft: drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: if(flags&0x10){3x Fill32(0,p,8)+guarded inits; clear 0x10}; install local buf in global if NULL, call, then null it
 */
/* func_02084aec: lazy-init three 8-word sub-objects (clearing flag 0x10),
 * then run func_02084c38 against a singleton context: if the global slot is
 * set use it, else point it at a stack buffer for the call and clear it. */

extern void Fill32(int value, void *dest, int size);
extern void func_02084bc8(void *p);
extern void func_02084c38(void *ctx, void *s);
extern void *data_021a1b1c;

void func_02084aec(unsigned char *s) {
    void *ctx;
    if ((*(int *)s & 0x10) == 0x10) {
        Fill32(0, s + 0x3c, 8);
        Fill32(0, s + 0x44, 8);
        Fill32(0, s + 0x4c, 8);
        if (*(int *)(s + 0x8))
            func_02084bc8(s + 0x3c);
        if (*(int *)(s + 0x10))
            func_02084bc8(s + 0x44);
        if (*(int *)(s + 0x18))
            func_02084bc8(s + 0x4c);
        *(int *)s &= ~0x10;
    }
    ctx = data_021a1b1c;
    if (ctx != 0) {
        func_02084c38(ctx, s);
        return;
    }
    {
        unsigned char buf[0x188];
        data_021a1b1c = buf;
        func_02084c38(buf, s);
        data_021a1b1c = 0;
    }
}
