/* CAMPAIGN-PREP candidate for func_021fd74c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: +0x120 [r1<<2] index (like 021fc0c8) but bic#0xfc0 + r2-stored field0 like fd584 family; store-order field0/field4/field2
 *   risk:       struct-guessed: hybrid of fc0c8 (orr#0x16 const, +0x120 index) and fd584 (bic#0xfc0, field0=r2). [sp+4] zeroed early (decl-order of word stores). Bit layout inferred. struct-guessed.
 *   confidence: low
 */
// func_ov002_021fd74c - bitfield-pack struct builder, mla index, +0x120, [r1<<2], store-order

typedef struct PackS PackS;
struct PackS {
    unsigned short field0;   // +0x0
    unsigned short field2;   // +0x2
    unsigned short field4;   // +0x4
    unsigned char  rest[0x12];
};

extern unsigned char data_ov002_022cf16c[];
extern void func_ov002_021fc3e8(PackS *s, int d);

void func_ov002_021fd74c(unsigned int r0, int r1, unsigned short r2)
{
    PackS s;
    unsigned char *base = data_ov002_022cf16c + (r0 & 1) * 0x868;
    *(int *)((char *)&s + 0x0) = 0;

    {
        unsigned int r0lo = ((unsigned int)(r0 << 16) >> 16);
        *(int *)((char *)&s + 0x4) = 0;
        // field2 bit0 = r0lo & 1
        s.field2 = (unsigned short)((s.field2 & ~0x1u) | (r0lo & 1u));
        {
            int v = *(int *)(base + 0x120 + (r1 << 2));
            // field2 bits1-5 = const 0xb : bic#0x3e orr#0x16
            s.field2 = (unsigned short)((s.field2 & ~0x3eu) | 0x16u);
            unsigned int f4hi = ((unsigned int)(v << 2)) >> 24;
            unsigned int comb = (f4hi << 1) + (((unsigned int)(v << 18)) >> 31);
            comb = (unsigned int)(comb << 16) >> 16;
            // field2 bits6-11 clear: bic#0xfc0
            s.field2 = (unsigned short)(s.field2 & ~0xfc0u);
            s.field4 = (unsigned short)((s.field4 & 0xffff803fu) | (((unsigned int)(comb << 23)) >> 17));
            *(int *)((char *)&s + 0x8)  = 0;
            *(int *)((char *)&s + 0xc)  = 0;
            *(int *)((char *)&s + 0x10) = 0;
            *(int *)((char *)&s + 0x14) = 0;
            s.field0 = r2;
            s.field4 = s.field4;
            s.field2 = s.field2;
            func_ov002_021fc3e8(&s, 0);
        }
    }
}
