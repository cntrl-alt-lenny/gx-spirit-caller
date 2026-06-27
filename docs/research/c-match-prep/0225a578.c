/* CAMPAIGN-PREP candidate for func_0225a578 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     counted loop; mla row base inlined; 2 bitfield extracts; stacked 5th arg
 *   risk:       permuter-class: 10 callee-saved regs (r4-fp) held live across the loop (state base r5, table r6, row-stride consts r7/r4, i in r8, byte-offset r9 in r9); mwcc reg-alloc + the str fp,[sp] stacked arg almost certainly schedule differently. Return value also guessed.
 *   confidence: low
 */
/* func_ov002_0225a578: class D counted loop building a result struct
 * (dst = r0 param). Pre-loop: read state data_022cd3f4 (f0,f1c),
 * index data_022cf16c[(f0&1)] + 0x30 by (f1c*0x14), extract bitfield
 * -> dst[0]; halfword table data_022d0250 lookup -> dst[1].
 * Loop i=0..4: per-row at data_022cf16c[(f4&1)]+0x30+(i*0x14),
 * extract -> dst.field8[i]; halfword table -> dst.field1c[i];
 * call 021bf294(cd3f4_0, cd3f4_1c, cd3f4_4, i, 0) -> dst.field30[i].
 * dst layout: 3 parallel int[5] arrays at +8, +0x1c, +0x30 (stride 4)
 * plus head ints at +0 and +4.
 */
struct State0225a578 {
    int f0;            /* 0x00 */
    int f4;            /* 0x04 */
    char pad8[0x14];
    int f1c;           /* 0x1c */
};
struct Row0225a578 {
    char pad[0x30];
    int  w;            /* +0x30 word holding the bitfields */
};
extern struct State0225a578 data_ov002_022cd3f4;
extern char data_ov002_022cf16c[];      /* base of the 0x868-stride rows */
extern unsigned short data_ov002_022d0250[];
extern int func_ov002_021bf294(int a, int b, int c, int i, int z);

int func_ov002_0225a578(int *dst)
{
    int i;
    {
        struct Row0225a578 *row =
            (struct Row0225a578 *)(data_ov002_022cf16c
                + (data_ov002_022cd3f4.f0 & 1) * 0x868
                + data_ov002_022cd3f4.f1c * 0x14);
        unsigned int v = (unsigned int)row->w;
        int e = (int)((((v << 2) >> 24) << 1) + (v >> 31));
        dst[0] = e;
        {
            unsigned int h = data_ov002_022d0250[e * 2];
            dst[1] = (int)((h << 0x11) >> 0x1e);
        }
    }
    for (i = 0; i < 5; i++) {
        struct Row0225a578 *row =
            (struct Row0225a578 *)(data_ov002_022cf16c
                + (data_ov002_022cd3f4.f4 & 1) * 0x868
                + i * 0x14);
        unsigned int v = (unsigned int)row->w;
        int e = (int)((((v << 2) >> 24) << 1) + (v >> 31));
        dst[2 + i] = e;
        {
            unsigned int h = data_ov002_022d0250[e * 2];
            dst[7 + i] = (int)((h << 0x11) >> 0x1e);
        }
        dst[12 + i] = func_ov002_021bf294(data_ov002_022cd3f4.f0,
                                          data_ov002_022cd3f4.f1c,
                                          data_ov002_022cd3f4.f4, i, 0);
    }
    return dst[16];
}
