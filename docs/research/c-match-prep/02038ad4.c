/* CAMPAIGN-PREP candidate for func_02038ad4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     flag via && short-circuit; ands sets r7=hi; rsb 0x200-hi; if-chain not ternary; stack temp via &stk
 *   risk:       orig keeps hi in r7 and reuses it as both clamp arg and final add; if mwcc spills hi or recomputes 0x200-x the rsb/add placement diverges. reshape-able via single hi local reused in place
 *   confidence: low
 */
#include <stdio.h>

typedef unsigned int u32;
typedef int s32;

struct Ctx_2038ad4 {
    unsigned char _pad0[0x2c];
    u32 field_2c;      /* +0x2c */
};

extern int func_02091678(void);
extern int func_020931e8(void);
extern int func_0209361c(void);
extern int func_02038984(u32 *sp0, int r6, int len, int flag);

int func_02038ad4(struct Ctx_2038ad4 *ctx, int r6, int len) {
    int flag;
    u32 stk;
    int hi;

    flag = 1;
    if (func_02091678() == 0 ||
        func_020931e8() == 0 ||
        func_0209361c() == 0) {
        flag = 0;
    }

    stk = ctx->field_2c;
    hi = stk & 0x1ff;
    if (hi == 0) {
        return func_02038984(&stk, r6, len, flag);
    }
    hi = 0x200 - hi;
    if (len <= hi) {
        return func_02038984(&stk, r6, len, flag);
    } else {
        int ret = func_02038984(&stk, r6, hi, flag);
        if (hi != ret) {
            return hi;
        }
        stk += hi;
        r6 += hi;
        len -= hi;
    }
    return hi + func_02038984(&stk, r6, len, flag);
}
