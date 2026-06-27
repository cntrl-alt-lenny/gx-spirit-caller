/* CAMPAIGN-PREP candidate for func_020874c4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early-return guards; 1<<p->bit then ands; cond-store f8=0 via if-else not ternary
 *   risk:       the final ands/movne/moveq/streq pattern: orig keeps the mask in r0 and does streq inside the test. mwcc may emit the store outside the conditional (extra branch). reshape-able (the if-else shown mirrors movne/moveq+streq).
 *   confidence: med
 */
/* func_020874c4: guard chain + 1<<bit mask test, conditional clear of f8.
 * func_02095554 returns int (wrap-cmp), func_02095cfc returns the live mask. */

typedef struct {
    int bit;     /* +0x0 shift amount */
    char _pad_4[0x4];
    int f8;      /* +0x8 */
    int fc;      /* +0xc */
    int f10;     /* +0x10 */
} guard_t;

extern int func_02095554(unsigned int arg);
extern int func_02095cfc(void);

int func_020874c4(guard_t *p) {
    int m;
    if (p->f8 == 0) return 0;
    if (p->fc == 0) {
        if (func_02095554(p->f10) == 0) return 1;
        p->fc = 1;
    }
    m = func_02095cfc();
    if ((1 << p->bit) & m) return 1;
    p->f8 = 0;
    return 0;
}
