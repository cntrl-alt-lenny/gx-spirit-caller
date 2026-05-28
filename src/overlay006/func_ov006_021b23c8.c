/* func_ov006_021b23c8: family 4 — helper(&data1) + 4 helpers + write data2 + return 1.
 *
 *     push {r3, lr}
 *     ldr r0, [pool0]    ; r0 = &data1
 *     bl helper1(&data1)
 *     bl func_02001ba4; bl func_0202c1ac; bl func_0202af40; bl func_02006918
 *     ldr r0, [pool1]; mov r1, #K
 *     str r1, [r0]; mov r0, #1; pop
 *
 * Sibling family: 4 ov006 picks with same shape.
 */
extern char data_ov006_0224f448[];
extern int data_ov006_021cf140;
extern void func_ov006_021b5db4(char *p);
extern void func_02001ba4(void);
extern void func_0202c1ac(void);
extern void func_0202af40(void);
extern void func_02006918(void);

int func_ov006_021b23c8(void) {
    func_ov006_021b5db4(data_ov006_0224f448);
    func_02001ba4();
    func_0202c1ac();
    func_0202af40();
    func_02006918();
    data_ov006_021cf140 = 0x11;
    return 1;
}
