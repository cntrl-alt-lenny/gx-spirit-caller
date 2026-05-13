/* func_ov002_02263818: thunk — `func_ov002_02262ee8` with r1 = 0x11cf.
 *
 *     ldr ip, =func_ov002_02262ee8
 *     ldr r1, =0x11cf
 *     bx  ip
 *
 * 3 insns + 2 pool words = 0x14 bytes. 0x11cf not encodable as
 * rot-8 immediate, so mwcc loads via pool.
 */

extern int func_ov002_02262ee8(int a, int b, int c, int d);

int func_ov002_02263818(int a, int _unused, int c, int d) {
    return func_ov002_02262ee8(a, 0x11cf, c, d);
}
