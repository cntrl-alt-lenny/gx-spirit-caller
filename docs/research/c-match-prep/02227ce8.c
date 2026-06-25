/* CAMPAIGN-PREP candidate for func_02227ce8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     nested counted loop; eor index; reload base per outer iter; guarded call
 *   risk:       mwcc may not hoist the 1/0 loop constants into callee-saved regs like orig (r8/r9)
 *   confidence: med
 */
/* func_ov002_02227ce8: nested counted loop. For i in [0,2): x = *(int*)
 * (d016c+0xcec) ^ i; for j in [0,10]: if 0225764c(self,x,j) then
 * 021d91e0(x,j,1). return 0. */
extern char data_ov002_022d016c[];
extern int  func_ov002_0225764c(int self, int b, int c);
extern void func_ov002_021d91e0(unsigned int x, unsigned int j, int one);

int func_ov002_02227ce8(int self) {
    int i, j, x;
    for (i = 0; i < 2; i++) {
        x = *(int *)(data_ov002_022d016c + 0xcec) ^ i;
        for (j = 0; j <= 10; j++) {
            if (func_ov002_0225764c(self, x, j) != 0)
                func_ov002_021d91e0(x, j, 1);
        }
    }
    return 0;
}
