/* CAMPAIGN-PREP candidate for func_0206b258 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind *data_02101d84 twice (h0 held in r6, h1 reloaded into r5 per asm); [ctx+0x80] signed cmp via bls; identical blx tail (1=5/4) via VFn cast
 *   risk:       the n>func_020aaddc(h0) test is unsigned (bls) but n=[ctx+0x80] is signed (ble guard); if mwcc treats the cast (int)n>0 and unsigned compare inconsistently a cmp flips. reshape-able (tune signed/unsigned on n).
 *   confidence: med
 */
/* func_0206b258 (main, class C) — linear calls + two blx tails; bind globals */
extern void        *data_02101d84;
extern int          data_0219eccc;
extern void  func_0206a314(void *ctx, int v);
extern void  func_0206aa68(void *ctx);
extern unsigned int func_020aaddc(void *h);
extern int   func_020ab054(void *a, void *h, unsigned int n);

typedef void (*VFn)(unsigned char *, int, int, int);

void func_0206b258(unsigned char *ctx) {
    unsigned int n;
    void        *h0;
    void        *h1;
    void        *base;

    n = *(unsigned int *)(ctx + 0x80);
    if ((int)n > 0) {
        h0 = data_02101d84;
        if (n > func_020aaddc(h0)) {
            base = *(void **)(ctx + 0x7c);
            h1   = data_02101d84;
            if (func_020ab054(base, h1, func_020aaddc(h1)) == 0) {
                func_0206a314(ctx, (int)base + (int)func_020aaddc(h0));
                (*(VFn *)(ctx + 0x488))(ctx, 5, data_0219eccc,
                                        *(int *)(ctx + 0x494));
            }
        }
    }

    (*(VFn *)(ctx + 0x488))(ctx, 4, data_0219eccc, *(int *)(ctx + 0x494));
    func_0206aa68(ctx);
}
