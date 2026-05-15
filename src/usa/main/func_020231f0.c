/* func_020231f0: 48-byte struct copy from data_0219a7cc into arg0.
 * Reverse direction of wave-18's func_020231c0 (clone-twin).
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   ip, .L_02023270           ; data_0219a7cc (src)
 *     mov   lr, r0                     ; lr = dst
 *     ldmia ip!, {r0, r1, r2, r3}
 *     stmia lr!, {r0, r1, r2, r3}
 *     ldmia ip!, {r0, r1, r2, r3}
 *     stmia lr!, {r0, r1, r2, r3}
 *     ldmia ip,  {r0, r1, r2, r3}
 *     stmia lr,  {r0, r1, r2, r3}
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, pc}
 */

typedef struct {
    unsigned int w[12];
} blob48_02023244_t;

extern blob48_02023244_t data_0219a7cc;

int func_020231f0(blob48_02023244_t *dst) {
    *dst = data_0219a7cc;
    return 1;
}
