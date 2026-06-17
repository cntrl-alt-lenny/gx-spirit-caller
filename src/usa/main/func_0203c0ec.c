/* func_0203c0ec: helper1 + cond helper2 + return helper1_ret.
 *
 *     push {r4, lr}
 *     ldr r0, [pool]; mov r1, #0
 *     bl func_0207cef4(&data, 0)
 *     movs r4, r0; beq L_end
 *     ldr r0, [pool]; mov r1, r4
 *     bl func_0207cf0c(&data, r4)
 *     L_end: mov r0, r4; pop
 */
extern char data_0219cf9c[];
extern int func_0207cef4(char *p, int n);
extern void func_0207cf0c(char *p, int n);

int func_0203c0ec(void) {
    int r = func_0207cef4(data_0219cf9c, 0);
    if (r != 0) func_0207cf0c(data_0219cf9c, r);
    return r;
}
