/* CAMPAIGN-PREP candidate for func_02092388 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     hoist flag=&1 and &c->sub; do/while with in-loop flag==0 return
 *   risk:       VERIFIED 100% as *.legacy.c (1.2/sp2p3). Reshape-able: route .legacy.c (default 2.0 = 21%, Style-B epilogue + r3-spill). do/while keeps out!=0 store predicated (ldrne/strne).
 *   confidence: high
 */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_02091a8c(void *);

typedef struct Container {
    char          _pad00[0x08];
    char          sub[0x08];   /* +0x08 sub-struct passed by &  */
    int          *base;        /* +0x10 array base             */
    char          _pad14[0x18 - 0x14];
    int           index;       /* +0x18                        */
    int           count;       /* +0x1c                        */
} Container;

int func_02092388(Container *c, int *out, int flagarg)
{
    int irq = OS_DisableIrq();
    if (c->count == 0) {
        int flag = flagarg & 1;
        void *sub = &c->sub;
        do {
            if (flag == 0) {
                OS_RestoreIrq(irq);
                return 0;
            }
            func_02091a8c(sub);
        } while (c->count == 0);
    }
    if (out != 0)
        *out = c->base[c->index];
    OS_RestoreIrq(irq);
    return 1;
}
