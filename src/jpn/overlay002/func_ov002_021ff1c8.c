/* func_ov002_021ff1c8: thunk — drop arg 0, pass arg 1 as new arg 0.
 *
 *     ldr ip, =
 *     mov r0, r1     ; new r0 = arg 1
 *     bx  ip
 *
 * 3 insns + 1 pool = 0x10 bytes.
 */

extern int func_ov002_021bc538(int a);

int func_ov002_021ff1c8(int unused_a, int b) {
    return func_ov002_021bc538(b);
}
