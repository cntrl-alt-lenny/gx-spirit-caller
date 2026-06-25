/* CAMPAIGN-PREP candidate for func_0209d1f0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind base global to one local; unsigned min as if-assign (movhi); single convergent return
 *   risk:       struct-guessed: pos/src/remain @+0x1c/+0x20/+0x24, page@+0x8, buf@+0x20 inferred from ldr offsets; wrong offset shifts every ldr/str. Confirm struct.
 *   confidence: med
 */
/* func_0209d1f0 — class C: aligned-buffer copy guard, field updates.
 * data_021a84c0 = DMA/copy-engine state held in one base reg (r5) across uses. */

extern void func_02094688(void *dst, void *src, int len);

typedef struct {
    char _pad[0x1c];
    unsigned int pos;    /* +0x1c */
    unsigned int src;    /* +0x20 */
    unsigned int remain; /* +0x24 */
} CopyState;

extern CopyState data_021a84c0;

typedef struct {
    char _pad08[0x8];
    int  page;   /* +0x8 */
    char _pad0c[0x14];
    char buf[1]; /* +0x20 */
} CopyReq;

int func_0209d1f0(CopyReq *req) {
    CopyState *g = &data_021a84c0;
    unsigned int base;
    unsigned int off;
    unsigned int n;

    base = g->pos & ~0x200;
    if (base == req->page) {
        off = g->pos - base;
        n = 0x200 - off;
        if (n > g->remain) {
            n = g->remain;
        }
        func_02094688(req->buf + off, (void *)g->src, n);
        g->pos += n;
        g->src += n;
        g->remain -= n;
    }
    return g->remain != 0;
}
