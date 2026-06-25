/* CAMPAIGN-PREP candidate for func_0207e54c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     alloc wrapper: movs null-check, +8 user ptr, magic literal, init then store
 *   risk:       null branch: orig folds moveq r0,#0/streq/ldmeq into predicated epilogue; mwcc may emit a real branch to shared exit. r4+8 reload after call must re-add. reshape-able (early-return shape) / permuter on epilogue predication.
 *   confidence: med
 */
#include <stdint.h>

typedef struct { char hdr[8]; int body; } Block;

extern int func_0207e3d4(int *p);
extern Block *func_0207e7d8(int size, int magic);

int func_0207e54c(int size, int **out) {
    Block *blk;

    blk = func_0207e7d8(size, 0x41424e4b);
    if (blk == 0) {
        *out = 0;
        return 0;
    }
    func_0207e3d4((int *)&blk->body);
    *out = (int *)&blk->body;
    return 1;
}
