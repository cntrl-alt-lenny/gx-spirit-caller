/* func_02032e80: store value at obj[0], then return 0.
 *
 *     str r1, [r0, #0x0]
 *     mov r0, #0x0
 *     bx  lr
 */

int func_02032e80(void *obj, int value) {
    *(int *)obj = value;
    return 0;
}
