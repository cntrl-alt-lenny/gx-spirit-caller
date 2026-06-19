/* func_ov004_021cb198: thunk — call func_ov004_021c9eb4 with
 * data_ov004_02211198, return 1.
 *
 *     push  {r3, lr}
 *     ldr   r0, .L_pool
 *     bl    func_ov004_021c9eb4
 *     mov   r0, #1
 *     pop   {r3, pc}
 *  .L_pool: .word data_ov004_02211198
 */

extern char data_ov004_02211198[];
extern void func_ov004_021c9eb4(void *p);

int func_ov004_021cb198(void) {
    func_ov004_021c9eb4(data_ov004_02211198);
    return 1;
}
