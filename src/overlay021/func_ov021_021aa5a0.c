/* func_ov021_021aa5a0: family c70c4c3a sibling of ov006_021b56d8 — same
 * shape, the first three sub-inits run in a different order and the
 * state word lives in this overlay's global.
 *
 *     push  {r3, lr}
 *     bl    func_0202c1ac
 *     bl    func_0202af40
 *     bl    func_02001ba4
 *     bl    func_02006918
 *     ldr   r0, .L_021aa5c8      ; .word data_ov021_021ace80
 *     mov   r1, #0x5
 *     str   r1, [r0, #0x0]
 *     mov   r0, #0x1
 *     pop   {r3, pc}
 */

extern void func_0202c1ac(void);
extern void func_0202af40(void);
extern void func_02001ba4(void);
extern void func_02006918(void);
extern char data_ov021_021ace80[];

int func_ov021_021aa5a0(void) {
    func_0202c1ac();
    func_0202af40();
    func_02001ba4();
    func_02006918();
    *(int *)data_ov021_021ace80 = 5;
    return 1;
}
