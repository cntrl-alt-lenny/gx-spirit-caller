/* CAMPAIGN-PREP candidate for func_020b06dc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: leaf; ldrsb signed char loads; i pre-decl; subtract 0x30; mirror the 0/<5/==5 ladder
 *   risk:       reshape-able: the trailing label structure (the ==5 rounding ladder with the trailing-zero scan and parity test) may emit branches in a different order; tweak by hoisting *s reloads and matching the bgt/blt split. Also exp store-before-flag0 order.
 *   confidence: low
 */
typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;

struct Num {
    u8  flag0;    /* 0x0 */
    u8  pad1;
    s16 exp;      /* 0x2 */
    u8  len;      /* 0x4 */
    u8  digits[1];/* 0x5 */
};

extern void func_020b03fc(struct Num *p, int len);

extern void func_020b06dc(struct Num *p, const char *s, int exp);

void func_020b06dc(struct Num *p, const char *s, int exp) {
    int i = 0;
    p->exp = (s16)exp;
    p->flag0 = 0;
    while (i < 0x20 && (s8)*s != 0) {
        s8 c = (s8)*s++;
        p->digits[i] = (u8)(c - 0x30);
        i++;
    }
    p->len = (u8)i;
    if ((s8)*s == 0)
        return;
    if ((s8)*s < 5)
        return;
    if ((s8)*s <= 5) {
        s8 c2 = (s8)s[1];
        s++;
        if (c2 != 0) {
            while (c2 == 0x30) {
                c2 = (s8)*++s;
                if (c2 == 0)
                    goto chk;
            }
            goto round;
        }
    chk:;
        {
            u8 last = p->digits[i - 1];
            if ((last & 1) == 0)
                return;
        }
    }
round:
    func_020b03fc(p, p->len);
}
