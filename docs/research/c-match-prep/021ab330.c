/* CAMPAIGN-PREP candidate for func_021ab330 (ov022, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: bind r4 base, store-order clamp, -16-v in two steps (mvn;sub)
 *   risk:       the two -0x10 literals differ in encoding (mov via sub r1,r2,#0x10 vs mvn r1,#0xf); writing both as -0x10 may make mwcc pick the same encoding and break one. reshape-able (use ~15 for the mvn site).
 *   confidence: med
 */
/* func_ov022_021ab330: decrement-clamp a 0x54 timer, lerp via func_020b3870, push the
 * negated result to two scroll regs (0x0400006c/0x0400106c via func_0208c884). When the
 * 0xc flag is clear, reset both timers, re-push the rest position, and clear BLDCNT bits.
 * (ov022) class C: hold r4 base across uses, store-order on the clamp. */
extern int data_ov022_021abaa0;
extern int data_ov022_021abae8;
extern void func_0208c884(int reg, int val);
extern int func_020b3870(int a, int b);

int func_ov022_021ab330(void) {
    char *t = (char *)&data_ov022_021abaa0;
    char *g = (char *)&data_ov022_021abae8;
    int x = *(int *)(t + 0x54) - 0x1000;
    int v;
    *(int *)(t + 0x54) = x;
    if (x < 0)
        *(int *)(g + 0xc) = 0;
    v = func_020b3870(-(*(int *)(g + 0xc) << 4), *(int *)(g + 0x8));
    v = -0x10 - v;
    func_0208c884(0x0400006c, v);
    func_0208c884(0x0400106c, v);
    if (*(int *)(g + 0xc) != 0)
        return 0;
    *(int *)(g + 0xc) = 0;
    *(int *)(g + 0x8) = 0;
    func_0208c884(0x0400006c, 0 - 0x10);
    func_0208c884(0x0400106c, -0x10);
    *(volatile int *)0x04000000 &= ~0x1f00;
    *(volatile int *)0x04001000 &= ~0x1f00;
    return 1;
}
