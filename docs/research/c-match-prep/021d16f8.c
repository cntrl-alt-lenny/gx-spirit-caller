/* CAMPAIGN-PREP candidate for func_021d16f8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: (u8) byte-pack lever ((u8)lo|((u8)hi<<8)) -> and;and;orr lsl#8 then (u16); blo/bhi/idx/flag/c held in callee regs across the 021b009c call
 *   risk:       reshape-able: the (u8) cast is the proven anti-peephole lever (brief 356/358); residual risk is mwcc recomputing blo/bhi instead of pre-masking them into callee regs across the call. If a byte uses lsl#24;lsr#16, the cast slipped.
 *   confidence: med
 */
/* func_ov002_021d16f8 (cls D): busy-gated; run 021b009c then post a 0x37
 * command built from (u8) byte-packs of flag/idx and the @+4 halfword. */
typedef unsigned char  u8;
typedef unsigned short u16;
extern char data_ov002_022ce950[];
extern void func_ov002_021b009c(void);
extern int  func_ov002_0229ade0(int cmd, int a, int b, int c);
extern int  func_ov002_0229c7f8(int cmd);

void func_ov002_021d16f8(void) {
    int flag = (*(u16 *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    int b   = *(u16 *)(data_ov002_022ce950 + 4);
    int idx = *(u16 *)(data_ov002_022ce950 + 2);
    int blo = b & 0xff;
    int bhi = (b >> 8) & 0xff;
    int c   = *(u16 *)(data_ov002_022ce950 + 6);
    if (*(int *)(data_ov002_022ce950 + 0x810) == 0) {
        func_ov002_021b009c();
        func_ov002_0229ade0(0x37,
            (u16)(((u8)flag) | ((u8)idx << 8)),
            (u16)(((u8)blo) | ((u8)bhi << 8)),
            c);
        *(int *)(data_ov002_022ce950 + 0x810) =
            *(int *)(data_ov002_022ce950 + 0x810) + 1;
    } else if (func_ov002_0229c7f8(0x37) == 0) {
        *(int *)(data_ov002_022ce950 + 0x80c) = 0;
    }
}
