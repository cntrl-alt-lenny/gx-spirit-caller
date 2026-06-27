/* CAMPAIGN-PREP candidate for func_021fd81c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: AND-mask extract of r0 packed fields (#0x80000000 etc), repack via lsl/lsr inserts, store-order preserved
 *   risk:       struct-guessed AND permuter-class: many interleaved bitfield inserts; mwcc will likely reorder the and/bic/orr scheduling and the ldrh-reload-between-stores chain. Field offsets/widths inferred. Hardest in batch.
 *   confidence: low
 */
// func_ov002_021fd81c - many bitfield inserts from r0's packed fields into stack struct, store-order
// Source r0 is itself a packed word; this UNPACKS r0 fields and REPACKS into struct halfwords.

typedef struct PackS PackS;
struct PackS {
    unsigned short field0;   // +0x0  (gets raw r0 low half)
    unsigned short field2;   // +0x2
    unsigned short field4;   // +0x4
    unsigned char  rest[0x12];
};

extern void func_ov002_021fd270(PackS *s, int d);

void func_ov002_021fd81c(unsigned int r0, int r1, int r2)
{
    PackS s;
    *(int *)((char *)&s + 0x0) = 0;

    // field2 bit0 = r0 bit31
    {
        unsigned int b = (r0 & 0x80000000u) >> 31;
        s.field2 = (unsigned short)((s.field2 & ~0x1u) | (b & 1u));
    }
    // field2 bit14 = r0 bit24
    {
        unsigned int b = (r0 & 0x01000000u) >> 24;
        b = (unsigned int)(b << 16) >> 16;
        s.field2 = (unsigned short)((s.field2 & ~0x4000u) | (((unsigned int)(b << 31)) >> 17));
    }
    // field0 = r0 low half (raw)
    s.field0 = (unsigned short)r0;
    {
        unsigned int e = (r0 & 0x00e00000u) >> 21;     // 3 bits
        e = (unsigned int)(e << 16) >> 16;
        unsigned int d5 = (r0 & 0x001f0000u) >> 16;    // 5 bits
        d5 = (unsigned int)(d5 << 16) >> 16;
        unsigned int g = (r0 & 0x7e000000u) >> 25;     // 6 bits
        g = (unsigned int)(g << 16) >> 16;
        *(int *)((char *)&s + 0x14) = 0;
        // field2 bits12-13 (0x3000) = e
        s.field2 = (unsigned short)((s.field2 & ~0x3000u) | (((unsigned int)(e << 30)) >> 18));
        // field2 bits1-5 (0x3e) = d5
        s.field2 = (unsigned short)((s.field2 & ~0x3eu) | (((unsigned int)(d5 << 27)) >> 26));
        *(int *)((char *)&s + 0x4) = 0;
        // field4 keep bits0-5,15; insert r1<<6 region
        s.field4 = (unsigned short)((*(unsigned short *)((char *)&s + 0x4) & 0xffff803fu) | (((unsigned int)(r1 << 23)) >> 17));
        // field2 bits6-11 (0xfc0) = g
        s.field2 = (unsigned short)((s.field2 & ~0xfc0u) | (((unsigned int)(g << 26)) >> 20));
        *(int *)((char *)&s + 0x8)  = 0;
        *(int *)((char *)&s + 0xc)  = 0;
        *(int *)((char *)&s + 0x10) = 0;
        s.field2 = s.field2;
        s.field4 = s.field4;
        *(int *)((char *)&s + 0x14) = r2;
        func_ov002_021fd270(&s, 0);
    }
}
