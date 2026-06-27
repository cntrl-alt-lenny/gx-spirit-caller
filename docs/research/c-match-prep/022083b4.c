/* CAMPAIGN-PREP candidate for func_022083b4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield :N for every lsl;lsr; converging-paths to single tail; flag0 on both objs
 *   risk:       Two-path merge on func_0202e234: mwcc may duplicate the func_021b6418 tail per branch instead of falling through to one L78. reshape-able (lift tail after the if).
 *   confidence: med
 */
/* func_ov002_022083b4 (ov002, D) — card/effect predicate over two objects.
 * card (r5/arg0) and other (r4/arg1) share the +0x2 ushort bitfield layout
 * (bit0 = flag0); other also uses bit12 w2 (f12); card uses +0x4 field (bit6,w9).
 * Both control paths converge on L78: return (func_021b6418(other) & 2) != 0.
 * Guards return 0. flag0 read on BOTH objects; bitfields drive every lsl;lsr. */
struct Obj {
    unsigned short u0;                              /* +0x0 */
    unsigned short flag0 : 1, : 11, f12 : 2, : 2;   /* +0x2 */
    unsigned short : 6, f4 : 9, : 1;                /* +0x4 */
};

extern int func_ov002_021ca5bc(int);
extern int func_0202e234(int);
extern int func_ov002_021b6418(struct Obj *);

int func_ov002_022083b4(struct Obj *card, struct Obj *other) {
    if (!func_ov002_021ca5bc(card->f4)) return 0;
    if (other == 0) return 0;
    if (other->flag0 == card->flag0) return 0;
    if (!func_0202e234(other->u0)) {
        if (other->f12 != 0) return 0;
    }
    return (func_ov002_021b6418(other) & 2) != 0;
}
