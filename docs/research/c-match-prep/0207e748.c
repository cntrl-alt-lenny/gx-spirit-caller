/* CAMPAIGN-PREP candidate for func_0207e748 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     alloc-wrapper clone: same shape as e54c, magic 0x504c5454, callee e738
 *   risk:       identical clone-family epilogue risk: predicated null path vs branch-to-exit. Locked to e54c's outcome. reshape-able (mirror e54c shape).
 *   confidence: med
 */
#include <stdint.h>

typedef struct { char hdr[8]; int body; } Block;

extern int func_0207e738(int *p);
extern Block *func_0207e7d8(int size, int magic);

int func_0207e748(int size, int **out) {
    Block *blk;

    blk = func_0207e7d8(size, 0x504c5454);
    if (blk == 0) {
        *out = 0;
        return 0;
    }
    func_0207e738((int *)&blk->body);
    *out = (int *)&blk->body;
    return 1;
}
