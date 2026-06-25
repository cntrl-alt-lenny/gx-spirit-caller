/* CAMPAIGN-PREP candidate for func_02000ef8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: switch on discrete cases -> mwcc range-compare tree, base in r4
 *   risk:       the cmp-tree shape (cmp 0x20/bgt, cmp 0x1c/blt, cmpne 0x20, then 0x16 / 0x34 / 0x36 branches) depends on mwcc choosing a compare-tree not a jump table for this sparse set; case-label order must stay ascending. reshape-able (case ordering), low residual risk.
 *   confidence: med
 */
/* func_02000ef8: if the state at data_021040ac[+0xb64] is one of {0x16,0x1c,0x20,0x34,0x36}
 * pop the stack into it, snapshot func_02000c4c() to data_02102c60, schedule func_02001540
 * via func_020057dc, clear +0xb68 and return 1; otherwise return 0. (main) class D switch. */
extern int data_02102c60;
extern int data_021040ac;
extern int func_02000c4c(void);
extern int func_02000d4c(void);
extern int func_020057dc(int a);
extern void func_02001540(void);

int func_02000ef8(void) {
    char *g = (char *)&data_021040ac;
    switch (*(int *)(g + 0xb64)) {
    case 0x16:
    case 0x1c:
    case 0x20:
    case 0x34:
    case 0x36:
        *(int *)(g + 0xb64) = func_02000d4c();
        *(int *)&data_02102c60 = func_02000c4c();
        func_020057dc((int)&func_02001540);
        *(int *)(g + 0xb68) = 0;
        return 1;
    default:
        return 0;
    }
}
