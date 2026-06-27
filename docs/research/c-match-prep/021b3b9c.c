/* CAMPAIGN-PREP candidate for func_021b3b9c (ov014, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: literal if(i==0)/else if(i==1) chain to reproduce cmp;beq;cmp;moveq select into r8; constants 0/1/0x200 hoisted out of loop.
 *   risk:       reshape-able: select of r8 from loop index uses a cmp/cmp/moveq ladder; a ternary or table may emit differently. The explicit if/else-if chain shown mirrors it; reg-alloc of r5/r6/r9 mirrors may still rotate (permuter-class fallback).
 *   confidence: med
 */
/* func_ov014_021b3b9c: 2-iter task sweep. For each live task slot, drive a 3-call
 * update (0208f458 / 0208f3e4 / 0208f38c), invoke it locked, then clear the slot.
 * The second-stage arg is (i==1?1:0)<<9. */
extern int  data_ov014_022350e0[];   /* task pointer array */
extern void func_0208f458(void);
extern void func_0208f3e4(int a0, int a1, int a2);
extern void func_0208f38c(void);
extern void Task_InvokeLocked(int task);

void func_ov014_021b3b9c(void)
{
    int i;
    for (i = 0; i < 2; i++) {
        int flag;
        if (i == 0) flag = 0;
        else if (i == 1) flag = 1;
        if (data_ov014_022350e0[i] != 0) {
            func_0208f458();
            func_0208f3e4(data_ov014_022350e0[i] + 0x28, flag << 9, 0x200);
            func_0208f38c();
            Task_InvokeLocked(data_ov014_022350e0[i]);
            data_ov014_022350e0[i] = 0;
        }
    }
}
