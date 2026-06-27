/* CAMPAIGN-PREP candidate for func_02032998 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla idx*0xc+[base+0xc80]; base=ctx+0x1fc held in r2; blx callback guard
 *   risk:       reshape-able: orig keeps r4=ctx and computes r2=ctx+0x1fc once, reusing for +0xc80,+0xc40 and reads [r4+0xed0] off raw ctx. If mwcc folds base differently the two add bases diverge. Operand-order: src=base+0xc80 first.
 *   confidence: med
 */
typedef struct Big {
    /* 0x00 */ char _pad[0x1fc];
    /* 0x1fc + 0xc40 = 0xe3c */ /* arg base */
} Big;

extern void func_02052c58(void *dst, void *src);

void func_02032998(void *r0arg, int idx, char *ctx)
{
    char *base;
    void *list;
    void (*cb)(void *, int);

    base = ctx + 0x1fc;
    list = (void *)(*(int *)(base + 0xc80) + idx * 0xc);
    func_02052c58((void *)(base + 0xc40), list);
    cb = *(void (**)(void *, int))(ctx + 0xed0);
    if (cb != 0)
        cb(r0arg, idx);
}
