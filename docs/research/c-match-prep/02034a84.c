/* CAMPAIGN-PREP candidate for func_02034a84 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind base reg across 2 mla; bitfield kept as &0xf mask; split range check
 *   risk:       VERIFIED: hot bit-packing body matches byte-for-byte. Cold >0xffff tail predicates (movcc/ldrls) vs orig's branch blocks (bcc/bls to shared .L_30). permuter-class (branch-vs-predicate); struct-guessed offsets
 *   confidence: high
 */
/* func_02034a84 (class D): resolve a packed card-handle. bit0x8000000 = already
 * resolved -> return as-is. <=0xffff: index global card table (stride 0xc) at
 * data_0219b2e0[+0x34], read low-nibble of byte+1, range-check vs +0x14/+0xa
 * counts, set bits 0x1000000/0x2000000(if def+7 bit0x80)/0x8000000, OR nibble<<0x14.
 * else: pointer-range path -> if in [data_0219b760,data_0219c408] return [r0+0x34] else 0. */

extern unsigned char data_0219b2e0[];   /* global header struct */
extern unsigned char data_0219b760[];   /* low ptr-range bound  */
extern unsigned char data_0219c408[];   /* high ptr-range bound */

struct Hdr {
    char _p[0x14];
    unsigned short n14;         /* 0x14 */
    char _q[0x6a - 0x16];
};

struct CardDef {
    unsigned char b0;           /* 0x00 */
    unsigned char b1;           /* 0x01 : low nibble = category */
    char _p[5];
    unsigned char b7;           /* 0x07 : bit0x80 flag */
    char _q[0xc - 8];
};

int func_02034a84(unsigned int h) {
    struct Hdr *hd;
    unsigned char *base;        /* card-def table base, held across two index ops */
    int nib;
    unsigned int idx;

    if (h & 0x8000000)
        return h;

    if (h <= 0xffff) {
        hd   = (struct Hdr *)data_0219b2e0;
        base = *(unsigned char **)(data_0219b2e0 + 0x34);
        nib  = ((struct CardDef *)(base + h * 0xc))->b1 & 0xf;
        if (h < hd->n14 && h >= *(unsigned short *)(data_0219b2e0 + 0xa)) {
            h |= 0x1000000;
            idx = (unsigned short)h;
            if (((struct CardDef *)(base + idx * 0xc))->b7 & 0x80)
                h |= 0x2000000;
        }
        h |= 0x8000000;
        return h | (nib << 0x14);
    }

    if (h < (unsigned int)data_0219b760)
        return 0;
    if (h <= (unsigned int)data_0219c408)
        return *(int *)(h + 0x34);
    return 0;
}
