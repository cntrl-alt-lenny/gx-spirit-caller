/* func_ov002_0226337c: thunk — `func_ov002_02262fc8` with r1 = 0x12a0.
 *
 *     ldr ip, =func_ov002_02262fc8
 *     ldr r1, =0x12a0
 *     bx  ip
 *
 * 3 insns + 2 pool words = 0x14 bytes. 0x12a0 not encodable as
 * rot-8 immediate, so mwcc loads via pool.
 */

extern int func_ov002_02262fc8(int a, int b, int c, int d);

int func_ov002_0226337c(int a, int _unused, int c, int d) {
    return func_ov002_02262fc8(a, 0x12a0, c, d);
}
