/* CAMPAIGN-PREP candidate for func_0229f1e0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: reload g_022d0f2c pool per use; if-assign clamp (movlt); arg pattern (E-1, (E-1)-E) for mov+sub
 *   risk:       orig emits args as 'mov r0,#0x56; sub r1,r0,#0x57' (E-1 then minus E = -1). mwcc may constant-fold the 2nd arg to a single mvn r1,#0 instead of sub-from-r0, breaking byte match. permuter-class (literal sub-fold) + reshape-able clamp
 *   confidence: low
 */
/* func_ov002_0229f1e0: priority/event dispatch on state s = a0->f_8.
 * If s>=0x10: a0->f_18=0xf; clamp g_022d0f2c->f_d4 to >=2; if
 *   g_022d11bc->f_4==3 call func_02037208(0x56,-1,0,3) else (0x38,-1,0,3).
 * Else: a0->f_18=1; clamp g_022d0f2c->f_d4 to >=0x10; switch(s): 1 ->
 *   func(0x42,-1,0,1); 0xf -> if a0->f_1c==g_022d016c->f_cf8 func(0x42,-1,0,1)
 *   else func(0x3a,-1,0,1); default -> func(0x3a,-1,0,1). */
extern char data_ov002_022d016c[];
extern char data_ov002_022d0f2c[];
extern char data_ov002_022d11bc[];
extern void func_02037208(int a, int b, int c, int d);

void func_ov002_0229f1e0(char *a0) {
    int s = *(int *)(a0 + 0x8);
    if (s >= 0x10) {
        *(int *)(a0 + 0x18) = 0xf;
        if (*(int *)(data_ov002_022d0f2c + 0xd4) < 2)
            *(int *)(data_ov002_022d0f2c + 0xd4) = 2;
        if (*(int *)(data_ov002_022d11bc + 0x4) == 3) {
            func_02037208(0x57 - 1, (0x57 - 1) - 0x57, 0, 3);
        } else {
            func_02037208(0x39 - 1, (0x39 - 1) - 0x39, 0, 3);
        }
        return;
    }
    *(int *)(a0 + 0x18) = 1;
    if (*(int *)(data_ov002_022d0f2c + 0xd4) < 0x10)
        *(int *)(data_ov002_022d0f2c + 0xd4) = 0x10;
    switch (*(int *)(a0 + 0x8)) {
    case 1:
        func_02037208(0x43 - 1, (0x43 - 1) - 0x43, 0, 1);
        return;
    case 0xf:
        if (*(int *)(a0 + 0x1c) == *(int *)(data_ov002_022d016c + 0xcf8))
            func_02037208(0x43 - 1, (0x43 - 1) - 0x43, 0, 1);
        else
            func_02037208(0x3b - 1, (0x3b - 1) - 0x3b, 0, 1);
        return;
    default:
        func_02037208(0x3b - 1, (0x3b - 1) - 0x3b, 0, 1);
        return;
    }
}
