/* CAMPAIGN-PREP candidate for func_021cb270 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign parity bit15; hold parity+f2 across guard; goto-merge; bic ~2 RMW store-order
 *   risk:       permuter-class: parity (movne/moveq) and f2 are computed BEFORE the guard and held in callee-saved regs across the d0c/cec test — mwcc likely recomputes parity after the branch or reorders the two ldrh, shifting the prologue. The d0/bic RMW interleaves with the 0229ade0 arg setup (mov r1..r3 #0). struct-guessed offsets.
 *   confidence: low
 */
/* func_ov002_021cb270 (ov002, class D, MED) — store-order global RMW + flag.
 * Computes parity(bit15 of ce950.f_0) and f2(ce950.f_2) early (held across the
 * guard); guard on d016c.f_d0c + cd744[f_cec]==2 skips d2c/d30 writes; then
 * 021c1010 call, clear bit1 of d016c.f_d0, 0229ade0, clear ce950.f_80c. */
typedef struct {
    unsigned short f_0; unsigned short f_2; char _a[0x806]; int f_80c;
} StateCe950;
extern StateCe950 data_ov002_022ce950;
typedef struct {
    char _a[0xd0]; unsigned int f_d0; char _b[0x18]; unsigned int f_cec;
    char _c[0x1c]; unsigned int f_d0c; char _d[0x1c]; int f_d2c; int f_d30;
} StateD016c;
extern StateD016c data_ov002_022d016c;
extern unsigned char data_ov002_022cd744[];
extern void func_ov002_021c1010(int parity, int f2);
extern void func_ov002_0229ade0(int a0, int a1, int a2, int a3);

void func_ov002_021cb270(void) {
    int parity = (data_ov002_022ce950.f_0 & 0x8000) ? 1 : 0;
    int f2 = data_ov002_022ce950.f_2;
    if (data_ov002_022d016c.f_d0c != 0
        && *(int *)(data_ov002_022cd744 + data_ov002_022d016c.f_cec * 4) == 2)
        goto after;
    data_ov002_022d016c.f_d2c = 0xb;
    data_ov002_022d016c.f_d30 = 0;
after:
    func_ov002_021c1010(parity, f2);
    data_ov002_022d016c.f_d0 &= ~2u;
    func_ov002_0229ade0(0x24, 0, 0, 0);
    data_ov002_022ce950.f_80c = 0;
}
