/* CAMPAIGN-PREP candidate for func_021caf48 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign parity bit15; bind r6; store-order 5-arg 021b1f20 via str[sp]; bic ~0x400000 RMW
 *   risk:       permuter-class: the r6 range test emits cmp;addne r0,r1,#1;cmpne;beq + add #0x52 chain — my `r6==base||r6==base+1` likely reorders the addne/cmpne into plain cmps. The literal base 0x11ed CSE across both compares is the crux. struct-guessed cf1ac base.
 *   confidence: low
 */
/* func_ov002_021caf48 (ov002, class D, MED) — dispatch + store-order RMW.
 * Reads three u16 fields of ce950 (+0,+2,+4,+6), derives parity from bit15 of
 * +0, calls 021b9ecc; if +4 nonzero runs a code-range dispatch with two
 * 021b1f20 5-arg tail-inserts (5th arg via str [sp]); else clears bit22 of a
 * per-parity record. Always tail-clears ce950.f_80c. */
typedef struct {
    unsigned short f_0; unsigned short f_2; unsigned short f_4; unsigned short f_6;
    char _a[0x804]; int f_80c;
} StateCe950;
extern StateCe950 data_ov002_022ce950;
extern unsigned char data_ov002_022cf1ac[];   /* LIT4 per-parity base */
extern int  func_ov002_021b1f20(int a0, int a1, int a2, int a3, int a4);
extern void func_ov002_021b2ab4(void);
extern int  func_ov002_021b3ecc(int player, int kind, int code);
extern int  func_ov002_021b9ecc(int parity, int a1);
extern int  func_ov002_021c1010(int parity, int a1);

void func_ov002_021caf48(void) {
    int parity = (data_ov002_022ce950.f_0 & 0x8000) ? 1 : 0;
    int a4 = data_ov002_022ce950.f_2;
    int has = data_ov002_022ce950.f_4;
    int f6 = data_ov002_022ce950.f_6;
    int r6 = func_ov002_021b9ecc(parity, a4);

    if (has != 0) {
        int base;
        func_ov002_021c1010(parity, a4);
        base = 0x11ed;
        if (r6 == base || r6 == base + 1) {
            if (func_ov002_021b3ecc(parity, 0xb, r6) == 0)
                func_ov002_021b1f20(parity, 0xb, 1, 0, 0);
        } else if (r6 == base + 0x52) {
            if (func_ov002_021b3ecc(parity, 0xb, r6) == 0)
                func_ov002_021b1f20(parity, 0xb, 1, r6, 0);
        }
        if (f6 != 0)
            func_ov002_021b2ab4();
    } else {
        unsigned int *p = (unsigned int *)(data_ov002_022cf1ac
                          + parity * 0x868 + a4 * 0x14);
        *p &= ~0x400000u;
    }
    data_ov002_022ce950.f_80c = 0;
}
