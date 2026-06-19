/* func_ov021_021aa4c0: family c70c4c3a sibling of ov006_021b56d8 — same
 * shape, the first three sub-inits run in a different order and the
 * state word lives in this overlay's global.
 *
 *     push  {r3, lr}
 *     bl    func_0202c158
 *     bl    func_0202aeec
 *     bl    func_02001b84
 *     bl    func_020068fc
 *     ldr   r0, .L_021aa5c8      ; .word data_ov021_021acda0
 *     mov   r1, #0x5
 *     str   r1, [r0, #0x0]
 *     mov   r0, #0x1
 *     pop   {r3, pc}
 */

extern void func_0202c158(void);
extern void func_0202aeec(void);
extern void func_02001b84(void);
extern void func_020068fc(void);
extern char data_ov021_021acda0[];

int func_ov021_021aa4c0(void) {
    func_0202c158();
    func_0202aeec();
    func_02001b84();
    func_020068fc();
    *(int *)data_ov021_021acda0 = 5;
    return 1;
}
