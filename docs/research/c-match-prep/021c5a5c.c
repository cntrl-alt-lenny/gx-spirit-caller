/* CAMPAIGN-PREP candidate for func_021c5a5c (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     func_02037208(N,N-(N+1),0,1) idiom; nested if(flag)/else-if(flag) for the dup cmp.
 *   risk:       the duplicate cmp r4,#0 + dead middle branch is hard to reproduce exactly; mwcc may fold the constant flag and drop the dead arm -> branch-table diverge. permuter-class (or escape to .s).
 *   confidence: low
 */
/* func_ov006_021c5a5c (ov006, D) - guard + stride-16 2D table walk, then a
 * 3-way SFX select on the computed flag.
 * idx0 = obj->f_4c; if idx0==0: cell = obj + idx0*16; if(cell->+70 + cell->+6c
 * < obj->+22c){ flag=1; obj->+44=1; s = cell->+70+cell->+6c;
 *   obj->+48 = (obj + s*16)->+7c; }. Then flag selects the SFX id.
 * r2=0,r3=1 are hoisted args shared by all three func_02037208 calls. */
extern void func_02037208(int a, int b, int c, int d);

int func_ov006_021c5a5c(char *obj) {
    int flag = 0;
    int idx0 = *(int *)(obj + 0x4c);
    if (idx0 == 0) {
        char *cell = obj + idx0 * 16;
        int sum = *(int *)(cell + 0x70) + *(int *)(cell + 0x6c);
        if (sum < *(int *)(obj + 0x22c)) {
            flag = 1;
            *(int *)(obj + 0x44) = 1;
            {
                int idx0b = *(int *)(obj + 0x4c);
                char *cell2 = obj + idx0b * 16;
                int s = *(int *)(cell2 + 0x70) + *(int *)(cell2 + 0x6c);
                *(int *)(obj + 0x48) = *(int *)((obj + s * 16) + 0x7c);
            }
        }
    }
    if (flag) {
        func_02037208(0x3a, 0x3a - 0x3b, 0, 1);
    } else if (flag) {
        func_02037208(0x46, 0x46 - 0x47, 0, 1);
    } else {
        func_02037208(0x43, 0x43 - 0x44, 0, 1);
    }
    return flag;
}
