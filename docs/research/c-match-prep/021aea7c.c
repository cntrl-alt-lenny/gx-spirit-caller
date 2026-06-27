/* CAMPAIGN-PREP candidate for func_021aea7c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     char*+offset writes; rely on global reload for f4^1; preserve store order
 *   risk:       reshape-able/peephole: orig builds 0xffff via `rsb r2,#0x10000` reusing the live 1 (mwcc materializes 0xffff differently); and it RELOADS f4 for `^1` — if mwcc constant-folds 0^1, mark f4 volatile or it diverges.
 *   confidence: med
 */
/* func_ov002_021aea7c: call init helper, then a straight store sequence into
 * two globals, including an eor-indexed flag write data_ov002_022cd744[f4^1]=1
 * (f4 RELOADED after being zeroed), then a sub-call; returns 1. */

extern char data_ov002_022cd73c[];
extern int  data_ov002_022cd744[];
extern char data_ov002_022d016c[];
extern void func_ov002_021ae7b8(void);
extern int  func_ov002_021af5a0(int arg0);

int func_ov002_021aea7c(int arg0) {
    func_ov002_021ae7b8();
    *(int *)(data_ov002_022d016c + 0xd04) = 3;
    *(int *)(data_ov002_022cd73c + 0x0) = 0;
    *(int *)(data_ov002_022cd73c + 0x4) = 0;
    data_ov002_022cd744[0] = 0;
    data_ov002_022cd744[*(int *)(data_ov002_022cd73c + 0x4) ^ 1] = 1;
    *(int *)(data_ov002_022d016c + 0x10) = *(int *)(data_ov002_022cd73c + 0x4);
    *(int *)(data_ov002_022d016c + 0xcf0) = 9;
    *(int *)(data_ov002_022d016c + 0xcf4) = 0x10000 - 1;
    *(int *)(data_ov002_022d016c + 0xce4) = *(int *)(data_ov002_022cd73c + 0x0);
    func_ov002_021af5a0(arg0);
    return 1;
}
