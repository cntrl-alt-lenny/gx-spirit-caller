/* CAMPAIGN-PREP candidate for func_020acca0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     errno=ERANGE store; conditional endptr store; sign-negate tail; store-order stack slots
 *   risk:       struct-guessed: st[]/ov/mag/sign are stack-slot guesses (sp+0x14=ov, sp+0x18=sign, sp+0x1c=trail) and the magic r1=0x80000001 (sub lr,#-2147483647) plus r2=func_020aabac arg are reconstructed; slot decl-order to mwcc almost certainly differs. permuter-class.
 *   confidence: low
 */
extern int func_020ac46c(void *out, int b, void *p2, void *p3, void *p4, void *p5);
extern int func_020aabac(void);
extern int data_021aa460;

long func_020acca0(unsigned int base, int *endptr, char *s)
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

    if (ov != 0) {
        data_021aa460 = 0x22;
        return -1;
    }
    if (sign != 0)
        return -(long)mag;
    return (long)mag;
}
