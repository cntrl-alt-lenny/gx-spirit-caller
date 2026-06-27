/* CAMPAIGN-PREP candidate for func_021d1c80 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D bitfield: lsl;lsr shift-pairs (not masks); reuse new-word local vs reload
 *   risk:       permuter-class: f268 re-extracts the f284 WORD held in r0 (no ldr); if mwcc reloads f284 from memory, 1 extra ldr diverges. Chained <<20>>28<<28>>23 fusion order also fragile.
 *   confidence: low
 */
/* func_ov011_021d1c80: chained bitfield inserts on data_ov011_021d403c,
 * then two void calls, then a final low-byte insert.
 *  - f284 bits 8..11  = arg0 low nibble        (bic #0xf00 ; orr lsr#0x14)
 *  - f268 bits 5..8   = (new f284 >> 8) & 0xf   (re-extract from the WORD
 *                       still in a reg, NOT a reload)
 *  - f280 |= 0x200
 *  - calls, then f284 low byte = 2 (bic #0xff ; orr #2)
 * The shifts are written as lsl;lsr pairs so mwcc emits the orr-shifted
 * form (a plain mask would fold to `and`). */
extern char data_ov011_021d403c[];
extern void func_ov011_021cb218(void);
extern void func_ov011_021ceffc(void);

void func_ov011_021d1c80(unsigned int arg0) {
    unsigned int *s284 = (unsigned int *)(data_ov011_021d403c + 0x284);
    unsigned int *s268 = (unsigned int *)(data_ov011_021d403c + 0x268);
    unsigned int *s280 = (unsigned int *)(data_ov011_021d403c + 0x280);
    unsigned int v284 = (*s284 & ~0xf00u) | ((arg0 << 28) >> 20);
    *s284 = v284;
    *s268 = (*s268 & ~0x1e0u) | ((((v284 << 20) >> 28) << 28) >> 23);
    *s280 = *s280 | 0x200u;
    func_ov011_021cb218();
    func_ov011_021ceffc();
    {
        unsigned int *p = (unsigned int *)(data_ov011_021d403c + 0x284);
        *p = (*p & ~0xffu) | 0x2u;
    }
}
