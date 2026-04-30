/* func_ov002_0226407c: thunk — `func_ov002_02263f04` with r1 = 0x16a4.
 *
 *     ldr ip, =func_ov002_02263f04
 *     ldr r1, =0x16a4
 *     bx  ip
 *
 * 3 insns + 2 pool words = 0x14 bytes. 0x16a4 not encodable as
 * rot-8 immediate, so mwcc loads via pool.
 */

extern int func_ov002_02263f04(int a, int b, int c, int d);

int func_ov002_0226407c(int a, int _unused, int c, int d) {
    return func_ov002_02263f04(a, 0x16a4, c, d);
}
