/* CAMPAIGN-PREP candidate for func_0200aa44 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     flag tst-guard + two call paths (6-arg, 2 stack) + Fill32
 *   risk:       func_02004f3c arg count/types guessed; 2-stack-arg ordering and data_02103fcc field type assumed
 *   confidence: med
 */
/* func_0200aa44 — flag-test branch into two call paths; returns 1. */

extern unsigned char data_02103fcc[];   /* field at +0x38 */
extern int  data_02102bb0;
extern int  data_020c43e4;
extern void *func_0208de24(void);
extern void func_02004f3c(void *a, void *b, void *c, int d, int e, int f);
extern void Fill32(int val, void *dst, int n);

int func_0200aa44(void)
{
    if (*(unsigned int *)(data_02103fcc + 0x38) & 0x10) {
        void *p = func_0208de24();
        func_02004f3c(&data_02102bb0, &data_020c43e4, p, 0xc0, 0xb0, 0xa);
    } else {
        Fill32(0, (char *)func_0208de24() + 0x5b00, 0x100);
        Fill32(0, (char *)func_0208de24() + 0x5f00, 0x100);
    }
    return 1;
}
