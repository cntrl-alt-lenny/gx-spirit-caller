/* CAMPAIGN-PREP candidate for func_02001ddc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: store-order + three :N inserts; f_20 split into two RMW writes
 *   risk:       reshape-able-but-fragile: 7 ordered stores with two writes to f_20. Risk = mwcc reordering independent stores or coalescing the two f_20 RMWs. struct-guessed: the 0x24 gap between f_20(.w*) and f_28 plus all offsets inferred from .s.
 *   confidence: med
 */
/* func_02001ddc: full-word stores interleaved with three bitfield inserts.
 * Decoded windows (mask 0xfe00ffff clears bits 16..24):
 *   f_28 = a1;
 *   f_1c bits16..24 = a3 & 0x1ff   (:9 at bit 16)
 *   f_c  = a4;
 *   f_20 bits 9..17 = a4 & 0x1ff   (:9 at bit 9)
 *   f_2c = a2;
 *   f_20 bits18..21 = a5 & 0xf     (:4 at bit 18, separate RMW reload)
 *   f_30 = a6;
 * Class D store-order: emit in this EXACT sequence. f_20 is touched twice
 * (two distinct :N windows) -> two separate field assignments, matching the
 * orig's reload `ldr r2,[r0,#0x20]` before the second insert. a3=r3, a4..a6
 * are stack params [sp],[sp+4],[sp+8]. */

typedef struct {
    char         _pad0[0xc];
    unsigned int f_c;       /* +0x0c */
    char         _pad1[0xc];
    struct {                /* +0x1c */
        unsigned int      : 16;
        unsigned int w9   : 9;  /* bits 16..24 */
        unsigned int      : 7;
    } f_1c;
    struct {                /* +0x20 */
        unsigned int      : 9;
        unsigned int w9   : 9;  /* bits 9..17  */
        unsigned int w4   : 4;  /* bits 18..21 */
        unsigned int      : 10;
    } f_20;
    unsigned int f_28;      /* +0x28 (pad fills 0x24) */
    unsigned int f_2c;      /* +0x2c */
    unsigned int f_30;      /* +0x30 */
} obj_t;

void func_02001ddc(obj_t *p, unsigned int a1, unsigned int a2,
                   unsigned int a3, unsigned int a4, unsigned int a5,
                   unsigned int a6) {
    p->f_28    = a1;
    p->f_1c.w9 = a3;
    p->f_c     = a4;
    p->f_20.w9 = a4;
    p->f_2c    = a2;
    p->f_20.w4 = a5;
    p->f_30    = a6;
}
