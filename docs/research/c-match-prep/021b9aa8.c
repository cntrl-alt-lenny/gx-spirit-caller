/* CAMPAIGN-PREP candidate for func_021b9aa8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: clone with cf178 guard, +0x120 list, base[0xc] bound; packed a*2+b decode
 *   risk:       struct-guessed: same Key a:8@22/b:1@13 layout as the 021b98c4 master clone. reshape-able: unsigned `>0` guard + read-once base[0xc] bound + rec++ walk. Confirm 0xc bound and +0x120 list offsets; otherwise transfers cleanly.
 *   confidence: med
 */
/* func_ov002_021b9aa8 (ov002, cls D, MED). Clone of 021b98c4: list at
 * cf16c+poff+0x120, length = base[0xc], guard table cf178. Returns hit index or
 * -1. */
typedef unsigned int u32;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];

struct Ov002Key { u32 : 13; u32 b : 1; u32 : 8; u32 a : 8; u32 : 2; };

int func_ov002_021b9aa8(int arg0, int arg1) {
    int poff = (arg0 & 1) * 0x868;
    char *base = data_ov002_022cf16c + poff;
    int i = 0;
    if (*(unsigned int *)(data_ov002_022cf178 + poff) > 0) {
        struct Ov002Key *rec = (struct Ov002Key *)(base + 0x120);
        unsigned int n = *(unsigned int *)(base + 0xc);
        do {
            if ((unsigned int)arg1 == rec->a * 2 + rec->b)
                return i;
            i++;
            rec++;
        } while ((unsigned int)i < n);
    }
    return -1;
}
