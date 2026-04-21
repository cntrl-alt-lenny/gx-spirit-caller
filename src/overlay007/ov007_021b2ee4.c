/* func_ov007_021b2ee4: zero-writer at offset 0.
 *
 *     mov r1, #0x0
 *     str r1, [r0, #0x0]
 *     bx  lr
 *
 * Sets *p = 0. One-call clear/reset.
 */

void func_ov007_021b2ee4(int *p) {
    *p = 0;
}
