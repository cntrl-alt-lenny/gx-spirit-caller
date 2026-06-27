/* CAMPAIGN-PREP candidate for func_0207d3ac (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mask-align (a-1+base)&~(a-1); track best(r6)/bestoff(r5,init ~0); avail-first then bestoff tiebreak; inline base per-iter
 *   risk:       Permuter-class: heavy multi-temp liveness (r6 best, r5 bestoff, lr avail, ip/r3 mask) across two cmp r6,lr; mwcc scheduling of the avail/off subs and the nested tiebreak branch order is a register-rotation coin-flip.
 *   confidence: low
 */
typedef unsigned int u32;

extern u32 func_020a6d48(u32 v);

struct Blk_207d3ac {
    char _pad4[4];
    u32  size;   /* +0x4 */
    char _pad8[0xc - 0x4 - 4];
    struct Blk_207d3ac *next; /* +0xc */
    /* body starts at +0x10 */
};

struct Heap_207d3ac {
    char _pad24[0x24];
    struct Blk_207d3ac *head; /* +0x24 */
};

u32 func_0207d3ac(struct Heap_207d3ac *heap, u32 align)
{
    u32 a;
    struct Blk_207d3ac *blk;
    u32 best;
    u32 bestoff;
    u32 mask;

    a = func_020a6d48(align);
    blk = heap->head;
    best = 0;
    bestoff = ~0u;
    if (blk != 0) {
        mask = ~(a - 1);
        do {
            u32 base = (u32)blk + 0x10;
            u32 aligned = mask & ((a - 1) + base);
            u32 end = blk->size + base;
            if (aligned < end) {
                u32 avail = end - aligned;
                u32 off = aligned - base;
                if (best < avail) {
                    best = avail;
                    bestoff = off;
                } else if (best == avail) {
                    if (bestoff > off) {
                        best = avail;
                        bestoff = off;
                    }
                }
            }
            blk = blk->next;
        } while (blk != 0);
    }
    return best;
}
