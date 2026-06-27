/* CAMPAIGN-PREP candidate for func_021ab564 (ov000, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     OFFSET-MEMBER row[idx], explicit RMW masks, reload after guard
 *   risk:       reshape-able: orig RELOADS [r3,#8] after the guarded bic; if mwcc CSE-caches the word across the if, the second ldr drops. Keep w8 as plain unsigned (not bound local) to force reload.
 *   confidence: low
 */
/* func_ov000_021ab564 (ov000, D) — stride-44 row [r0], word at +8.
 * lowbyte = (~arg1) & oldlowbyte; if(lowbyte!=0x3f) clear bit9; then RMW
 * the low byte = lowbyte and set bit8. Note the RELOAD of [r3,#8] after the
 * guarded bic — the low-byte write reads the word a SECOND time.
 *   field layout at +8: b0:8 low byte, bit8 (0x100), bit9 (0x200). */
struct Ov000Row { char pad0[8]; unsigned w8; char pad12[32]; };  /* stride 44 */
extern struct Ov000Row data_ov000_021c7530[];

void func_ov000_021ab564(int idx, int arg1) {
    struct Ov000Row *p = &data_ov000_021c7530[idx];
    unsigned v = (~arg1) & (p->w8 & 0xff);
    if (v != 0x3f) {
        p->w8 &= ~0x200u;
    }
    p->w8 = (p->w8 & ~0xffu) | (v & 0xff);
    p->w8 |= 0x100;
}
