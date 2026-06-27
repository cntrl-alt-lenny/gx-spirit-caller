/* CAMPAIGN-PREP candidate for func_022491c8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     base+entries bind; :19 mask shift; count@+0x18; entries@+0x3a0
 *   risk:       struct-guessed: entries offset (+0x3a0) and count (+0x18) inferred from add r5,r6,#0x3a0 / ldr [r6,#0x18]. id reused for both guard calls binds r9 once (matches mov r1,r9). Loop reg-alloc likely OK.
 *   confidence: med
 */
typedef unsigned int u32;

extern u32 func_ov002_0223bb28(u32 a, u32 b);
extern u32 func_ov002_021ca3f0(u32 a, u32 b);
extern void func_ov002_02253458(u32 a, u32 b, u32 c);

struct Tbl {
    u32 pad0[6];     /* +0x00 */
    u32 count;       /* +0x18 */
    u32 pad1[0xe1];  /* +0x1c .. +0x3a0 */
    u32 entries[1];  /* +0x3a0 */
};

extern struct Tbl data_ov002_022cf16c[2];
extern u32 data_ov002_022cf184[][0x868/4];

void func_ov002_022491c8(u32 arg)
{
    int i;
    u32 *e;
    struct Tbl *base;

    i = 0;
    if (data_ov002_022cf184[arg & 1][0] == 0)
        return;
    base = &data_ov002_022cf16c[arg & 1];
    e = &base->entries[0];
    do {
        u32 id = (e[0] << 0x13) >> 0x13;
        if (func_ov002_0223bb28(arg, id) != 0 &&
            func_ov002_021ca3f0(arg, id) != 0) {
            func_ov002_02253458(arg, 0xc, i);
        }
        i++;
        e++;
    } while ((u32)i < base->count);
}
