/* CAMPAIGN-PREP candidate for func_02237d60 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     clone-guard; bind bank/row once (reused as args); explicit (…,0,0) tail; return 0 not call result
 *   risk:       reshape-able: orig reuses leftover bit0(r0)/f1(r1) AS call args 0/1 then zeros r2/r3; if mwcc recomputes bank/row at the call instead of keeping them live, 2 extra extracts appear. decl bank/row first.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02237d60 (ov002, class D, MED tier) — brief 494.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 *   recipe:  same guard as 02237ca4 (b0:1/f1:5,h4:6/:9,row:13/:8); tail
 *            func(bank,row,0,0) reuses the bitfield locals as args; return 0.
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
extern int  func_ov002_021dec2c(int bank, int row, int c, int d);

int func_ov002_02237d60(struct ObjHdr *p) {
    int bank = p->b0;
    int row  = p->f1;
    struct Row16 *r = (struct Row16 *)(data_ov002_022cf16c + bank * 0x868 + 0x30 + row * 0x14);
    if (p->f9 != (u32)((r->hi8 << 1) + r->b13))
        return 0;
    if (*(u16 *)((char *)data_ov002_022cf1a4 + bank * 0x868 + row * 0x14) == 0)
        return 0;
    func_ov002_021dec2c(bank, row, 0, 0);
    return 0;
}
