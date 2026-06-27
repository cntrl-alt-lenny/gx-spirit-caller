/* CAMPAIGN-PREP candidate for func_0207e6f0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     alloc-wrapper clone: same shape as e54c, magic 0x43484152, callee e6e0
 *   risk:       identical clone-family epilogue risk: predicated null path (moveq/streq/ldmeq) vs branch. Locked to e54c's outcome. reshape-able (mirror e54c shape).
 *   confidence: med
 */
#include <stdint.h>

typedef struct { char hdr[8]; int body; } Block;

extern int func_0207e6e0(int *p);
extern Block *func_0207e7d8(int size, int magic);

int func_0207e6f0(int size, int **out) {
    Block *blk;

    blk = func_0207e7d8(size, 0x43484152);
    if (blk == 0) {
        *out = 0;
        return 0;
    }
    func_0207e6e0((int *)&blk->body);
    *out = (int *)&blk->body;
    return 1;
}
