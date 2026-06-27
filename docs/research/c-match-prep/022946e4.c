/* CAMPAIGN-PREP candidate for func_022946e4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     BIND attr once (single ldrh, r2 reused); explicit shifts; char[] bank; unsigned <0x14
 *   risk:       Bind-vs-reload: orig holds attr in r2 for BOTH f12 and flag0 extracts (one ldrh). If mwcc reloads card->u2 for the second extract, an extra ldrh diverges. reshape-able (bound local, as written)
 *   confidence: med
 */
/* func_ov002_022946e4 (ov002, D) - bitfield gate, then BOUND attr + bank-mul range predicate.
 * card@r0.  attr = ushort@+2 loaded ONCE (r2) and reused (bind, not reload).
 * f12 = ((unsigned)attr<<18)>>30 = bits[13:12] (mov lsl#0x12; movs lsr#0x1e).
 * if (f12 == 0) return func_02291160(card).   (bne skips the bl)
 * flag0 = ((unsigned)attr<<31)>>31, &1.  w = *(int*)(data_022cf17c + flag0*0x868).
 * return (w < 0x14) ? 1 : 0.   (unsigned movcc/movcs). */
extern char data_ov002_022cf17c[];
extern int  func_ov002_02291160(struct Obj *);
struct Obj { unsigned short u0; unsigned short u2; };

int func_ov002_022946e4(struct Obj *card) {
    unsigned attr = card->u2;
    if ((((unsigned)attr << 18) >> 30) == 0) return func_ov002_02291160(card);
    {
        unsigned flag0 = (((unsigned)attr << 31) >> 31) & 1;
        return *(unsigned *)(data_ov002_022cf17c + flag0 * 0x868) < 0x14 ? 1 : 0;
    }
}
