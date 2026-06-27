/* CAMPAIGN-PREP candidate for func_022214dc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order temps; cross-clamp held in r8; if-assign min; f6hi:8 bitfield for type byte
 *   risk:       permuter-class: 4 byte-temps ax/ay/bx/by + the r8-held first-clamp interleave; mwcc's reg-alloc/scheduling of which temp lands callee-saved across the 2nd 021c848c call likely rotates.
 *   confidence: low
 */
/* func_ov002_022214dc: if obj type-byte (h6 hi) == 2, fetch two packed coord
 * words via 0223de94, split lo/hi bytes, clamp X to 0xffff, emit two queue
 * commands (cross-clamped: first uses second word's clamp, vice versa). */

extern int func_ov002_021c848c(int a, int b);
extern int func_ov002_021d59cc(int a, int b, int c, int d, unsigned short e);
extern int func_ov002_0223de94(void *obj, int sel);
extern int func_ov002_0223df38(void *obj, int a, int b);

typedef struct Obj {
    unsigned short h0;          /* 0x00 */
    unsigned short f2b0 : 1;    /* 0x02 */
    unsigned short f2b1 : 5;
    unsigned short f2b6 : 6;
    unsigned short f2hi : 4;
    unsigned short f4b0 : 2;    /* 0x04 */
    unsigned short f4b2 : 1;
    unsigned short f4hi : 13;
    unsigned short f6lo : 8;    /* 0x06 */
    unsigned short f6hi : 8;    /* type byte */
} Obj;

int func_ov002_022214dc(void *obj) {
    Obj *o = (Obj *)obj;
    int a, b;
    int ax, ay, bx, by;
    int c0, c1;

    if (o->f6hi != 2) return 0;

    a = func_ov002_0223de94(obj, 0);
    b = func_ov002_0223de94(obj, 1);

    ay = ((unsigned short)a >> 8) & 0xff;
    bx = b & 0xff;
    by = ((unsigned short)b >> 8) & 0xff;
    ax = a & 0xff;

    if (func_ov002_0223df38(obj, 0, 0) == 0) return 0;
    if (func_ov002_0223df38(obj, 1, 0) == 0) return 0;

    c1 = func_ov002_021c848c(ax, ay);
    c0 = func_ov002_021c848c(bx, by);
    if (c0 > 0xffff) c0 = 0xffff;
    func_ov002_021d59cc(ax, ay, o->h0, 2, (unsigned short)c0);
    if (c1 > 0xffff) c1 = 0xffff;
    func_ov002_021d59cc(bx, by, o->h0, 2, (unsigned short)c1);
    return 0;
}
