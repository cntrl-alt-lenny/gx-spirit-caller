/* CAMPAIGN-PREP candidate for func_02045954 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     callee-saved decl r6/r5/r4=r0/r1/r3; store-order h8,ha,h4,h6 then store global
 *   risk:       store-order [p+8],[p+a],[p+4],[p+6] with shared imm #1 in r0 reused for ha and h4 -- if mwcc rematerializes the 1 or reorders the h6=0 store the movs diverge; reshape-able. struct-guessed.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 *data_0219dad0;
extern void func_020458d8(void);
extern void func_02077b4c(u32 a);
extern void func_020945f4(void *dst, int val, int n);

void func_02045954(u8 *p, u16 a1, u32 a2, u32 a3) {
    if (data_0219dad0 != 0) {
        return;
    }
    func_020945f4(p, 0, 0xc);
    *(u16 *)(p + 0x8) = a1;
    *(u16 *)(p + 0xa) = 1;
    *(u16 *)(p + 0x4) = 1;
    *(u16 *)(p + 0x6) = 0;
    data_0219dad0 = p;
    func_020458d8();
    func_02077b4c(a3);
}
