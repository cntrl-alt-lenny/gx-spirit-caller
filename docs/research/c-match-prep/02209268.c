/* CAMPAIGN-PREP candidate for func_02209268 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     movs r4 binds a in callee reg; 021bc8c8 r1=r0=p dup; cmp a,(c+d) movle
 *   risk:       permuter-class: orig holds a in callee-saved r4 across 4 calls (movs r4,r0). mwcc must pick r4 for a; if it spills or rotates the callee regs the prologue regset and a-liveness diverge.
 *   confidence: low
 */
/* func_ov002_02209268 (ov002, class D, MED). Packed halfword at +0x2.
 * a=021b9bd4(p,b5) (early, kept in callee r4); guards 021ca2b8(p),021ca3f0(p,0x1813),
 * 021bc8c8(p,p,b5); c=021ff2b8(self,p); d=021bc288(p,b5); return a <= c+d. */
typedef unsigned short u16;

struct Self02209268 {
    u16 f0;                                                /* +0x0 */
    struct { u16 p : 1; u16 b5 : 5; u16 b6 : 6; u16 _t : 4; } f2; /* +0x2 */
};

extern int func_ov002_021b9bd4(int p, int b5);
extern int func_ov002_021ca2b8(int p);
extern int func_ov002_021ca3f0(int p, int code);
extern int func_ov002_021bc8c8(int p, int p2, int b5);
extern int func_ov002_021ff2b8(struct Self02209268 *self, int p);
extern int func_ov002_021bc288(int p, int b5);

int func_ov002_02209268(struct Self02209268 *self) {
    int a, c, d;
    a = func_ov002_021b9bd4(self->f2.p, self->f2.b5);
    if (a == 0) return 0;
    if (func_ov002_021ca2b8(self->f2.p) == 0) return 0;
    if (func_ov002_021ca3f0(self->f2.p, 0x1813) == 0) return 0;
    if (func_ov002_021bc8c8(self->f2.p, self->f2.p, self->f2.b5) == 0) return 0;
    c = func_ov002_021ff2b8(self, self->f2.p);
    d = func_ov002_021bc288(self->f2.p, self->f2.b5);
    return a <= c + d;
}
