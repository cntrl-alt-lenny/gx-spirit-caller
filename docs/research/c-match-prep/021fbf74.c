/* CAMPAIGN-PREP candidate for func_021fbf74 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: bitfield inserts via lsl/lsr pairs, store-order preserved, mla idx inlined, ne->1/0 via if-assign
 *   risk:       struct-guessed: cf16c/cf1a4 layout (stride 0x14, +0x30, *0x868 page) inferred from mla/add chain. Also heavy shift-insert scheduling is permuter-class; bit positions may need exact :N bitfields to fold lsl;lsr.
 *   confidence: low
 */
// func_ov002_021fbf74 - zero stack struct, two-arg call, then bitfield-pack into struct, store-order heavy

typedef struct PackS PackS;
struct PackS {
    unsigned short field0;   // +0x0   (gets r0 result)
    unsigned short field2;   // +0x2   bit0, bits1-5, bit14
    unsigned short field4;   // +0x4   bits6-14
    unsigned char  rest[0x12];
};

extern unsigned char data_ov002_022cf16c[];  // base, mla idx, +0x30, [r5*0x14]
extern unsigned char data_ov002_022cf1a4[];  // base, mla idx, [r5*0x14]

extern int  func_ov002_021b9ecc(unsigned short a, unsigned short b, void *s);
extern void func_ov002_021fc1a0(PackS *s, int d);
extern void func_ov002_021fc3e8(PackS *s, int d);

int func_ov002_021fbf74(unsigned short r7, unsigned short r6, unsigned short r5, int r3)
{
    PackS s;
    int r4 = r3;
    *(int *)((char *)&s + 0x0)  = 0;
    *(int *)((char *)&s + 0x4)  = 0;
    *(int *)((char *)&s + 0x8)  = 0;
    *(int *)((char *)&s + 0xc)  = 0;
    *(int *)((char *)&s + 0x10) = 0;
    *(int *)((char *)&s + 0x14) = 0;

    {
        int ok = func_ov002_021b9ecc(r6, r5, &s);
        if (ok == 0)
            return 0;

        // field2 bit0 = r6 & 1
        s.field2 = (unsigned short)((s.field2 & ~0x1u) | (r6 & 1u));
        // field0 = ok
        s.field0 = (unsigned short)ok;
        // field2 bits1-5 = (r5 & 0x1f)
        s.field2 = (unsigned short)((s.field2 & ~0x3eu) | (((unsigned int)(r5 << 27) >> 26)));

        {
            int t = *(int *)(data_ov002_022cf16c + ((r6 & 1) * 0x868) + 0x30 + r5 * 0x14);
            unsigned short t2 = *(unsigned short *)(data_ov002_022cf1a4 + ((r6 & 1) * 0x868) + r5 * 0x14);
            int r3b = (r7 != r6) ? 1 : 0;
            unsigned int r6v = ((unsigned int)(t << 2)) >> 24;
            unsigned int r0v = (unsigned int)(r3b << 16) >> 16;
            unsigned int r5v = ((r6v << 1) + (((unsigned int)(t << 18)) >> 31));
            r5v = (unsigned int)(r5v << 16) >> 16;
            // field2 bit14
            s.field2 = (unsigned short)((s.field2 & ~0x4000u) | (((unsigned int)(r0v << 31)) >> 17));
            // field4 keep bits0-5,15 ; insert r5v<<6 region
            s.field4 = (unsigned short)((t2 & 0xffff803fu) | (((unsigned int)(r5v << 23)) >> 17));
            s.field4 = s.field4;
            s.field2 = s.field2;
            if (t2 != 0) {
                func_ov002_021fc1a0(&s, r4);
                return 0;
            }
            func_ov002_021fc3e8(&s, r4);
            return 0;
        }
    }
}
