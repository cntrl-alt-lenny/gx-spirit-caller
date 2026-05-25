/* func_020454f0: pair setter — write two args to two adjacent-ish globals.
 *
 *     ldr r3, .L_02045504    ; data_0219dacc
 *     ldr r2, .L_02045508    ; data_0219dac8
 *     str r0, [r3, #0x0]
 *     str r1, [r2, #0x0]
 *     bx  lr
 *
 * mwcc loads BOTH pool refs first, then stores — `&base[expr]` style would
 * fold to one pool. Two separate `&` globals is what produces this.
 */

extern int data_0219dacc;
extern int data_0219dac8;

void func_020454f0(int a, int b) {
    data_0219dacc = a;
    data_0219dac8 = b;
}
