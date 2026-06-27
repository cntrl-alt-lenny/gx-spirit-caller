/* CAMPAIGN-PREP candidate for func_022a6324 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     divmod/mla strides as plain *, branch order follows jump-table cases
 *   risk:       permuter-class: addls pc,pc,ip jump-table vs C switch — mwcc may emit a cmp-chain not the pc-relative table; case ordering/labels likely reorder.
 *   confidence: low
 */
/* func_ov002_022a6324 (ov002, D) — category-dispatch pointer getter.
 * r0=base, r1=i, r2=sel, r3=sub. Returns &base->...[...] computed by a small
 * mla index machine; sel 0xb..0xf jump-tabled (addls pc,pc,ip,lsl#2), sel<0xb
 * falls through. Case 0xb tail-calls func_0229da60. Guards return 0.
 * Strides 0xb0/0x2c/0xcc/0xdc/0x14/0x64 are the on-disk record sizes. */
extern void *func_ov002_0229da60(void *p, int sub);

void *func_ov002_022a6324(char *base, int i, int sel, int sub) {
    unsigned ip = (unsigned)(sel - 0xb);
    if (ip <= 4) {
        if (ip == 0)                 /* sel == 0xb */
            return func_ov002_0229da60(base + 0x3e0 + i * 0xcc, sub);
        /* sel 0xc..0xf */
        if (sel < 0xc) return (void *)0;
        return base + 0x280 + i * 0xb0 + (sel - 0xc) * 0x2c;
    }
    {
        int t = sel + sub;
        if ((unsigned)t <= 0xa)
            return base + i * 0xdc + t * 0x14;
        if ((unsigned)sel > 4) return (void *)0;
        return base + 0x1b8 + i * 0x64 + sel * 0x14;
    }
}
