/* func_ov002_02263404: thunk — `func_ov002_02262fc8` with r1 = 0x1a21.
 *
 *     ldr ip, =func_ov002_02262fc8
 *     ldr r1, =0x1a21
 *     bx  ip
 *
 * 3 insns + 2 pool words = 0x14 bytes. 0x1a21 not encodable as
 * rot-8 immediate, so mwcc loads via pool.
 */

extern int func_ov002_02262fc8(int a, int b, int c, int d);

int func_ov002_02263404(int a, int _unused, int c, int d) {
    return func_ov002_02262fc8(a, 0x1a21, c, d);
}
