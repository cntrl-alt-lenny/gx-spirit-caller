/* CAMPAIGN-PREP candidate for func_021cb174 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order d2c,d30,d0,80c; if-assign tst#1 moveq/movne for d30; orr accumulator-first
 *   risk:       reshape-able: d30 = `(f_2 & 1) ? 0 : 1` must emit tst;moveq r2,#1;movne r2,#0 (not eor/sub). The base-reg reload pattern (ldr r1 d016c twice, ldr r0 ce950 twice) is orig's bind-vs-reload — mwcc may hold one base in a reg and diverge two ldr. struct-guessed offsets.
 *   confidence: med
 */
/* func_ov002_021cb174 (ov002, class D, MED) — straight store-order global
 * writes, no calls. d016c.f_d2c=6; d30 = (ce950.f_2 bit0 clear)?1:0;
 * d016c.f_d0 |= 1; ce950.f_80c=0. Exact store order: d2c, d30, d0, 80c. */
typedef struct {
    char _a[0xd0]; unsigned int f_d0; char _b[0x58]; int f_d2c; int f_d30;
} StateD016c;
extern StateD016c data_ov002_022d016c;
typedef struct { char _a[0x2]; unsigned short f_2; char _b[0x808]; int f_80c; } StateCe950;
extern StateCe950 data_ov002_022ce950;

void func_ov002_021cb174(void) {
    data_ov002_022d016c.f_d2c = 6;
    data_ov002_022d016c.f_d30 = (data_ov002_022ce950.f_2 & 1) ? 0 : 1;
    data_ov002_022d016c.f_d0 |= 1;
    data_ov002_022ce950.f_80c = 0;
}
