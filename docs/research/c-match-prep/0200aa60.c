/* CAMPAIGN-PREP candidate for func_0200aa60 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     flag tst-guard + two call paths (6-arg, 2 stack) + Fill32
 *   risk:       func_02004f58 arg count/types guessed; 2-stack-arg ordering and data_021040ac field type assumed
 *   confidence: med
 */
/* func_0200aa60 — flag-test branch into two call paths; returns 1. */

extern unsigned char data_021040ac[];   /* field at +0x38 */
extern int  data_02102c90;
extern int  data_020c44c4;
extern void *func_0208df0c(void);
extern void func_02004f58(void *a, void *b, void *c, int d, int e, int f);
extern void Fill32(int val, void *dst, int n);

int func_0200aa60(void)
{
    if (*(unsigned int *)(data_021040ac + 0x38) & 0x10) {
        void *p = func_0208df0c();
        func_02004f58(&data_02102c90, &data_020c44c4, p, 0xc0, 0xb0, 0xa);
    } else {
        Fill32(0, (char *)func_0208df0c() + 0x5b00, 0x100);
        Fill32(0, (char *)func_0208df0c() + 0x5f00, 0x100);
    }
    return 1;
}
