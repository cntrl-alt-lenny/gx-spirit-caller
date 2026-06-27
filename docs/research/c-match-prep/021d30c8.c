/* CAMPAIGN-PREP candidate for func_021d30c8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (u8)lo|((u8)hi<<8) byte-pack lever; u16 cast for lsl16;lsr16; bit15 ternary; RMW counter
 *   risk:       orig loads counter/[+2]/[+4]/[+6] all at the top before the gate (4 ldr); mwcc may sink the [+2]/[+4]/[+6] loads into the taken arm, reordering vs orig's hoist. reshape-able via early local reads in decl-order.
 *   confidence: med
 */
/* func_ov002_021d30c8: ov002 one-shot (counter+0x810 gate) -> post cmd 0x40
 * with a (u8)|(u8)<<8 byte-pack of [+6] and [+4]; then poll 0229c7f8, and on
 * 0 post cmd 8 (zeros) and clear +0x80c. cls D: byte-pack + bit15 ternary. */
#include "ov002_core.h"

extern int func_ov002_0229c7f8(int a);

void func_ov002_021d30c8(void) {
    int flag;
    int packed;
    flag = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    if (*(int *)(data_ov002_022ce950 + 0x810) == 0) {
        /* (u8) lever: (u8)lo | ((u8)hi<<8) -> and;and;orr lsl#8 (NOT lsl#24;lsr#16). */
        packed = (unsigned short)((unsigned char)*(unsigned short *)(data_ov002_022ce950 + 0x6)
                | ((unsigned char)*(unsigned short *)(data_ov002_022ce950 + 0x4) << 8));
        func_ov002_0229ade0(0x40, flag,
            *(unsigned short *)(data_ov002_022ce950 + 0x2), packed);
        *(int *)(data_ov002_022ce950 + 0x810) += 1;
    }
    if (func_ov002_0229c7f8(0x40) == 0) {
        func_ov002_0229ade0(0x8, 0, 0, 0);
        *(int *)(data_ov002_022ce950 + 0x80c) = 0;
    }
}
