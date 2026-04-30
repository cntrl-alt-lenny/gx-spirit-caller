/* func_ov002_021afb90: compute address &data_ov002_022cdc88[i] with stride 4.
 *
 * Final residual from brief 017's 41-member cluster (PR #247 + #248
 * matched 34). 3-insn 0x10 with a shape distinct from the other 4 in
 * the cluster.
 */

extern char data_ov002_022cdc88[];

void *func_ov002_021afb90(int i) {
    return &((int *)data_ov002_022cdc88)[i];
}
