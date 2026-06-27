/* CAMPAIGN-PREP candidate for func_021d8840 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bind d016c.f_ce4 before loop; 5-iter slot scan with else-clear-bit; void early-return; flag|0x49 pack
 *   risk:       permuter-class: orig splits the slot walk into TWO induction pointers (lr=base+0x30, r4=base both +=0x14); a single `e=base+i*0x14` may emit one IV + offset addressing, diverging the loop body. Loop strength-reduction is unsteerable by C form.
 *   confidence: low
 */
/* func_ov002_021d8840 (ov002, cls D): mla-base scan of 5 slots then a bitfield pack.
 * base = cf16c + (arg0&1)*0x868. d016c.f_ce4 = *(int*)(d016c+0xce4) held across the
 * loop. For i in 0..4: if slot[i].id && hw38==0 && hw36 -> count++ else clear bit i
 * of arg1. If count<=1 return; else post 021d479c(flag|0x49, (u16)ce4, ce4>>16, arg1). */
typedef unsigned short u16;
typedef unsigned int   u32;

struct Ov002Key { u32 id : 13; u32 b : 1; u32 : 8; u32 a : 8; u32 : 2; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern int  func_ov002_021d479c(int p0, int p1, int p2, int p3);

void func_ov002_021d8840(int arg0, int arg1) {
    char *base = data_ov002_022cf16c + (arg0 & 1) * 0x868;
    int ce4 = *(int *)(data_ov002_022d016c + 0xce4);
    int count = 0;
    int i;
    int flag;
    for (i = 0; i < 5; i++) {
        char *e = base + i * 0x14;
        if (((struct Ov002Key *)(e + 0x30))->id != 0 &&
            *(u16 *)(e + 0x38) == 0 &&
            *(u16 *)(e + 0x36) != 0)
            count++;
        else
            arg1 &= ~(1 << i);
    }
    if (count <= 1)
        return;
    flag = (arg0 != 0) ? 0x8000 : 0;
    func_ov002_021d479c((u16)(flag | 0x49), (u16)ce4, (u16)((unsigned)ce4 >> 16),
                        (u16)arg1);
}
