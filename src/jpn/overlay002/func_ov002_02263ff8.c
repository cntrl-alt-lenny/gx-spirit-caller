/* func_ov002_02263ff8: thunk — `func_ov002_02263e1c` with r1 = 0x1b27.
 *
 *     ldr ip, =func_ov002_02263e1c
 *     ldr r1, =0x1b27
 *     bx  ip
 *
 * 3 insns + 2 pool words = 0x14 bytes. 0x1b27 not encodable as
 * rot-8 immediate, so mwcc loads via pool.
 */

extern int func_ov002_02263e1c(int a, int b, int c, int d);

int func_ov002_02263ff8(int a, int _unused, int c, int d) {
    return func_ov002_02263e1c(a, 0x1b27, c, d);
}
