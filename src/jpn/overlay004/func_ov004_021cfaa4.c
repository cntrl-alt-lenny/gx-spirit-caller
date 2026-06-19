/* func_ov004_021cfaa4: clone of func_ov004_021cdc3c with the SAME
 * data_ov004_02211230 arg. Same disassembly shape, different VA.
 *
 *     push  {r3, lr}
 *     bl    func_ov004_021cb198
 *     ldr   r0, .L_pool
 *     bl    func_ov004_021c9eb4
 *     mov   r0, #1
 *     pop   {r3, pc}
 *  .L_pool: .word data_ov004_02211230
 */

extern char data_ov004_02211230[];
extern int func_ov004_021cb198(void);
extern void func_ov004_021c9eb4(void *p);

int func_ov004_021cfaa4(void) {
    func_ov004_021cb198();
    func_ov004_021c9eb4(data_ov004_02211230);
    return 1;
}
