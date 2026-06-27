/* CAMPAIGN-PREP candidate for func_021d4e10 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     fall-through switch (no breaks); (u8) of u16 state; byte0-inc as halfword RMW preserving byte1
 *   risk:       the byte-inc RMW: orig does ldrh; (v<<24>>24)+1; (..<<16>>16); bic#0xff; and#0xff; orr; strh. My &~0xff|(u8)(..+1) C may emit a `:8` style differently OR mwcc may not duplicate it inline twice. reshape-able via a u16{lo:8;hi:8} bitfield `s->lo++` if masks diverge.
 *   confidence: low
 */
/* func_ov002_021d4e10: ov002 3-state FALL-THROUGH switch on the state byte at
 * cdc68[+0xc]. state0: cd70 copy + set +0x80c=1 / +0x810=0 + byte-inc cdc74,
 * fall into state1: 021d48f4 then if +0x80c!=0 return 1 else byte-inc cdc74,
 * fall into state2: 021b1458(8,0,0,0) + clear bit2 of cd968[+0x300], return 1.
 * default: return 1. cls D: byte-inc bitfield (halfword RMW) repeated. */
#include "ov002_core.h"

extern char data_ov002_022cdc68[];   /* +0xc: state byte (in a halfword) */
extern char data_ov002_022cdc6c[];   /* cd70 src */
extern char data_ov002_022cdc74[];   /* halfword: byte0 = a counter, byte1 preserved */
extern char data_ov002_022cd968[];   /* +0x300 flag word */
extern void func_ov002_0229cd70(void *dst, void *src, int n);
extern void func_ov002_021b1458(int a, int b, int c, int d);
extern void func_ov002_021d48f4(void);

int func_ov002_021d4e10(void) {
    switch ((unsigned char)*(unsigned short *)(data_ov002_022cdc68 + 0xc)) {
    case 0:
        func_ov002_0229cd70(data_ov002_022ce950, data_ov002_022cdc6c, 8);
        *(int *)(data_ov002_022ce950 + 0x80c) = 1;
        *(int *)(data_ov002_022ce950 + 0x810) = 0;
        *(unsigned short *)data_ov002_022cdc74 =
            (unsigned short)((*(unsigned short *)data_ov002_022cdc74 & ~0xff)
            | (unsigned char)((unsigned char)*(unsigned short *)data_ov002_022cdc74 + 1));
        /* fall through */
    case 1:
        func_ov002_021d48f4();
        if (*(int *)(data_ov002_022ce950 + 0x80c) != 0)
            return 1;
        *(unsigned short *)data_ov002_022cdc74 =
            (unsigned short)((*(unsigned short *)data_ov002_022cdc74 & ~0xff)
            | (unsigned char)((unsigned char)*(unsigned short *)data_ov002_022cdc74 + 1));
        /* fall through */
    case 2:
        func_ov002_021b1458(8, 0, 0, 0);
        *(int *)(data_ov002_022cd968 + 0x300) &= ~0x4;
        return 1;
    default:
        return 1;
    }
}
