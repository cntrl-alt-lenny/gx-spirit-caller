/* func_02023214: 48-byte struct copy from src (arg0) into global. Uses
 * 3 ldmia!/stmia! pairs of 4 words each. Returns 1.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   ip, .L_02023240           ; data_0219a8ac
 *     mov   lr, r0                     ; lr = src
 *     ldmia lr!, {r0, r1, r2, r3}
 *     stmia ip!, {r0, r1, r2, r3}
 *     ldmia lr!, {r0, r1, r2, r3}
 *     stmia ip!, {r0, r1, r2, r3}
 *     ldmia lr,  {r0, r1, r2, r3}
 *     stmia ip,  {r0, r1, r2, r3}
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, pc}
 */

typedef struct {
    unsigned int w[12];   /* 48 bytes */
} blob48_02023214_t;

extern blob48_02023214_t data_0219a8ac;

int func_02023214(const blob48_02023214_t *src) {
    data_0219a8ac = *src;
    return 1;
}
