/* func_ov006_021b56d8: family c70c4c3a — run four void sub-inits, set a
 * global state word to 5, return 1.
 *
 *     push  {r3, lr}
 *     bl    func_02001ba4
 *     bl    func_0202c1ac
 *     bl    func_0202af40
 *     bl    func_02006918
 *     ldr   r0, .L_021b5700      ; .word data_ov006_0224f38c
 *     mov   r1, #0x5
 *     str   r1, [r0, #0x0]
 *     mov   r0, #0x1
 *     pop   {r3, pc}
 */

extern void func_02001ba4(void);
extern void func_0202c1ac(void);
extern void func_0202af40(void);
extern void func_02006918(void);
extern char data_ov006_0224f38c[];

int func_ov006_021b56d8(void) {
    func_02001ba4();
    func_0202c1ac();
    func_0202af40();
    func_02006918();
    *(int *)data_ov006_0224f38c = 5;
    return 1;
}
