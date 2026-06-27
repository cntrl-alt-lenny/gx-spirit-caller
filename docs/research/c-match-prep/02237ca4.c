/* CAMPAIGN-PREP candidate for func_02237ca4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D bitfields b0:1/f1:5/f9:9 + b13:1/hi8:8 row; parallel cf16c(+0x30)/cf1a4, products CSE; rhs accumulator-first
 *   risk:       reshape-able: bit0 emits lsl#31;lsr#31;and#1 — if mwcc drops the trailing and#1 (or folds b0 to plain and), the bit0 extract diverges by one instr; try raw (h2<<31)>>31 vs bitfield.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02237ca4 (ov002, class D, MED tier) — brief 494.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * Drop into src/, run ninja + objdiff, then apply the risk note.
 *   recipe:  D bitfields b0:1/f1:5 on h2, :6/:9 on h4, :13/:8 on loaded word;
 *            parallel cf16c(+0x30)/cf1a4 tables, products b0*0x868 & f1*0x14 CSE.
 */
typedef unsigned short u16;
typedef unsigned int   u32;

/* obj header at r0: packed halfwords (cf. ov002_core.h Ov002Self f0;b0:1) */
struct ObjHdr {
    u16 f0;                        /* +0 (unused here) */
    u16 b0 : 1; u16 f1 : 5; u16 : 6; u16 hi2 : 2;   /* +2 */
    u16 : 6; u16 f9 : 9; u16 : 1;                    /* +4 */
};
/* 0x14-stride row in the cf16c table (rows start at +0x30) */
struct Row16 {
    u32 : 13; u32 b13 : 1; u32 : 8; u32 hi8 : 8; u32 : 2;
};

extern char data_ov002_022cf16c[];        /* base; rows at +0x30, stride 0x14 */
extern u16  data_ov002_022cf1a4[];        /* parallel hword table, stride 0x14 */
extern int  func_ov002_0220e74c(struct ObjHdr *p);

int func_ov002_02237ca4(struct ObjHdr *p) {
    struct Row16 *r = (struct Row16 *)(data_ov002_022cf16c + p->b0 * 0x868 + 0x30 + p->f1 * 0x14);
    if (p->f9 != (u32)((r->hi8 << 1) + r->b13))
        return 0;
    if (*(u16 *)((char *)data_ov002_022cf1a4 + p->b0 * 0x868 + p->f1 * 0x14) == 0)
        return 0;
    return func_ov002_0220e74c(p);
}
