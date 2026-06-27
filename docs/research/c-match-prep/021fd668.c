/* CAMPAIGN-PREP candidate for func_021fd668 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: byte-identical to 021fd584 except tail call target; same bitfield/store-order recipe
 *   risk:       struct-guessed: same struct/bit inference as 021fd584; if that one's layout is right this clone matches identically. Only divergence risk is shared with the clone. struct-guessed.
 *   confidence: low
 */
// func_ov002_021fd668 - clone of 021fd584; identical body, calls func_ov002_021fc3e8

typedef struct PackS PackS;
struct PackS {
    unsigned short field0;   // +0x0
    unsigned short field2;   // +0x2
    unsigned short field4;   // +0x4
    unsigned char  rest[0x12];
};

extern unsigned char data_ov002_022cf16c[];
extern void func_ov002_021fc3e8(PackS *s, int d);

void func_ov002_021fd668(unsigned int r0, int r1, unsigned short r2)
{
    PackS s;
    unsigned char *base = data_ov002_022cf16c + (r0 & 1) * 0x868;
    *(int *)((char *)&s + 0x0) = 0;

    {
        int v = *(int *)(base + 0x30 + r1 * 0x14);
        s.field2 = (unsigned short)((s.field2 & ~0x1u) | ((((unsigned int)(r0 << 16) >> 16)) & 1u));

        {
            unsigned int r1v = ((unsigned int)(r1 << 16) >> 16);
            s.field2 = (unsigned short)((s.field2 & ~0x3eu) | (((unsigned int)(r1v << 27)) >> 26));
            unsigned int f4hi = ((unsigned int)(v << 2)) >> 24;
            unsigned int comb = (f4hi << 1) + (((unsigned int)(v << 18)) >> 31);
            comb = (unsigned int)(comb << 16) >> 16;
            *(int *)((char *)&s + 0x4) = 0;
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
