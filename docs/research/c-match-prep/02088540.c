/* CAMPAIGN-PREP candidate for func_02088540 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     double-read src[i] (store then reload for shift); mask|=1<<b; ip-index; if-then-do-while; strne f48 then f44
 *   risk:       Orig reads src[i] TWICE (ldrb r3 for store, ldrb r0 for shift). If mwcc CSEs the load into one reg, the second ldrb vanishes -> diverge. reshape-able (write src[i] both places, separate from the stored copy, as here).
 *   confidence: med
 */
/* func_02088540 (main, class C/D). byte-copy loop building shifted mask.
 * r5=count(arg1), r4=0 mask, r6=arg0, ip=i. if(count<=0) skip loop.
 * loop: b = src[i]; (arg0)[i+0x4c] = b; b2 = src[i] (RELOAD); i++;
 *       mask |= 1<<b2;   (orr r4,r4,#1<<r0)
 * after: if (func_020873fc(mask)==0) return 0;
 *        arg0[0x48]=count; arg0[0x44]=mask; return 1.
 * src is arg2 (r2, never moved).
 */

struct S88540 {
    char _pad00[0x44];
    int  f44;                 /* +0x44 mask */
    int  f48;                 /* +0x48 count */
    /* +0x4c byte array */
};

extern int func_020873fc(int mask);

int func_02088540(struct S88540 *s, int count, unsigned char *src) {
    int mask = 0;
    int i = 0;
    if (count > 0) {
        do {
            unsigned char b = src[i];
            *((unsigned char *)s + i + 0x4c) = b;
            mask |= 1 << src[i];
            i++;
        } while (i < count);
    }
    if (func_020873fc(mask) == 0) return 0;
    s->f48 = count;
    s->f44 = mask;
    return 1;
}
