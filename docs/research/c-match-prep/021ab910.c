/* CAMPAIGN-PREP candidate for func_021ab910 (ov009, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: switch(o[0x24]) state machine; MMIO RMW bic/orr; r4=ret init 0 (moveq tail)
 *   risk:       permuter-class: KNOWN wall (ov009_core.h: 021ab910 60%) — the switch discriminant lands in r0 not r1, rotating the whole body incl. the dual-engine MMIO block; declaration-order did NOT move it. Discriminant register coin-flip.
 *   confidence: low
 */
/* func_ov009_021ab910 — display state machine, MMIO RMW arms (class D).
 * o = r0 (the scene controller). switch(o[0x24]) over states 0/1/2; state arms
 * RMW the 0x4000000 / +0x1000 display engine regs. Returns a 0/1 done flag. */
#include "ov009_core.h"

extern int func_ov009_021ac4d0(void);
extern int func_020215d8(int h);

int func_ov009_021ab910(int *o) {
    volatile unsigned int *eng = (volatile unsigned int *)0x4000000;
    volatile unsigned int *eng2 = (volatile unsigned int *)0x4001000;
    int ret = 0;
    switch (o[0x24 / 4]) {
    case 0:
        o[0x30 / 4] += 1;
        if (o[0x30 / 4] == 4) {
            eng[0]  = (eng[0]  & ~0x1f00) | 0x1900;
            eng2[0] = (eng2[0] & ~0x1f00) | 0x1800;
            o[0x30 / 4] = 0;
            o[0x24 / 4] = 1;
        }
        break;
    case 1:
        if (func_ov009_021ac4d0() != 0) {
            o[0x30 / 4] = 0;
            o[0x24 / 4] = 2;
        }
        break;
    case 2:
        if (o[0x30 / 4] == 0xe) {
            eng[0]  = eng[0]  & ~0x1f00;
            eng2[0] = eng2[0] & ~0x1f00;
        }
        if (func_020215d8(o[0x2c / 4]) == 0) ret = 1;
        o[0x30 / 4] += 1;
        break;
    }
    return ret;
}
