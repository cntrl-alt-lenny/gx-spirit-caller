/* func_02071010: clear `(*data->ptr_4)->f_a4`.
 *
 *     ldr r0, .L_02071024
 *     mov r1, #0x0
 *     ldr r0, [r0, #0x4]       ; r0 = *(p + 0x4)
 *     str r1, [r0, #0xa4]      ; (*p4)->f_a4 = 0
 *     bx  lr
 *  .L_02071024: .word data_021a63d0
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

void func_02071010(void) {
    data_021a63d0.ptr_4->field = 0;
}
