/* CAMPAIGN-PREP candidate for func_021d87dc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: mla base cf16c+(arg0&1)*0x868 +0x260; flag tested on raw arg0; bx-tail return; Ov002Key a*2+b
 *   risk:       reshape-able: it is a frameless tail-call => `return func_021d479c(...)` to get ldr ip,=...;bx ip; the (arg0&1)*0x868 base must compile as `and;mla` (it will from cf16c + (arg0&1)*0x868). flag if-assign keeps movne/moveq order.
 *   confidence: med
 */
/* func_ov002_021d87dc (ov002, cls D): leaf, bx tail-call to 021d479c. rec = cf16c +
 * (arg0&1)*0x868; w = *(u32*)(rec+0x260). flag = arg0?0x8000:0 (tested on raw arg0
 * before &1). Posts kind p0=flag|0x29, p1=0xd, p2=Ov002Key a*2+b extract, p3=0. */
typedef unsigned short u16;
typedef unsigned int   u32;

struct Ov002Key { u32 id : 13; u32 b : 1; u32 : 8; u32 a : 8; u32 : 2; };

extern char data_ov002_022cf16c[];
extern int  func_ov002_021d479c(int p0, int p1, int p2, int p3);

int func_ov002_021d87dc(int arg0) {
    struct Ov002Key *rec =
        (struct Ov002Key *)(data_ov002_022cf16c + (arg0 & 1) * 0x868 + 0x260);
    int flag = (arg0 != 0) ? 0x8000 : 0;
    return func_ov002_021d479c((u16)(flag | 0x29), 0xd, (u16)(rec->a * 2 + rec->b), 0);
}
