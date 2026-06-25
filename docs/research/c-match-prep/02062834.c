/* CAMPAIGN-PREP candidate for func_02062834 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind p/a; asm-order loads; add p50+a0 base; byte==2 guards mirror store; struct fields
 *   risk:       orig RELOADS p->_0x50 (ldr r3 again) and a->_0 between the two calls rather than caching — if mwcc CSEs f50/a0 into one reg the ldr count drops. reshape-able only by forcing reload (re-read p->f50); else permuter-class on CSE.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02062834 (main, class C) — brief 496.
 * UNVERIFIED build-free draft. MED tier: byte-match not expected first build.
 *   recipe: bind r4=p,r5=a; loads in asm order; add-base p50+a0; cond store 0x8c after byte==2
 */
/* func_02062834: emit one record. With a 5-byte-padded length advance
 * (func_02064490 on the +0x50 sub-buffer, a->_0 + 5, halfword +0x66), test
 * placement via func_02062280(p, base + a->_0, a->_4); on success copy +0x88
 * into a->_c, and if the tag byte at base[a->_0 + 2] == 2 mirror +0x88 into
 * +0x8c. Returns 1, or 0 when placement fails. */

extern int func_02064490(void *buf, int len, int h);
extern int func_02062280(void *p, int off, int b);

typedef struct Obj {
    char           _pad_00[0x50];
    unsigned char *f50;            /* +0x50 base buffer */
    char           _pad54[0x66 - 0x54];
    unsigned short f66;            /* +0x66 */
    char           _pad68[0x88 - 0x68];
    int            f88;            /* +0x88 */
    int            f8c;            /* +0x8c */
} Obj;

typedef struct Arg { int a0; int a4; int a8; int ac; } Arg;

int func_02062834(Obj *p, Arg *a) {
    func_02064490(p->f50, a->a0 + 5, p->f66);
    if (func_02062280(p, (int)p->f50 + a->a0, a->a4) == 0)
        return 0;
    a->ac = p->f88;
    if (p->f50[a->a0 + 2] == 2)
        p->f8c = p->f88;
    return 1;
}
