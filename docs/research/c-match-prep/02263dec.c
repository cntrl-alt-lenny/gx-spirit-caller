/* CAMPAIGN-PREP candidate for func_02263dec (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: unsigned umull /5 + %5 as separate exprs; Ov002Slot.id 13-bit; two-mla addr inlined
 *   risk:       permuter-class: orig has DOUBLE umull for i/5 (one fused into eor `lsr#2`); mwcc may CSE to a single divide, diverging the divmod block / reg-alloc.
 *   confidence: med
 */
/* func_ov002_02263dec: scan loop over the global counter d016c.f_d28 (0..9).
 * Per i: player = arg0 ^ (i/5) [unsigned umull /5], rem = i%5, then probe
 * Ov002Slot.id at cf16c + (player&1)*0x868 + rem*20 + 0x30 (13-bit field).
 * If slot set AND 021b3ecc ok: maybe 021d5b80, bump counter, return 0.
 * NB the orig emits TWO umulls (i/5 folds into the eor `lsr#2` AND into i%5)
 * => keep i/5 and i%5 as SEPARATE exprs (no shared q) to avoid CSE to one. */
#include "ov002_core.h"

extern int func_ov002_021b3ecc(int a, int b, int c);
extern int func_ov002_021de940(int a, int b, int c, int d);
extern int func_ov002_021d5b80(int a, int b, int c, int d);

int func_ov002_02263dec(int arg0, int arg1) {
    unsigned int i, rem;
    int pl, id;

    while ((unsigned int)*(int *)(data_ov002_022d016c + 0xd28) < 10) {
        i = (unsigned int)*(int *)(data_ov002_022d016c + 0xd28);
        pl = arg0 ^ (int)(i / 5);
        rem = i % 5;
        id = ((struct Ov002Slot *)(data_ov002_022cf16c +
              (pl & 1) * 0x868 + rem * 20 + 0x30))->id;
        if (id != 0 && func_ov002_021b3ecc(pl, rem, arg1) != 0) {
            if (func_ov002_021de940(pl, rem, 0, arg1) == 0)
                func_ov002_021d5b80(pl, rem, arg1, 1);
            *(int *)(data_ov002_022d016c + 0xd28) += 1;
            return 0;
        }
        *(int *)(data_ov002_022d016c + 0xd28) += 1;
    }
    return 1;
}
