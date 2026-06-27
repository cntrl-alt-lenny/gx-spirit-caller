/* CAMPAIGN-PREP candidate for func_02081c84 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: lsl#f;lsr#10 bitfield halves; mla index in loop; field store
 *   risk:       struct-guessed: the `mla lr,r3,r2,base` 2D index and `[r3+4]`/`[r3+0x1c]` chain are reconstructed indexing; offsets and the slot-deref shape are inferred and likely need real-struct confirmation before the mla matches.
 *   confidence: low
 */
/* func_02081c84: walks an indexed table (mla stride) writing a packed 16-bit
 * field per element of a byte list. r0=base, r1=hdr(+0 u16 ofs, +2 u8 count,
 * +3 flags), r2=obj(+0x2c word), r3=pair(+0 u16, +2 u16 mask&1 selects half).
 * The `mla r,a,b,c` arises from tab[idx + stride*k] byte indexing. */

struct hdr {
    unsigned short ofs;   /* +0x0 */
    unsigned char  count; /* +0x2 */
    unsigned char  flags; /* +0x3 */
};

int func_02081c84(unsigned char *base, struct hdr *h, unsigned char *obj, unsigned short *pair)
{
    unsigned int a = *(unsigned int *)(obj + 0x2c);
    unsigned int hi = (unsigned short)(a << 0x10 >> 0x10);
    unsigned short lo = pair[0];
    unsigned char *list = base + h->ofs;
    unsigned int field;
    unsigned int i;

    if (pair[1] & 1) {
        /* full 16-bit width */
    } else {
        hi = (unsigned short)((hi << 0xf) >> 0x10);
        lo = (unsigned short)((lo << 0xf) >> 0x10);
    }

    field = (unsigned short)((lo + hi) << 0x10 >> 0x10);

    for (i = 0; i < h->count; i++) {
        unsigned short k = *(unsigned short *)(base + 0xa);
        unsigned char  e = list[i];
        unsigned char *t = base + 4 + k;
        unsigned short stride = *(unsigned short *)t;
        int *slot = *(int **)(t + stride * e + 0x4);
        *(unsigned short *)((unsigned char *)slot + (int)base + 0x1c) = field;
    }

    h->flags |= 1;
    return 0;
}
