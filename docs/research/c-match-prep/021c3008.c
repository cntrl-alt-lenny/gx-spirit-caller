/* CAMPAIGN-PREP candidate for func_021c3008 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     explicit shifts rebuild key (e>>6&0xff)*2+(e>>13&1); guard-and bne short-circuit; reload rec+0x14 per iter
 *   risk:       permuter-class: key reconstruction threads e through r0/r1/ip then `add r3,r3,ip,lsr#0x1f` fusion; mwcc may not fuse the *2 + bit13 into one add+lsr#31, and the 5 live regs (parity/tag/i/n/ptr) across the call are alloc-order sensitive.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c3008 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe:     id(13b)==tag && bit21==0 gate; rebuild key=((e>>6)&0xff)*2 + ((e>>13)&1); call021b3fd8; if==0 count++
 * func_021c3008(parity, tag): over rec[0x14] entries at rec+0x418; for matches
 * (.id==tag, bit21 clear) compute packed key and call func_021b3fd8(parity, 11,
 * tag, key); if it returns 0, count++. parity(=r0/sl), tag(=r1/r9) held live. */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int  func_ov002_021b3fd8(int parity, int b, int tag, int key);

int func_ov002_021c3008(int parity, int tag) {
    int off = (parity & 1) * 0x868;
    int count = 0;
    if (*(int *)(data_ov002_022cf180 + off) != 0) {
        char *rec = data_ov002_022cf16c + off;
        unsigned int *p = (unsigned int *)(rec + 0x18 + 0x400);
        int i = 0;
        do {
            unsigned int e = *p;
            if ((int)((e << 19) >> 19) == tag && ((e << 10) >> 31) == 0) {
                int key = (int)(((e << 2) >> 24) << 1) + (int)((e << 18) >> 31);
                if (func_ov002_021b3fd8(parity, 11, tag, key) == 0) count++;
            }
            i++;
            p++;
        } while (i < *(int *)(rec + 0x14));
        return count;
    }
    return count;
}
