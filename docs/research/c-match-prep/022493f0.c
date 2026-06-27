/* CAMPAIGN-PREP candidate for func_022493f0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two sequential counted loops; rsb prev=1-arg; count@+0x14; no entries
 *   risk:       reshape-able: first guard uses bls (signed/unsigned skip) vs second uses ldmls early-return — the two-loop ordering and i-reset must stay; count offset (+0x14) guessed. Low codegen risk otherwise (no inner entry array).
 *   confidence: med
 */
typedef unsigned int u32;

extern void func_ov002_02253458(u32 a, u32 b, u32 c);

struct Tbl {
    u32 pad0[5];     /* +0x00 */
    u32 count;       /* +0x14 */
};

extern struct Tbl data_ov002_022cf16c[2];
extern u32 data_ov002_022cf180[][0x868/4];

void func_ov002_022493f0(u32 arg)
{
    u32 prev;
    int i;
    struct Tbl *base;

    prev = 1 - arg;
    i = 0;
    if (data_ov002_022cf180[prev & 1][0] != 0) {
        base = &data_ov002_022cf16c[prev & 1];
        do {
            func_ov002_02253458(prev, 0xe, i);
            i++;
        } while ((u32)i < base->count);
    }

    i = 0;
    if (data_ov002_022cf180[arg & 1][0] != 0) {
        base = &data_ov002_022cf16c[arg & 1];
        do {
            func_ov002_02253458(arg, 0xe, i);
            i++;
        } while ((u32)i < base->count);
    }
}
