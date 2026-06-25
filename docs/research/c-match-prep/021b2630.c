/* CAMPAIGN-PREP candidate for func_021b2630 (ov015, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Straight-line init, fixed call seq; smulbb from short*short index
 *   risk:       smulbb needs both operands short-typed; index var=0 may instead fold to a plain ldrsh and drop the multiply
 *   confidence: low
 */
/* func_ov007_021b2630: init control block a0.
 *   a0->f_4c = 0;
 *   row = data_020c9694[(short)i * (short)0x18]  (i==0 -> offset 0, signed h/w)
 *   func_ov007_021b2b74(data_ov007_0223352c, row);
 *   a0->f_44 = 1;
 *   func_ov007_021b2c44(data_ov007_0223352c);
 *   func_ov007_021b2920(a0); func_ov007_021b299c(a0);
 *   func_ov007_021b28c4(a0, 1);
 *   return 1;
 */

extern void func_ov007_021b2b74(void *a, int b);
extern void func_ov007_021b2c44(void *a);
extern void func_ov007_021b2920(void *a);
extern void func_ov007_021b299c(void *a);
extern void func_ov007_021b28c4(void *a, int b);
extern short data_020c9694[];
extern char  data_ov007_0223352c[];

int func_ov007_021b2630(char *a0) {
    short i = 0;
    int row;
    *(int *)(a0 + 0x4c) = 0;
    row = *(short *)((char *)data_020c9694 + (short)i * (short)0x18);
    func_ov007_021b2b74(data_ov007_0223352c, row);
    *(int *)(a0 + 0x44) = 1;
    func_ov007_021b2c44(data_ov007_0223352c);
    func_ov007_021b2920(a0);
    func_ov007_021b299c(a0);
    func_ov007_021b28c4(a0, 1);
    return 1;
}
