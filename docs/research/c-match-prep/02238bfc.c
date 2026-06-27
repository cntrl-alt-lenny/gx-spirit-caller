/* CAMPAIGN-PREP candidate for func_02238bfc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: cmp g 0x7f-first then 0x80; inv=1-b0(rsb) and idx=inv&1(and) distinct; 0x80 path returns 0x7f
 *   risk:       reshape-able: branch-layout — orig tests 0x7f first but lays the 0x80 body inline and 0x7f body at the tail. If mwcc emits the 0x7f body inline (swapped block order), the b-targets diverge; force order with the if/else-if as written or swap.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02238bfc (ov002, class D, MED tier) — brief 494.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 *   recipe:  state branch g==0x7f / ==0x80 / else; D: inv = 1-bit0 (rsb) then
 *            idx = inv&1 (and) kept distinct; cf178/cf16c indexed by idx*0x868.
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct ObjHdr { u16 f0; u16 b0 : 1; u16 : 15; };

extern char data_ov002_022ce288[];   /* +0x5a8 = state word g */
extern char data_ov002_022cf16c[];   /* base for the 0x7f path */
extern char data_ov002_022cf178[];   /* word table, stride 0x868 */
extern char data_ov002_022d0e6c[];   /* +0xb0 hword */
extern int  func_ov002_021e2550(int inv, int hw, void *ptr, int d);
extern int  func_ov002_0226af78(int inv, int b);

int func_ov002_02238bfc(struct ObjHdr *p) {
    int g = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (g == 0x7f) {
        int inv = 1 - p->b0;
        int hw  = *(u16 *)(data_ov002_022d0e6c + 0xb0);
        void *ptr = data_ov002_022cf16c + (inv & 1) * 0x868 + 0x120 + (hw << 2);
        func_ov002_021e2550(inv, hw, ptr, 1);
        return 0;
    } else if (g == 0x80) {
        int inv = 1 - p->b0;
        if (*(u32 *)(data_ov002_022cf178 + (inv & 1) * 0x868) == 0)
            return 0;
        func_ov002_0226af78(inv, 0);
        return 0x7f;
    }
    return 0;
}
