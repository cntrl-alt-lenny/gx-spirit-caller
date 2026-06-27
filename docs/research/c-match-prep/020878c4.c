/* CAMPAIGN-PREP candidate for func_020878c4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla r5=idx*0x24+base then +0xc bound once (r5 reused); cross-link stores in asm order
 *   risk:       orig binds slot base in r5 across two uses (cfdc + cff4) and reloads node->f8 twice (the two ldr [r4,#0x8]). If mwcc caches node->f8 the final ldr diverges. struct-guessed 0x24 stride — confirm vs data_021a4cb4.
 *   confidence: med
 */
/* func_020878c4: mla index into 0x24-stride array (data_021a4cb4), alloc via
 * func_0207cfdc(&arr[idx].f_c, 0); on success cross-link (node->fc=arg, arg->f8=node),
 * then func_02089864(node->f8), return node->f8. */

typedef struct {
    int *f0;
    char _pad_4[0x4];
    int *f8;     /* +0x8 */
    int *fc;     /* +0xc */
} link_t;

extern char data_021a4cb4[];
extern int *func_0207cfdc(void *slot, void *q);
extern void func_0207cff4(void *a, void *b);
extern int  func_02089864(int *p);

int *func_020878c4(int idx, int *arg) {
    char *slot = data_021a4cb4 + idx * 0x24 + 0xc;
    int *node = func_0207cfdc(slot, 0);
    if (node == 0) return 0;
    func_0207cff4(slot, node);
    node[0xc/4] = (int)arg;
    arg[0x8/4] = (int)node;
    func_02089864((int *)node[0x8/4]);
    return (int *)node[0x8/4];
}
