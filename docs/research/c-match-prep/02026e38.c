/* CAMPAIGN-PREP candidate for func_02026e38 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: :4 bitfield at bit12; ternary set?0xf:0; dynamic-bit RMW order
 *   risk:       reshape-able: idx<0 path inserts via redundant <<16>>16 u16-extend before the <<28 bitfield-store; if mwcc skips that extend the insert sequence diverges. (also struct-guessed: 0x16a offset).
 *   confidence: med
 */
/* func_02026e38 (main, class D) - nibble bitfield insert/RMW into u16 at 0x16a.
 * field is bits 12..15 of the halfword at +0x16a (r0+0x100 then +0x6a; the
 * 0x100/0x6a split is forced because 0x16a > the ldrh #0xff imm range).
 * idx<0  -> nibble = set?0xf:0  (no read of old nibble)
 * idx>=0 -> nibble = set ? (old|(1<<idx)) : (old & ~(1<<idx)); insert back. */
typedef unsigned short u16;

typedef struct Obj26e38 {
    char _pad[0x16a];
    u16  _lo12:12, nib:4;   /* 0x16a: nibble field at bit 12 */
} Obj26e38;

int func_02026e38(Obj26e38 *p, int idx, int set) {
    int n;
    if (idx < 0) {
        n = set ? 0xf : 0;
    } else if (set) {
        n = p->nib | (1 << idx);
    } else {
        n = p->nib & ~(1 << idx);
    }
    p->nib = n;
    return 1;
}
