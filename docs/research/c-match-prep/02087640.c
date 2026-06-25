/* CAMPAIGN-PREP candidate for func_02087640 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla index as base+idx*0x24+0xc; discard func_02089920 result; cond-return on fc
 *   risk:       mla fusion: orig emits mov r0,#0x24; mla r0,f10,r0,base then add #0xc. mwcc may split into mov/mul/add differently or fold +0xc into the mla constant. struct-guessed stride 0x24 — confirm against data_021a4cb4 layout.
 *   confidence: med
 */
/* func_02087640: guard, func_02089920(p->f8) for side-effect (result discarded),
 * then either clear node->f8=0 or compute &arr[f10] (0x24 stride) and call
 * func_0207cff4(&arr[f10].f_c, p). data_021a4cb4 is the 0x24-stride array base. */

typedef struct {
    char _pad_0[0x8];
    int  f8;      /* +0x8 */
    int *fc;      /* +0xc node ptr */
    int  f10;     /* +0x10 index */
} ent_t;

extern char data_021a4cb4[];
extern void func_0207cff4(void *a, void *b);
extern int  func_02089920(int p);

void func_02087640(ent_t *p) {
    if (p->f8 == 0) return;
    func_02089920(p->f8);
    if (p->fc != 0) {
        p->fc[0x8/4] = 0;
        return;
    }
    func_0207cff4(data_021a4cb4 + p->f10 * 0x24 + 0xc, p);
}
