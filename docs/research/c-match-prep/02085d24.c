/* CAMPAIGN-PREP candidate for func_02085d24 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitset base[idx>>5]|=1<<(idx&31); mla i*0x18 array index; ldmia/stmia 3-word copy
 *   risk:       batch asm truncated at .L_5cc; the {r0,r1,r2} ldmia/stmia 3-word block copy needs a 12-byte struct memcpy to emit stmia, and mla i*0x18 reload — struct-guessed + permuter-class.
 *   confidence: low
 */
/* func_02085d24: 3-bit flag dispatch (r3 bits 4/2/1) copying a 3-word vec block and
 * setting/clearing bits in a global bitset array base[0xc4 + (idx>>5)<<2] (idx=src bytes).
 * NOTE: original .s also writes data_021a292c/2930/2934[idx*0x18] (LIT1..3) and ends with
 * obj[0] |= 0x10; str; return.  r0=obj(ip), r1=src vec ptr, r2=byte-args ptr, r3=mask. */
typedef unsigned char u8;
typedef unsigned int u32;

extern u32 *data_021a1b1c;          /* deref -> bitset base */
extern u32  data_021a292c[];        /* stride-0x18 (6 words) arrays */
extern u32  data_021a2930[];
extern u32  data_021a2934[];

void func_02085d24(u32 *obj, u32 *src, u8 *arg, int mask) {
    u8 b3 = arg[3];
    if (mask & 4) {
        obj[0] = src[0] | 1;
        if (b3 & 2) {
            u8 i = arg[1];
            u32 *bs = data_021a1b1c + (0xc4 / 4);
            bs[i >> 5] |= 1u << (i & 0x1f);
        }
    } else {
        obj[1] = src[0];
        obj[2] = src[1];
        obj[3] = src[2];
        if (b3 & 2) {
            u8 i = arg[1];
            u32 *bs = data_021a1b1c + (0xc4 / 4);
            int w = i * 6;
            bs[i >> 5] &= ~(1u << (i & 0x1f));
            data_021a292c[w] = src[3];
            data_021a2930[w] = src[4];
            data_021a2934[w] = src[5];
        }
    }
    if (b3 & 1) {
        u8 i = arg[2];
        u32 *base = data_021a1b1c;
        obj[0] |= 0x20;
        if ((1u << (i & 0x1f)) & base[(0xc4 / 4) + (i >> 5)]) {
            obj[0] |= 8;
        } else {
            u32 *p = data_021a292c + i * 6;
            *(u32 *)(obj + 4) = p[0];
            *(u32 *)(obj + 5) = p[1];
            *(u32 *)(obj + 6) = p[2];
        }
    }
    obj[0] |= 0x10;
}
