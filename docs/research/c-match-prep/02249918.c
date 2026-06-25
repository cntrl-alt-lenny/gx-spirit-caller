/* CAMPAIGN-PREP candidate for func_02249918 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     base+entries bind; :19 narrow id; eq-2 guard; count@+0x10; entries@+0x260
 *   risk:       struct-guessed: entries@+0x260 and count@+0x10 inferred from add r5,r6,#0x260 / ldr [r6,#0x10]. id bound to r9 once and reused — matches. Clean equality guards, low codegen risk beyond the offset guesses.
 *   confidence: med
 */
typedef unsigned int u32;

extern u32 func_0202e234(u32 id);
extern u32 func_0202de9c(u32 id);
extern void func_ov002_02253458(u32 a, u32 b, u32 c);

struct Tbl {
    u32 pad0[4];     /* +0x00 */
    u32 count;       /* +0x10 */
    u32 pad1[0x93];  /* +0x14 .. +0x260 */
    u32 entries[1];  /* +0x260 */
};

extern struct Tbl data_ov002_022cf16c[2];
extern u32 data_ov002_022cf17c[][0x868/4];

void func_ov002_02249918(u32 arg)
{
    int i;
    u32 *e;
    struct Tbl *base;

    i = 0;
    if (data_ov002_022cf17c[arg & 1][0] == 0)
        return;
    base = &data_ov002_022cf16c[arg & 1];
    e = &base->entries[0];
    do {
        u32 id = (e[0] << 0x13) >> 0x13;
        if (func_0202e234(id) != 0 &&
            func_0202de9c(id) == 2) {
            func_ov002_02253458(arg, 0xd, i);
        }
        i++;
        e++;
    } while ((u32)i < base->count);
}
