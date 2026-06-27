/* CAMPAIGN-PREP candidate for func_02019184 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D bitfield: unsigned (v<<28)>>28 / (v<<24)>>24 extracts, eager mla base before cmp
 *   risk:       permuter-class: like the matched func_02018dcc sibling, mwcc peepholes (v<<28)>>28 to `and#0xf`; the eager-mla-before-branch schedule also depends on reg-alloc. Likely needs permuter to keep lsl;lsr.
 *   confidence: low
 */
/* func_02019184 (main, class D) — key==0 branch-tail, lsl;lsr bitfield extracts.
 * a0=r0(->r5). w=GetSystemWork()(->r4). idx=func_02019210(a0); e=w+(idx-1)*0x18 (computed eagerly).
 * if (a0==0): v=*(int*)(w+0x8d0); return (v<<28)>>28;   // low 4 bits (bits 0-3), unsigned
 * else:       v=*(int*)(e+0x8);  return (v<<24)>>24;     // low 8 bits, unsigned
 * Both extracts are unsigned (v<<k)>>k per matched func_020191dc/func_02018d98 family.
 * Note the mla base is materialized before the cmp (eager), matching the asm schedule. */
extern char *GetSystemWork(void);
extern int func_02019210(int);

int func_02019184(int a0) {
    char *w = GetSystemWork();
    int idx = func_02019210(a0);
    char *e = w + (idx - 1) * 24;
    if (a0 == 0) {
        unsigned v = *(unsigned *)(w + 0x8d0);
        return (v << 28) >> 28;
    }
    {
        unsigned v = *(unsigned *)(e + 0x8);
        return (v << 24) >> 24;
    }
}
