/* CAMPAIGN-PREP candidate for func_02081988 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C/D: boolean-normalize each guard to !!(...) (movne1/moveq0); nested && short-circuit; LIT0 is a tag compare
 *   risk:       struct-guessed: ASM is TRUNCATED at `cmp r0,#0` after 0207e7d8 — the whole tail (sel/r4 + arg1/r5 usage) and sel's else-value are unknown; _LIT0 constant addr missing. Reconstruct from full asm before trusting.
 *   confidence: low
 */
/* func_02081988: gate predicate then dispatch. pred(p) = p && p->f0 == LIT0
 * (a type/vtable tag) && (u16)p->h6 >= thresh, normalized to 0/1. If pred(,0x100)
 * -> sel=0; else if pred(,1) -> sel=1; else func_02093bfc(). Then func_02081898(p)
 * and func_0207e7d8(p). ASM IS TRUNCATED after the 0207e7d8 call/cmp — tail guessed. */
extern int  func_02093bfc(void);
extern void func_02081898(void *p);
extern int  func_0207e7d8(void *p);
extern int  data_0208XXXX_LIT0;   /* _LIT0 tag constant (addr not in extern list) */

typedef struct {
    int            f0;   /* +0x00 tag */
    unsigned char  pad4[2];
    unsigned short h6;   /* +0x06 */
} Obj;

static int pred(Obj *p, int thresh) {
    int ok = 0;
    if (p != 0 && p->f0 == (int)&data_0208XXXX_LIT0) ok = 1;
    if (ok) {
        int ok2 = 0;
        if (p != 0 && (unsigned int)p->h6 >= (unsigned int)thresh) ok2 = 1;
        return ok2 ? 1 : 0;
    }
    return 0;
}

void func_02081988(Obj *p, void *arg1) {
    int sel;
    if (pred(p, 0x100)) {
        sel = 0;
    } else if (pred(p, 1)) {
        sel = 1;
    } else {
        func_02093bfc();
        sel = 0;
    }
    (void)sel;
    func_02081898(p);
    func_0207e7d8(p);
    /* truncated: original continues past `cmp r0,#0` using sel(r4) and arg1(r5) */
}
