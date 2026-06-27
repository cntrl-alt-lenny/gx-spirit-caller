/* CAMPAIGN-PREP candidate for func_0207d37c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D :1 bitfield; clear-then-set (two stores w/ reload); return old bit zero-ext
 *   risk:       reshape-able: mwcc may fold the clear+set into one mask op instead of the two separate strh; if so, model as explicit `f&=~1; f|=(v&1);` (already done) — residual risk is order of `and r0,r3,#1` (old) being scheduled before vs after the store.
 *   confidence: med
 */
/* func_0207d37c (main, class D, 0x30) — halfword :1 bitfield insert.
 * Field is a u16 at obj+0x24+0x12 (=+0x36). Bit 0 is a 1-bit flag set from
 * arg r1. The asm clears bit0 (bic #1, store), then re-reads, captures the
 * OLD bit0, ORs in the new bit, stores; the captured old bit0 is returned
 * zero-extended (lsl#16;lsr#16). So: read old, write new, return old.
 */
typedef struct Inner_37c {
    char           _pad[0x12];
    unsigned short flag;     /* +0x24+0x12 ; bit0 = the :1 field */
} Inner_37c;

typedef struct Obj_37c {
    char           _pad24[0x24];
    Inner_37c      in;       /* +0x24 */
} Obj_37c;

unsigned int func_0207d37c(Obj_37c *obj, unsigned int v) {
    unsigned short old = obj->in.flag;
    obj->in.flag = (unsigned short)(old & ~1u);
    obj->in.flag = (unsigned short)((obj->in.flag) | (v & 1u));
    return (unsigned short)(old & 1u);
}
