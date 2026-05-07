/* func_0207f884: fill 3 ints starting at `*r0` with -1 each.
 *
 *     mov r2, #0x0
 *     mvn r1, #0x0           ; r1 = -1
 *  .L_0207f88c:
 *     str r1, [r0, r2, lsl #0x2]
 *     add r2, r2, #0x1
 *     cmp r2, #0x3
 *     blt .L_0207f88c
 *     bx  lr
 *
 * Loop emits `str r1, [r0, r2, lsl #2]` rather than auto-incrementing
 * the pointer — register-indexed store with shift.
 */

void func_0207f884(int *p) {
    int i;
    for (i = 0; i < 3; i++) {
        p[i] = -1;
    }
}
