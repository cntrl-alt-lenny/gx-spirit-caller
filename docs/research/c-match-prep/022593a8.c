/* CAMPAIGN-PREP candidate for func_022593a8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     indexed-flag guard + tail-call OR store-block init
 *   risk:       0228fa1c is whole-fn .s taking (a,b,c); tail call must pass all three; if it takes fewer, an extra mov may appear
 *   confidence: high
 */
/* func_ov002_022593a8: if the per-slot flag data_ov002_022cd744[arg0]==1, hand
 * off to func_ov002_0228fa1c(arg0,arg1,arg2); otherwise arm a cmd-id-10 request
 * (arg0->+0xD6C param, arg1->+0xD58, arg2->+0xD84, zero the status words). */

extern char data_ov002_022d016c[];
extern int data_ov002_022cd744[];
extern void func_ov002_0228fa1c(int a, int b, int c);

void func_ov002_022593a8(int arg0, int arg1, int arg2) {
    if (data_ov002_022cd744[arg0] == 1) {
        func_ov002_0228fa1c(arg0, arg1, arg2);
        return;
    }
    *(int *)(data_ov002_022d016c + 0xD48) = 10;
    *(int *)(data_ov002_022d016c + 0xD84) = arg2;
    *(int *)(data_ov002_022d016c + 0xD54) = 0;
    *(int *)(data_ov002_022d016c + 0xD50) = 0;
    *(int *)(data_ov002_022d016c + 0xD6C) = arg0;
    *(int *)(data_ov002_022d016c + 0xD58) = arg1;
}
