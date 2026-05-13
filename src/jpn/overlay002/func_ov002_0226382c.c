/* func_ov002_0226382c: thunk — `func_ov002_02262ee8` with r1 = 0x12ac.
 *
 *     ldr ip, =func_ov002_02262ee8
 *     ldr r1, =0x12ac
 *     bx  ip
 *
 * 3 insns + 2 pool words = 0x14 bytes. 0x12ac not encodable as
 * rot-8 immediate, so mwcc loads via pool.
 */

extern int func_ov002_02262ee8(int a, int b, int c, int d);

int func_ov002_0226382c(int a, int _unused, int c, int d) {
    return func_ov002_02262ee8(a, 0x12ac, c, d);
}
