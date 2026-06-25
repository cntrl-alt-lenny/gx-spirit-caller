/* CAMPAIGN-PREP candidate for func_021b7718 (ov016, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch returning constants => jump table (cmp #4; addls pc); index loop; slot reload per use
 *   risk:       reshape-able/permuter-class: orig pre-hoists the case constants into 5 callee-saved regs BEFORE the loop and uses an addls-pc jump table at the top; mwcc may instead constant-fold the identity switch (code=i) and drop the table. If so, force the table via the literal-returning switch; otherwise permuter. data_021bb1b0 reload each use matches.
 *   confidence: low
 */
/* func_ov016_021b7718 (ov016, class C) — for each of 5 task slots in
 * data_ov016_021bb1b0[], if non-null: select a priority code via a switch
 * on the index (0->0,1->1,2->2,3->3,4->4), then f458(), f3e4(ptr+0x28,
 * code<<9, 0x200), f38c(), Task_InvokeLocked(ptr), clear slot.
 * The switch is an obfuscated identity but the constants are materialised
 * in distinct regs (mov fp,3 / sl,2 / r6,1 / r7,0), so keep it a switch
 * returning those literals to reproduce the jump table.
 */
extern void *data_ov016_021bb1b0[5];
extern void func_0208f458(void);
extern void func_0208f3e4(int dst, int val, int len);
extern void func_0208f38c(void);
extern void Task_InvokeLocked(void *task);

void func_ov016_021b7718(void) {
    int i;

    for (i = 0; i < 5; i++) {
        int code;
        switch (i) {
            case 0:  code = 0; break;
            case 1:  code = 1; break;
            case 2:  code = 2; break;
            case 3:  code = 3; break;
            case 4:  code = 4; break;
            default: code = 0; break;
        }
        if (data_ov016_021bb1b0[i] != 0) {
            func_0208f458();
            func_0208f3e4((int)data_ov016_021bb1b0[i] + 0x28, code << 9, 0x200);
            func_0208f38c();
            Task_InvokeLocked(data_ov016_021bb1b0[i]);
            data_ov016_021bb1b0[i] = 0;
        }
    }
}
