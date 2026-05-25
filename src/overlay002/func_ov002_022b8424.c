/* func_ov002_022b8424: setter — write field at offset 0xc5c, return 1.
 *
 *     str r1, [r0, #0xc5c]
 *     mov r0, #0x1
 *     bx  lr
 */

int func_ov002_022b8424(char *p, int v) {
    *(int *)(p + 0xc5c) = v;
    return 1;
}
