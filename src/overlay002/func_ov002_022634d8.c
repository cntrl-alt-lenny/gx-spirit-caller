/* func_ov002_022634d8: thunk — `func_ov002_022630b0` with r1 = 0x1a20.
 *
 *     ldr ip, =func_ov002_022630b0
 *     ldr r1, =0x1a20
 *     bx  ip
 *
 * 3 insns + 2 pool words = 0x14 bytes. 0x1a20 not encodable as
 * rot-8 immediate, so mwcc loads via pool.
 */

extern int func_ov002_022630b0(int a, int b, int c, int d);

int func_ov002_022634d8(int a, int _unused, int c, int d) {
    return func_ov002_022630b0(a, 0x1a20, c, d);
}
