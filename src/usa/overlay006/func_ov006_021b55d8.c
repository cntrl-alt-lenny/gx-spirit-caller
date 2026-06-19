/* func_ov006_021b55d8: family c70c4c3a — run four void sub-inits, set a
 * global state word to 5, return 1.
 *
 *     push  {r3, lr}
 *     bl    func_02001b84
 *     bl    func_0202c158
 *     bl    func_0202aeec
 *     bl    func_020068fc
 *     ldr   r0, .L_021b5700      ; .word data_ov006_0224f26c
 *     mov   r1, #0x5
 *     str   r1, [r0, #0x0]
 *     mov   r0, #0x1
 *     pop   {r3, pc}
 */

extern void func_02001b84(void);
extern void func_0202c158(void);
extern void func_0202aeec(void);
extern void func_020068fc(void);
extern char data_ov006_0224f26c[];

int func_ov006_021b55d8(void) {
    func_02001b84();
    func_0202c158();
    func_0202aeec();
    func_020068fc();
    *(int *)data_ov006_0224f26c = 5;
    return 1;
}
