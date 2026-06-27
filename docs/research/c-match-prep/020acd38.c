/* CAMPAIGN-PREP candidate for func_020acd38 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     clamp INT_MIN/MAX; ERANGE store; cond-move tail; signed-range branch ladder
 *   risk:       struct-guessed/permuter-class: the movne #INT_MIN / mvneq #INT_MIN cond-move pair at the error tail and the 0x80000000 boundary compares are hand-tuned; control-flow ladder (.L_948/.L_958/.L_97c) won't lower from this C identically, and stack-slot decl order is guessed.
 *   confidence: low
 */
extern int func_020ac46c(void *out, int b, void *p2, void *p3, void *p4, void *p5);
extern int func_020aabac(void);
extern int data_021aa460;

long func_020acd38(unsigned int base, int *endptr, char *s)
{
    int sign;
    unsigned int mag;
    int ov;
    int trail;
    int st[8];

    st[3] = (int)base;       /* sp+0xc */
    st[4] = 0;               /* sp+0x10 */

    func_020ac46c(&trail, 0x80000001,
                  (void *)&st[3],
                  (void *)&ov,
                  (void *)&mag,
                  (void *)&sign);

    if (endptr != 0)
        *endptr = (int)(base + (unsigned int)trail);

    if (ov == 0) {
        if (sign == 0) {
            if (mag > 0x7fffffffu)
                goto range_err;
        } else {
            if (mag <= 0x80000000u)
                goto ok;
        }
    }
range_err:
    if (sign != 0) {
        data_021aa460 = 0x22;
        return (long)0x80000000;   /* INT_MIN */
    }
    data_021aa460 = 0x22;
    return (long)0x7fffffff;       /* INT_MAX */
ok:
    if (sign != 0)
        return -(long)mag;
    return (long)mag;
}
