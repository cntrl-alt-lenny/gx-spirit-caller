/* CAMPAIGN-PREP candidate for func_020384e8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     post-inc ptr walk + conditional ip+=0x40; (u16)[lim&0x1f] folds to lsl#1b;lsr#1a; do-while sum
 *   risk:       VERIFIED: post-inc scan, (lim&0x1f) -> lsl#27/lsr#26 fold, do-while sum all match target structure. Residual = register ASSIGNMENT in sum loop (count r3 vs orig r1). permuter-class (reg-naming)
 *   confidence: med
 */
/* func_020384e8 (class D): limit r0, mode r1. list = data_0219b2e0[+0x4c];
 * if NULL return -1. lim = (u16)limit. Walk records: ptr starts at list, each
 * step reads word *ptr++ ; counter += 0x20 ; if counter>=lim stop ; if that
 * word>=0 skip the rest of the record (ptr += 0x40). At stop: if word<0 return
 * -1. mode!=0: idx=(lim & 0x1f) (emitted (lim<<0x1b)>>0x1a as a u16 elem), read
 * u16 ptr[idx]; if ==0xffff return -1 else return it. mode==0: sum all u16
 * ptr[k] (k=0..(lim&0x1f)-1) that != 0xffff, return word + sum. */

extern unsigned char data_0219b2e0[];

int func_020384e8(int limit, int mode) {
    unsigned char *ip;          /* record/word cursor */
    int lim;                    /* (u16)limit */
    int counter;
    int word;
    unsigned char *halfs;       /* ip after the scan, viewed as u16[] base */
    int n, k;
    int sum;

    ip = *(unsigned char **)(data_0219b2e0 + 0x4c);
    if (ip == 0)
        return -1;

    lim = (unsigned short)limit;
    counter = 0;
    for (;;) {
        counter += 0x20;
        word = *(int *)ip;
        ip += 4;
        if (counter >= lim)
            break;
        if (word >= 0)
            ip += 0x40;
    }

    if (word < 0)
        return -1;

    halfs = ip;
    if (mode != 0) {
        int v = ((unsigned short *)halfs)[lim & 0x1f];  /* see risk: lsl#1b;lsr#1a fold */
        if (v == 0xffff)
            return 0xffff - 0x10000;
        return v;
    }

    sum = 0;
    n = lim & 0x1f;
    k = 0;
    do {
        int v = ((unsigned short *)halfs)[k];
        k++;
        if (v != 0xffff)
            sum += v;
    } while (k < n);
    return word + sum;
}
