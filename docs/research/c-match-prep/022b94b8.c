/* CAMPAIGN-PREP candidate for func_022b94b8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: same bit-test+mla row-base as 022b9420 clone; fixed 0xfa7 tail arg.
 *   risk:       reshape-able-ish: same `mla (n&1),#0x868` row-base fusion risk as the clone; if it splits to mul+add, address diverges. Dead first arg `a` must stay in the signature.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_022b94b8 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. clone variant of 022b9420: same mla table
 * index + bit10 test, but callee is _022bde90 and the fallthrough arg is a fixed 0xfa7.
 *   asm: mul r1,ip,#0x14 ; mla r0,(n&1),#0x868,data ; ldr r0,[r1,r0] ; lsr#0xa ; tst #1
 */
extern char data_ov002_022cf1ac[];
extern int func_0202e234(int);
extern int func_ov002_022bde90(int);

int func_ov002_022b94b8(int a, int handle, int flag, int n, int i) {
    int r;
    if (func_0202e234(handle) == 0 && n >= 0 && i >= 0) {
        int w = *(int *)((char *)data_ov002_022cf1ac + (n & 1) * 0x868 + i * 0x14);
        if (((w >> 0xa) & 1) == 0)
            handle = 0x1362;
    }
    r = func_ov002_022bde90(handle);
    if (flag == 0)
        return r;
    if (r != 0)
        return r;
    return func_ov002_022bde90(0xfa7);
}
