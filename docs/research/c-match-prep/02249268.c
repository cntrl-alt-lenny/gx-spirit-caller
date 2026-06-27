/* CAMPAIGN-PREP candidate for func_02249268 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     outer xor index -> mla base; entries@+0x418; :19 mask; count@+0x14
 *   risk:       struct-guessed + reshape-able: base computed via mla r9,(idx&1),0x868,fp each outer iter (NOT bound across iters) — writing base=&arr[idx&1] inside the loop matches; if mwcc hoists fp differently the mla folds. entries/count offsets inferred.
 *   confidence: low
 */
typedef unsigned int u32;

extern u32 func_0202e234(u32 id);
extern u32 func_ov002_021c33e4(u32 a, u32 b, u32 c);
extern void func_ov002_02253458(u32 a, u32 b, u32 c);

struct Tbl {
    u32 pad0[5];      /* +0x00 */
    u32 count;        /* +0x14 */
    u32 pad1;         /* +0x18 */
    u32 hdr[0x100];   /* +0x18 .. +0x418 */
    u32 entries[1];   /* +0x418 = +0x18 + 0x400 */
};
struct TblPad { struct Tbl t; char _pad[0x868 - (int)sizeof(struct Tbl)]; };

extern struct TblPad data_ov002_022cf16c[2];

void func_ov002_02249268(u32 arg)
{
    int o;
    int i;
    u32 *e;
    struct Tbl *base;
    u32 idx;

    for (o = 0; o < 2; o++) {
        idx = arg ^ o;
        base = &data_ov002_022cf16c[idx & 1].t;
        i = 0;
        if (base->count == 0)
            continue;
        e = &base->entries[0];
        do {
            u32 id = (e[0] << 0x13) >> 0x13;
            if (func_0202e234(id) != 0 &&
                func_ov002_021c33e4(arg, idx, i) != 0) {
                func_ov002_02253458(idx, 0xe, i);
            }
            i++;
            e++;
        } while ((u32)i < base->count);
    }
}
