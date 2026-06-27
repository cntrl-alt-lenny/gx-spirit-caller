/* CAMPAIGN-PREP candidate for func_02237e00 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     byte-identical clone of 02237ca4; only the tail-call target differs (0221074c); tail-return p
 *   risk:       reshape-able: identical codegen surface to 02237ca4 — same bit0 lsl;lsr;and#1 question. Whatever flips 02237ca4 to 100% applies verbatim here (crack-once-propagate across the 4 clones).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02237e00 (ov002, class D, MED tier) — brief 494.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 *   recipe:  exact clone of 02237ca4 guard; tail-returns func_0221074c(p).
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
extern int  func_ov002_0221074c(struct ObjHdr *p);

int func_ov002_02237e00(struct ObjHdr *p) {
    struct Row16 *r = (struct Row16 *)(data_ov002_022cf16c + p->b0 * 0x868 + 0x30 + p->f1 * 0x14);
    if (p->f9 != (u32)((r->hi8 << 1) + r->b13))
        return 0;
    if (*(u16 *)((char *)data_ov002_022cf1a4 + p->b0 * 0x868 + p->f1 * 0x14) == 0)
        return 0;
    return func_ov002_0221074c(p);
}
