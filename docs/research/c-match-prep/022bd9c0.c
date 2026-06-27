/* CAMPAIGN-PREP candidate for func_022bd9c0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: cmp-chain (not table); bind r5=s[0xc58]; (mode==2)-(mode==1) sub for the threshold mul.
 *   risk:       truncated/struct-guessed: asm clipped at 90 lines; state2 (.L_114) body is gone, and the shared .L_130 tail/return is past the cut. _bc2b4 vs _36590 arg sharing of [d016c+0xdc] is inferred.
 *   confidence: low
 */
/* func_ov002_022bd9c0: PARTIAL/TRUNCATED (asm clipped at 90 lines; size=336). 3-state
 * machine (cmp 0/1/2, NOT a jump table). state2 body at .L_114 (ldr r0,_LIT2 ...) is
 * MOSTLY MISSING. r5 holds s[0xc58] across calls in state1 (bind, do not reload). */
extern char data_ov002_022d016c[];
extern char data_ov002_022d1af8[];
extern char data_ov002_022d28fc[];
extern void func_02036590(int, int);
extern void func_020373cc(int, int, int, int);
extern void func_ov002_022b3898(int);
extern int func_ov002_022bc2b4(int);
extern void func_ov002_022bdb88(int, int, int, int, int);

int func_ov002_022bd9c0(int *s) {
    int mode;
    int sel;
    int a;
    int b;
    switch (s[0xc60 / 4]) {
    case 0:
        s[0xc48 / 4] = 0;
        s[0xc60 / 4] = 1;
        s[0xc64 / 4] = 0;
        break;
    case 1:
        if (s[0xc64 / 4] == 0xa) {
            int r5 = s[0xc58 / 4];
            func_ov002_022bc2b4(*(int *)(data_ov002_022d016c + 0xdc));
            func_02036590(*(int *)(data_ov002_022d016c + 0xdc), 0);
            if (r5 == 1) sel = 0x2a;
            else if (r5 == 2) sel = 0x2b;
            else sel = 0x2c;
            func_020373cc(sel, 1, 0, -1);
        }
        if (s[0xc64 / 4] == 0x28) {
            int k = s[0xc58 / 4];
            if (k == 1) sel = 0;
            else if (k == 2) sel = 1;
            else sel = 2;
            func_ov002_022bdb88((int)data_ov002_022d1af8, 0x4c, sel, 0, 0);
        }
        mode = s[0xc58 / 4];
        a = (mode == 2) ? 1 : 0;
        b = (mode == 1) ? 1 : 0;
        if (s[0xc64 / 4] >= (a - b) * 0x14 + 0x12c) {
            s[0xc60 / 4] = 2;
            s[0xc64 / 4] = 0;
        }
        break;
    case 2:
        /* TRUNCATED: body after ldr r0,_LIT2 (data_ov002_022d28fc) is missing */
        break;
    default:
        break;
    }
    return 1;
}
