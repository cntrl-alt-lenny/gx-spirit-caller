/* func_020a3830: write u16 to data_021a9900+0x6.
 *
 * Final residual from brief 017's 41-member cluster (PR #247 + #248
 * matched 34). 3-insn 0x10 with a shape distinct from the other 4 in
 * the cluster.
 */

extern char data_021a9900[];

void func_020a3830(unsigned int v) {
    *(unsigned short *)(data_021a9900 + 0x6) = (unsigned short)v;
}
