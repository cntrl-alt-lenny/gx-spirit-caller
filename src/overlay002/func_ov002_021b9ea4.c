/* func_ov002_021b9ea4: thunk — `func_ov002_021b3e28` with r2 = 0x1a90.
 *
 *     ldr ip, =func_ov002_021b3e28
 *     ldr r2, =0x1a90
 *     bx  ip
 *
 * 3 insns + 2 pool words = 0x14 bytes. 0x1a90 not encodable as
 * rot-8 immediate, so mwcc loads via pool.
 */

extern int func_ov002_021b3e28(int a, int b, int c, int d);

int func_ov002_021b9ea4(int a, int b, int _unused, int d) {
    return func_ov002_021b3e28(a, b, 0x1a90, d);
}
