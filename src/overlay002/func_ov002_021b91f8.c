/* func_ov002_021b91f8: returns 1 iff `*r0 == *r1` (compare two ints
 * pointed to by the args).
 *
 *     ldr r2, [r0, #0x0]
 *     ldr r0, [r1, #0x0]
 *     cmp r2, r0
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     bx  lr
 */

int func_ov002_021b91f8(int *a, int *b) {
    return *a == *b;
}
