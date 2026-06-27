/* CAMPAIGN-PREP candidate for func_022b9420 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: (w>>10)&1 bit-test; mla fuses (n&1)*0x868 row-base; if-assign handle.
 *   risk:       reshape-able-ish: orig fuses row-base via `mla r0,(n&1),#0x868,data`; if mwcc splits into mul+add the address calc diverges. Also 1st arg `a` is dead — keep it in the signature.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_022b9420 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. clone of 022b9388 (different callees).
 * Bit-test on a 2D table: word = *(int*)(data + (n&1)*0x868 + i*0x14); test bit10.
 *   asm: mul r1,ip,#0x14 ; mla r0,(n&1),#0x868,data ; ldr r0,[r1,r0] ; r0,lsr#0xa ; tst #1
 */
extern char data_ov002_022cf1ac[];
extern int func_0202e234(int);
extern int func_ov002_022bddf0(int);

int func_ov002_022b9420(int a, int handle, int flag, int n, int i) {
    int r;
    if (func_0202e234(handle) == 0 && n >= 0 && i >= 0) {
        int w = *(int *)((char *)data_ov002_022cf1ac + (n & 1) * 0x868 + i * 0x14);
        if (((w >> 0xa) & 1) == 0)
            handle = 0x1362;
    }
    r = func_ov002_022bddf0(handle);
    if (flag == 0)
        return r;
    if (r != 0)
        return r;
    return func_ov002_022bddf0(func_0202e234(handle) != 0 ? 0xfe0 : 0x1362);
}
