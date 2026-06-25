/* CAMPAIGN-PREP candidate for func_0207d610 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     flags&1 bitfield→firstfit; bestsz(lr) init ~0; signed subs r7-r9 borrow-check; align mask; break on firstfit/exact
 *   risk:       Permuter-class: 6-callee-saved liveness (r1 best,lr bestsz,ip bestoff,r5 firstfit) with subs/bmi sign test and the two early-exit cmps; mwcc reg-rotation and the (sz+body-req) operand order are the likely diverging codegen.
 *   confidence: low
 */
typedef unsigned int u32;
typedef unsigned short u16;

extern int func_0207d78c(struct Heap_207d610 *h, u32 req, u32 off, int one);

struct Blk_207d610 {
    char _pad4[4];
    u32  size;   /* +0x4 */
    struct Blk_207d610 *next; /* +0x8 */
    /* body at +0x10 */
};

struct Heap_207d610 {
    char _pad24[0x24];
    u32  f4;     /* +0x24 + 0x4 -> head ptr at +0x28 */
    u16  flags;  /* +0x24 + 0x12 = +0x36 */
};

int func_0207d610(char *heapb, u32 req, u32 align)
{
    char *h;
    struct Blk_207d610 *best;
    u32 bestsz;
    u32 bestoff;
    int firstfit;
    struct Blk_207d610 *blk;
    u32 mask;

    h = heapb + 0x24;
    firstfit = ((*(u16 *)(h + 0x12)) & 1) ? 0 : 1;
    best = 0;
    bestsz = ~0u;
    bestoff = 0;
    blk = *(struct Blk_207d610 **)(h + 0x4);
    if (blk != 0) {
        mask = ~(align - 1);
        do {
            u32 sz = blk->size;
            u32 body = (u32)blk + 0x10;
            u32 aligned = mask & (sz + body - req);
            if ((int)(aligned - body) >= 0) {
                if (bestsz > sz) {
                    best = blk;
                    bestsz = sz;
                    bestoff = aligned;
                    if (firstfit)
                        break;
                    if (sz == req)
                        break;
                }
            }
            blk = blk->next;
        } while (blk != 0);
    }
    if (best == 0)
        return 0;
    return func_0207d78c((struct Heap_207d610 *)heapb, req, bestoff, 1);
}
