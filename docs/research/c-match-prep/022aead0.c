/* CAMPAIGN-PREP candidate for func_022aead0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     movne/moveq select as ternary; u16 lsl;lsr triples as &mask args
 *   risk:       reshape-able: arg count/order of func_ov002_02259774 and func_02037208 inferred from r0-r3 setup; the 0x3a/-1 literal pair (mov 0x3a then sub) may need explicit constants to match the two movs.
 *   confidence: med
 */
/* func_ov002_022aead0: setter. Calls func_ov002_022ae718 -> r4 (flag),
 * picks r3=0xc if r4!=0 else 0xb, reads global u16 at g+0x90, unpacks
 * three bitfields (b0,5bit,6bit) and passes them + r3 to
 * func_ov002_02259774. Then if global[+0xc8]!=0 calls func_0229a414(0);
 * always func_ov002_022ae9c0(self,0); if flag r4==0 also calls
 * func_02037208(-1,0,1). */

extern int  data_ov002_022d0f2c[];  /* g2; field at +0xc8 */
extern int  data_ov002_022d1910[];  /* g; u16 at +0x90 */
extern void func_02037208(int a, int b, int c, int d);
extern void func_ov002_02259774(int b0, int five, int six, void *self, int kind);
extern void func_ov002_0229a414(int a);
extern int  func_ov002_022ae718(void *self);
extern void func_ov002_022ae9c0(void *self, int a);

void func_ov002_022aead0(void *self) {
    int flag;
    int kind;
    unsigned int h;

    flag = func_ov002_022ae718(self);
    kind = flag ? 0xc : 0xb;
    h = *(unsigned short *)((char *)data_ov002_022d1910 + 0x90);
    func_ov002_02259774(h & 1, (h >> 2) & 0x1f, (h >> 6) & 0x3f, self, kind);

    if (((int *)data_ov002_022d0f2c)[0xc8 / 4] != 0)
        func_ov002_0229a414(0);

    func_ov002_022ae9c0(self, 0);

    if (flag == 0)
        func_02037208(-1, 0, 1, 0); /* mov r0,#0x3a; sub r1,r0,#0x3b => r0=0x3a,r1=-1 */
}
