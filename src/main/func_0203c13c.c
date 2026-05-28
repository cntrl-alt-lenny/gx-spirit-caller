/* func_0203c13c: helper1 + cond helper2 + return helper1_ret.
 *
 *     push {r4, lr}
 *     ldr r0, [pool]; mov r1, #0
 *     bl func_0207cfdc(&data, 0)
 *     movs r4, r0; beq L_end
 *     ldr r0, [pool]; mov r1, r4
 *     bl func_0207cff4(&data, r4)
 *     L_end: mov r0, r4; pop
 */
extern char data_0219d07c[];
extern int func_0207cfdc(char *p, int n);
extern void func_0207cff4(char *p, int n);

int func_0203c13c(void) {
    int r = func_0207cfdc(data_0219d07c, 0);
    if (r != 0) func_0207cff4(data_0219d07c, r);
    return r;
}
