/* CAMPAIGN-PREP candidate for func_0201e870 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     call wrapper; asr#4 each matrix word; strh store-order at strided offsets 6/e/16/1e
 *   risk:       reshape-able/struct-guessed: store-order is clean (4 sequential ldr;asr#4;strh) so should match if locals decl in r4/r5/r7/r6 order; risk is the stack-arg layout (sp+0x18/+0x1c) and which incoming regs are dead — signature inferred from frame.
 *   confidence: med
 */
/* func_0201e870 (main, class D) — wrapper: alloc/get obj via func_02005b1c,
 * build matrix into a local 4-word buffer via func_0201e7c4, then store each
 * matrix word >>4 (asr) as a halfword into obj at strided offsets
 * 0x6,0xe,0x16,0x1e (store-order). Args: r0,r1 unused passthrough? r2,r3 +
 * two stack args (sp+0x18, sp+0x1c). */
extern char *func_02005b1c(int a, int b);
extern void  func_0201e7c4(int a0, int a1, int idxsrc, int *out);

char *func_0201e870(int a0, int a1, int p2, int p3, int s18, int *s1c) {
    char *obj = func_02005b1c(a0, a1);
    func_0201e7c4(p2, p3, s18, s1c);
    *(short *)(obj + 0x6)  = (short)(s1c[0] >> 4);
    *(short *)(obj + 0xe)  = (short)(s1c[1] >> 4);
    *(short *)(obj + 0x16) = (short)(s1c[2] >> 4);
    *(short *)(obj + 0x1e) = (short)(s1c[3] >> 4);
    return obj;
}
