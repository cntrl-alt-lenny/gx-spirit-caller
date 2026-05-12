/* func_02089024: bounds-checked struct-array lookup. Indexes into an
 * array of 0x10-byte structs (stride 16) and returns the field at +0x14.
 * If idx >= count, returns 0.
 *
 *     ldr   r1, .L_02089048           ; data_021a5800
 *     ldr   r1, [r1, #0x0]            ; r1 = *gp = base
 *     ldr   r2, [r1, #0x84]           ; r2 = base->arr
 *     ldr   r1, [r2, #0x8]            ; r1 = arr->cnt
 *     cmp   r0, r1
 *     movhs r0, #0x0
 *     addlo r0, r2, r0, lsl #0x4      ; arr + idx*16
 *     ldrlo r0, [r0, #0x14]
 *     bx    lr
 */

extern char *data_021a5800;

unsigned int func_02089024(unsigned int idx) {
    char *base = data_021a5800;
    char *arr  = *(char **)(base + 0x84);
    if (idx >= *(unsigned int *)(arr + 0x8)) return 0;
    return *(unsigned int *)(arr + idx * 0x10 + 0x14);
}
