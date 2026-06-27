/* CAMPAIGN-PREP candidate for func_021d1158 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     arg saved to callee-saved r4; r0=#4 shared by both arms (hoist const 4); ternary flag; early-returns match branch layout
 *   risk:       reshape-able: orig hoists `mov r0,#4` BEFORE the `bne` so 4 feeds both the state-0 event and the state-!=0 0229c7f8 call. If mwcc materializes 4 twice, 1 mov diverges; keeping both as literal `4` usually lets mwcc share it. Decl-order of flag-vs-st mild reg risk.
 *   confidence: med
 */
/* func_ov002_021d1158: 2-state entry taking one arg. State 0: post 4(flag,arg),
 * stash arg at d016c+0xcf8, run 021b29c0/021b2ab4, bump +0x810. State !=0: wait
 * on 0x24... actually wait on 4 via 0229c7f8(4); if pending return, else post
 * 0x24 and clear +0x80c. flag = ce950 sign bit. arg held in r4. */

extern char data_ov002_022ce950[];
extern char data_ov002_022d016c[];
extern void func_ov002_021b29c0(void);
extern void func_ov002_021b2ab4(void);
extern int  func_ov002_0229ade0(int cmd, int a, int b, int c);
extern int  func_ov002_0229c7f8(int a);

void func_ov002_021d1158(int arg) {
    int flag = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    int st = *(int *)(data_ov002_022ce950 + 0x810);

    if (st != 0) {
        if (func_ov002_0229c7f8(4) != 0) return;
        func_ov002_0229ade0(0x24, 0, 0, 0);
        *(int *)(data_ov002_022ce950 + 0x80c) = 0;
        return;
    }
    func_ov002_0229ade0(4, flag, arg, 0);
    *(int *)(data_ov002_022d016c + 0xcf8) = arg;
    func_ov002_021b29c0();
    func_ov002_021b2ab4();
    *(int *)(data_ov002_022ce950 + 0x810) = *(int *)(data_ov002_022ce950 + 0x810) + 1;
}
