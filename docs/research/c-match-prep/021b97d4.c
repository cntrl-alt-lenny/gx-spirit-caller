/* CAMPAIGN-PREP candidate for func_021b97d4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :13 bitfield id (lsl19;lsr19), eor index toggle, inner stride-2 walk, return matched index
 *   risk:       reshape-able: the loop induction var `idx` (=arg0^p, +=2) must stay the returned value and the table pointer base. If mwcc strength-reduces to a byte pointer instead of an index*4, the cmp/return shape shifts 1-2 insns (then permuter-class). Rec.id :13 layout struct-guessed.
 *   confidence: med
 */
/* func_ov002_021b97d4 (ov002, cls D, MED). Two-player (eor-toggled) scan of the
 * d0250 packed-key table: for outer p in {0,1} the base index is (arg0 ^ p), and
 * for inner k in 0..0x7f it reads the :13 id of d0250[(arg0^p) + 2*k] and, on
 * id==arg1, returns that element index; else 0. */
typedef unsigned short u16;

extern char data_ov002_022d0250[];

struct Ov002Rec { u16 id : 13; u16 cnt : 2; u16 hi : 1; u16 pad; };

int func_ov002_021b97d4(int arg0, int arg1) {
    struct Ov002Rec *tab = (struct Ov002Rec *)data_ov002_022d0250;
    int p;
    for (p = 0; p < 2; p++) {
        int idx = arg0 ^ p;
        int k;
        for (k = 0; k < 0x80; k++) {
            if ((unsigned int)arg1 == tab[idx].id)
                return idx;
            idx += 2;
        }
    }
    return 0;
}
