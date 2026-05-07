/* func_02089008: indexed-by-16 store at offset 0x14 of stride-16 record.
 *
 *     ldr r2, .L_02089020
 *     ldr r2, [r2, #0x0]           ; r2 = data->p
 *     ldr r2, [r2, #0x84]          ; r2 = data->p->arr_84
 *     add r0, r2, r0, lsl #0x4     ; r0 = arr + idx*16
 *     str r1, [r0, #0x14]          ; arr[idx].f_14 = arg
 *     bx  lr
 *
 * Three-deref store: data global -> p -> arr (at offset 0x84) ->
 * indexed slot. mwcc fuses the index-shift into the add.
 */

typedef struct {
    char  _pad[0x84];
    char *arr_84;
} state_021a5800_inner_t;

extern state_021a5800_inner_t *data_021a5800;

void func_02089008(int idx, int arg) {
    char *arr = data_021a5800->arr_84;
    *(int *)(arr + idx * 16 + 0x14) = arg;
}
