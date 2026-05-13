/* func_020342d0: call helper, if non-null result write byte. Returns
 * void; uses predicated body.
 *
 *     stmdb sp!, {r3, r4, r5, lr}
 *     mov   r5, r0
 *     mov   r4, r1
 *     bl    func_02034134
 *     cmp   r0, #0x0
 *     addne r1, r4, #0x1
 *     addne r0, r0, r5
 *     strneb r1, [r0, #0x448]
 *     ldmia sp!, {r3, r4, r5, pc}
 */

extern int func_02034134(int p);

void func_020342d0(int p, int idx) {
    int r = func_02034134(p);
    if (r != 0) {
        unsigned char *t = (unsigned char *)(r + p + 0x448);
        *t = (unsigned char)(idx + 1);
    }
}
