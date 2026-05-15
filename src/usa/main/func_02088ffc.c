/* func_02088ffc: clone of wave-17 func_02088f3c / 0208910c family at
 * field offset +0x10 (vs +0x14 / +0xc). Bounds-checked struct-array
 * lookup via data_021a5720.
 *
 *     ldr   r1, .L_02089108           ; data_021a5720
 *     ldr   r1, [r1, #0x0]
 *     ldr   r2, [r1, #0x84]
 *     ldr   r1, [r2, #0x8]
 *     cmp   r0, r1
 *     movhs r0, #0x0
 *     addlo r0, r2, r0, lsl #0x4
 *     ldrlo r0, [r0, #0x10]
 *     bx    lr
 */

extern char *data_021a5720;

unsigned int func_02088ffc(unsigned int idx) {
    char *base = data_021a5720;
    char *arr  = *(char **)(base + 0x84);
    if (idx >= *(unsigned int *)(arr + 0x8)) return 0;
    return *(unsigned int *)(arr + idx * 0x10 + 0x10);
}
