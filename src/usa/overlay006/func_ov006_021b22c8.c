/* func_ov006_021b22c8: family 4 — helper(&data1) + 4 helpers + write data2 + return 1.
 *
 *     push {r3, lr}
 *     ldr r0, [pool0]    ; r0 = &data1
 *     bl helper1(&data1)
 *     bl func_02001b84; bl func_0202c158; bl func_0202aeec; bl func_020068fc
 *     ldr r0, [pool1]; mov r1, #K
 *     str r1, [r0]; mov r0, #1; pop
 *
 * Sibling family: 4 ov006 picks with same shape.
 */
extern char data_ov006_0224f328[];
extern int data_ov006_021cf020;
extern void func_ov006_021b5cb4(char *p);
extern void func_02001b84(void);
extern void func_0202c158(void);
extern void func_0202aeec(void);
extern void func_020068fc(void);

int func_ov006_021b22c8(void) {
    func_ov006_021b5cb4(data_ov006_0224f328);
    func_02001b84();
    func_0202c158();
    func_0202aeec();
    func_020068fc();
    data_ov006_021cf020 = 0x11;
    return 1;
}
