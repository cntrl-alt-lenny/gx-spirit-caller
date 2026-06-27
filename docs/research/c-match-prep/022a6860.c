/* CAMPAIGN-PREP candidate for func_022a6860 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield :N extracts, ldrnesb guard as p&&*p, 2nd header from r4
 *   risk:       reshape-able(bitfield): p!=0 && *(signed char*)p!=0 must fold to cmp/ldrnesb/cmpne short-circuit; extracts are :N not masks. extra==rec aliasing guessed.
 *   confidence: med
 */
/* func_ov002_022a6860 (ov002, D) — unpack [r2+0] header, two dispatch calls.
 * r0=base(r7), r1=arg(r6), r2=rec(r5), r3=extra(r4). 022a6324(base,a,b,c); if it
 * returns p with *(signed char*)p != 0 -> 022a6500(base,arg,rec,extra); then
 * RELOAD header from [r4] (r3/extra, a halfword ptr), 022a6324 again; if nonzero
 * tail func_0229d2ec. Note 2nd ldrh is from r4 (extra), not r5. */
typedef unsigned short u16;
struct Hdr { u16 k0; u16 a : 1, b : 5, c : 8, : 2; };
extern signed char *func_ov002_022a6324(void *base, int i, int sel, int sub);
extern void func_ov002_022a6500(void *base, int arg, struct Hdr *rec, struct Hdr *extra);
extern void func_ov002_0229d2ec(void);

void func_ov002_022a6860(char *base, int arg, struct Hdr *rec, struct Hdr *extra) {
    signed char *p = func_ov002_022a6324(base, rec->k0 & 1, (rec->k0 >> 1) & 0x1f,
                                         (rec->k0 >> 6) & 0xff);
    if (p == 0 || *p == 0) return;
    func_ov002_022a6500(base, arg, rec, extra);
    if (func_ov002_022a6324(base, extra->k0 & 1, (extra->k0 >> 1) & 0x1f,
                            (extra->k0 >> 6) & 0xff) != 0)
        func_ov002_0229d2ec();
}
