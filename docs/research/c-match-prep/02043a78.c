/* CAMPAIGN-PREP candidate for func_02043a78 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: sp word-pair flushes; lsr/and/orr bitfield, strb stream bytes in store-order
 *   risk:       struct-guessed + permuter-class: r4 offsets and func_02094688 arg-order/semantics inferred; the hand-packed strb sequence (da7c+5/+a/+b) and which buf word reloads will rotate regs unless C mirrors store-order exactly.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02043a78 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: class-D bitfield-pack serializer rarely
 * first-build-matches. data_0219da7c is a bss byte-stream; da82/da88 are
 * fixed byte offsets into it (separate symbols => separate ldr each). The
 * helper func_02094688(dst,src,nbits) packs/flushes nbits from a stack word
 * pair into the stream. After each flush the code hand-packs extra bytes via
 * lsr/and/orr + strb in EXACT store order.
 *   recipe: D store-order; sp word-pair per flush; lsr/and/orr bitfield then strb da7c+5/+a/+b
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_0219da7c;   /* stream byte 0 */
extern u8 data_0219da82;   /* stream byte +6 (label) */
extern u8 data_0219da88;   /* stream byte +c (label) */
extern void func_02094688(void *dst, void *src, int nbits);

typedef struct {
    u8  _pad0[4];
    u32 f4;     /* +0x04 */
    u32 f8;     /* +0x08 */
    u32 fc;     /* +0x0c */
    u16 f10;    /* +0x10 */
    u8  f12[2]; /* +0x12 */
} Obj02043a78;

void func_02043a78(Obj02043a78 *r4)
{
    u32 buf[2];

    /* flush #1: pack {f8,fc} as a 5-unit field into the stream */
    buf[0] = r4->f8;
    buf[1] = r4->fc;
    func_02094688(buf, &data_0219da7c, 5);

    /* hand-pack one byte from f4 + low buf word into stream+5 */
    {
        u32 lo  = buf[0];
        u32 f4  = r4->f4;
        u32 ip  = (lo >> 5) | (buf[1] << 0x1b);
        u32 r3  = buf[1] >> 5;
        u8  b5  = (u8)(((f4 >> 8) & 0x7) | ((lo & 0x1f) << 3));
        (&data_0219da7c)[5] = b5;
        /* flush #2: repacked {ip,r3} as a 4-unit field */
        buf[0] = ip;
        buf[1] = r3;
        func_02094688(buf, &data_0219da82, 4);
    }

    /* hand-pack two bytes from f10 into stream+a / stream+b */
    {
        u16 h    = r4->f10;
        u32 lo   = buf[1];
        (&data_0219da7c)[0xa] = (u8)((lo & 0x3f) | ((h & 0x3) << 6));
        (&data_0219da7c)[0xb] = (u8)((u16)r4->f10 >> 2);
    }

    /* flush #3: 2 units from f12 */
    func_02094688(&r4->f12[0], &data_0219da88, 2);
}
