/* func_020467e4: compute address &data_0219daf4[i] with stride 4.
 *
 * Final residual from brief 017's 41-member cluster (PR #247 + #248
 * matched 34). 3-insn 0x10 with a shape distinct from the other 4 in
 * the cluster.
 */

extern char data_0219daf4[];

void *func_020467e4(int i) {
    return &((int *)data_0219daf4)[i];
}
