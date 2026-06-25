/* CAMPAIGN-PREP candidate for func_0207d520 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store loc.lo/loc.hi to sp in source order; match(r4) tracked; final size delta cmp #0x10 early-return; bind base(r6)
 *   risk:       Struct-guessed + control-flow: the .L_78 loop's movcc/bcc fallthrough vs my goto structure is fragile; mwcc may not reproduce the str r2,[sp,#4] store-order and the early addcc-sp epilogue. Likely needs reshape and may stay permuter-class.
 *   confidence: low
 */
typedef unsigned int u32;

extern int  func_0207d994(int *dst, int tag);
extern void func_0207d9c4(int a, int b, struct Node_207d520 *c);
extern int *func_0207d9f4(int *a, struct Node_207d520 *b);

struct Range_207d520 {
    u32 lo;   /* +0x0 */
    u32 hi;   /* +0x4 */
};

struct Node_207d520 {
    char _pad4[4];
    u32  size;   /* +0x4 */
    char _pad8[0xc - 0x4 - 4];
    struct Node_207d520 *next; /* +0xc */
    /* body at +0x10 */
};

int func_0207d520(int *self, struct Range_207d520 *rng)
{
    struct Range_207d520 loc;
    struct Node_207d520 *match;
    struct Node_207d520 *cur;
    int *base;

    loc.lo = rng->lo;
    loc.hi = rng->hi;
    base = self;
    match = (struct Node_207d520 *)((int *)self)[0];
    cur = match;
    if ((int)cur != 0) {
        u32 lo = rng->lo;
        do {
            if ((u32)cur < lo) {
                match = cur;
                goto after;
            }
            if ((u32)cur != rng->hi)
                goto reset;
            loc.hi = cur->size + ((u32)cur + 0x10);
            func_0207d9f4(base, cur);
            goto reset_null;
        after:
            cur = cur->next;
        } while ((int)cur != 0);
    }
reset_null:
    match = 0;
reset:
    if ((int)match != 0) {
        if (cur->size + ((u32)match + 0x10) == rng->lo) {
            loc.lo = (u32)match;
            match = (struct Node_207d520 *)func_0207d9f4(base, match);
        }
    }
    if ((u32)loc.hi - (u32)loc.lo < 0x10)
        return 0;
    {
        int tmp;
        tmp = func_0207d994((int *)&loc, 0x4652);
        func_0207d9c4(tmp, (int)base, match);
    }
    return 1;
}
