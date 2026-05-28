/* func_020873cc: null-check + helper + AND-NOT data.
 *
 *     push {r4, lr}
 *     movs r4, r0; popeq
 *     mov r1, #0; bl func_02094f48(arg, 0)
 *     ldr r0, [pool]; mvn r1, r4; ldr r2, [r0, #0]
 *     and r1, r2, r1; str r1, [r0, #0]; pop
 */
extern int data_021a4858;
extern void func_02094f48(int n, int z);

void func_020873cc(int n) {
    if (n == 0) return;
    func_02094f48(n, 0);
    data_021a4858 &= ~n;
}
