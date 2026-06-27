/* CAMPAIGN-PREP candidate for func_021d1308 (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order: strh 0xe before reading g[0xc80]; mirror word then strh low half; bind v once
 *   risk:       reshape-able: the 4th arg to 0201cd1c is the same g[0xc80] held in r3 across str[ip] and strh[sp+2]; if mwcc reloads instead of binding 'v', an extra ldr diverges. arg '0x3a-0x3b' forces sub r1,r0,#0x3b.
 *   confidence: med
 */
/* func_ov004_021d1308: small marshalling. Reads g[0xc80], writes stack {u16=0xe, u16=g[0xc80]},
 * mirrors word to data_ov004_0220f168, calls 0201cd1c(6, &stk, 4, g[0xc80]); then sets
 * g[0xc6c]=1 and calls 02037208(0x3a, -1, 0, 1). Class C: straight stores, store-order. */
extern char data_ov004_0220e500[];
extern char data_ov004_0220f168[];
extern void func_0201cd1c(int a, void *p, int c, int d);
extern void func_02037208(int a, int b, int c, int d);

struct Ov004Stk2 {
    unsigned short a;   /* +0x0 = 0xe */
    unsigned short b;   /* +0x2 = g[0xc80] low half */
};

void func_ov004_021d1308(void) {
    struct Ov004Stk2 stk;
    int v;

    stk.a = 0xe;
    v = *(int *)(data_ov004_0220e500 + 0xc80);
    *(int *)data_ov004_0220f168 = v;
    stk.b = (unsigned short)v;
    func_0201cd1c(6, &stk, 4, v);
    *(int *)(data_ov004_0220e500 + 0xc6c) = 1;
    func_02037208(0x3a, 0x3a - 0x3b, 0, 1);
}
