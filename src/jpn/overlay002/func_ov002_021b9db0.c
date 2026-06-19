/* func_ov002_021b9db0: thunk — `func_ov002_021b3d48` with r2 = 0x1513.
 *
 *     ldr ip, =func_ov002_021b3d48
 *     ldr r2, =0x1513
 *     bx  ip
 *
 * 3 insns + 2 pool words = 0x14 bytes. 0x1513 not encodable as
 * rot-8 immediate, so mwcc loads via pool.
 */

extern int func_ov002_021b3d48(int a, int b, int c, int d);

int func_ov002_021b9db0(int a, int b, int _unused, int d) {
    return func_ov002_021b3d48(a, b, 0x1513, d);
}
