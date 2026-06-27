/* CAMPAIGN-PREP candidate for func_021b98c4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: packed a*2+b decode, unsigned>0 guard (bls), do-while bcc bound from base[0x10], rec++ walk
 *   risk:       struct-guessed: Key a:8@22 / b:1@13 widths inferred from lsl#2;lsr#24 + lsl#18;lsr#31. reshape-able: guard must be `>0` (unsigned -> bls) not `!=0`; loop bound base[0x10] is read-once before loop. mwcc may hoist/reload the n load.
 *   confidence: med
 */
/* func_ov002_021b98c4 (ov002, cls D, MED). Search player(arg0&1)'s list at
 * cf16c+poff+0x260, length = *(int*)(cf16c+poff+0x10), guarded by
 * *(int*)(cf17c+poff)!=0. Each 4-byte record packs a :8 field at bit22 and a :1
 * at bit13; compare (a*2+b)==arg1 and return the 0-based hit index, else -1. */
typedef unsigned int u32;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];

struct Ov002Key { u32 : 13; u32 b : 1; u32 : 8; u32 a : 8; u32 : 2; };

int func_ov002_021b98c4(int arg0, int arg1) {
    int poff = (arg0 & 1) * 0x868;
    char *base = data_ov002_022cf16c + poff;
    int i = 0;
    if (*(unsigned int *)(data_ov002_022cf17c + poff) > 0) {
        struct Ov002Key *rec = (struct Ov002Key *)(base + 0x260);
        unsigned int n = *(unsigned int *)(base + 0x10);
        do {
            if ((unsigned int)arg1 == rec->a * 2 + rec->b)
                return i;
            i++;
            rec++;
        } while ((unsigned int)i < n);
    }
    return -1;
}
