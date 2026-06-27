/* CAMPAIGN-PREP candidate for func_02207450 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D bind/reload: re-read c->f2 each call (orig reloads ldrh thrice), pointer bound
 *   risk:       reshape-able: if mwcc CSEs c->f2/bit0 into one reg across the three calls, 3 ldrh collapse to 1 and diverge; re-reading the member per call is the lever (flip to bind only if it over-reloads).
 *   confidence: med
 */
/* func_ov002_02207450 (ov002, cls D): bitfield gate then guard-chain of three
 * IDENTICAL calls. Entity *r0 bound in r4. type6=bits[11:6] of u16@+2; ==0x23 ->1.
 * Else call func_021bb90c(bit0, key) for keys 0x1681,0x16b3,0x16b4; any zero ->0,
 * all nonzero ->1. CRITICAL: asm RELOADS [r4+2] (ldrh) before EACH call and
 * recomputes bit0 — only the pointer is bound, not the field. Re-read c->f2 per
 * call to reproduce the three ldrh. */
struct Ent { char _0[2]; unsigned short f2; };
extern int func_ov002_021bb90c(int bit0, int key);

int func_ov002_02207450(struct Ent *c) {
    if (((c->f2 << 0x14) >> 0x1a) == 0x23)
        return 1;
    if (func_ov002_021bb90c((c->f2 << 0x1f) >> 0x1f, 0x1681) == 0)
        return 0;
    if (func_ov002_021bb90c((c->f2 << 0x1f) >> 0x1f, 0x16b3) == 0)
        return 0;
    if (func_ov002_021bb90c((c->f2 << 0x1f) >> 0x1f, 0x16b4) == 0)
        return 0;
    return 1;
}
