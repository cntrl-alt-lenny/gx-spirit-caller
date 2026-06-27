/* CAMPAIGN-PREP candidate for func_0223832c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D word bitfields b9:1/f4:4/f9:9; obj callee-saved; 2nd mask = 1<<((b9<<4)+f4); args b9,f4,f9 order
 *   risk:       reshape-able: orig RELOADS *(obj+0x14) before the 2nd call, but 021d8904 takes only scalars so mwcc may CSE one load. If first param of 021d8904 is actually the obj, declare it so the call-barrier forces the reload.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0223832c (ov002, class D, MED tier) — brief 494.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 *   recipe:  D bitfields on the +0x14 word: b9:1, f4@10:4, f9@0:9. obj held
 *            callee-saved across 2 calls; the +0x14 word RELOADED for the 2nd.
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct Obj {
    char _pad14[0x14];
    u32 f9 : 9; u32 f4 : 4; u32 b9 : 1; u32 : 18;   /* word at +0x14 */
};

extern int func_ov002_021d8904(int a, int b, int c);
extern int func_ov002_021de134(struct Obj *p, int mask, int c, int d);

int func_ov002_0223832c(struct Obj *p) {
    func_ov002_021d8904(p->b9, p->f4, p->f9);
    func_ov002_021de134(p, 1 << ((p->b9 << 4) + p->f4), 0xb, 8);
    return 0;
}
