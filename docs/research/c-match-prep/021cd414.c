/* CAMPAIGN-PREP candidate for func_021cd414 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign parity bit15; lo=f2&0xff, hi=(f2 asr8)&0xff; and 0x7fff; tst bit15 branch; str[sp]
 *   risk:       struct-guessed + permuter-class: the .L_2200 branch maps the WRONG call (021b1f20 takes the str[sp]/r3=ip path, 021b1fe8 the r0=parity+lo*2 path) — branch-sense and which call gets f_6 on the stack is inferred from tst...beq and may be swapped; arg roles for 021b1f20/1fe8 are guessed. hi uses asr#8 (signed f2) so f_2 must be `short` not `unsigned short` or it emits lsr.
 *   confidence: low
 */
/* func_ov002_021cd414 (ov002, class D, MED) — sign-extract + asr/and packing.
 * Reads ce950 f_2,f_4,f_6 and parity(bit15 of f_0). Splits f_2 into low byte
 * and asr#8 high byte; masks f_4 with 0x7fff and tests its bit15. If bit15
 * clear: call 021b1f20(parity*?+lo*2, hi, masked, ...) ; else 021b1fe8 path
 * with f_6 pushed via str[sp]. Tail 0229ade0 + clear f_80c. */
typedef struct {
    unsigned short f_0; unsigned short f_2; unsigned short f_4; unsigned short f_6;
    char _a[0x804]; int f_80c;
} StateCe950;
extern StateCe950 data_ov002_022ce950;
extern int  func_ov002_021b1f20(int a0, int a1, int a2, int a3, int a4);
extern void func_ov002_021b1fe8(int a0, int a1, int a2, int a3);
extern void func_ov002_0229ade0(int a0, int a1, int a2, int a3);

void func_ov002_021cd414(void) {
    int f2  = data_ov002_022ce950.f_2;
    int parity = (data_ov002_022ce950.f_0 & 0x8000) ? 1 : 0;
    int f4  = data_ov002_022ce950.f_4;
    int f6  = data_ov002_022ce950.f_6;
    int lo  = f2 & 0xff;
    int hi  = (f2 >> 8) & 0xff;
    int masked = f4 & 0x7fff;
    if (f4 & 0x8000) {
        func_ov002_021b1f20(parity, 0xb, hi /*unused-slot*/, masked, f6);
    } else {
        func_ov002_021b1fe8(parity + lo * 2, hi, masked, 0);
    }
    func_ov002_0229ade0(0x24, 0, 0, 0);
    data_ov002_022ce950.f_80c = 0;
}
