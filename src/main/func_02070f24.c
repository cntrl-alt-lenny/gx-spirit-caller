/* func_02070f24: null-checked clear of `(*data->ptr_4)->f_a4_ptr`.
 *
 *     ldr r0, .L_02070f40
 *     ldr r0, [r0, #0x4]
 *     ldr r1, [r0, #0xa4]
 *     cmp r1, #0x0
 *     movne r0, #0x0
 *     strne r0, [r1, #0x0]
 *     bx  lr
 *  .L_02070f40: .word data_021a63d0
 *
 * Same `data_021a63d0.ptr_4` chain as brief-020 func_02071010, but
 * with a null-check on the pointer field at +0xa4 before zero-ing
 * its target.
 */

typedef struct {
    char  _pad[0xa4];
    int  *f_a4;
} child_a4_t;

typedef struct {
    char        _pad[0x4];
    child_a4_t *ptr_4;
} data_021a63d0_t;

extern data_021a63d0_t data_021a63d0;

void func_02070f24(void) {
    int *q = data_021a63d0.ptr_4->f_a4;
    if (q != 0) *q = 0;
}
