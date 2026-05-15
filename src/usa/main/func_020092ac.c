/* func_020092ac: bit-test `data_02105e5c[0x874] & (1 << r0)`.
 *
 *     ldr r1, =data_02105e5c
 *     mov r2, #0x1
 *     ldr r1, [r1, #0x874]
 *     and r0, r1, r2, lsl r0
 *     bx lr
 */

extern char data_02105e5c[];

int func_020092ac(unsigned int bit) {
    return *(int *)(data_02105e5c + 0x874) & (1 << bit);
}
