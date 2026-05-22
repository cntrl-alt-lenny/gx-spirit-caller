/* func_ov004_021cb278: thunk — call func_ov004_021c9f94 with
 * data_ov004_022113f8, return 1.
 *
 *     push  {r3, lr}
 *     ldr   r0, .L_pool
 *     bl    func_ov004_021c9f94
 *     mov   r0, #1
 *     pop   {r3, pc}
 *  .L_pool: .word data_ov004_022113f8
 */

extern char data_ov004_022113f8[];
extern void func_ov004_021c9f94(void *p);

int func_ov004_021cb278(void) {
    func_ov004_021c9f94(data_ov004_022113f8);
    return 1;
}
