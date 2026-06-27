/* CAMPAIGN-PREP candidate for func_02249090 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     select q before NULL-guard; base+entries bind; :19 mask; count@+0x10
 *   risk:       reshape-able: q is conditionally-assigned (ldreq r5) and may be uninitialised when neither branch hits — matches asm's ldreq; if mwcc adds a default-init the cmp/ldr pattern diverges. struct count offset guessed.
 *   confidence: med
 */
typedef unsigned int u32;

extern u32 func_0202df78(u32 a, u32 b);
extern u32 func_ov002_021ca3f0(u32 a, u32 b);
extern void func_ov002_02253458(u32 a, u32 b, u32 c);

struct Tbl {
    u32 pad0[4];     /* +0x00 */
    u32 count;       /* +0x10 */
    u32 pad1[0x93];  /* +0x14 .. +0x260 */
    u32 entries[1];  /* +0x260 */
};

extern struct Tbl data_ov002_022cf16c[2];
extern u32 data_ov002_022cf17c[][0x868/4];

void func_ov002_02249090(u32 arg, u32 sel)
{
    u32 q;
    int i;
    u32 *e;
    struct Tbl *base;

    if (sel == 0x1232)
        q = 0x1117;
    else if (sel == 0x1232 + 0xac)
        q = 0xfc9;

    i = 0;
    if (data_ov002_022cf17c[arg & 1][0] == 0)
        return;
    base = &data_ov002_022cf16c[arg & 1];
    e = &base->entries[0];
    do {
        u32 id = (e[0] << 0x13) >> 0x13;
        if (func_0202df78(id, q) != 0 &&
            func_ov002_021ca3f0(arg, id) != 0) {
            func_ov002_02253458(arg, 0xd, i);
        }
        i++;
        e++;
    } while ((u32)i < base->count);
}
