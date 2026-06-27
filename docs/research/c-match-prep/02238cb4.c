/* CAMPAIGN-PREP candidate for func_02238cb4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     clone-guard with {r3,r4,r5} frame; bind bank/row; call 021de9d4(p,bank,row) reuses live locals; return 0
 *   risk:       permuter-class: register coloring — orig spreads bit0/f1/products across r1/r2/r3/r4/r5/ip/lr differently from the 4-reg clones; the f9-compare reg permutation (r4/r5/lr) may not yield to a C reshape even with decl-order set.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02238cb4 (ov002, class D, MED tier) — brief 494.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 *   recipe:  same guard as 02237ca4; single call func_021de9d4(obj,bank,row)
 *            reuses the live bitfield locals as args (no explicit arg setup); ret 0.
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct ObjHdr {
    u16 f0;
    u16 b0 : 1; u16 f1 : 5; u16 : 6; u16 hi2 : 2;
    u16 : 6; u16 f9 : 9; u16 : 1;
};
struct Row16 { u32 : 13; u32 b13 : 1; u32 : 8; u32 hi8 : 8; u32 : 2; };

extern char data_ov002_022cf16c[];
extern u16  data_ov002_022cf1a4[];
extern int  func_ov002_021de9d4(struct ObjHdr *p, int bank, int row);

int func_ov002_02238cb4(struct ObjHdr *p) {
    int bank = p->b0;
    int row  = p->f1;
    struct Row16 *r = (struct Row16 *)(data_ov002_022cf16c + bank * 0x868 + 0x30 + row * 0x14);
    if (p->f9 != (u32)((r->hi8 << 1) + r->b13))
        return 0;
    if (*(u16 *)((char *)data_ov002_022cf1a4 + bank * 0x868 + row * 0x14) == 0)
        return 0;
    func_ov002_021de9d4(p, bank, row);
    return 0;
}
