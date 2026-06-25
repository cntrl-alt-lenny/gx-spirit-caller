/* CAMPAIGN-PREP candidate for func_0207e840 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl s inside each branch (avoid hoisting f18); eor operand-order (f10>0)^f4; accumulator-first add c+(h<<3)
 *   risk:       orig reloads p->f18 once per branch into a reused reg; if mwcc hoists the load above the if, two ldr diverge. reshape-able: keep the local scoped inside each branch (done).
 *   confidence: med
 */
/* func_0207e840: eor-predicate select of element base, tail-call. */
typedef struct {
    unsigned short h0;   /* 0x0 */
    unsigned short h2;   /* 0x2 */
    char _pad04[0x8];    /* 0x4..0xb */
    int c;               /* 0xc */
} sub_t;

typedef struct {
    int   f0;            /* 0x0 */
    int   f4;            /* 0x4 */
    char  _pad08[0x4];   /* 0x8 */
    int   fc;            /* 0xc */
    int   f10;           /* 0x10 */
    char  _pad14[0x4];   /* 0x14 */
    sub_t *f18;          /* 0x18 */
} obj_t;

extern int func_0207e92c(obj_t *p);

int func_0207e840(obj_t *p) {
    sub_t *s;
    if ((p->f10 > 0) ^ p->f4) {
        s = p->f18;
        p->f0 = s->c + (s->h2 << 3);
    } else {
        s = p->f18;
        p->f0 = s->c + (s->h0 << 3) - 8;
    }
    p->fc = 0;
    return func_0207e92c(p);
}
