/* CAMPAIGN-PREP candidate for func_02233204 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sel dispatch; sum operand-order c+(a+b); 1-(attr&1) rsb; *100 mul; fall-through to return 0
 *   risk:       the sel==0x7f branch falls through to the shared return 0 (no own return) - if mwcc duplicates the mov r0,0/ldm instead of branching to .L_1274, epilogue layout diverges. reshape-able (fall-through structure).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02233204 (ov002, class D) - brief 494.
 * UNVERIFIED build-free draft. sel = *(int*)(ce288 + 0x5a8).
 *   sel==0x80: 0226b274(attr&1, (attr>>1)&0x1f, 3); return 0x7f
 *   sel==0x7f: a=u16@d0e6c+0xb0,b=+0xb2,c=+0xb4; 021df818(card, 1-(attr&1),
 *              (c+(a+b))*100); fall through return 0
 *   else: return 0
 * sum order c+(a+b) matches add r1,a,b then add r3,c,r1 (c is first operand). */
typedef unsigned short u16;

extern char data_ov002_022ce288[];
extern char data_ov002_022d0e6c[];
extern int  func_ov002_021df818(void *, int, int);
extern int  func_ov002_0226b274(int, int, int);

int func_ov002_02233204(void *cardv) {
    u16 *base = (u16 *)cardv;
    int sel = *(int *)(data_ov002_022ce288 + 0x5a8);

    if (sel == 0x80) {
        u16 attr = base[1];
        func_ov002_0226b274(attr & 1, (attr >> 1) & 0x1f, 3);
        return 0x7f;
    }
    if (sel == 0x7f) {
        u16 attr = base[1];
        u16 a = *(u16 *)(data_ov002_022d0e6c + 0xb0);
        u16 b = *(u16 *)(data_ov002_022d0e6c + 0xb2);
        u16 c = *(u16 *)(data_ov002_022d0e6c + 0xb4);
        func_ov002_021df818(cardv, 1 - (attr & 1), (c + (a + b)) * 100);
    }
    return 0;
}
