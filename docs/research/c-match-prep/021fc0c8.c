/* CAMPAIGN-PREP candidate for func_021fc0c8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: mla idx inlined (r0&1)*0x868; constant bitfield orr#0x16; lsl/lsr inserts; store-order field0/field2/field4 last
 *   risk:       struct-guessed: bit layout of field2/field4 and stride. The shift-insert sequence (v<<2>>24, v<<19>>19, v<<18>>31) likely needs exact :N bitfields; if mwcc emits and+orr instead of bic+orr the masks diverge. struct-guessed.
 *   confidence: low
 */
// func_ov002_021fc0c8 - bitfield-pack struct builder, mla index, store-order

typedef struct PackS PackS;
struct PackS {
    unsigned short field0;   // +0x0
    unsigned short field2;   // +0x2
    unsigned short field4;   // +0x4
    unsigned char  rest[0x12];
};

extern unsigned char data_ov002_022cf16c[];   // base; mla (r0&1)*0x868 + base; +0x120; [r1<<2]
extern void func_ov002_021fc3e8(PackS *s, int d);

void func_ov002_021fc0c8(unsigned int r0, int r1, int r2)
{
    PackS s;
    unsigned char *base = data_ov002_022cf16c + (r0 & 1) * 0x868;
    *(int *)((char *)&s + 0x0) = 0;

    // field2 bit0 = (r0 & 1)  via (r0<<16)>>16 then &1
    s.field2 = (unsigned short)((s.field2 & ~0x1u) | ((((unsigned int)(r0 << 16) >> 16)) & 1u));

    {
        int v = *(int *)(base + 0x120 + (r1 << 2));
        // field2 bits1-5 = constant 0xb (0x16>>1): bic #0x3e; orr #0x16
        s.field2 = (unsigned short)((s.field2 & ~0x3eu) | 0x16u);

        {
            unsigned int f4hi = ((unsigned int)(v << 2)) >> 24;     // r0 = v<<2 >>24
            unsigned int ipv  = ((unsigned int)(v << 19)) >> 19;     // bits 0..12
            unsigned int comb = (f4hi << 1) + (((unsigned int)(v << 18)) >> 31);
            comb = (unsigned int)(comb << 16) >> 16;
            // field2 bit14 clear: bic #0x4000
            s.field2 = (unsigned short)(s.field2 & ~0x4000u);
            // field4 keep bits0-5,15; insert comb<<6
            s.field4 = (unsigned short)((s.field4 & 0xffff803fu) | (((unsigned int)(comb << 23)) >> 17));

            *(int *)((char *)&s + 0x4)  = 0;
            *(int *)((char *)&s + 0x8)  = 0;
            *(int *)((char *)&s + 0xc)  = 0;
            *(int *)((char *)&s + 0x10) = 0;
            *(int *)((char *)&s + 0x14) = 0;

            s.field0 = (unsigned short)ipv;
            // field2 already holds last value; store-order: field0, field2, field4
            s.field2 = s.field2;
            s.field4 = s.field4;

            func_ov002_021fc3e8(&s, r2);
        }
    }
}
