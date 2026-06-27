/* CAMPAIGN-PREP candidate for func_0225a874 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield extract helper; parallel-table compares; mla sel*0x868 inlined
 *   risk:       permuter-class: the static helper will likely be inlined but the function keeps many live temps (lr/r4/ip reused as scratch across both halves); the asm interleaves loads (ldrh lr early, cmp later) so mwcc scheduling/reg-alloc is the main divergence. Offsets struct-guessed.
 *   confidence: low
 */
/* func_ov002_0225a874: class D dense compare chain. Reads state
 * data_022cd3f4, computes a row bitfield extract from
 * data_022cf16c[(f0&1)]+0x30+(f1c*0x14); compares to field 0xec.
 * If unequal -> return 1. Else compare a 2-bit halfword-table extract
 * (data_022d0250) to field 0xf0; unequal -> return 1.
 * Then if field 8 != 0 -> return 0. Else a second parallel check
 * using field4/field20 against parallel tables data_022cd4e8 /
 * data_022cd4fc indexed by field20; mismatch -> return 1 else 0.
 */
struct State0225a874 {
    int f0;            /* 0x00 */
    int f4;            /* 0x04 */
    int f8;            /* 0x08 */
    char pad0c[0x10];
    int f1c;           /* 0x1c */
    int f20;           /* 0x20 */
    char pad24[0xc8];
    int fec;           /* 0xec */
    int ff0;           /* 0xf0 */
};
struct Row0225a874 { char pad[0x30]; int w; };
extern struct State0225a874 data_ov002_022cd3f4;
extern char data_ov002_022cf16c[];
extern unsigned short data_ov002_022d0250[];
extern int data_ov002_022cd4e8[];   /* indexed by f20 */
extern int data_ov002_022cd4fc[];   /* indexed by f20 */

static int extract_w(char *base, int sel, int rowidx)
{
    struct Row0225a874 *row = (struct Row0225a874 *)(base + (sel & 1) * 0x868 + rowidx * 0x14);
    unsigned int v = (unsigned int)row->w;
    return (int)((((v << 2) >> 24) << 1) + (v >> 31));
}

int func_ov002_0225a874(void)
{
    int e0 = extract_w(data_ov002_022cf16c, data_ov002_022cd3f4.f0, data_ov002_022cd3f4.f1c);
    if (data_ov002_022cd3f4.fec != e0)
        return 1;
    {
        unsigned int h = data_ov002_022d0250[e0 * 2];
        if (data_ov002_022cd3f4.ff0 != (int)((h << 0x11) >> 0x1e))
            return 1;
    }
    if (data_ov002_022cd3f4.f8 != 0)
        return 0;
    {
        int e1 = extract_w(data_ov002_022cf16c, data_ov002_022cd3f4.f4, data_ov002_022cd3f4.f20);
        if (data_ov002_022cd4e8[data_ov002_022cd3f4.f20] != e1)
            return 1;
        {
            unsigned int h = data_ov002_022d0250[e1 * 2];
            if (data_ov002_022cd4fc[data_ov002_022cd3f4.f20] != (int)((h << 0x11) >> 0x1e))
                return 1;
        }
    }
    return 0;
}
