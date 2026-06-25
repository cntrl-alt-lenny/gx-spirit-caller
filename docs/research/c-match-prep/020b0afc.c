/* CAMPAIGN-PREP candidate for func_020b0afc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: a/b reload flag0; min via if-assign(lim); ip=i,lr=lim regs; 'a=b' moveq aliasing for tail
 *   risk:       permuter-class: the second loop reloads a->len each iter and the 'moveq r0,r1' selects which operand's tail to scan (lr==r4). mwcc may keep len in a reg or pick a different pointer, diverging the ldrb [.,#4] reload and the a=b select.
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

extern int func_020b0afc(struct Num *a, struct Num *b);

int func_020b0afc(struct Num *a, struct Num *b) {
    if (a->flag0 == 0)
        return b->flag0 == 0;
    if (b->flag0 == 0)
        return a->flag0 == 0;
    if (a->exp != b->exp)
        return 0;
    {
        int n = a->len;
        int bl = b->len;
        int i = 0;
        int lim = n;
        if (n > bl)
            lim = bl;
        if (lim > 0) {
            do {
                if (a->digits[i] != b->digits[i])
                    return 0;
                i++;
            } while (i < lim);
        }
        if (lim == n)
            a = b;
        while (i < (int)a->len) {
            if (a->digits[i] != 0)
                return 0;
            i++;
        }
        return 1;
    }
}
