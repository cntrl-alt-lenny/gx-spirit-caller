/* CAMPAIGN-PREP candidate for func_0206d360 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind pr to r6; load n14/n1c first (decl-order na,nb); if-assign clamp; reload p10/n14 after call
 *   risk:       reshape-able: orig RELOADS [r6,#0x10]/[r6,#0x14] after func_02094688 (post-call reload) — if mwcc binds them across the call, 2 ldr vanish; flip by re-deref. struct-guessed.
 *   confidence: med
 */
/* func_0206d360 @ main : class C (two clamp+memcpy blocks, struct-base bind) */
typedef struct Pair Pair;
struct Pair {
    char pad00[0x10];
    void *p10;   /* 0x10 dst A */
    int   n14;   /* 0x14 remaining A */
    void *p18;   /* 0x18 dst B */
    int   n1c;   /* 0x1c remaining B */
};

extern void func_02094688(void *dst, const void *src, int n);

int func_0206d360(const void *src, int total, Pair *pr)
{
    int na;
    int nb;

    na = pr->n14;
    nb = pr->n1c;
    if (na > total) {
        na = total;
        nb = 0;
    } else {
        int rest = total - na;
        if (nb > rest) {
            nb = rest;
        }
    }
    if (na > 0) {
        func_02094688(pr->p10, src, na);
        pr->p10 = (char *)pr->p10 + na;
        pr->n14 -= na;
    }
    if (nb > 0) {
        func_02094688(pr->p18, (const char *)src + na, nb);
        pr->p18 = (char *)pr->p18 + nb;
        pr->n1c -= nb;
    }
    return na + nb;
}
