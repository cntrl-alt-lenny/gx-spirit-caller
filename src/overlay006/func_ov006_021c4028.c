/* func_ov006_021c4028: normalize record[idx] (f0,f4 stride-0x10 pair at
 * self+0x9c) into range [0,6) by incrementing/decrementing f0 while
 * counter-adjusting f4.
 *
 *     ldr r1, [r0, #0x64]
 *     add r0, r0, #0x9c
 *     ldr r3, [r0, r1, lsl #0x4]
 *     add r2, r0, r1, lsl #0x4
 *     cmp r3, #0x0
 *     mov r0, #0x0
 *     bge .L_1b64
 *     ...
 *     bx lr
 */

int func_ov006_021c4028(char *self) {
    int idx = *(int *)(self + 0x64);
    char *rec = (self + 0x9c) + idx * 0x10;
    int v = *(int *)(rec);
    int result;

    result = 0;
    if (v >= 0) goto mid;
    result = 1;
    if (v >= 0) goto mid;

    do {
        *(int *)(rec) += 1;
        *(int *)(rec + 4) -= 1;
        v = *(int *)(rec);
    } while (v < 0);

mid:
    if (v < 6) goto end;
    result = 1;
    if (v < 6) goto end;

    do {
        *(int *)(rec) -= 1;
        *(int *)(rec + 4) += 1;
        v = *(int *)(rec);
    } while (v >= 6);

end:
    return result;
}
