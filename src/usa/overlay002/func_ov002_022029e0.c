/* func_ov002_022029e0: thunk — `func_ov002_021bd5e8` with r0 = 0x10f4.
 *
 *     ldr ip, =func_ov002_021bd5e8
 *     ldr r0, =0x10f4
 *     bx  ip
 *
 * 3 insns + 2 pool words = 0x14 bytes. 0x10f4 not encodable as
 * rot-8 immediate, so mwcc loads via pool.
 */

extern int func_ov002_021bd5e8(int a, int b, int c, int d);

int func_ov002_022029e0(int _unused, int b, int c, int d) {
    return func_ov002_021bd5e8(0x10f4, b, c, d);
}
