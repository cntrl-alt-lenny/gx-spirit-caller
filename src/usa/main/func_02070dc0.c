/* func_02070dc0: null-checked store of arg at offset 0x38 of pointer-chain.
 *
 *     ldr r1, .L_02070ec0
 *     ldr r1, [r1, #0x4]
 *     ldr r1, [r1, #0xa4]
 *     cmp r1, #0x0
 *     strne r0, [r1, #0x38]
 *     bx  lr
 *  .L_02070ec0: .word data_021a62f0
 *
 * Same `data_021a62f0.ptr_4->f_a4` chain as brief-020 func_02070f28 /
 * brief-022 func_02070e3c; here we store arg at +0x38 of the pointee.
 */

typedef struct {
    char _pad[0x38];
    int  f_38;
} child_a4_inner_t;

typedef struct {
    char              _pad[0xa4];
    child_a4_inner_t *f_a4;
} child_a4_t;

typedef struct {
    char        _pad[0x4];
    child_a4_t *ptr_4;
} data_021a63d0_t;

extern data_021a63d0_t data_021a62f0;

void func_02070dc0(int arg) {
    child_a4_inner_t *q = data_021a62f0.ptr_4->f_a4;
    if (q != 0) q->f_38 = arg;
}
