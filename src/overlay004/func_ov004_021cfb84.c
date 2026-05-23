/* func_ov004_021cfb84: clone of func_ov004_021cdd1c with the SAME
 * data_ov004_02211490 arg. Same disassembly shape, different VA.
 *
 *     push  {r3, lr}
 *     bl    func_ov004_021cb278
 *     ldr   r0, .L_pool
 *     bl    func_ov004_021c9f94
 *     mov   r0, #1
 *     pop   {r3, pc}
 *  .L_pool: .word data_ov004_02211490
 */

extern char data_ov004_02211490[];
extern int func_ov004_021cb278(void);
extern void func_ov004_021c9f94(void *p);

int func_ov004_021cfb84(void) {
    func_ov004_021cb278();
    func_ov004_021c9f94(data_ov004_02211490);
    return 1;
}
