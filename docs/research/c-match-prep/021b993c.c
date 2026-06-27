/* CAMPAIGN-PREP candidate for func_021b993c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: same as 021b98c4 with cf184 guard, +0x3a0 list, base[0x18] bound; packed a*2+b decode
 *   risk:       struct-guessed: identical Key bitfield assumption as 021b98c4 (the clone). reshape-able: `>0` unsigned guard + read-once bound. If the 021b98c4 sibling matches, this transfers; main risk is the bound-offset (0x18) being a struct member confirm.
 *   confidence: med
 */
/* func_ov002_021b993c (ov002, cls D, MED). Clone of 021b98c4: same packed
 * (a*2+b) record scan, but list at cf16c+poff+0x3a0, length = base[0x18], guard
 * table cf184. Returns hit index or -1. */
typedef unsigned int u32;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf184[];

struct Ov002Key { u32 : 13; u32 b : 1; u32 : 8; u32 a : 8; u32 : 2; };

int func_ov002_021b993c(int arg0, int arg1) {
    int poff = (arg0 & 1) * 0x868;
    char *base = data_ov002_022cf16c + poff;
    int i = 0;
    if (*(unsigned int *)(data_ov002_022cf184 + poff) > 0) {
        struct Ov002Key *rec = (struct Ov002Key *)(base + 0x3a0);
        unsigned int n = *(unsigned int *)(base + 0x18);
        do {
            if ((unsigned int)arg1 == rec->a * 2 + rec->b)
                return i;
            i++;
            rec++;
        } while ((unsigned int)i < n);
    }
    return -1;
}
