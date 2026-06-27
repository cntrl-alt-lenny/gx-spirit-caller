/* CAMPAIGN-PREP candidate for func_021d6c98 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     f6 as if-assign; nested branch-tails reaching shared L50c; cf1a2 reloaded twice
 *   risk:       inline-vs-branch class: the cf1a4==0 fall-through into the shared L50c tail (and the twice-read cf1a2) may not reproduce mwcc's exact beq/epilogue sharing; pb held across 3 reads adds reg-mirror. permuter-class.
 *   confidence: low
 */
/* func_ov002_021d6c98 (ov002, cls D): guard chain (slot-id query, self bit0,
 * accessor) then a 4-way branch-tail dispatch on two per-player u16 flags
 * (cf1a4, cf1a2) into 021d63fc / 021d6808. pb=(arg1&1)*0x868, row=arg2*0x14.
 * f6 = (021c... id query == 0). */
#include "ov002_core.h"

extern int  func_0202e2f8(int id);
extern int  func_ov002_021c9dac(int bit0);
extern void func_ov002_021d63fc(int a, int b, int c, int d);
extern void func_ov002_021d6808(int a, int b, int c, int d, int e);

void func_ov002_021d6c98(int arg0, int arg1, int arg2) {
    int pb = (arg1 & 1) * 0x868;
    int f6;
    if (func_0202e2f8(((struct Ov002Slot *)(data_ov002_022cf16c + pb + arg2 * 0x14 + 0x30))->id) == 0)
        f6 = 1;
    else
        f6 = 0;
    if (func_ov002_021c9dac(((struct Ov002Self *)arg0)->b0) == 0)
        return;
    if (func_ov002_021c1e44((struct Ov002Self *)arg0, arg1, arg2) != 0)
        return;
    if (f6 != 0) {
        if (*(unsigned short *)(data_ov002_022cf1a4 + pb + arg2 * 0x14) != 0) {
            if (*(unsigned short *)(data_ov002_022cf1a2 + pb + arg2 * 0x14) != 0) {
                func_ov002_021d63fc(arg0, arg1, arg2, 0);
                return;
            }
            func_ov002_021d6808(arg0, arg1, arg2, 1, 0);
            return;
        }
    }
    if (*(unsigned short *)(data_ov002_022cf1a2 + pb + arg2 * 0x14) != 0)
        return;
    func_ov002_021d6808(arg0, arg1, arg2, 0, 0);
}
