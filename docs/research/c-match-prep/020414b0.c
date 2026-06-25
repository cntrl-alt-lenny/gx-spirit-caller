/* CAMPAIGN-PREP candidate for func_020414b0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     blx through ctx+0x1000 fn-ptr; movs-arg guard; store-order field set then add
 *   risk:       field offsets/types of Out guessed; the [r4] reload before the add and store-order (0x4,0xc,8) must match; ctor sig
 *   confidence: med
 */
#include "types.h"

extern u32 data_020fe8d4;

typedef void *(*Ctor_020414b0)(u32 arg, int n);

struct Out_020414b0 {
    char *p;     /* 0x0 */
    char *q;     /* 0x4 */
    char *end;   /* 0x8 */
    int   len;   /* 0xc */
};

int func_020414b0(void *ctx, struct Out_020414b0 *out, int n)
{
    Ctor_020414b0 ctor = *(Ctor_020414b0 *)((char *)ctx + 0x1000 + 0x10);
    if (n == 0) {
        return 0;
    }
    out->p = (char *)ctor(data_020fe8d4, n);
    if (out->p == 0) {
        return 0;
    }
    out->q = out->p;
    out->len = n;
    out->end = out->p + out->len;
    return 1;
}
