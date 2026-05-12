/* func_02034114: iterate function-pointer array calling each with
 * (p, abs(b)); return first index where the callback returns 1, else
 * return -1.
 *
 *     stmdb sp!, {r3, r4, r5, r6, r7, lr}
 *     movs  r6, r1
 *     ldr   r4, .L_0203415c           ; data_020beb58
 *     mov   r7, r0
 *     rsbmi r6, r6, #0x0
 *     mov   r5, #0x0
 *  .L_0203412c:
 *     ldr   r2, [r4, r5, lsl #0x2]
 *     mov   r0, r7
 *     mov   r1, r6
 *     blx   r2
 *     cmp   r0, #0x1
 *     moveq r0, r5
 *     ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
 *     add   r5, r5, #0x1
 *     cmp   r5, #0xd
 *     blt   .L_0203412c
 *     mvn   r0, #0x0
 *     ldmia sp!, {r3, r4, r5, r6, r7, pc}
 */

typedef int (*fn_02034114_t)(int, int);
extern fn_02034114_t data_020beb58[];

int func_02034114(int p, int b) {
    int i;
    if (b < 0) b = -b;
    for (i = 0; i < 0xd; i++) {
        if (data_020beb58[i](p, b) == 1) return i;
    }
    return ~0;
}
