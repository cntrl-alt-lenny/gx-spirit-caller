/* CAMPAIGN-PREP candidate for func_02249790 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     rsb prev=1-arg; base+entries bind; :19 mask; eq-0x16 guard; count@+0x14
 *   risk:       struct-guessed: entries@+0x418 (add #0x18 then #0x400) and count@+0x14 inferred. cmp r0,#0x16/bne is a clean equality test — reshape-safe. Main divergence risk is struct offsets, not codegen.
 *   confidence: med
 */
typedef unsigned int u32;

extern u32 func_0202b878(u32 id);
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
extern u32 data_ov002_022cf180[][0x868/4];

void func_ov002_02249790(u32 arg)
{
    u32 prev;
    int i;
    u32 *e;
    struct Tbl *base;

    prev = 1 - arg;
    i = 0;
    if (data_ov002_022cf180[prev & 1][0] == 0)
        return;
    base = &data_ov002_022cf16c[prev & 1].t;
    e = &base->entries[0];
    do {
        u32 id = (e[0] << 0x13) >> 0x13;
        if (func_0202b878(id) == 0x16) {
            func_ov002_02253458(prev, 0xe, i);
        }
        i++;
        e++;
    } while ((u32)i < base->count);
}
