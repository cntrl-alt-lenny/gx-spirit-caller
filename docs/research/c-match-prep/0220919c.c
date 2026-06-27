/* CAMPAIGN-PREP candidate for func_0220919c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     1-p arg via rsb; reload p per call; cmp a,(b+1) => signed movle if-assign
 *   risk:       reshape-able: orig calls 021bbf50(1-p) twice (guard then stored a); if mwcc hoists/CSEs the call or the 1-p rsb the second-call block diverges. cmp r4(a),r0(b+1) fixes operand order.
 *   confidence: med
 */
/* func_ov002_0220919c (ov002, class D, MED). Packed halfword at +0x2.
 * guards 021c23ac(p,b5),021ca2b8(p),021ca3f0(p,0x1815),021bbf50(1-p);
 * a=021bbf50(1-p); b=021bc618(p); return a <= b+1. */
typedef unsigned short u16;

struct Self0220919c {
    u16 f0;                                                /* +0x0 */
    struct { u16 p : 1; u16 b5 : 5; u16 b6 : 6; u16 _t : 4; } f2; /* +0x2 */
};

extern int func_ov002_021c23ac(int p, int b5);
extern int func_ov002_021ca2b8(int p);
extern int func_ov002_021ca3f0(int p, int code);
extern int func_ov002_021bbf50(int q);
extern int func_ov002_021bc618(int p);

int func_ov002_0220919c(struct Self0220919c *self) {
    int a, b;
    if (func_ov002_021c23ac(self->f2.p, self->f2.b5) == 0) return 0;
    if (func_ov002_021ca2b8(self->f2.p) == 0) return 0;
    if (func_ov002_021ca3f0(self->f2.p, 0x1815) == 0) return 0;
    if (func_ov002_021bbf50(1 - self->f2.p) == 0) return 0;
    a = func_ov002_021bbf50(1 - self->f2.p);
    b = func_ov002_021bc618(self->f2.p);
    return a <= b + 1;
}
