/* func_ov002_02263edc: thunk — `func_ov002_02263dec` with r1 = 0x1619.
 *
 *     ldr ip, =func_ov002_02263dec
 *     ldr r1, =0x1619
 *     bx  ip
 *
 * 3 insns + 2 pool words = 0x14 bytes. 0x1619 not encodable as
 * rot-8 immediate, so mwcc loads via pool.
 */

extern int func_ov002_02263dec(int a, int b, int c, int d);

int func_ov002_02263edc(int a, int _unused, int c, int d) {
    return func_ov002_02263dec(a, 0x1619, c, d);
}
