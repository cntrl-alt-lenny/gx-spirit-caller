/* CAMPAIGN-PREP candidate for func_021b99b4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: clone with cf180 guard, list base+0x18+0x400, base[0x14] bound; packed a*2+b decode
 *   risk:       reshape-able: write `base + 0x18 + 0x400` (mwcc splits 0x418 into add#0x18;add#0x400 since it can't rotate-encode 0x418) — collapsing to +0x418 would emit one add and diverge. struct-guessed: same Key layout; bound offset 0x14 confirm.
 *   confidence: med
 */
/* func_ov002_021b99b4 (ov002, cls D, MED). Clone of 021b98c4 with the list base
 * split as +0x18+0x400 (=+0x418, two adds because 0x418 isn't an ARM imm8
 * rotate), length = base[0x14], guard table cf180. Returns hit index or -1. */
typedef unsigned int u32;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];

struct Ov002Key { u32 : 13; u32 b : 1; u32 : 8; u32 a : 8; u32 : 2; };

int func_ov002_021b99b4(int arg0, int arg1) {
    int poff = (arg0 & 1) * 0x868;
    char *base = data_ov002_022cf16c + poff;
    int i = 0;
    if (*(unsigned int *)(data_ov002_022cf180 + poff) > 0) {
        struct Ov002Key *rec = (struct Ov002Key *)(base + 0x18 + 0x400);
        unsigned int n = *(unsigned int *)(base + 0x14);
        do {
            if ((unsigned int)arg1 == rec->a * 2 + rec->b)
                return i;
            i++;
            rec++;
        } while ((unsigned int)i < n);
    }
    return -1;
}
