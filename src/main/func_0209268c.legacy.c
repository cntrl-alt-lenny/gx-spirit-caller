/* CAMPAIGN-PREP candidate for func_0209268c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind cur=*(d+4) once before branch (used both arms); if/else-if/else ret
 *   risk:       VERIFIED 100% as *.legacy.c (1.2/sp2p3). Reshape-able: route .legacy.c (default 2.0 = 69%, Style-B pop{pc}). cur hoisted before the f8==0 branch makes else-if predicate match (moveq/movne).
 *   confidence: high
 */
extern char data_021a63d0[];
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_02092668(int, void *);

typedef struct Obj {
    char _pad00[0x08];
    int  f8;    /* +0x08 */
    int  fc;    /* +0x0c */
} Obj;

int func_0209268c(Obj *o)
{
    int irq = OS_DisableIrq();
    int ret;
    int cur = *(int *)(data_021a63d0 + 0x4);
    if (o->f8 == 0) {
        o->f8 = cur;
        o->fc = o->fc + 1;
        func_02092668(cur, o);
        ret = 1;
    } else if (o->f8 == cur) {
        o->fc = o->fc + 1;
        ret = 1;
    } else {
        ret = 0;
    }
    OS_RestoreIrq(irq);
    return ret;
}
