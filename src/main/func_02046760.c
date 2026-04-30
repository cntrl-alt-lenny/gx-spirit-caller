/* func_02046760: compute address &data_0219db74[i] with stride 8.
 *
 * Final residual from brief 017's 41-member cluster (PR #247 + #248
 * matched 34). 3-insn 0x10 with a shape distinct from the other 4 in
 * the cluster.
 */

extern char data_0219db74[];

void *func_02046760(int i) {
    return &((struct { int a, b; } *)data_0219db74)[i];
}
