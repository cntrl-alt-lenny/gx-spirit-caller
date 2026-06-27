/* CAMPAIGN-PREP candidate for func_021ae674 (ov008, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: signed:8 +8 (asr), unsigned:8 +4/+6; cond-move clamp via if/else-if; bind ip-as-s
 *   risk:       permuter-class: the subgt/strgth + addlt/strlth predicated tail and the `ip` (s) reg held across the f14 store; mwcc likely emits explicit branches, diverging on the cond-store fusion. struct-guessed offsets.
 *   confidence: low
 */
/* func_ov008_021ae674 — sign-clamp inc/dec via cond moves (class D).
 * data_ov008_021b2dc8: +8 is a signed:8 counter (lsl#24;asr#24), +6 unsigned:8,
 * +4 unsigned:8, +0x14 an int copied to data_021b2780+0x634. */
#include "ov008_core.h"

extern void func_ov008_021ae3a0(int n);
extern void func_ov008_021ac0b8(int a, int b, int c);
extern void func_ov008_021abcdc(void);

typedef struct {
    unsigned short pad0;
    unsigned short pad2;
    unsigned int f4 : 8;        /* +4 unsigned:8 */
    unsigned int f4_r : 24;
    signed   int f6 : 8;        /* +6 read unsigned (lsl;lsr) */
    unsigned int f6_r : 24;
    signed   int f8 : 8;        /* +8 signed:8 (lsl#24;asr#24) */
    unsigned int f8_r : 24;
    unsigned int padc[3];
    int f14;                    /* +0x14 */
} Obj021b2dc8;

void func_ov008_021ae674(void) {
    Obj021b2dc8 *o = (Obj021b2dc8 *)data_ov008_021b2dc8;
    int v;
    func_ov008_021ae3a0(o->f8);
    if (o->f8 != 0) {
        int s = o->f8;                 /* ip held across the block */
        *(int *)(data_ov008_021b2780 + 0x634) = o->f14;
        if (s > 0) { o->f8 = s - 1; }
        else if (s < 0) { o->f8 = s + 1; }
    }
    v = (unsigned char)o->f6;          /* +6 read as unsigned:8 */
    if (v > 2) {
        func_ov008_021ac0b8((unsigned char)o->f4, v - 2, 1);
    }
    func_ov008_021abcdc();
}
