/* CAMPAIGN-PREP candidate for func_022391d8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: sel:2 gate; canonical guard; de678(p,..) barrier drives the h2 reload; val=(x*4+f9*8+1)&0xffff
 *   risk:       permuter-class: the dense pre-call interleave (h2/h4 bitfields, b0*0x868/f1*0x14 muls, lhs/rhs build all scheduled into r4-r6/ip/lr) is scheduling-sensitive; mwcc's instruction order across the 268B body likely diverges and needs permuter even if every value matches.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_022391d8 (ov002, class D, MED tier) — brief 494.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 *   recipe:  D: sel=(h2>>12)&3 :2 gate; canonical guard (b0:1/f1:5,h4:6/:9,
 *            row:13/:8); de678 call-barrier forces the h2/h4 reloads; val&0xffff.
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct ObjHdr {
    u16 f0;                                  /* +0 */
    u16 b0 : 1; u16 f1 : 5; u16 : 6; u16 sel : 2; /* +2 (sel = bits 12-13) */
    u16 : 6; u16 f9 : 9; u16 : 1;            /* +4 */
};
struct Row16 { u32 : 13; u32 b13 : 1; u32 : 8; u32 hi8 : 8; u32 : 2; };

extern char data_ov002_022cf16c[];
extern u16  data_ov002_022cf1a4[];
extern int  func_ov002_021c10e8(int bank, int row, int c);
extern int  func_ov002_021de678(struct ObjHdr *p, int bank, int row, int d);
extern int  func_ov002_021e276c(int bank, int h0, int c, int val);

int func_ov002_022391d8(struct ObjHdr *p) {
    if (p->sel == 1) {
        struct Row16 *r = (struct Row16 *)(data_ov002_022cf16c + p->b0 * 0x868 + 0x30 + p->f1 * 0x14);
        if (p->f9 != (u32)((r->hi8 << 1) + r->b13))
            return 0;
        if (*(u16 *)((char *)data_ov002_022cf1a4 + p->b0 * 0x868 + p->f1 * 0x14) == 0)
            return 0;
        if (func_ov002_021de678(p, p->b0, p->f1, 0x2000) != 0) {
            int x = func_ov002_021c10e8(p->b0, p->f1, 1);
            int val = (x * 4 + p->f9 * 8 + 1) & 0xffff;
            func_ov002_021e276c(p->b0, p->f0, 0x21, val);
        }
    }
    return 0;
}
