/* func_02070f0c: copy `(*data->ptr_4)->f_a4` into `arg->f_a4`.
 *
 *     ldr r1, .L_02070f20
 *     ldr r1, [r1, #0x4]       ; r1 = *(p + 0x4) — pointer field
 *     ldr r1, [r1, #0xa4]      ; r1 = src->f_a4
 *     str r1, [r0, #0xa4]      ; arg->f_a4 = r1
 *     bx  lr
 *  .L_02070f20: .word data_021a63d0
 */

typedef struct entry_a4 {
    char _pad[0xa4];
    int  field;
} entry_a4_t;

typedef struct {
    char        _pad[0x4];
    entry_a4_t *ptr_4;
} data_021a63d0_t;

extern data_021a63d0_t data_021a63d0;

void func_02070f0c(entry_a4_t *dst) {
    dst->field = data_021a63d0.ptr_4->field;
}
