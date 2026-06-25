/* CAMPAIGN-PREP candidate for func_020a5894 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bic#3 via &~3 align-down; g=p store before first call; r3=end ptr, stack[0]=size
 *   risk:       reshape-able: aligned=(q-0xe4)&~3 reused as both stack[sp] size and in p+0xe4+aligned (r3 end); if mwcc recomputes instead of CSE-ing, bind aligned to one local (as written). Stack-arg pair order is the watch-point.
 *   confidence: med
 */
/* func_020a5894 — IRQ-guarded one-time init of a subsystem at global g.
 *
 *   saved=OS_DisableIrq();
 *   if (data_021a9920 == NULL) {               // not yet init
 *       data_021a9920 = p;
 *       func_020a5864((char*)p + 0xc4);
 *       aligned = (q - 0xe4) & ~3;
 *       p->field_c0 = 0;
 *       func_02091d24(p, func_020a591c, p,
 *                     (char*)p + 0xe4 + aligned, aligned, 0);  // 2 stack args
 *       func_020919d8(p);
 *   }
 *   OS_RestoreIrq(saved);
 */

typedef struct {
    char field_c0_pad[0xc0];
    int  field_c0;     /* +0xc0 <- 0 */
} Ctx;

extern void  *data_021a9920;
extern int    OS_DisableIrq(void);
extern void   OS_RestoreIrq(int saved);
extern void   func_020a5864(void *p);
extern void   func_02091d24(void *a, void *cb, void *b, void *end,
                            int size, int z);
extern void   func_020919d8(void *p);
extern void   func_020a591c(void);

void func_020a5894(void *p, int q) {
    int saved = OS_DisableIrq();

    if (data_021a9920 == 0) {
        int aligned;

        data_021a9920 = p;
        func_020a5864((char *)p + 0xc4);

        aligned = (q - 0xe4) & ~3;
        ((Ctx *)p)->field_c0 = 0;
        func_02091d24(p, (void *)func_020a591c, p,
                      (char *)p + 0xe4 + aligned, aligned, 0);
        func_020919d8(p);
    }

    OS_RestoreIrq(saved);
}
