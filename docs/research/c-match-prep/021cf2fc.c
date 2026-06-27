/* CAMPAIGN-PREP candidate for func_021cf2fc (ov011, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield :N inserts (lsl;lsr) + re-fetch base each call (no bind)
 *   risk:       orig holds p1/p2/p3 in callee-saved r6/r5/r4 across 3 calls; mwcc may rotate which callee reg each param gets -> register-permutation. permuter-class
 *   confidence: med
 */
/* func_ov011_021cf2fc: three accessor re-fetches via func_02018b94(); each
 * returns &substruct, into which we bitfield-insert one packed param.
 *  [+0x14] .b0:8  = p1 & 0xff
 *  [+0x1c] .f16:5 = p2 & 0x1f  (lsl#0x1b;lsr#0xb -> 5-bit field at bit16)
 *  [+0x1c] .f8:8  = p3 & 0xff  (lsl#0x18;lsr#0x10 -> 8-bit field at bit8)
 * Orig keeps p1/p2/p3 in callee-saved r6/r5/r4 across the 3 bl's. */
extern char *func_02018b94(void);

typedef struct {
    char  _pad00[0x14];
    unsigned int b0 : 8;        /* +0x14 bit0 */
    char  _pad15[0x1c - 0x18];
    unsigned int      : 8;      /* +0x1c bits0..7  */
    unsigned int f8   : 8;      /* +0x1c bits8..15 */
    unsigned int f16  : 5;      /* +0x1c bits16..20 */
} Ov011Cf2;

void func_ov011_021cf2fc(int p1, int p2, int p3) {
    ((Ov011Cf2 *)func_02018b94())->b0  = (unsigned int)p1;
    ((Ov011Cf2 *)func_02018b94())->f16 = (unsigned int)p2;
    ((Ov011Cf2 *)func_02018b94())->f8  = (unsigned int)p3;
}
