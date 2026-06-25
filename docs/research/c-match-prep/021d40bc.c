/* CAMPAIGN-PREP candidate for func_021d40bc (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     flag-toggle (load,zero-store,movne#1), store-order mode/f38/f3c, mask<<0x1d>>0x1d
 *   risk:       reshape-able: the toggle 'if(f38){f38=0;flag=1}' must compile to the movne/strne idiom — writing it as read-then-conditional-write matches; if mwcc emits a branch instead of strne, reshape the toggle to a single guarded block (already done).
 *   confidence: med
 */
/* func_ov004_021d40bc: flag-toggle then guard-chain. a0=self(r4).
 * if (self->f38) { self->f38=0; if (data_021040ac[0x34]==1) { 02001d68(1);
 *     021d8798(g_022915e8, g_02209f94, 0x12); 02001d68(data_02104f4c[1]&7); } }
 * if (!g_022915e8[0]) return; 0203268c(); if (0203320c()==1){self->mode=3}else{self->mode=2}
 * self->f38=1; self->f3c=0. Class C: flag-toggle movne, store-order selects. */
extern char data_021040ac[];
extern char data_02104f4c[];
extern char data_ov004_02209f94[];
extern char data_ov004_022915e8[];
extern void func_02001d68(int a);
extern int  func_0203268c(void);
extern int  func_0203320c(void);
extern void func_ov004_021d8798(void *a, void *b, int c);

struct Ov004St2 {
    char  _pad0[0x30];
    int   mode;   /* +0x30 */
    char  _pad34[4];
    int   f38;    /* +0x38 */
    int   f3c;    /* +0x3c */
};

void func_ov004_021d40bc(struct Ov004St2 *self) {
    if (self->f38) {
        self->f38 = 0;
        if (*(int *)(data_021040ac + 0x34) == 1) {
            func_02001d68(1);
            func_ov004_021d8798(data_ov004_022915e8, data_ov004_02209f94, 0x12);
            func_02001d68(((*(int *)(data_02104f4c + 4)) << 0x1d) >> 0x1d);
        }
    }
    if (*(int *)data_ov004_022915e8 == 0)
        return;
    func_0203268c();
    if (func_0203320c() == 1)
        self->mode = 3;
    else
        self->mode = 2;
    self->f38 = 1;
    self->f3c = 0;
}
