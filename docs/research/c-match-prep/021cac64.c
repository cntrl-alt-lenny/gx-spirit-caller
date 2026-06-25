/* CAMPAIGN-PREP candidate for func_021cac64 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     fields read pre-branch (r4,r5,r6,r7); hi via int >>8 => asr; lo|(hi<<8) operand order; (u16) cast = lsl16;lsr16
 *   risk:       reshape-able: the high-byte `hw>>8` must stay a signed-int shift to emit asr#8 (not lsr); if it folds to lsr, narrow hw differently. (u16) cast must yield the lsl#16;lsr#16 zero-extend on arg3; decl order a,b,lo,hi pins r4-r7.
 *   confidence: low
 */
/* func_ov002_021cac64: void. Read u16 hw@ce950+6 (lo=hw&0xff, hi=hw>>8
 * via signed int shift -> asr), a=u16@ce950+2, b=u16@ce950+4. If
 * ce950[0x810]==0: func_021ab864(0); func_021ae3f0(0);
 * func_0229ade0(0xc, a, b, (u16)(lo | (hi<<8))); bump ce950[0x810]. Then if
 * func_0229c7f8(0xc)==0 clear ce950[0x80c]. */
extern char data_ov002_022ce950[];
extern void func_ov002_021ab864(int a);
extern void func_ov002_021ae3f0(int a);
extern void func_ov002_0229ade0(int a, int b, int c, int d);
extern int  func_ov002_0229c7f8(int a);

void func_ov002_021cac64(void) {
    int hw = *(unsigned short *)(data_ov002_022ce950 + 0x6);
    int a = *(unsigned short *)(data_ov002_022ce950 + 0x2);
    int b = *(unsigned short *)(data_ov002_022ce950 + 0x4);
    int lo = hw & 0xff;
    int hi = hw >> 8;
    if (*(int *)(data_ov002_022ce950 + 0x810) == 0) {
        func_ov002_021ab864(0);
        func_ov002_021ae3f0(0);
        func_ov002_0229ade0(0xc, a, b,
            (unsigned short)((lo & 0xff) | ((hi & 0xff) << 8)));
        *(int *)(data_ov002_022ce950 + 0x810) += 1;
    }
    if (func_ov002_0229c7f8(0xc) == 0)
        *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
