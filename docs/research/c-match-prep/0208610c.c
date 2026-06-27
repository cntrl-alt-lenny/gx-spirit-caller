/* CAMPAIGN-PREP candidate for func_0208610c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitset RMW; mla idx*0x18; 6x FX12 smull>>12; Copy32 records; store-order
 *   risk:       batch asm truncated before .L_9b0 6x-smull tail; ip=idx*0x18 byte-offset is held across all 6 scales while r3=idx*0x18 word-stride aliases — mwcc reg-alloc of the two parallel indices is permuter-class.
 *   confidence: low
 */
/* func_0208610c: flag dispatch (r3 bit2) — bitset set/clear in *data_021a1b1c[0xc4..]
 * (idx=arg[1],arg[2]) plus Copy32 of 0x18-byte stride records data_021a2920..2934[idx*0x18],
 * with a 6x FX12 scale (smull>>12) in the .L_9b0 tail.  r0=obj, r1=src, r2=arg, r3=mask. */
typedef unsigned char u8;
typedef unsigned int u32;
typedef signed int s32;
typedef signed long long s64;

extern void Copy32(void *dst, void *src, int n);
extern u32 *data_021a1b1c;
extern u32  data_021a2920[], data_021a2924[], data_021a2928[];
extern u32  data_021a292c[], data_021a2930[], data_021a2934[];

void func_0208610c(u32 *obj, u32 *src, u8 *arg, int mask) {
    u8 a1 = arg[1];
    u8 a2 = arg[2];
    if (mask & 4) {
        u32 *base = data_021a1b1c;
        obj[0] |= 1;
        if ((1u << (a2 & 0x1f)) & base[(0xc4 / 4) + (a2 >> 5)]) {
            u32 *bs = base + (0xc4 / 4);
            bs[a1 >> 5] |= 1u << (a1 & 0x1f);
            obj[0] |= 0x18;
        } else {
            Copy32((char *)data_021a2920 + a2 * 0x18, (char *)data_021a2920 + a1 * 0x18, 0x18);
            Copy32((char *)data_021a2920 + a2 * 0x18, obj + 4, 0x18);
        }
    } else {
        u32 *base = data_021a1b1c;
        obj[1] = src[0];
        obj[2] = src[1];
        obj[3] = src[2];
        if ((1u << (a2 & 0x1f)) & base[(0xc4 / 4) + (a2 >> 5)]) {
            Copy32(src, (char *)data_021a2920 + a1 * 0x18, 0x18);
            base = data_021a1b1c;
            { u32 *bs = base + (0xc4 / 4); bs[a1 >> 5] &= ~(1u << (a1 & 0x1f)); }
            obj[0] |= 0x18;
        } else {
            u32 *bs = base + (0xc4 / 4);
            int w = a1 * 6;
            int o2 = a2 * 6;
            bs[a1 >> 5] &= ~(1u << (a1 & 0x1f));
            data_021a2920[w] = (s32)(((s64)src[0] * data_021a2920[o2]) >> 12);
            data_021a2924[w] = (s32)(((s64)src[1] * data_021a2924[o2]) >> 12);
            data_021a2928[w] = (s32)(((s64)src[2] * data_021a2928[o2]) >> 12);
            data_021a292c[w] = (s32)(((s64)src[3] * data_021a292c[o2]) >> 12);
            data_021a2930[w] = (s32)(((s64)src[4] * data_021a2930[o2]) >> 12);
            data_021a2934[w] = (s32)(((s64)src[5] * data_021a2934[o2]) >> 12);
            Copy32(data_021a2920 + w, obj + 4, 0x18);
        }
    }
}
