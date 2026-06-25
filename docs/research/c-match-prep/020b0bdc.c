/* CAMPAIGN-PREP candidate for func_020b0bdc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: clone of 0afc but ordering (<,>) compares; r5=a.len r4=b.len; cmp av,bv with movcc both ways
 *   risk:       permuter-class: 4-reg push {r3,r4,r5,lr} vs sibling's 2-reg means mwcc must spill a.len/b.len to r5/r4; the av<bv / av>bv double-movcc and exp< tail-compare are scheduling coin-flips a C reshape won't pin.
 *   confidence: med
 */
typedef unsigned char u8;
typedef signed short s16;

struct Num {
    u8  flag0;    /* 0x0 */
    u8  pad1;
    s16 exp;      /* 0x2 */
    u8  len;      /* 0x4 */
    u8  digits[1];/* 0x5 */
};

extern int func_020b0bdc(struct Num *a, struct Num *b);

int func_020b0bdc(struct Num *a, struct Num *b) {
    if (a->flag0 == 0)
        return b->flag0 != 0;
    if (b->flag0 == 0)
        return 0;
    if (a->exp != b->exp)
        return a->exp < b->exp;
    {
        int n = a->len;
        int bl = b->len;
        int i = 0;
        int lim = n;
        if (n > bl)
            lim = bl;
        if (lim > 0) {
            do {
                u8 av = a->digits[i];
                u8 bv = b->digits[i];
                if (av < bv)
                    return 1;
                if (av > bv)
                    return 0;
                i++;
            } while (i < lim);
        }
        if (lim == n) {
            while (i < bl) {
                if (b->digits[i] != 0)
                    return 1;
                i++;
            }
        }
        return 0;
    }
}
